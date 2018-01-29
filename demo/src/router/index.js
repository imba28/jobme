import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'
import TaskAddPage from '@/pages/TaskAdd'
import TestPage from '@/pages/Test'

export default new Router({
    linkActiveClass: "active", // active class for non-exact links.
    linkExactActiveClass: "active", // active class for *exact* links.
    routes: [
        {
            path: '/',
            component: HomePage
        },
        {
            path: '/tasks',
            component: TasksPage,
            children: [
                { path: '/tasks/add', component: TaskAddPage, props: true }
            ]
        }
    ]
})
