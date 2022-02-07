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
      <CardRecipe :difficulty="3" recipename="Poulet braisé" personnes="10" photo="poulet.jpg" time="4980" />
      <CardRecipe :difficulty="1" recipename="Soupe au navet d'automnes" personnes="10" photo="poulet.jpg" time="25" />
      <CardRecipe
        v-for="recipe in recipes"
        :key="recipe"
        :difficulty="recipe.difficulte"
        :recipename="recipe.titre"
        :personnes="recipe.nb_pers"
        :photo="recipe.url_img"
        :time="recipe.temps"
      />
    </div>
  </section>
</template>

<script>
import axios from 'axios'
import CardRecipe from '../components/CardRecipe'

export default {
  name: 'IndexPage',
  components: {
    CardRecipe
  },
  data () {
    return {
      error: false,
      loading: true,
      recipes: null
    }
  },

  created () {
    axios
      .get('http://localhost:8080/recettes')
      .then((response) => {
        this.recipes = response.data
        console.log(this.recipes)
        this.error = false
      })
      .catch((error) => {
        console.log(error)
        this.error = true
      })
      .finally(() => {
        this.loading = false
      })
    // méthode qui est appelée quand le callback d'une promise est exécuté : resolve ou reject, cela évite de dupliquer le code dans .then & .catch
  }

}
</script>
