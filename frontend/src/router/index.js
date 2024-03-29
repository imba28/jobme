import Vue from 'vue'

import Router from 'vue-router'
import auth from '@/auth'

// Pages
import InfoPage from '@/pages/JobInfo'
import SavedJobsPage from '@/pages/Saved'
import HomePage from '@/pages/Home'
import ErrorPage from '@/pages/Error'
import ProfilePage from '@/pages/Profile'
import JobPage from '@/pages/Job'
import ExploreChildhoodPage from '@/pages/Explore-Childhood'
import ExploreNowPage from '@/pages/Explore-Now'
import DetailsPage from '@/pages/details'
import OutOfJobsPage from '@/pages/OutOfJobs'
import AboutPage from '@/pages/About'

Vue.use(Router)

const router = new Router({
  linkActiveClass: 'active', // active class for non-exact links.
  linkExactActiveClass: 'active', // active class for *exact* links.
  routes: [{
    name: 'home',
    path: '/',
    component: HomePage,
    meta: {
      ifLoginRedirectTo: 'explore-childhood'
    }
  },
  {
    name: 'saved-jobs',
    path: '/saved',
    component: SavedJobsPage,
    meta: {
      requiresLogin: true
    }
  },
  {
    name: 'explore-childhood',
    path: '/explore-childhood',
    component: ExploreChildhoodPage,
    meta: {
      requiresLogin: true
    }
  },
  {
    name: 'explore-now',
    path: '/explore-now',
    component: ExploreNowPage,
    meta: {
      requiresLogin: true
    }
  },
  {
    name: 'about',
    path: '/about/',
    component: AboutPage
  },
  {
    name: 'run-out-of-jobs',
    path: '/no-jobs/',
    component: OutOfJobsPage
  },
  {
    name: 'details',
    path: '/details/:hobby_id',
    component: DetailsPage,
    props: true,
    meta: {
      requiresLogin: true
    }
  },
  {
    name: 'job-info',
    path: '/jobs/:name/info',
    component: InfoPage,
    props: true
  },
  {
    name: 'job',
    path: '/jobs/:name',
    component: JobPage,
    props: true,
    meta: {
      requiresLogin: true
    }
  },
  {
    name: 'profile',
    path: '/profile',
    component: ProfilePage,
    meta: {
      requiresLogin: true
    }
  },
  {
    path: '*',
    component: ErrorPage
  }
  ]
})

router.beforeEach(function (to, from, next) {
  if (to.meta) {
    if (to.meta.requiresLogin) {
      if (!auth.isSignedIn()) {
        router.push({
          name: 'home'
        })
        router.app.addNotification('Für diese Aktion musst du dich einloggen!', 'error')

        return
      }
    }
    if (to.meta.ifLoginRedirectTo) {
      if (auth.isSignedIn()) {
        console.log('REDIRECT TO ' + to.meta.ifLoginRedirectTo)
        router.push({
          path: to.meta.ifLoginRedirectTo
        })
        return
      }
    }

    const toIdx = to.params.bottomMenuIndex ? to.params.bottomMenuIndex : 0
    router.app.$root.transitionName = toIdx <= 0 ? 'page-right' : 'page-left'
  }

  next()
})

export default router
