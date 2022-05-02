<template>
  <div class="all">
    <h1>{{ msg }}</h1>
    <h3 v-on:click="getRecipes" class="reload">Reload Recipes</h3>

    <div class="recipe-list" v-if="recipes.length > 0">
      <div class="card" @click="navigate(r.slug)" v-for="r in recipes" v-bind:key="r.id">
        <router-link :to="'/recipes/'+r.slug" v-bind:name="r.id">
        <!-- title -->
        <h3>{{r.title}}</h3>
        <p>{{r.description}}</p>
        <!-- discription -->
        </router-link>
      </div>
    </div>

  </div>
</template>

<script>
import apiService from '../../services/RecipeApi'

export default {
  name: 'RecipeIndex',
  props: {
    msg: String
  },
  data(){
    return {
      recipes: [
        {
          id: 0,
          title: "example",
          directions: "cook the thing",
          showURL: "/recipe/0",
          editURL: "/recipe/0/edit"
        }
      ]
    }
  },
  methods:{
    async getRecipes(){
      let all = await apiService.getAll()
      this.recipes = apiService.addUrls(all)
      this.$store.commit('addRecipes', all)
    },
    checkNumRecipes(){
      return this.$store.getters.getNumRecipes
    },
    getFromStore(){
      this.recipes = this.$store.getters.getAllRecipes
    },
    navigate(slug){
      this.$router.push(`/recipes/${slug}`);
    }
  },
  mounted(){
    // does store has recipes?
    // todo: adjust for the creation and deletion of recipes.
    if(this.checkNumRecipes() === 0){
      this.getRecipes()
    }else{
      this.getFromStore()
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3.reload {
  cursor: pointer;
}
div.recipe-list {
  display: grid;
  grid-template-columns: 1fr 500px 1fr;
}
.card{
  display: inline-block;
  box-sizing: border-box;
  /* opacity: 0.75; */
  /* background-color: #efefef; */
  min-width: 385px;
  width: 89%;
  max-width: 477px;
  height:150px;
  padding: 9px;
  margin: 22px auto;
  box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
  transition:all 0.3s ease;
  cursor: pointer;
}
div.card:hover{
  opacity: 1;
  /* background-color: #f3f3f3; */
  /* background-color: #c22121; */
  box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19);
}
.card * {
  text-decoration: none;
  /* color: #2c3e50; */
}

@media only screen and (max-width: 1200px) {
  div.recipe-list {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-gap: 5px;
  }
}
@media only screen and (max-width: 750px) {
  div.recipe-list {
    display: grid;
    grid-template-columns: 1fr;
  }
}
</style>
