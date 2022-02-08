<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png"> -->
    <RecipeIndex msg="Welcome to Tim's Recipe Book"/>
  </div>
</template>

<script>
// @ is an alias to /src
import RecipeIndex from '../components/recipes/Index.vue'

export default {
  name: 'Home',
  components: {
    RecipeIndex
  },
}
</script>

<style scoped>

</style>