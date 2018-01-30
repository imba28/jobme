import notification from '@/lib/notification'

let email = null;
let password = null;

export default {
    isSignedIn() {
        return email !== null
    },
    signIn(email, password) {
        const formData = new FormData();
        formData.append('email', email);
        formData.append('password', password);

        fetch('http://localhost:3000/login', {
            mode: 'cors',
            method: 'POST',
            headers: {
                'Accept': 'application/json',
            },
        })
        .then(response => response.json())
        .then(status => {
            if(status.error !== undefined && status.error === true) {
                notification.error(status.message);
                return false;
            }
            else {
                notification.success(status.message);
                return true;
            }
        })
    }
}
