<template>
  <li v-bind:key="item.id" class="item-li">
    <!-- Show -->
    <div v-if="show" class="item-div">
      <span class="amount">{{item.amount}} </span>
      <span class="item">{{item.name}}</span>
      <span class="tip">{{item.tip}}</span>
      <span v-if="level_check()" @click="flip" class="edit-icon">&#x270E;</span>
    </div>
    <div v-else>
      <Form :ingredient="item" :create="false"/>
      <div class="btn-row">
        <button @click="removeIng" class="trash-box btn">
          <svg class="trash" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M19 7L18.1327 19.1425C18.0579 20.1891 17.187 21 16.1378 21H7.86224C6.81296 21 5.94208 20.1891 5.86732 19.1425L5 7M10 11V17M14 11V17M15 7V4C15 3.44772 14.5523 3 14 3H10C9.44772 3 9 3.44772 9 4V7M4 7H20" stroke="#4A5568" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
        <button @click="flip" class="cancel btn" type="button">Cancel</button>
      </div>
    </div>

  </li>
</template>

<script>
import Form from "./Form"
import apiService from "../../services/RecipeApi"
export default {
  name: "Ingredient",
  props: {
    item: Object
  },
  components:{
    Form
  },
  data(){
    return {
      show: true
    }
  },
  methods:{
    flip(){
      this.show = !this.show
    },
    async removeIng(e){
      e.preventDefault()
      let gone = await apiService.deleteIngredient(this.$props.item)
      if(gone.error){
        // console.log(gone.error)
        return
      }else{
        this.$router.go(`/recipe/${this.$props.item.recipe_id}`)
      }
    },
    level_check(){
      if(this.$store.getters.isLoggedIn){
        return JSON.parse(atob(this.$store.getters.getTokenData))["level"] === 1 ? true : false
      } else {
        return false
      }
    }
  },
}
</script>

<style scoped>
.btn-row{
  display: flex;
  flex-wrap: nowrap;
  justify-content: space-around;
}
.btn{
  box-sizing: border-box;
  width:45%;
  height: 30px;
}
.trash{
  margin: 0;
  padding: 0;
  /* line-height: 30px; */
  /* vertical-align: middle; */
}
/* .cancel{} */
/* .trash-box{} */
.edit-icon{
  float: right;
  cursor: pointer;
}
.edit-icon:hover{
  color: #3bbd58;
  box-shadow: 1px 0px 10px #efefef;
}
.item-li{
  border-bottom: 1px solid #efefef;
}
.item-li:hover{
  border-bottom: 1px dotted #000;
}
</style>