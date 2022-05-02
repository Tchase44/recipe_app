<template>
  <div id="update-recipe">
    <nav v-if="recipeObj">
      <router-link :to="'/recipes/'+recipeObj.slug" v-if="recipeObj">Back</router-link>
    </nav>
    <div class="message-box">
      <h4 class="error" v-if="error">{{error}}</h4>
      <h4 class="success" v-if="success">{{success}}<br>
        <Loading />
      </h4>
    </div>
    <div class="recipe-update-form">
      <form @submit="update" v-if="recipeObj">
        <input type="hidden" name="id" v-model="recipeObj.id">

        <label for="title">Title:</label><br>
        <input type="text" name="title" id="title" v-model="recipeObj.title"><br>

        <label for="slug">Slug:</label><br>
        <input type="text" name="slug" id="slug" v-model="recipeObj.slug"><br>
        <sub>This is your new URL:<br>{{paramiterize(recipeObj.slug)}}</sub><br>

        <label for="description">Description:</label><br>
        <input type="text" name="description" id="description" v-model="recipeObj.description"><br>

        <label id="direction-label" for="directions">Directions:</label><br>
        <textarea name="directions"
                  id="directions"
                  v-model="recipeObj.directions"
                  rows="10"
                  ></textarea><br>

        <label for="tips">Tips:</label><br>
        <input type="text" name="tips" id="tips" v-model="recipeObj.tips"><br>

        <button type="submit">Submit!</button>
        <button type="button" @click="remove">Delete</button>
      </form>
    </div>
  </div>
</template>

<script>
import apiService from '../../services/RecipeApi'
import validator from "../../services/recipeValidations";
import Loading from "../loading"
export default {
  name: 'RecipeForm',
  props: {
    slug: String
  },
  components:{
    Loading
  },
  data(){
    return {
      recipeObj: null,
      error: null,
      success: null
    }
  },
  methods:{
    async update(e){
      e.preventDefault()
      let updates = {...this.recipeObj}//<- clone the obj to prevent mutation
      delete updates.showURL
      delete updates.editURL
      this.recipeObj.slug = this.paramiterize(this.recipeObj.slug) || this.paramiterize(this.recipeObj.title)
      let valid = validator.valid(this.recipeObj)
      if(valid === true){
        let post = await apiService.updateRecipe(updates)
        if(post.error){
          this.error = post.error
        }else{
          this.success = "Successfully Updated!"
          window.setTimeout(() => {
            this.$router.push(`/recipes/${updates.slug}`)
          }, 1000);
        }
      }else{
        this.error = valid
      }
    },
    async fetchRecipe(){
      // this.recipeObj = await apiService.getRecipeById(this.$props.id)
      this.recipeObj = await apiService.getRecipeBySlug(this.$props.slug)
      this.recipeObj = apiService.addUrls(this.recipeObj)
    },
    async remove(){
      if(window.confirm("Are you sure you want to Delete this recipe forever?")){
        let deleted = await apiService.deleteRecipe(this.recipeObj.id)
        if(deleted.error){
          this.error = deleted.error
        }else{
          this.success = "Successfully Deleted! Redirecting"
          window.setTimeout(() => {
            this.$router.push(`/`)
          }, 1000);
        }
      }
    },
    paramiterize: function(str){
      if (str){
        return encodeURIComponent(str.replaceAll(' ','-').toLowerCase())
      } else {
        return false
      }
    }
  },
  mounted(){
    this.fetchRecipe()
  },
}
</script>

<style scoped>
#update-recipe{
  height: 100%;
}
.recipe-update-form{
  width: 100%;
  max-width: 410px;
  margin: 0 auto;
}
nav {
  margin: 10px auto;
}
</style>