<template>
  <div class="column is-8">
    <div class="card">
      <h1 class="has-text-centered is-size-4 pt-4">
        <b>Inscription</b>
      </h1>
      <section class="pb-4 pl-6 pr-6 mt-4">
        <div class="is-flex is-justify-content-center">
          <b-field
            label="Nom:"
            class="column is-6"
          >
            <b-input
              type="text"
              placeholder="entrez votre nom"
            />
          </b-field>
          <b-field
            label="Prénom"
            class="column is-6"
          >
            <b-input
              type="text"
              placeholder="entrez votre prénom"
            />
          </b-field>
        </div>
        <div class="is-flex is-justify-content-center">
          <b-field
            label="Email:"
            class="column is-6"
          >
            <b-input
              type="text"
              placeholder="entrez votre email"
            />
          </b-field>
          <b-field
            label="Téléphone"
            class="column is-6"
          >
            <b-input
              type="text"
              placeholder="entrez votre numéro de téléphone"
            />
          </b-field>
        </div>
        <div class="is-flex is-justify-content-center">
          <b-field
            label="Mot de passe:"
            class="column is-6"
          >
            <b-input
              type="password"
              placeholder="entrez votre mot de passe"
            />
          </b-field>
          <b-field
            label="Confirmation du mot de passe"
            class="column is-6"
          >
            <b-input
              type="text"
              placeholder="confirmez votre mot de passe"
            />
          </b-field>
        </div>
        <div class="is-flex is-justify-content-center">
          Êtes-vous un expert en cuisine ? &nbsp;
          <b-radio
            v-model="radio"
            name="expertRatio"
            native-value="oui"
            @click.native="seen = true"
          >
            oui
          </b-radio>
          <b-radio
            v-model="radio"
            name="expertRatio"
            native-value="non"
            checked
            @click.native="seen = false"
          >
            non
          </b-radio>
        </div>
        <div v-if="seen" id="expert" class="columns is-flex-wrap-wrap mt-4" style="border:solid lightgrey 1px;">
          <b-field class="column is-6">
            <b-checkbox id="cuissonFour" class="checkbox">
              Cuisson au four
            </b-checkbox>
          </b-field>
          <b-field class="column is-6">
            <b-checkbox id="poisson" class="checkbox">
              Poisson
            </b-checkbox>
          </b-field>
          <b-field class="column is-6">
            <b-checkbox id="cuissonPlancha" class="checkbox">
              Cuisson à la plancha
            </b-checkbox>
          </b-field>
          <b-field class="column is-6">
            <b-checkbox id="viande" class="checkbox">
              Viande
            </b-checkbox>
          </b-field>
        </div>
        <div class="is-flex is-justify-content-center pb-4 pt-4">
          <b-button type="is-primary" outlined>
            Inscription
          </b-button>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SignUpItem',
  data () {
    return {
      radio: 'non',
      seen: false
    }
  }
}

</script>
