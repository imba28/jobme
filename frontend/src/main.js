import Vue from 'vue'
import App from './App'
import auth from '@/auth'
import router from './router'
import Touch from 'vue-touch'
import Vue2TouchEvents from 'vue2-touch-events'

import '@/sass/template.scss'

Vue.config.productionTip = true

Vue.use(Vue2TouchEvents, {
    disableClick: false,
    touchClass: '',
    tapTolerance: 10,
    swipeTolerance: 30,
    longTapTimeInterval: 400
})

Vue.use(Touch)

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    props: {
        transitionName: 'page-right'
    },
    data: {
        show: '',
        isSignedIn: false,
        user: null,
    },
    components: {
        App
    },
    template: '<App/>',
    created: () => { // Beim ersten Laden der Seite prüfen, ob aus dem sessionStorage ein User ausgelesen wurde und falls vorhanden globalen Status setzen.
        if(auth.isSignedIn() && !this.isSignedIn) {
            router.app.user = auth.getUser()
            router.app.isSignedIn = true
        }
    }
})
