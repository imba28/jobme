import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'

Vue.use(Vuex)

const vuexLocal = new VuexPersistence({
    storage: window.sessionStorage
})

export default new Vuex.Store({
    state:  {
        myJobs: [], // vorgeschlagene Jobs
        savedJobs: [], // Jobs, die mir gefallen haben
        checkedIcons: []
    },
    mutations: {
        setMyJobs(state, jobs) {
            state.myJobs = jobs
        },
        likeJob(state, job) {
            if (!state.savedJobs.find(item => item.id == job.id)) {
                state.savedJobs.push(job)
            }
        },
        dislikeJob(state, job) {
            if (state.savedJobs.find(item => item.id == job.id)) {
                state.savedJobs.splice(state.savedJobs.indexOf(job), 1)
            }
        },
        checkIcon(state, category) {
            if (state.checkedIcons.includes(category.id)) {
                category.isChecked = false;
                state.checkedIcons.splice(state.checkedIcons.indexOf(category.id), 1)
            } else {
                category.isChecked = true;
                state.checkedIcons.push(category.id)
            }
        }
    },
    actions: {
        setJobs({ commit }, jobs) {
            commit('setMyJobs', jobs)
        },
    },
    plugins: [vuexLocal.plugin]
})
