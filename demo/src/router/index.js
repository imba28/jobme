import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

// Pages
import HomePage from '@/pages/Home'
import TasksPage from '@/pages/Tasks'
import TaskAddPage from '@/pages/TaskAdd'
import GroupsPage from '@/pages/Groups'
import GroupPage from '@/pages/Group'
import GroupAddPage from '@/pages/GroupAdd'

export default new Router({
    routes: [
        {
            path: '/',
            component: HomePage
        },
        {
            name: 'tasks',
            path: '/tasks',
            component: TasksPage,
            children: [
                { path: '/tasks/add', component: TaskAddPage, props: true }
            ]
        },
        {
            name: 'groups',
            path: '/groups',
            component: GroupsPage,
            children: [
                { path: '/groups/add', component: GroupAddPage }
            ]
        },
        {
            name: 'group_id',
            path: '/groups/:id',
            component: GroupPage,
            props: true
        }
    ]
})
