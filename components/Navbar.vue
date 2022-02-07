<template>
  <b-navbar>
    <template #brand>
      <b-navbar-item>
        <img
          src="https://raw.githubusercontent.com/buefy/buefy/dev/static/img/buefy-logo.png"
          alt="Lightweight UI components for Vue.js based on Bulma"
        >
      </b-navbar-item>
    </template>
    <template #start>
      <b-navbar-item tag="nuxt-link" to="/">
        Recette
      </b-navbar-item>
      <b-navbar-item tag="nuxt-link" to="/QandA">
        Q&A
      </b-navbar-item>
      <b-navbar-item tag="nuxt-link" to="/producteurs">
        Producteurs
      </b-navbar-item>
    </template>

    <template #end>
      <b-navbar-item v-if="$store.state.token" tag="div">
        <div class="buttons">
          <div class="button is-primary" @click="$router.push(`/profil/${$store.state.user.id}`)">
            <strong>{{ $store.state.user.email }}</strong>
          </div>
          <div class="button is-light" @click="deconnection">
            Déconnexion
          </div>
        </div>
      </b-navbar-item>

      <b-navbar-item v-else tag="div">
        <div class="buttons">
          <Nuxt-Link to="/inscription">
            <div class="button is-primary">
              <strong>Inscription</strong>
            </div>
          </Nuxt-Link>
          <Nuxt-Link to="/connexion">
            <div class="button is-light">
              Connexion
            </div>
          </Nuxt-Link>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>

<script>
export default {
  name: 'Navbar',
  methods: {
    deconnection () {
      this.$auth.logout()
      this.$store.commit('storeUser', {})
      this.$store.commit('storeToken', '')
      this.$router.push('/')
    }
  }
}
</script>

<style scoped>

</style>
