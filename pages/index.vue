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
      <CardRecipe :difficulty="3" recipename="Poulet braisé" personnes="10" photo="poulet.jpg" time="25" />
      <CardRecipe :difficulty="1" recipename="Soupe au navet d'automnes" personnes="10" photo="poulet.jpg" time="25" />
    </div>
  </section>
</template>

<script>
import CardRecipe from '../components/CardRecipe'
export default {
  name: 'IndexPage',
  components: {
    CardRecipe
  }
}
</script>
