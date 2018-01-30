import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import auth from '@/auth'

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'
import RegisterPage from '@/pages/Register'
import TaskAddPage from '@/pages/TaskAdd'
import LoginPage from '@/pages/Login'
import TestPage from '@/pages/Test'
import WelcomePage from "@/pages/Welcome"

const router = new Router({
    linkActiveClass: "active", // active class for non-exact links.
    linkExactActiveClass: "active", // active class for *exact* links.
    routes: [{
            path: '/',
            name: 'home',
            component: HomePage,
            meta: {
                pageHeader: 'task-o-mat'
            }
        },
        {
            path: '/tasks',
            component: TasksPage,
            children: [{
                path: '/tasks/add',
                component: TaskAddPage,
                props: true
            }],
            meta: {
                pageHeader: 'Aufgaben'
            }
        },
        { path: '/login', name: 'login', component: LoginPage},
        { path: '/test', component: TestPage},
        { path: '/register', component: RegisterPage},
        { path: '/welcome', component: WelcomePage}
    ]
})

router.beforeEach(function(to, from, next) {
    if (to.name === undefined) { //TODO Routen markieren, die keinen Login benötigen.
        if (!auth.isSignedIn()) {
            router.push({ path: 'login' })
            router.app.addNotification('Für diese Aktion musst du dich einloggen!', 'error')

            return false;
        }
    }

    if(typeof router.app.setPageHeader === 'function') {
        router.app.setPageHeader(to.meta.pageHeader || 'task-o-mat')
    }

    next()
})

export default router
