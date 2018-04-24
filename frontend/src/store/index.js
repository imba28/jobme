import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state:  {
        myJobs: []
    },
    mutations: {
        setJobs(state, jobs) {
            state.myJobs = jobs
        }
    }
})
