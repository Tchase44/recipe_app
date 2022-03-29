<template>
  <div id="burger-contnent">
    <ul>
      <lI v-if="loggedIn">
        <router-link class="burg-item" to="/my_account">Account</router-link>
      </li>
      <lI>
        <router-link class="burg-item" to="/about">About</router-link>
      </li>
      <lI>
        <router-link class="burg-item" to="/">Home</router-link>
      </li>
      <lI v-if="loggedIn && userLevel < 3">
        <router-link class="burg-item" to="/recipe/new">Add Recipe</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props:{
    loggedIn: Boolean,
    userLevel: Number,
  },
}
</script>

<style scoped>
div#burger-contnent {
  margin-top: 15px;
}
div#burger-contnent > ul {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
}
div#burger-contnent li {
  margin-bottom: 15px;
}
div#burger-contnent a.burg-item {
  text-decoration: none;
  color: #292929;
  font-size: 1.5em;
  font-weight: bold;
}
div#burger-contnent li a.burg-item:hover{
  color: #575757;
}
</style>