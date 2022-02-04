<template>
  <div>
    <div class="message-box">
      <h4 class="error" v-if="errors">{{errors}}</h4>
      <h4 class="success" v-if="success">{{success}}</h4>
    </div>

    <form @submit="create">

      <label for="title">Title</label><br>
      <input type="text" name="title" id="title" v-model="recipeObj.title" required><br>

      <label for="slug">Slug</label><br>
      <span>URL: /recipe/{{paramiterize(recipeObj.title)}}</span><br>

      <label for="description">Description</label><br>
      <input type="text" name="description" id="description" v-model="recipeObj.description"><br>

      <label id="direction-label" for="directions">Directions:</label><br>
      <textarea name="directions"
                    id="directions"
                    v-model="recipeObj.directions"
                    rows="10"
                    ></textarea><br>
      <label for="tips">Tips</label><br>
      <input type="text" name="tips" id="tips" v-model="recipeObj.tips"><br>

      <button type="submit">Submit!</button>
    </form>
  </div>
</template>

<script>
import apiService from '../../services/RecipeApi'
import validator from '../../services/recipeValidations'
export default {
  name: 'RecipeNew',
  data(){
    return {
      recipeObj: {
        "title":"",
        "description":"",
        "directions": "",
        "tips": "",
        // ingredients: []
        },
      errors: null,
      success: null
    }
  },
  methods:{
    async create(e){
      e.preventDefault()
      let newRecipe = {...this.recipeObj}//<- clone the obj to prevent mutation
      let valid = validator.valid(newRecipe)
      if(valid === true){
        let post = await apiService.createRecipe(newRecipe)
        if(post.error){
          this.errors = post.error
        }else{
          this.success = "Successfully Created!"
          this.recipeObj = post
          window.setTimeout(() => {
            this.$router.push(`/recipe/${post.slug}`)
          }, 1000);
        }
      }else{
        this.errors = valid
      }
    },
    paramiterize: function(str){
      if (str){
        return encodeURIComponent(str.replaceAll(' ','-').toLowerCase())
      } else {
        return ""
      }
    }
  },
  mounted(){
  },
  computed: {

  }
}
</script>

<style scoped>

</style>