<template>
  <div class="column is-one-quarter-desktop is-half-tablet is-full-mobile">
    <div class="card">
      <div class="card-image">
        <figure class="image is-4by3">
          <img :src="contributeur.url_img" alt="Photo de profil">
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
  name: 'CardContributeur',
  // eslint-disable-next-line vue/require-prop-types,vue/prop-name-casing
  props: ['contributeur', 'followers'],
  data () {
    return {
      suivi: false
    }
  },
  computed: {
    fullname () {
      return this.contributeur.prenom + ' ' + this.contributeur.nom
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
        if (el.id === this.contributeur.id) {
          this.suivi = true
        }
      })
    },
    unfollow () {
      this.$axios.put(`http://localhost:8000/contributeur/${this.$store.state.user.id}/unfollow/${this.contributeur.id}`)
        .then((response) => {
          this.suivi = false
        })
        .catch((error) => {
          console.log(error)
          this.$buefy.toast.open('Une erreur est survenue')
        })
    },
    follow () {
      this.$axios.put(`http://localhost:8000/contributeur/${this.$store.state.user.id}/suivre/${this.contributeur.id}`)
        .then((response) => {
          this.suivi = true
        })
        .catch((error) => {
          console.log(error)
          this.$buefy.toast.open('Une erreur est survenue')
        })
    }
  }
}
</script>

<style scoped>

</style>
