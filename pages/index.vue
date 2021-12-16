<template>
  <section class="section">
    <div class="columns is-multiline">
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
