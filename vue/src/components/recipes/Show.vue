<template>
  <div class="recipe">
    <router-link :to="'/'" v-bind:name="recipe.id">Back</router-link>
    <h3 v-if="recipe">{{recipe.title}}</h3>
    <div class="ingredient-list" v-if="recipe">
      <ul v-if="recipe.ingredients">
        <Ingredient v-for="i in recipe.ingredients" v-bind:key="i.id" :item="i" />
      </ul>
    </div>
    <div v-if="level_check()" class="i-box">
      <span class="point" @click="adding" v-if="add" > Cancle [-] </span>
      <span class="point" @click="adding" v-else > Add Ingredient [+]</span>
      <IngredientForm
        v-if="add"
        :ingredient="blank"
        :recipeId="recipe.id"
        :create="true"
      />
    </div>
    <Divider />
    <div v-if="recipe" class="direction-box">
      <h3>Directions</h3>
      <pre> {{recipe.directions}} </pre>
    </div>
    <div v-if="recipe" class="tips-box">
      {{recipe.tips}}
    </div>
    <router-link v-if="recipe && level_check()" :to="'/recipes/'+recipe.slug+'/edit'"  v-model="recipe.editURL">
      Edit Recipe
    </router-link>
  </div>
</template>

<script>
import apiService from '../../services/RecipeApi'
import Ingredient from '../ingredients/Ingredient'
import IngredientForm from '../ingredients/Form'
import Divider from '../divider'
export default {
name: 'RecipeShow',
props:['slug'],
components:{
  Ingredient,
  IngredientForm,
  Divider
},
  data(){
    return {
      recipe: null,
      recipeId: this.$props.slug,
      add: false,
      blank: {
        id: null,
        name: "",
        amount: "",
        tip: "",
      }
    }
  },
  methods:{
    async getRecipe(slug){
      this.recipe = await apiService.getRecipeBySlug(slug)
      // this.recipe = await apiService.getRecipeById(id)
      this.recipe = apiService.addUrls(this.recipe)
    },
    adding(){
      this.add = !this.add
    },
    async addIngredient(){
      let newIng = await apiService.createIngredient()
      newIng
    },
    level_check(){
      if(this.$store.getters.isLoggedIn){
        return JSON.parse(atob(this.$store.getters.getTokenData))["level"] === 1 ? true : false
      } else {
        return false
      }
    }
  },
  mounted(){
    if(this.recipeId.toString() === "0"){
      return
    }else{
      this.getRecipe(this.recipeId)
    }
  }
}
</script>

<style scoped>
div.recipe{
  width:100%;
  max-width: 720px;
  min-height: 75vh;
  margin: 0 auto;
}
.ingredient-list{
  width: 100%;
  max-width: 450px;
  margin: 0 auto;
  box-sizing: border-box;
}
.ingredient-list > ul {
  text-decoration: none;
  list-style-type: none;
  text-align: left;
  width: 100%;
  padding: 0;
}
.ingredient-list li {
  margin: 10px 0;
}
.point{
  cursor: pointer;
}
div.direction-box{
  margin: 0 auto;
}
pre {
  font-family: Arvo, sans-serif;
  white-space: pre-wrap;
}
</style>