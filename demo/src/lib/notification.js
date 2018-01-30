import router from '@/router'

export default {
    error(message, duration = 2500) {
        router.app.addNotification(message, 'error', duration)
    },
    note(message, duration = 2500) {
        router.app.addNotification(message, 'note', duration)
    },
    warn(message, duration = 2500) {
        router.app.addNotification(message, 'warn', duration)
    },
    success(message, duration = 2500) {
        router.app.addNotification(message, 'success', duration);
    }
}
