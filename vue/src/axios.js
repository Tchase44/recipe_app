import axios from 'axios'
// process.env.
// import store from './store'?
axios.defaults.baseURL = `${process.env.VUE_APP_API_LOCATION}`; // remove once proxy os setup
axios.defaults.headers.common['Content-Type'] = 'application/json';
axios.defaults.headers.common['Authorization'] = `Bearer ${sessionStorage.getItem("auth_token")}`;

export default axios
