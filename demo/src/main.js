// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import TaskComponent from './components/Task'
import auth from '@/auth'
import router from './router'

import '@/sass/template.scss'

Vue.config.productionTip = true
Vue.component('task-component', TaskComponent);

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    data: {
        show: '',
        isSignedIn: false,
        user: null
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
