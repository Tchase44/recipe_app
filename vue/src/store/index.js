import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    logged_in: sessionStorage.getItem('auth_token') ? true : false,
    user_token: sessionStorage.getItem('auth_token') || null,
    recipes: [],
    numRecipes: 0
  },
  getters:{
    getAllRecipes: state => {
      return state.recipes
    },
    getRecipe: (state) => (id) => {
      return state.recipes.find( r => r.id === id)
    },
    getNumRecipes: (state) => {
      return state.numRecipes
    },
    isLoggedIn: ( state ) => {
      return state.logged_in
    },
    getTokenData:(state) => {
      if(state.logged_in && state.user_token){
        return state.user_token.split(".")[1]
      }else{
        return null
      }
    },
    token:(state) => {
      if(state.logged_in && state.user_token){
        return state.user_token
      }else{
        return null
      }
    }
  },
  mutations: {
    addRecipes: (state, recipeArray) => {
      state.recipes = recipeArray
      state.numRecipes = recipeArray.length
    },
    updateRecipe: (state, newR) => {
      let r = state.recipes.findIndex( r => r.id === newR.id)
      state.recipes[r] = newR
    },
    logOut: (state)=>{
      state.logged_in = false
      state.user_token = null
      sessionStorage.clear()
    },
    logIn:(state, token) => {
      sessionStorage.setItem('auth_token',token)
      state.logged_in = true
      state.user_token = token
    }
  },
  actions: {
  },
  modules: {
  }
})
