<template>
  <div id="app">
    <!-- This is the Root componet -->
    <div v-if="!loggedIN" id="logs"><router-link to="/login">login</router-link></div>
    <!-- <div v-if="!loggedIN" id="logs"><router-link to="/login">log Out</router-link></div> -->
    <div id="nav" class="navbar">
      <router-link v-if="loggedIN" class="nav-item" to="/my_account">Account</router-link> |
      <router-link class="nav-item" to="/about">About</router-link> |
      <router-link class="nav-item" to="/">Home</router-link> |
      <router-link v-if="loggedIN && level < 3" class="nav-item" to="/recipe/new">Add Recipe</router-link>
    </div>

    <main>
      <router-view/>
    </main>

    <Footer />
  </div>
</template>

<script>
import Footer from "./components/footer"
import userService from "./services/userApi"
export default {
  components:{
    Footer
  },
  data(){
    return {
      level: 3
    }
  },
  methods:{
    async userlevel(){
      let l = await userService.getMyUsername();
      this.level = l.level
    }
  },
  mounted(){
    if(this.$store.getters.isLoggedIn){
      this.userlevel()
    }
  },
  computed:{
    loggedIN(){
      return this.$store.getters.isLoggedIn
    },
  }
}
</script>

<style>
div#app {
  min-width: 460px;
}
div#app *{
  --green-color: #3bbd58;
  --black-color: #292929;
}
#app {
  font-family: 'Arvo', serif;
  /* font-family: Avenir, Helvetica, Arial, sans-serif; */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #000;
  box-sizing: border-box;
  min-height: 100vh;
}
#app * {
  box-sizing: border-box;
  /* margin: 0; */
  /* padding: 0; */
}
h1, h2, h3, h4, h5, h6, p, span, div, nav, button{
  color: #000;
  text-decoration: none;
  font-family: 'Arvo', serif;
}
h1{
  font-family: 'Lora', serif;
}
#nav.navbar{
  height: 3em;
  line-height: 3em;
  font-size: 1.5em;
  background: #3bbd58;;
}

#nav a {
  font-family: Arvo;
  font-weight: bolder;
  color: #000;
}

#nav a.router-link-exact-active {
  color: #fff;
}
#app main {
  min-height: 80vh;
}
#logs{
  position: fixed;
  top: 0;
  left: 0;
  border: 1px solid #292929;
  padding: 15px 5px 15px 5px;
  border-radius: 180px;
  /* background: #3bbd58; */
  background: #292929;
}
#logs a {
  color: #3bbd58;
}
</style>
