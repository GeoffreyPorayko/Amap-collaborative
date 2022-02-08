<template>
  <section class="section">
    <div class="container mt-3">
      <b-field message="Quelle producteur cherchez-vous?">
        <b-input
          v-model="search"
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
    <div class="columns is-multiline is-justify-content-center mt-2">
      <template v-for="producteur in filterByTerm">
        <CardProducteur :key="producteur.id" :producteur="producteur" />
      </template>
    </div>
  </section>
</template>

<script>
import CardProducteur from '../../components/CardProducteur'
export default {
  name: 'IndexPage',
  components: {
    CardProducteur
  },
  data () {
    return {
      producteurs: [],
      search: ''
    }
  },
  computed: {
    filterByTerm () {
      return this.producteurs.filter((el) => {
        if (el.nom.toLowerCase().includes(this.search.toLowerCase()) || el.prenom.toLowerCase().includes(this.search.toLowerCase())) {
          return true
        } else {
          return false
        }
      })
    }
  },
  mounted () {
    this.$axios.get('http://localhost:8000/producteurs')
      .then((response) => {
        this.producteurs = response.data
        console.log(response)
      })
      .catch((error) => {
        console.log(error)
      })
  }
}
</script>
