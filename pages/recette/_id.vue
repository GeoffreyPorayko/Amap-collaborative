<template>
  <div>
    <RecetteComp :difficulty="3" recipename="Poulet braisé" personnes="10" photo="../../poulet.jpg" time="25" />
  </div>
</template>

<script>
import RecetteComp from '../../components/RecetteComp'
export default {
  name: 'RecetteVue',
  components: {
    RecetteComp
  }
}
</script>

<style scoped>

</style>
