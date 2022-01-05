<template>
  <section class="section">
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
    <div class="columns is-multiline is-justify-content-center">
      <CardRecipe
        v-for="recette in recettes"
        :key="recette"
        :idrecette="recette.id"
        :difficulty="recette.difficulte"
        :recipename="recette.titre"
        :personnes="recette.nb_pers"
        photo="poulet.jpg"
        :time="recette.temps"
      />
    </div>
  </section>
</template>

<script>
import CardRecipe from '../components/CardRecipe'

export default {
  name: 'IndexPage',
  components: {
    CardRecipe
  },
  data () {
    return {
      recettes: null
    }
  },
  created () {
    this.$axios.get('http://localhost:8000/recettes').then((response) => {
      this.recettes = response.data
    })
  }
}
</script>
