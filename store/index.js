import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export const state = () => ({
  token: ''
})

export const mutations = {
  storeToken (state, data) {
    state.token = data.access_token
  }
}
