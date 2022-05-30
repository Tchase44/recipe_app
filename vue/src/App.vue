<template>
  <div id="app">
    <!-- This is the Root componet -->
    <div v-if="!loggedIN" id="logs">
      <router-link to="/login">login</router-link>
    </div>
    <div id="burger-box" @click="hideShow">
      <svg v-if="!burgerToggle" viewBox="0 0 100 80" width="40" height="40">
        <rect width="100" height="20"></rect>
        <rect y="30" width="100" height="20"></rect>
        <rect y="60" width="100" height="20"></rect>
      </svg>
      <span v-if="burgerToggle" id="close">X</span>
      <Burger v-if="burgerToggle" :loggedIn="loggedIN" :userLevel="userLevel" />
    </div>
    <!-- <div v-if="!loggedIN" id="logs"><router-link to="/login">log Out</router-link></div> -->
    <div id="nav" class="navbar">
      <router-link v-if="loggedIN" class="nav-item" to="/my_account">
        Account
      </router-link> |
      <router-link class="nav-item" to="/about">About</router-link> |
      <router-link class="nav-item" to="/">Home</router-link> |
      <router-link
        v-if="loggedIN && userLevel < 3"
        class="nav-item"
        to="/recipe/new"
        >Add Recipe</router-link
      >
    </div>

    <main>
      <router-view />
    </main>

    <Footer />
  </div>
</template>

<script>
import Burger from "./components/burger.vue";
import Footer from "./components/footer";
// import userService from "./services/userApi"
export default {
  components: {
    Footer,
    Burger,
  },
  data() {
    return {
      burgerToggle: false,
    };
  },
  methods: {
    hideShow() {
      this.burgerToggle = !this.burgerToggle;
    },
  },
  mounted() {},
  computed: {
    loggedIN() {
      // console.log(this.$store.getters.isLoggedIn)
      return this.$store.getters.isLoggedIn;
    },
    userLevel() {
      return this.$store.getters.getUserLevel;
    },
  },
};
</script>

<style>
div#app {
  min-width: 350px;
}
div#app * {
  --green-color: #3bbd58;
  --black-color: #292929;
}
#app {
  font-family: "Arvo", serif;
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
h1, h2, h3, h4, h5, h6, p, span, div, nav, button {
  color: #000;
  text-decoration: none;
  font-family: "Arvo", serif;
}
h1 {
  font-family: "Lora", serif;
}
#nav.navbar {
  height: 3em;
  line-height: 3em;
  font-size: 1.5em;
  background: #3bbd58;
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
#logs {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 5;
  width: 88px;
  height: 83px;
  line-height: 51px;
  padding: 15px 5px 15px 5px;
  background: #292929;
}
#logs a {
  color: #3bbd58;
}
#burger-box {
  cursor: pointer;
  background: var(--green-color);
  margin: 0 auto;
  padding-top: 20px;
  padding-bottom: 20px;
}
#close {
  cursor: pointer;
  font-family: cursive;
  font-size: 3em;
  font-weight: bolder;
}
@media screen and (min-width: 460px) {
  #burger-box {
    display: none;
  }
  #logs {
    height: 72px;
    line-height: 41px;
  }
}

@media screen and (max-width: 460px) {
  #nav {
    display: none;
  }
}
</style>
