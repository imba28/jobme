import router from '@/router'
import store from '@/store'
import config from '@/../config/app'

export default {
  isSignedIn() {
    return store.state.user !== null
  },
  getUser() {
    return store.state.user
  },
  getUID() {
    if (store.state.user) return store.state.user.id
    return null
  },
  getAuthToken() {
    return store.state.auth_token
  },
  signOut() {
    store.commit('setUser', null)
    store.commit('setAuthToken', null)
  },
  signIn(user, password) {
    return new Promise((resolve, reject) => {
      fetch(config.api.host + '/user_token', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            'name': user,
            'password': password
        })
      })
      .then(async function(response) {
        const json = await response.json()
        if (response.status < 200 || response.status >= 300) {
          reject(json)
        }

        store.commit('setUser', json.user)
        store.commit('setAuthToken', json.auth_token)

        resolve(json)
      })
    })
  }
}
