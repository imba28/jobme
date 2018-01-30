import notification from '@/lib/notification'
import request from '@/lib/request'

let user = null;
let auth_token = null;

const local_token = sessionStorage.getItem('auth_token')
const local_user = sessionStorage.getItem('user')

if(local_token && local_user) {
    auth_token = local_token
    user = JSON.parse(local_user)
}

export default {
    isSignedIn() {
        return auth_token !== null
    },
    getUser() {
        return user
    },
    getUID() {
        if(user) return user.id
        return null
    },
    getAuthToken() {
        return auth_token
    },
    signOut() {
        user = null
        auth_token = null
    },
    signIn(email, password) {
        return new Promise((resolve, reject) => {
            request.fetch(`http://localhost:3000/login`, 'POST', {
                email,
                password
            })
            .then(res => {
                user = res.user
                auth_token = res.auth_token

                notification.success(`Willkommen zurück ${user.name}!`);

                sessionStorage.setItem('auth_token', auth_token)
                sessionStorage.setItem('user', JSON.stringify(user))

                resolve(user)
            })
            .catch(err => {
                notification.error(err.message);
                reject(err.message);
            })
        })
    }
}
