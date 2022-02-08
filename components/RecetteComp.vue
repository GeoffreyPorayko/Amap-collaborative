<template>
  <div v-if="error">
    <p>{{ messageError }}</p>
  </div>
  <div v-else>
    <div v-if="loading" style="margin: 0 auto;" class="mt-5">
      <Spinner />
    </div>
    <div v-else class="recipe card">
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
      <p class="has-text-centered">
        <i>{{ recipe.description }}</i>
      </p>
      <div class="lorem text has-text-centered is-bordered mt-3 p-1">
        <button id="btn-ingredient" class="is-size-4 btnSelect btnSelected" @click="selectChange('ingredient')">
          Ingrédients
        </button>
        <button id="btn-ustensile" class="is-size-4 btnSelect" @click="selectChange('ustensile')">
          Ustensiles
        </button>
      </div>
      <div class="lorem is-bordered mt-1">
        <ul v-if="type === 'ingredient'" class="p-5">
          <li v-for="produit in produits" :key="produit.id_produit">
            {{ produit.nombre }} {{ produit.unite }} {{ produit.nom }}
          </li>
        </ul>
        <ul v-else class="p-5">
          <li v-for="ustensile in ustensiles" :key="ustensile.id_ustensile">
            {{ ustensile.nombre }} {{ ustensile.nom }}
          </li>
        </ul>
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
      messageError: '',
      loading: true,
      recipe: null,
      produits: null,
      ustensiles: null,
      etapes: null,
      type: 'ingredient'
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
      .get('http://localhost:8000/recette/' + this.id)
      .then((response) => {
        this.recipe = response.data
        console.log(this.recipe)
        this.error = false
      })
      .catch((error) => {
        console.log(error)
        this.error = true
        this.messageError = 'Erreur lors de la récupération de la recette'
      })
      .finally(() => {
        this.loading = false
      })
    axios
      .get('http://localhost:8000/recette/produits/' + this.id)
      .then((response) => {
        this.produits = response.data
        this.error = false
      })
      .catch((error) => {
        console.log(error)
        this.error = true
        this.messageError = 'Erreur lors de la récupération des ingrédients de la recette'
      })
    axios
      .get('http://localhost:8000/recette/ustensiles/' + this.id)
      .then((response) => {
        this.ustensiles = response.data
        this.error = false
      })
      .catch((error) => {
        console.log(error)
        this.error = true
        this.messageError = 'Erreur lors de la récupération des ustensiles de la recette'
      })
  },
  methods: {
    selectChange (type) {
      document.getElementById('btn-ingredient').classList.remove('btnSelected')
      document.getElementById('btn-ustensile').classList.remove('btnSelected')
      if (type === 'ingredient') {
        this.type = 'ingredient'
        document.getElementById('btn-ingredient').classList.add('btnSelected')
      } else {
        this.type = 'ustensile'
        document.getElementById('btn-ustensile').classList.add('btnSelected')
      }
    }
  }

}

</script>

<style scoped>

.btnSelect{
  width: 49.5%;
  border-radius: 8px;
  padding: 1%;
  border: none;
  cursor: pointer;
}

.btnSelected{
  background-color: #7957d5;
  color: antiquewhite;
}

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
  border: solid rgb(148, 148, 148) 1px;
  border-radius: 8px;
}
.likedislike{
  margin: 0 auto;
}
.avis{
  margin: 0 auto;
}

li{
  list-style-type: '- ';
}
</style>
