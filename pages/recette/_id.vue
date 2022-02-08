<template>
  <div>
    <RecetteComp :id="$route.params.id" class="mt-5" />
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
