<template>
  <div class="p-2">
    <h1 class="pb-4 is-size-5">
      Informations Personnelles
    </h1>
    <div v-if="edit">
      <form>
        <div v-if="edit === 'nom'" class="is-flex">
          <b-tooltip label="Annuler" position="is-top"><i class="fas fa-undo is-clickable" @click="cancelInfos()" /></b-tooltip>
          <p class="pb-2">
            <span class="is-underlined">Nom :</span>
            <b-input type="texte" />
          </p>
        </div>
        <div v-else class="is-flex">
          <b-tooltip label="Modifier" position="is-left"><i class="fas fa-pen is-clickable" @click="editInfos('nom')" /></b-tooltip>
          <p class="pb-2"><span class="is-underlined">Nom</span> : Bulma San</p>
        </div>
        <div v-if="edit === 'email'" class="is-flex">
          <b-tooltip label="Annuler" position="is-top"><i class="fas fa-undo is-clickable" @click="cancelInfos()" /></b-tooltip>
          <p class="pb-2">
            <span class="is-underlined">Email :</span>
            <b-input type="texte" />
          </p>
        </div>
        <div v-else class="is-flex">
          <b-tooltip label="Modifier" position="is-left"><i class="fas fa-pen is-clickable" @click="editInfos('email')" /></b-tooltip>
          <p class="pb-2"><span class="is-underlined">Email</span> : jean.paul@gmail.com</p>
        </div>
        <div v-if="edit === 'tel'" class="is-flex">
          <b-tooltip label="Annuler" position="is-top"><i class="fas fa-undo is-clickable" @click="cancelInfos()" /></b-tooltip>
          <p class="pb-2">
            <span class="is-underlined">Téléphone :</span>
            <b-input type="texte"></b-input>
          </p>
        </div>
        <div v-else class="is-flex">
          <b-tooltip label="Modifier" position="is-left"><i class="fas fa-pen is-clickable" @click="editInfos('tel')" /></b-tooltip>
          <p class="pb-2"><span class="is-underlined">Téléphone</span> : 0625186203</p>
        </div>
        <div class="has-text-centered">
          <b-button type="is-primary" outlined>Valider</b-button>
        </div>
      </form>
    </div>
    <div v-else>
      <div class="is-flex">
        <b-tooltip label="Modifier" position="is-left"><i class="fas fa-pen is-clickable" @click="editInfos('nom')" /></b-tooltip>
        <p class="pb-2"><span class="is-underlined">Nom</span> : Bulma San</p>
      </div>
      <div class="is-flex">
        <b-tooltip label="Modifier" position="is-left"><i class="fas fa-pen is-clickable" @click="editInfos('email')" /></b-tooltip>
        <p class="pb-2"><span class="is-underlined">Email</span> : jean.paul@gmail.com</p>
      </div>
      <div class="is-flex">
        <b-tooltip label="Modifier" position="is-left"><i class="fas fa-pen is-clickable" @click="editInfos('tel')" /></b-tooltip>
        <p class="pb-2"><span class="is-underlined">Téléphone</span> : 0625186203</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      edit: ''
    }
  },
  methods: {
    editInfos (name) {
      this.edit = name
    },
    cancelInfos () {
      this.edit = ''
    }
  }
}
</script>

<style scoped>
h1 {
  text-align: center;
  text-decoration: underline;
}
i {
  float: left;
  margin-right: 7px;
}
</style>
