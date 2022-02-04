import Vue from 'vue'
import router from './router'
import store from './store'
import axios from './axios.js'
import App from './App.vue'
// import config from '../config'
// import { createProxyMiddleware } from 'http-proxy-middleware'
// yarn add http-proxy-middleware
// function(app) {
  // Vue.use(
  //     '/api',
  //     createProxyMiddleware({
  //       target: 'http://localhost:3000',
  //       changeOrigin: true,
  //     })
  // );

// Vue.use(config)
// console.log(process.env)
Vue.config.productionTip = false

Vue.use(axios)
// Vue.use(createProxy)
new Vue({
  router,
  store,
  axios,
  render: h => h(App)
}).$mount('#app')
