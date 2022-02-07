<template>
  <div v-if="error">
    <p>Erreur lors de la récupération de la recette</p>
  </div>
  <div v-else>
    <div v-if="loading" style="margin: 0 auto;" class="mt-5">
      <Spinner />
    </div>
    <div v-else class="recipe">
      <p class="has-text-centered has-text-weight-semibold is-size-2">
        {{ recipe.titre }}
      </p>
      <div class="recipe-image  ">
        <b-image :src="recipe.url_img" alt="Placeholder image" />
      </div>
      <div class="recipe-info is-flex is-flex-wrap-wrap is-justify-content-space-between">
        <div class="timerecipe">
          <p>{{ timeConv }}</p>
        </div>
        <div class="recipe-content">
          <p class="has-text-centered">
            {{ level }}
          </p>
        </div>
        <div class="has-text-centered">
          <span class="icon-text">
            <span>{{ recipe.nb_pers }}</span>
            <span class="icon">
              <i class="fas fa-utensil-spoon" />
            </span>
          </span>
        </div>
      </div>
      <br>
      <div class="lorem text has-text-centered is-bordered">
        <p class="p-2">
          {{ recipe.description }}
        </p>
      </div>
      <br>
      <div class="recipe-logo has-text-centered is-flex flex-wrap-wrap">
        <div class="likedislike">
          <b-button type="is-primary" size="is-large" outlined rounded>
            <b-icon
              pack="far"
              icon="thumbs-up"
              size="is-medium"
            />
          </b-button>
          <b-button type="is-primary" size="is-large" outlined rounded>
            <b-icon
              pack="far"
              icon="thumbs-down"
              size="is-medium"
            />
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
  </div>
</template>
<script>
import axios from 'axios'
import Spinner from '../components/spinner'
export default {
  name: 'RecetteComp',
  components: {
    Spinner
  },
  props: ['id'],
  data () {
    return {
      error: false,
      loading: true,
      recipe: null
    }
  },
  computed: {
    level () {
      switch (this.recipe.difficulte) {
        case 1:
          return 'Facile'
        case 2:
          return 'Normal'
        case 3:
          return 'Difficile'
        default:
          return 'Not filled in'
      }
    },

    timeConv () {
      let time = this.recipe.temps
      let heures = ''
      let minutes = ''
      let secondes = ''

      if ((time / 3600) >= 1) {
        heures = Math.trunc(time / 3600) + 'h '
        time -= 3600 * Math.trunc(time / 3600)
      }

      if ((time / 60) >= 1) {
        minutes = Math.trunc(time / 60) + 'min '
        time -= 60 * Math.trunc(time / 60)
      }

      if (time > 0) {
        secondes = time + 'sec'
      }

      return heures + minutes + secondes
    }

  },
  created () {
    axios
      .get('http://localhost:8080/recette/' + this.id)
      .then((response) => {
        this.recipe = response.data
        console.log(this.recipe)
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
