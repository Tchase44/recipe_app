<template>
  <div id="account">
    <h3>{{account.username}}'s Account</h3>
    <span>{{chef(account.level)}}</span>
    <!-- <Divider /> -->
    <div @click="logout"><button id="logout-btn">Log Out</button></div>
    <!-- <Divider /> -->
    <div class=message-con>
      <div v-if="m" class="message-box">
        <h3>{{m}}</h3>
        <Loading/>
      </div>
      <div v-if="e" class="error-box">
        <ul>
          <li v-for="err in e" v-bind:key="err" >{{err}}</li>
        </ul>
      </div>
    </div>
    <Divider />
    <h4>Update Username</h4>
    <form @submit="updateUsername">
      <input type="text" id="username" class="username check" v-model="account.username">
      <button type="submit">Change Username</button>
    </form>
    <Divider />
    <form @submit="updatePassword" class="passwords">
        <h4>Password Management</h4>
      <div class="passbox">
        <label for="password" class="g-left">Current Password:</label>
        <input type="password" name="current_password" class="g-right" v-model="account.current_password">
        <label for="new_password" class="g-left">New Password:</label>
        <input type="password" name="new_password" class="g-right" v-model="account.new_password">
        <label for="password_confirmation" class="g-left">Confirm Password</label>
        <input type="password" name="password_confirmation" class="g-right" v-model="account.password_confirmation">
        <label for="submit" class="g-left"></label>
        <button type="submit" class="g-right">Update Password</button>
      </div>
    </form>
    <Divider />
    <h4>Remove My Account</h4>
    <form @submit="deleteAccount" class="remove-acc">
      <button type="submit">Delete</button>
    </form>
  </div>
</template>

<script>
import userAPI from "../../services/userApi";
import Divider from "../divider.vue";
import Loading from "../loading"
import passChecker from "../../services/passwordValid"
export default {
  name: "account",
  components:{
    Divider,
    Loading
  },
  data(){
    return {
      account:{
        username: "",
        id: null,
        current_password: null,
        new_password: null,
        password_confirmation: null,
        level: this.$store.getters.getUserLevel,
      },
      m: null,
      e: null
    }
  },
  methods:{
    chef(level){
      if (level === 1) {
        return "headchef"
      }
      else if (level === 2) {
        return "souschef"
      }
      else if (level === 3) {
        return "linecook"
      }
      else{
        return "linecook"
      }
    },
    goHome(seconds){
      let s = seconds * 1000
      setTimeout(() => {
        this.$router.push({name:"Home"})
      }, s);
    },
    clearMsg(){
      this.m  = null
      this.e = null
    },
    async updatePassword(e){
      e.preventDefault()
      this.clearMsg()

      if (passChecker.vaild(this.account.new_password,this.account.password_confirmation) === true){
        let passChange = await userAPI.passwordChange(
          {
            id: this.account.id,
            current_password: this.account.current_password,
            password: this.account.new_password,
            password_confirmation: this.account.password_confirmation
          }
        )
        if(passChange.message){
          this.m = passChange.message
          this.goHome(3)
        }
        else{
          this.e = passChange.error
        }
      }else{
        this.e = passChecker.vaild(this.account.new_password,this.account.password_confirmation)
      }
    },
    async deleteAccount(e){
      e.preventDefault()
      if(confirm("Are you sure you want to delete your account?")){
        let x = await userAPI.removeAccount()
        if(x.message === "Successfuly Deleted"){
          this.m = x.message
          alert(x.message)
          this.logout()
        }else{
          this.e = x.errors
        }
      }
    },
    async getUsername(){
      let res = await userAPI.getMyUsername()
      this.account.username = res.username
      this.$store.commit("setUserLevel", res.level)
    },
    async updateUsername(e){
      e.preventDefault()
      this.clearMsg()
      let res = await userAPI.changeUsername(
        {
          username: this.account.username,
          id: this.account.id
        }
      )
      if(res.message === "Change Successful"){
        this.m = res.message
        this.goHome(4)
      }else{
        this.m = "Error Updating username, It may already exsist"
      }
    },
    async authCheck(){
      let x = await userAPI.healthCheck()
      this.m = x
    },
    logout(){
      this.$store.commit('logOut')
      localStorage.clear()
      sessionStorage.clear()
      this.$router.push({name:"Home"})
    }
  },
  mounted(){
    this.getUsername()
    let id = this.$store.getters.getTokenData
    this.account.id = JSON.parse(atob(id)).user_id
  },
}
</script>

<style scoped>
  input,button {
    width: 320px;
    height: 2em;
  }

  #logout-btn {
    background: var(--black-color);
    color: var(--green-color);
    margin: 15px 0 2px 0;
  }
  #logout-btn:hover {
    color: var(--black-color);
    background: var(--green-color);
  }

  form.passwords {
    overflow: hidden;
  }

  div.message-box, div.error-box {
    width: 99%;
    margin: 0 auto;
  }
  div.message-box h3{
    color: var(--green-color);
  }
  div.error-box{
    color: rgb(255, 255, 255);
    font-size: 0.9em;
    background: rgb(145, 12, 12);
    height: 35px;
    line-height: 35px;
  }

  div.passbox {
    width: 100%;
    height:250px;
    display: grid;
    grid-template-rows: repeat(4,1fr);
    grid-template-columns: minmax(45%,200px) minmax(45%,200px) ;
  }

  div.passbox label.g-left {
    grid-column-start: 1;
    text-align: right;
    margin: 0 15px 0 0;
  }

  div.passbox input.g-right {
    grid-column-start: 2;
  }
  .remove-acc{
    margin-bottom: 2em;
  }
  @media screen and (max-width: 500px) {
    div.passbox{
      display: inline-block;
    }
    div.passbox label.g-left {
      display: inline-block;
      width:80%;
      text-align: center;
    }
    div.passbox label.g-right {
      display: inline-block;
      width:80%;
      text-align: center;
    }
  }
</style>