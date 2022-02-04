<template>
  <div class="ingredient-form">
    <form v-if="!create" @submit="update" class="IngForm">
      <input type="hidden" name="id" :value="updates.id">
      <input type="hidden" name="recipe_id" :value="updates.recipe_id">


      <label for="amount" class="amount">Amount:</label>
      <input type="text" name="amount_value" id="amount_value" class="amount_value" v-model="value" >
      <select name="amount_units" id="amount_units" v-model="unit">
        <option disabled value="">Please select one</option>
        <option v-for="u in units" :value="u" v-bind:key="u">{{u}}</option>
      </select><br>

      <label for="name" class="name-label">Name:</label>
      <input type="text" class="name-value " name="name" v-model="updates.name" :placeholder="updates.name"><br>


      <label for="tip" class="tip-label">Tip:</label>
      <input type="text" class="tip-value " name="tip" v-model="updates.tip" :placeholder="updates.tip"><br>

      <button type="submit" class="btn update-btn">Update</button>
    </form >

    <form v-else @submit="createIng" class="IngForm">
      <input type="hidden" name="id" :value="updates.id">
      <input type="hidden" name="recipe_id" :value="updates.recipe_id">

      <label for="amount" class="amount">Amount:</label>
      <input type="text" name="amount_value" id="amount_value" class="amount_value" placeholder="Must be Number or accepted fraction" v-model="value" >
      <select name="amount_units" id="amount_units" v-model="unit">
        <option disabled value="">Please select one</option>
        <option v-for="u in units" :value="u" v-bind:key="u">{{u}}</option>
      </select>

      <label for="name" class="name-label">Name:</label>
      <input type="text" name="name" class="name-value" v-model="updates.name" :placeholder="updates.name">

      <label for="tip" class="tip-label">Tip:</label>
      <input type="text" name="tip" class="tip-value" v-model="updates.tip" :placeholder="updates.tip">

      <button type="submit" class="btn create-btn">Add ingredient</button>
    </form >
  </div>
</template>

<script>
import apiService from '../../services/RecipeApi'
import measure from '../../services/measuements'
export default {
  name: "Form",
  props:{
    ingredient: Object,
    create: Boolean,
    recipeId: Number,
  },
  data(){
    return{
      units: measure.units,
      unit: this.splitter(this.$props.ingredient.amount).u,
      value: this.splitter(this.$props.ingredient.amount).a,
      updates: {
        ...this.$props.ingredient,
        recipe_id: this.$props.recipeId},//<- clone the obj to prevent mutation
      msg: null
    }
  },
  methods:{
    async update(e){
      e.preventDefault()
      // let updates = {...this.ingredient}
      // fraction check here
      // console.log(this.updates)
      this.updates.amount = this.joiner(this.value, this.unit)
      delete this.updates.created_at
      delete this.updates.updated_at
      let updated = await apiService.updateIngredient(this.updates)
      if(!updated.error){
        this.ingredient = updated
        window.setTimeout(()=>{
          this.$router.go(`/recipe/${this.updates.recipe_id}`)
        },1000)
      }
    },
    async createIng(e){
      e.preventDefault()
      // let updates = {...this.ingredient}
      // fraction check here
      // console.log(this.updates)
      this.updates.amount = this.joiner(this.value, this.unit)
      delete this.updates.created_at
      delete this.updates.updated_at
      let updated = await apiService.createIngredient(this.updates)
      if(!updated.error){
        this.ingredient = updated
        window.setTimeout(()=>{
          this.$router.go(`/recipe/${this.updates.recipe_id}`)
        },1000)
      }
    },
    splitter(amount){
      let x = amount.indexOf(" ") + 1 //* Removes space from slice
      let u = amount.slice(x, amount.length) //<- "Cups"
      let a = amount.slice(0, x) //<- "2"
      return {u:u, a:a}
    },
    joiner(value,unit){
      return `${value.trimEnd()} ${unit}`
    }
    // async remove(ingredient){
    //   let updated = await apiService.deleteIngredient
    // }
  }
}
</script>

<style scoped>
input{
  width: 100%;
  height: 25px;
}
.IngForm{
  display: grid;
  width: 100%;
  grid-template-areas:
                    "amount amount-value amount-measure"
                    "name name-value name-value"
                    "tips tips-value tips-value"
                    "btn btn btn ";
  grid-gap: 5px;
  row-gap: 15px;
}
.amount{
  grid-area: amount;
}
#amount_units{
  grid-area: amount-measure;
}
.amount_value{
  grid-area: amount-value;
}
.name-value{
  grid-area: name-value;
}
.name-label{
  grid-area: name;
}
.tip-label{
  grid-area: tips;
}
.tip-value{
  grid-area: tips-value;
}
.btn{
  grid-area: btn;
  height: 30px;
}
/* input.single-box{
  width: 300px;
} */
</style>