<template>
  <div>
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
          <b-navbar-item>
            Producteurs
          </b-navbar-item>
        </template>

        <template #end>
          <b-navbar-item tag="div">
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
    <div class="container mt-3">
      <b-field message="Quelle recette cherchez-vous?">
        <b-input
          placeholder="Rechercher..."
          type="search"
          icon="magnify"
          expanded
        />
        <p class="control">
          <b-button type="is-primary" label="Rechercher" />
        </p>
      </b-field>
    </div>
    <section class="main-content columns">
      <div class="column is-10">
        <Nuxt />
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'DefaultLayout',
  data () {
    return {
      items: [
        {
          title: 'Home',
          icon: 'home',
          to: { name: 'index' }
        },
        {
          title: 'Inspire',
          icon: 'lightbulb',
          to: { name: 'inspire' }
        }
      ]
    }
  }
}
</script>

<style scoped>

</style>
