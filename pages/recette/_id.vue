<template>
  <div>
    <RecetteComp :id="$route.params.id" />
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
