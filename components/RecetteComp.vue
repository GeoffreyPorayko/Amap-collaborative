<template>
  <div class="recipe">
    <p class="has-text-centered has-text-weight-semibold is-size-2">
      {{ recipename }}
    </p>
    <div class="recipe-image  ">
      <b-image :src="photo" alt="Placeholder image" />
    </div>
    <div class="recipe-info is-flex is-flex-wrap-wrap is-justify-content-space-between">
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
    <br>
    <div class="lorem text has-text-centered is-bordered">
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque corporis culpa dignissimos doloremque fugiat hic, incidunt ipsum molestias quas quia quidem, reiciendis, repellendus sit tenetur!
      </p>
    </div>
    <br>
    <div class="recipe-logo has-text-centered is-flex flex-wrap-wrap">
      <div class="likedislike">
        <b-button type="is-primary" size="is-large" outlined rounded>
          <b-icon
            pack="far"
            icon="thumbs-up"
            size="is-medium">
          </b-icon>
        </b-button>
        <b-button type="is-primary" size="is-large" outlined rounded>
          <b-icon
            pack="far"
            icon="thumbs-down"
            size="is-medium">
          </b-icon>
        </b-button>
      </div>
    </div>

    <div class="avis is-flex is-flex-wrap-wrap is-justify-content-space-between">
      <b-button type="is-primary" outlined rounded>
        Une question ?
      </b-button>
      <b-button type="is-primary" outlined rounded>
        Donnez votre avis !
      </b-button>
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
.recipe{
  max-width: 500px;
  width: 100%;
  margin: 0 auto;
}

.recipe-image{
  border-radius: 8px;
  overflow: hidden;
  margin: 10px;
}

.lorem{
  border: solid black 1px;
  border-radius: 8px;
}
.likedislike{
  margin: 0 auto;
}
.avis{
  margin: 0 auto;
}
</style>
