import Home from '../views/Home.vue'
import Show from '../components/recipes/Show.vue'
import Form from '../components/recipes/Form.vue'
import RecipeNew from '../components/recipes/New.vue'
import login from '../components/users/login.vue'
import signUp from '../components/users/signup.vue'
import Account from '../components/users/account.vue'

export default [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/recipe/new',
    name: 'RecipeNew',
    component: RecipeNew
  },
  {
    path: '/recipes',
    name: 'Recipes',
    component: Home
  },
  {
    path: '/recipe/:slug',
    props: true,
    name: 'Show',
    component: Show
  },
  // {
  //   path: '/recipe/:id',
  //   props: true,
  //   name: 'Show',
  //   component: Show
  // },
  {
    path: '/recipe/:slug/edit',
    props: true,
    name: 'Form',
    component: Form
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path:"/login",
    component: login
  },
  {
    path:"/sign_up",
    component: signUp
  },
  {
    path:"/my_account",
    component: Account
  }
]