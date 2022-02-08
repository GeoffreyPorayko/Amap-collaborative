<template>
  <div class="columns is-centered">
    <div class="column is-4 is-half mb-6">
      <b-navbar centered style="border-radius: 5px" class="is-primary">
        <template #start>
          <b-navbar-item id="layout" tag="nuxt-link" to="/compte/params" class="is-size-5">
            Compte
          </b-navbar-item>
          <b-navbar-item tag="nuxt-link" to="/compte/params" class="is-size-5">
            Mes Recettes
          </b-navbar-item>
          <b-navbar-item tag="nuxt-link" to="/compte/params" class="is-size-5">
            Favoris
          </b-navbar-item>
        </template>
      </b-navbar>
    </div>
  </div>
</template>
<style scoped>

</style>
