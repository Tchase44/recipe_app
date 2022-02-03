import axios from '../axios'

export default {
  login: (userData) => {
    return axios.post(`/auth_user`,
    {
      authentication: {
        password: userData.password,
        email: userData.email
      }
    }).then( data => {
      // console.log(data)
      return data.data
    })
    .catch( err => {
      // console.log(err)
      return {error: err}
    })
  },
  signUp: (userInfo = {}) => {
    return axios.post(`/sign_up`,
    {sign_up: userInfo}
    ).then( data => {
      return data.data
    })
    .catch( err => {
      // console.log(err)
      return {error: err}
    })
  },
  passwordChange:(userInfo = {})=>{
    return axios.put(`/users/password`,
    {account_update: userInfo, password: null}
    ).then( data => {
      return data.data
    })
    .catch( err => {
      // console.log(err)
      return {error: err}
    })
  },
  removeAccount: () => {
    return axios.delete(`/users`)
    .then( data => {
      return data.data
    })
    .catch( err => {
      // console.log(err)
      return {error: err}
    })
  },
  getMyUsername: () => {
    return axios.get(
      `/user/username`
    ).then( data => {
      return data.data
    }).catch( err => {
      // console.log(err)
      return {error: err}
    })
  },
  changeUsername: (userInfo = {}) => {
    return axios.put(`/user/username`,
    {account_update: userInfo}
    ).then( data => {
      return data.data
    }).catch(err=>{
      // console.log(err)
      return {error: err}
    })
  }
}