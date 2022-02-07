<template>
  <div class="column is-one-quarter-desktop is-half-tablet is-full-mobile">
    <div class="card">
      <div class="card-image">
        <figure class="image is-4by3">
          <img :src="photo" alt="Placeholder image">
        </figure>
      </div>
      <div class="card-content has-text-centered">
        <p class="mb-1">
          {{ nom }}
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
  props: ['nom', 'photo', 'suivi'],
  computed: {
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
