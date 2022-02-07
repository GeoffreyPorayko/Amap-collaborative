import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export const state = () => ({
  token: '',
  user: {}
})

export const mutations = {
  storeToken (state, token) {
    state.token = token
  },
  storeUser (state, user) {
    state.user = user
  }
}
