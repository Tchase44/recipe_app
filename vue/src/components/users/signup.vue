<template>
  <div>
    <h3>Already have an account? <router-link to="/login">Log In</router-link></h3>
    <p v-if="message">
      <ul v-for="err in message" v-bind:key="err">
        <li>{{err}}</li>
      </ul>
    </p>
    <form @submit="requestAccount" >
      <label for="email">email</label><br>
      <input type="email" name="email" class="" required v-model="pUser.email"><br>
      <label for="username">username</label><br>
      <input type="text" name="username" class="" v-model="pUser.username"><br>
      <label for="password">password</label><br>
      <input type="password" name="password" class="" required v-model="pUser.password"><br>
      <label for="password_confirmation">password_confirmation</label><br>
      <input type="password" name="password_confirmation" class="" required v-model="pUser.password_confirmation"><br>
      <button type="submit">Sign Up</button>
    </form>
  </div>
</template>

<script>
import userApi from '../../services/userApi'
import check from '../../services/passwordValid'
export default {
  name: "SignUp",
  data(){
    return {
      pUser:{
        email: "",
        username: "",
        password: "",
        password_confirmation:""
      },
      message: null
    }
  },
  methods:{
    passCheck(s1,s2){
      return (typeof(s1) === "string" && typeof(s2) === "string" && s1 === s2 )
    },
    usernameCheck(username){
      // console.log(username)
      if (username.split("").includes("@")){ return false}
      if (username.split("").includes(".")){ return false}
      if (username.split("").includes(" ")){ return false}
      return true
    },
    async requestAccount(e){
      e.preventDefault();
      let vaild = check.vaild(this.pUser.password, this.pUser.password_confirmation)
      if(!this.usernameCheck(this.pUser.username)){
        this.message = ["Usernames connot contain '@' or '.' or ',' or blank spaces"]
      } else if(vaild !== true ){
        this.message = vaild
      }else{
        // ToDo: API activation email
        let success = await userApi.signUp(this.pUser)
        if(success.auth_token){
          sessionStorage.setItem("auth_token", success.auth_token)
          this.$store.commit('logIn', success.auth_token)
          this.$router.push('/')
        }else{
          this.message = success.errors
        }
      }
    }
  }
}
</script>

<style>

</style>