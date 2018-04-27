import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'
import service from '@/lib/service'

Vue.use(Vuex)

const vuexLocal = new VuexPersistence({
  storage: window.sessionStorage
})

export default new Vuex.Store({
  state: {
    myJobs: [], // vorgeschlagene Jobs
    savedJobs: [], // Jobs, die mir gefallen haben
    checkedIcons: [],
    user: {},
    auth_token: null
  },
  mutations: {
    setMyJobs(state, jobs) {
      state.myJobs = jobs
    },
    likeJob(state, job) {
      console.log("like job", job)
      if (state.savedJobs.find(item => item.id == job.id) == undefined) {
        console.log("push", job)

        state.savedJobs.push(job)
      }
      service('users/1/jobs', {
        method: 'POST',
        data: {
          job_id: job.id
        }
      })
    },
    dislikeJob(state, job) {
      let local_job = state.savedJobs.find(item => item.id == job.id)
      if (local_job) {
        state.savedJobs.splice(state.savedJobs.indexOf(local_job), 1)
      }
      service('users/1/jobs/' + job.id, {
        method: 'DELETE',
        rawName: true
      })
    },
    checkIcon(state, category) {
      if (state.checkedIcons.includes(category.id)) {
        category.isChecked = false;
        state.checkedIcons.splice(state.checkedIcons.indexOf(category.id), 1)
      } else {
        category.isChecked = true;
        state.checkedIcons.push(category.id)
      }
    },
    setUser(state, user) {
      state.user = user
    },
    setAuthToken(state, token) {
      state.auth_token = token
    },
    setLikedJobs(state, jobs) {
      state.savedJobs = jobs
    }
  },
  actions: {
    setJobs({
      commit
    }, jobs) {
      commit('setMyJobs', jobs)
    },
  },
  plugins: [vuexLocal.plugin]
})
