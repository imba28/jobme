import notification from '@/lib/notification'
import request from '@/lib/request'

let user = null;
let auth_token = null;

const local_token = sessionStorage.getItem('auth_token')
const local_user = sessionStorage.getItem('auth_token')

if(local_token) {
    auth_token = local_token
    user = local_user
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
                notification.success(res);
                user = res.user
                auth_token = res.auth_token
                sessionStorage.setItem('auth_token', auth_token)
                sessionStorage.setItem('user', user)
                resolve(user)
            })
            .catch(err => {
                notification.error(status.message);
                reject(status.message);
            })
        })
    }
}
