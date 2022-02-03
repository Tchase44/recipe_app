import Vue from 'vue'
import VueRouter from 'vue-router'
import Routes from './Routes'
import store from '../store'

Vue.use(VueRouter)

const routes = Routes

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach( (to,form,next) => {
  if(store.getters.isLoggedIn && store.getters.getTokenData){
    // console.log("Logged In")
    let t = JSON.parse(atob(store.getters.getTokenData))
    let exp = new Date(0)
    exp.setUTCSeconds(t.exp)

    let iss = new Date(0)
    iss.setUTCSeconds(t.iat)

    let now = new Date
    switch (now) {
      case now >= exp:
        store.commit('logOut')
        sessionStorage.clear()
        localStorage.clear()
        next({to: "/"})
        break;
      case iss >= now:
        store.commit('logOut')
        sessionStorage.clear()
        localStorage.clear()
        next({to: "/"})
        break;
      case iss >= exp:
        store.commit('logOut')
        sessionStorage.clear()
        localStorage.clear()
        next({to: "/"})
        break;
      default:
        next()
        break;
    }
  }else{
    // console.log("not logged in")
    next()
  }
})
export default router
