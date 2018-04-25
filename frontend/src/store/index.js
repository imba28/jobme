import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state:  {
        myJobs: [],
        checkedIcons: []
    },
    mutations: {
        setMyJobs(state, jobs) {
            state.myJobs = jobs
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
    }
})
