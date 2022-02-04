import axios from 'axios'
// import store from './store'?
// axios.defaults.baseURL = 'https://api.example.com';
axios.defaults.baseURL = 'https://localhost:3000'; // remove once proxy os setup
axios.defaults.headers.common['Content-Type'] = 'application/json';
axios.defaults.headers.common['Authorization'] = `Bearer ${sessionStorage.getItem("auth_token")}`;

export default axios
