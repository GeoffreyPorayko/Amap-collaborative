<template>
  <div>
    <section>
      <h1 class="title is-4">
        Création de recette :
      </h1>
      <h5 class="subtitle is-5 mt-1">
        Sur cette pages vous pourrez créer votre recette afin de la publié étape par
        étape.
      </h5>
      <b-field label="Nom de la recette">
        <b-input name="nomrecette" expanded/>
      </b-field>

      <div class="is-flex is-flex-wrap-wrap is-justify-content-space-between">
        <b-field label="Saison">
          <b-select placeholder="Choisir une saison">
            <option value="1">
              Été
            </option>
            <option value="2">
              Automne
            </option>
            <option value="3">
              Printemps
            </option>
            <option value="4">
              Hiver
            </option>
          </b-select>
        </b-field>
        <b-field label="Difficultée">
          <b-select placeholder="Choisir une difficultée">
            <option value="1">
              Facile
            </option>
            <option value="2">
              Moyenne
            </option>
            <option value="3">
              Dur
            </option>
          </b-select>
        </b-field>
        <b-field label="Régime">
          <b-select placeholder="Choisir un régime">
            <option value="1">
              Normal
            </option>
            <option value="2">
              Végétarien
            </option>
            <option value="3">
              Végan
            </option>
          </b-select>
        </b-field>
        <b-field label="Nombre de personnes">
          <b-select placeholder="Choisir le nombre de personne">
            <option value="1">
              1
            </option>
            <option value="2">
              2
            </option>
            <option value="3">
              3
            </option>
            <option value="4">
              4
            </option>
            <option value="5">
              5
            </option>
            <option value="6">
              6
            </option>
            <option value="7">
              + de 6
            </option>
          </b-select>
        </b-field>
      </div>
      <b-field label="Nombre d'ingrédients">
        <b-numberinput v-model="nbing" placeholder="5" min="1" max="15"/>
      </b-field>
      <h5 class="subtitle is-5">Liste des ingrédients : </h5>
      <div class="columns is-multiline">
        <div v-for="n in parseInt(nbing)" :key="n" class="mt-2 column is-one-quarter is-full-mobile is-full-tablet">
          <b-input v-model="listing[n]"></b-input>
        </div>
      </div>

      <b-field label="Nombre d'étapes de la recette">
        <b-numberinput v-model="nbetapes" placeholder="5" min="1" max="15"/>
      </b-field>
      <div v-for="n in parseInt(nbetapes)" :key="n" class="mt-3">
        <h5 class="title is-5">
          Etape : {{ n }}
        </h5>
        <b-field>
          <b-input v-model="descetape[n]" type="textarea"/>
        </b-field>
      </div>
    </section>
    <b-button expanded class="button is-primary">
      Envoyer la recette
    </b-button>
  </div>
</template>

<script>
export default {
  name: 'Creation',
  data () {
    return {
      nbing: 1,
      nbetapes: 1,
      descetape: [],
      listing: []
    }
  }
}
</script>

<style scoped>

</style>
