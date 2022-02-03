import axios from 'axios'
// need config for api host
// `proxy` defines the hostname, port, and protocol of the proxy server.
// `auth` indicates that HTTP Basic auth should be used to connect to the proxy, and
// supplies credentials.
// This will set an `Proxy-Authorization` header, overwriting any existing
// `Proxy-Authorization` custom headers you have set using `headers`.
// If the proxy server uses HTTPS, then you must set the protocol to `https`.
// proxy: {
//   protocol: 'https',
//   host: '127.0.0.1',
//   port: 9000,
//   auth: {
//     username: 'mikeymike',
//     password: 'rapunz3l'
//   }
// },
export default {
  getAll: () => {
    return axios.get(`/recipes`)
    .then( data => {
      return data.data
    })
    .catch( err => {
      // console.log(err)
      return {error: err}
    })
  },
  // getRecipeById: (id) => {
  //   return axios.get(`/recipes/${id}`)
  //   .then( data => {
  //     return data.data
  //   })
  //   .catch( err => {
  //     return {error: err}
  //   })
  // },
  getRecipeBySlug: (slug) => {
    return axios.get(`/recipes/${slug}`)
    .then( data => {
      return data.data
    })
    .catch( err => {
      return {error: err}
    })
  },
  createRecipe:(recipeObj) => {
    return axios.post(
      `/recipes`,
      {recipe: recipeObj}
    )
    .then( data => {
      return data.data
    })
    .catch( err => {
      // console.log(err)
      return { error: err}
    })
  },
  updateRecipe:(recipeObj) => {
    let recipe = Object.assign({}, recipeObj)
    delete recipe.showURL
    delete recipe.editURL
    delete recipe.ingredients
    return axios.put(
      `/recipes/${recipe.id}`,
      {recipe: recipe}
    ).then( data => {
      return data.data
    })
    .catch( err => {
      return {error: err}
    })
  },
  deleteRecipe: (id = "") => {
    return axios.delete(`/recipes/${id}`)
    .then( data => {
      return data.data
    })
    .catch( err => {
      return { error: err}
    })
  },
  createIngredient: (itemObj = {}) => {
    return axios.post(
      `/recipes/${itemObj.recipe_id}/ingredients`,
      {ingredient: itemObj}
    ).then( data => {
      return data.data
    }).catch( err => {
      return { error: err}
    })
  },
  updateIngredient: (itemObj = {}) => {
    return axios.put(
      `/recipes/${itemObj.recipe_id}/ingredients/${itemObj.id}`,
      {ingredient: itemObj}
    ).then( data => {
      return data.data
    }).catch( err => {
      return { error: err}
    })
  },
  deleteIngredient: (ing = {}) => {
    return axios.delete(`/recipes/${ing.recipe_id}/ingredients/${ing.id}`)
    .then( data => {
      return data.data
    }).catch( err => {
      return { error: err}
    })
  },
  /*
  // Ingredients
  getIngredientbyId: (id = "") => {
    return axios.get()
    .then( data => {
      return data.data
    })
    .catch( err => {
      return { error: err}
    })
  },
  getIngredientsbyRecipeId: (recipeId = "") => {
    return axios.get()
    .then( data => {
      return data.data
    })
    .catch( err => {
      return { error: err}
    })
  },
  */
  addUrls: (objOrArray) => {
    if(objOrArray[0] === undefined){ //<-means its an array not a object
      let obj = objOrArray
      obj.showURL = `/recipe/${obj.id}`
      obj.editURL = `/recipe/${obj.id}/edit`
      return obj
    } else {
      let arry = objOrArray
      arry.forEach(r => {
        r.showURL = `/recipe/${r.id}`
        r.editURL = `/recipe/${r.id}/edit`
      });
      return arry
    }
  }
}