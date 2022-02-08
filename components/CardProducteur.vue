<template>
  <div class="column is-one-quarter-desktop is-half-tablet is-full-mobile">
    <div class="card">
      <div class="card-image">
        <figure class="image is-4by3">
          <img :src="producteur.url_img" alt="Placeholder image">
        </figure>
      </div>
      <div class="card-content has-text-centered">
        <p class="mb-1">
          {{ fullname }}
        </p>
        <b-button rounded class="is-small">
          {{ followed }}
        </b-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CardProducteur',
  // eslint-disable-next-line vue/require-prop-types,vue/prop-name-casing
  props: ['producteur'],
  data () {
    return {
      suivi: 0
    }
  },
  computed: {
    fullname () {
      return this.producteur.prenom + ' ' + this.producteur.nom
    },
    followed () {
      if (this.suivi) {
        return 'Ne plus suivre'
      } else {
        return 'Suivre'
      }
    }
  }
}
</script>

<style scoped>

</style>
