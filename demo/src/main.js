// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import TaskComponent from './components/Task'
import router from './router'

import '@/sass/template.scss'

Vue.config.productionTip = true
Vue.component('task-component', TaskComponent);

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    data: {
        show: ''
    },
    components: {
        App
    },
    template: '<App/>'
})
