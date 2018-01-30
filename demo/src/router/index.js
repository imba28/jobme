import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'
import LoginPage from '@/pages/Login'

export default new Router({
  routes: [
      { path: '/', component: HomePage },
      { path: '/tasks', component: TasksPage },
      { path: '/login', component: LoginPage}
  ]
})
