import Vue from 'vue'

import Router from 'vue-router'
import auth from '@/auth'

// Pages
import HomePage from '@/pages/Home'
import ErrorPage from '@/pages/Error'

Vue.use(Router)

const router = new Router({
    linkActiveClass: 'active', // active class for non-exact links.
    linkExactActiveClass: 'active', // active class for *exact* links.
    routes: [{
            path: '/',
            component: HomePage
        },
        {
            path: '*',
            component: ErrorPage
        }
    ]
})

router.beforeEach(function(to, from, next) {
    if (to.meta) {
        if (to.meta.requiresLogin) {
            if (!auth.isSignedIn()) {
                router.push({
                    name: 'login'
                })
                router.app.addNotification('Für diese Aktion musst du dich einloggen!', 'error')

                return;
            }
        }
        if (to.meta.ifLoginRedirectTo) {
            if (auth.isSignedIn()) {
                console.log('REDIRECT TO ' + to.meta.ifLoginRedirectTo)
                router.push({
                    path: to.meta.ifLoginRedirectTo
                })
                return;
            }
        }


        if (to.meta.bottomMenuIndex !== undefined && from.meta.bottomMenuIndex !== undefined) {
            router.app.$root.transitionName = to.meta.bottomMenuIndex < from.meta.bottomMenuIndex ? 'page-right' : 'page-left'
        }
        else {
            router.app.$root.transitionName = 'page-right'
        }
    }

    if (typeof router.app.setPageHeader === 'function') {
        router.app.setPageHeader(to.meta.pageHeader || 'task-o-mat')
    }

    next()
})

export default router
