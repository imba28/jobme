import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import auth from '@/auth'

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'
import RegisterPage from '@/pages/Register'
import TaskAddPage from '@/pages/TaskAdd'
import GroupsPage from '@/pages/Groups'
import GroupPage from '@/pages/Group'
import GroupAddPage from '@/pages/GroupAdd'
import LoginPage from '@/pages/Login'
import TestPage from '@/pages/Test'
import WelcomePage from "@/pages/Welcome"
import ErrorPage from "@/pages/Error"
import CalendarPage from "@/pages/Calendar"

const router = new Router({
    linkActiveClass: "active", // active class for non-exact links.
    linkExactActiveClass: "active", // active class for *exact* links.
    routes: [{
            path: '/',
            component: WelcomePage,
            meta: {
                ifLoginRedirectTo: '/tasks'
            }
        },
        {
            name: 'tasks',
            path: '/tasks',
            component: TasksPage,
            meta: {
                requiresLogin: true,
                bottomMenuIndex: 1
            }
        },
        {
            name: 'task-add',
            path: '/tasks/add',
            component: TaskAddPage,
            props: true,
            meta: {
                requiresLogin: true
            }
        },
        {
            name: 'groups',
            path: '/groups',
            component: GroupsPage,
            meta: {
                pageHeader: 'Gruppen',
                requiresLogin: true,
                bottomMenuIndex: 0
            }
        },
        {
            name: 'group-add',
            path: '/groups/add',
            component: GroupAddPage,
            meta: {
                pageHeader: 'Gruppen',
                requiresLogin: true
            }
        },
        {
            name: 'group_id',
            path: '/groups/:id',
            component: GroupPage,
            props: true,
            meta: {
                pageHeader: 'Gruppen',
                requiresLogin: true
            }
        },
        {
            path: '/test',
            component: TestPage,
            meta: {
                requiresLogin: true
            }
        },
        { path: '/login', name: 'login', component: LoginPage, meta: { ifLoginRedirectTo: '/tasks' }},
        { path: '/register', component: RegisterPage },
        { path: '/calendar', component: CalendarPage },
        { path: '*', component: ErrorPage }
    ]
})

router.beforeEach(function(to, from, next) {
    if (to.meta) {
        if (to.meta.requiresLogin) {
            if (!auth.isSignedIn()) {
                router.push({
                    path: 'login'
                })
                router.app.addNotification('Für diese Aktion musst du dich einloggen!', 'error')

                return;
            }
        }
        if (to.meta.ifLoginRedirectTo) {
            if (auth.isSignedIn()) {
                console.log("REDIRECT TO " + to.meta.ifLoginRedirectTo)
                router.push({
                    path: to.meta.ifLoginRedirectTo
                })
                return;
            }
        }


        if (to.meta.bottomMenuIndex !== undefined && from.meta.bottomMenuIndex !== undefined) {
            router.app.$root.transitionName = to.meta.bottomMenuIndex > from.meta.bottomMenuIndex ? 'page-right' : 'page-left'
        }
    }

    if (typeof router.app.setPageHeader === 'function') {
        router.app.setPageHeader(to.meta.pageHeader || 'task-o-mat')
    }

    next()
})

export default router
