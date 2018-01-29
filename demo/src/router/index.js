import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'

export default new Router({
  routes: [
      { path: '/', component: HomePage },
      { path: '/tasks', component: TasksPage }
  ]
})
