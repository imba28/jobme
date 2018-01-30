import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'
<<<<<<< HEAD
import LoginPage from '@/pages/Login'
import TaskAddPage from '@/pages/TaskAdd'

export default new Router({
  routes: [
      { path: '/', component: HomePage },
      {
          path: '/tasks',
          component: TasksPage,
          children: [
              { path: '/tasks/add', component: TaskAddPage, props: true }
          ]
      },
      { path: '/login', component: LoginPage}
  ]
})
