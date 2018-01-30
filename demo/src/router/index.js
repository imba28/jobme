import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import auth from '@/auth'
auth.signIn('aaa', 'asdasd')

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'
import TaskAddPage from '@/pages/TaskAdd'
import LoginPage from '@/pages/Login'
const router = new Router({
    linkActiveClass: "active", // active class for non-exact links.
    linkExactActiveClass: "active", // active class for *exact* links.
    routes: [{
            path: '/',
            name: 'home',
            component: HomePage
        },
        {
            path: '/tasks',
            component: TasksPage,
            children: [{
                path: '/tasks/add',
                component: TaskAddPage,
                props: true
            }]
        },
        { path: '/login', name: 'login', component: LoginPage}
    ]
})

router.beforeEach(function(to, from, next) {
    if (to.name === undefined) { //TODO Routen markieren, die keinen Login benötigen.
        if (!auth.isSignedIn()) {
            router.push({ path: 'login' });
            return false;
        }
    }

    next()
})

export default router
