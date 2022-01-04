<template>
  <div class="recipe">
    <p class="has-text-centered has-text-weight-semibold is-text">
      {{ recipename }}
    </p>
    <div class="recipe-image">
      <b-image
        :src="photo"
        alt="Placeholder image"
      ></b-image>
    </div>
    <div class="footer-recipe is-flex is-flex-wrap-wrap is-justify-content-space-between">
      <div class="timerecipe">
        <p>{{ time }} min</p>
      </div>
      <div class="recipe-content">
        <p class="has-text-centered">
          {{ level }}
        </p>
      </div>
      <div class="has-text-centered">
        <span class="icon-text">
          <span>{{ personnes }}</span>
          <span class="icon">
            <i class="fas fa-utensil-spoon" />
          </span>
        </span>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'RecetteComp',
  props: ['recipename', 'difficulty', 'personnes', 'photo', 'time'],
  computed: {
    level () {
      switch (this.difficulty) {
        case 1:
          return 'Facile'
        case 2:
          return 'Normal'
        case 3:
          return 'Difficile'
        default:
          return 'Not filled in'
      }
    }
  }
}
</script>

<style scoped>

.recipe-image{
max-width: 500px;
width: 100%;
  margin: 0 auto;
  border-radius: 8px;
  overflow: hidden;
}
</style>
