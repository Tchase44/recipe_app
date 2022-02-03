<template>
  <div class="login" id="login">
    <h3>Dont have an account? <router-link to="/sign_up">Sign Up?</router-link></h3>
    <div class="error"><p>{{error_message}}</p></div>
    <form action="" @submit="login">
      <label for="email">Username or Email</label><br>
      <input type="text" name="email" class="" v-model="stuff.email"><br>
      <label for="password">password</label><br>
      <input type="password" name="password" class="" v-model="stuff.password"><br>
      <button @click="login">Login</button>
    </form>
  </div>
</template>

<script>
import userAPI from '../../services/userApi.js'
export default {
  name: "Login",
  data(){
    return{
      stuff: {
        email: "",
        password: "",
      },
      error_message: ""
    }
  },
  methods:{
    async login(e){
      e.preventDefault()
      let token = await userAPI.login(this.stuff)
      if(token.auth_token){
        sessionStorage.setItem("auth_token", token.auth_token)
        this.$store.commit('logIn',token.auth_token)
        this.$router.push('/')
      }else{
        this.error_message = "Invalid Username/Password"
      }
    },
  }
}
</script>

<style>
div.error > *{
  color: #e21e1e;
}
/* div{color:#befd2c} */
</style>
