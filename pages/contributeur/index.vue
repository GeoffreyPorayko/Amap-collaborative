<template>
  <section class="section">
    <div class="columns mt-3">
      <b-field message="Quelle contributeur cherchez-vous?" class="column is-half is-offset-3">
        <b-input
          v-model="search"
          placeholder="Rechercher..."
          type="search"
          icon="magnify"
          expanded
        />
      </b-field>
    </div>
    <div class="columns is-multiline is-justify-content-center mt-2">
      <template v-for="contributeur in filterByTerm">
        <CardContributeur :key="contributeur.id" :contributeur="contributeur" :followers="followers" />
      </template>
    </div>
  </section>
</template>

<script>
import CardContributeur from '../../components/CardContributeur'
export default {
  name: 'IndexPage',
  components: {
    CardContributeur
  },
  data () {
    return {
      contributeurs: [],
      followers: [],
      search: ''
    }
  },
  computed: {
    filterByTerm () {
      return this.contributeurs.filter((el) => {
        if (el.id !== this.$store.state.user.id) {
          return el.nom.toLowerCase().includes(this.search.toLowerCase()) || el.prenom.toLowerCase().includes(this.search.toLowerCase())
        } else {
          return false
        }
      })
    }
  },
  mounted () {
    this.$axios.get('http://localhost:8000/contributeurs')
      .then((response) => {
        this.contributeurs = response.data
      })

    this.$axios.get(`http://localhost:8000/contributeurs/suivis/${this.$store.state.user.id}`)
      .then((response) => {
        this.followers = response.data
      })
  }
}
</script>
