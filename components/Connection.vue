<template>
  <div class="column is-8">
    <div class="card">
      <h1 class="has-text-centered is-size-4 pt-4">
        <b>Connexion</b>
      </h1>
      <section class="pb-4">
        <form>
          <b-field
            label="Email:"
            class="column is-6"
            style="margin:0 auto;"
          >
            <b-input
              v-model="userInfo.email"
              type="text"
              placeholder="Entrer votre email"
            />
          </b-field>
          <div
            class="has-text-danger has-text-centered"
          >
            {{ erreurEmail }}
          </div>
          <b-field
            label="Mot de passe:"
            class="column is-6"
            style="margin:0 auto;"
          >
            <b-input
              v-model="userInfo.password"
              type="password"
              placeholder="Entrer votre mot de passe"
              password-reveal
            />
          </b-field>
          <div
            class="has-text-danger has-text-centered"
          >
            {{ erreurPassword }}
          </div>
          <div class="submit is-flex is-justify-content-center pb-4 pt-4">
            <b-button type="is-primary" outlined @click="logFunction(userInfo)">
              Connexion
            </b-button>
          </div>
        </form>
        <p class="has-text-centered">
          Mot de passe oublié ?
        </p>
        <p class="has-text-centered">
          Pas encore de compte ?
          <NuxtLink to="/inscription">
            Créez en un
          </NuxtLink>
        </p>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ConnectionItem',
  // eslint-disable-next-line vue/require-prop-types,vue/prop-name-casing
  props: ['logFunction', 'erreurEmail', 'erreurPassword'],
  data () {
    return {
      showPassword: false,
      userInfo: {
        email: '',
        password: ''
      }
    }
  }
}
</script>

<style scoped>

</style>
