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

        <div v-if="$store.state.user.id">
          <div v-if="suivi">
            <b-button rounded class="is-small" @click="unfollow">
              Ne plus suivre
            </b-button>
          </div>
          <div v-else>
            <b-button rounded class="is-small" @click="follow">
              Suivre
            </b-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CardProducteur',
  // eslint-disable-next-line vue/require-prop-types,vue/prop-name-casing
  props: ['producteur', 'followers'],
  data () {
    return {
      suivi: false
    }
  },
  computed: {
    fullname () {
      return this.producteur.prenom + ' ' + this.producteur.nom
    }
  },
  mounted () {
    setTimeout(
      this.isFollowing
      , 50)
  },
  methods: {
    isFollowing () {
      this.followers.forEach((el) => {
        if (el.id === this.producteur.id) {
          this.suivi = true
        }
      })
    },
    unfollow () {
      console.log('unfollow')
      this.$axios.put(`http://localhost:8000/producteur/${this.$store.state.user.id}/unfollow/${this.producteur.id}`)
        .then((response) => {
          console.log(response)
          this.suivi = false
        })
        .catch((error) => {
          console.log(error)
        })
    },
    follow () {
      console.log('follow')
      this.$axios.put(`http://localhost:8000/producteur/${this.$store.state.user.id}/suivre/${this.producteur.id}`)
        .then((response) => {
          console.log(response)
          this.suivi = true
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }
}
</script>

<style scoped>

</style>
