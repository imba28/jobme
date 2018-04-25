import notification from '@/lib/notification'
import router from '@/router'

let user = null

const local_token = sessionStorage.getItem('auth_token')
const local_user = sessionStorage.getItem('user')

if (local_user) {
  user = local_user
}

export default {
  isSignedIn () {
    return local_user !== null
  },
  getUser () {
    return user
  },
  getUID () {
    if (user) return 1
    return null
  },
  getAuthToken () {
    return 'pleasedontsteal'
  },
  signOut () {
    user = null

    sessionStorage.removeItem('user')

    router.app.$root.isSignedIn = false
    router.app.$root.user = null
  },
  signIn (user, password) {
    fetch('http://localhost:3000/user_token', {
      method: 'post',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({'auth': {'name': user, 'password': password}})

    }).then(function (response) {
      console.info(response)
    })

    /* return new Promise((resolve, reject) => {
      user = user

      notification.success(`Willkommen ${user}!`);

      sessionStorage.setItem('user', user)

      router.app.$root.isSignedIn = true
      router.app.$root.user = user

      resolve(user)
    })
      .catch(err => {
        notification.error(err.message);
        reject(err.message);
      }) */
    }
}
