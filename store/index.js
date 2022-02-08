import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export const state = () => ({
  token: '',
  user: {
    id: 1,
    nom: 'Humbert',
    prenom: 'Lucas'
  }
})

export const mutations = {
  storeToken (state, token) {
    state.token = token
  },
  storeUser (state, user) {
    state.user = user
  }
}
