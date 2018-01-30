import router from '@/router'

export default {
    error(message) {
        router.app.addNotification(message, 'error')
    },
    note(message) {
        router.app.addNotification(message, 'note')
    },
    warn(message) {
        router.app.addNotification(message, 'warn')
    },
    success(message) {
        router.app.addNotification(message, 'success');
    }
}
