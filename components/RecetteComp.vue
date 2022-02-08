<template>
  <div v-if="error">
    <p>{{ messageError }}</p>
  </div>
  <div v-else>
    <div id="topPage" />
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
          <p>{{ timeConv(recipe.temps) }}</p>
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
      <div class="is-flex is-justify-content-center mt-5">
        <button class="button is-medium is-info" @click="displayStep()">
          Commencer la recette
        </button>
      </div>
      <div v-for="etape in etapes" :key="etape.id" class="mt-5">
        <h1><b>ÉTAPE {{ etape.numero }}</b> {{ etape.titre }}</h1>
        <p>{{ etape.contenu }}</p>
      </div>
      <br>
      <div class="recipe-logo has-text-centered is-flex flex-wrap-wrap mt-2">
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
    <div v-if="etapes" id="fenetreEtape" class="blur">
      <div id="etapeCard" class="card p-4">
        <i class="fas fa-times cross fa-lg" style="cursor: pointer;" @click="closeStep()" />
            <h1 class="is-size-4 ml-4 mt-4"><b>ÉTAPE {{ etapes[indexEtape].numero }}</b> {{ etapes[indexEtape].titre }} </h1>
            <img :src="etapes[indexEtape].url_img" alt="" class="imgEtape">
            <p class="ml-4 mt-5">{{ etapes[indexEtape].contenu }}</p>
            <footer>
              <button v-if="indexEtape === 0" class="button is-medium is-primary" style="float:left;">Précédent</button>
              <button v-else v-on:click="indexEtape --" class="button is-medium is-primary" style="float:left;">Précédent</button>
              <button v-if="indexEtape === etapes.length -1" class="button is-medium is-primary" style="float:right;" v-on:click="indexEtape = 0; closeStep()">Fin</button>
              <button v-else class="button is-medium is-primary mr-5" style="float:right;" v-on:click="indexEtape ++">Suivant</button>
            </footer>
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
      type: 'ingredient',
      play: false,
      timer: null,
      indexEtape: 0
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
    axios
      .get('http://localhost:8000/recette/etapes/' + this.id)
      .then((response) => {
        this.etapes = response.data
        this.error = false
      })
      .catch((error) => {
        console.log(error)
        this.error = true
        this.messageError = 'Erreur lors de la récupération des étapes de la recette'
      })
  },
  methods: {
    timeConv (time) {
      // let time = this.recipe.temps
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
    },

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
    },

    displayStep () {
      document.body.scrollTop = 0
      document.documentElement.scrollTop = 0
      document.getElementById('fenetreEtape').style = 'display: block;'
      document.getElementsByTagName('html').style = 'overflow = hidden'
    },

    closeStep () {
      document.getElementById('fenetreEtape').style = 'display: none;'
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

.blur{
  opacity: 1;
  transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
  position: absolute;
  top: 0px;
  left: 0px;
  z-index: 1;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(8px);
}

.imgEtape{
  padding: 2%;
  margin-right: 2%;
  float: right;
  max-width: 50%;
  max-height: 90%;
}

li{
  list-style-type: '- ';
}

footer{
  position: absolute;
  bottom: 0%;
  padding: 2%;
  width: 100%;
}

#fenetreEtape{
  display: none;
}

#etapeCard{
  width: 80%;
  height: 80%;
  position: absolute; /* postulat de départ */
  top: 50%; left: 50%; /* à 50%/50% du parent référent */
  transform: translate(-50%, -50%);
}

@media (max-width: 640px) {

h1{
  text-align: center;
}

.imgEtape{
  float: none;
  display: block;
  margin: 0 auto;
}

#etapeCard{
  width: 100%;
  height: 95%;
  position: absolute; /* postulat de départ */
  top: 55%; left: 50%; /* à 50%/50% du parent référent */
}

}

</style>
