<template>
  <div class="column is-8">
    <div class="card">
      <h1 class="has-text-centered is-size-4 pt-4">
        <b>Connection</b>
      </h1>
      <section class="pb-4">
        <b-field
          label="Email:"
          class="column is-6"
          style="margin:0 auto;"
        >
          <b-input
            type="email"
            placeholder="entrez votre email"
          />
        </b-field>
        <b-field
          label="Mot de passe:"
          class="column is-6"
          style="margin:0 auto;"
        >
          <b-input
            type="password"
            placeholder="entrez votre mot de passe"
          />
        </b-field>
        <div class="is-flex is-justify-content-center pb-4 pt-4">
            <b-button type="is-primary" outlined>Connection</b-button>
        </div>
        <p class="has-text-centered">
          Mot de passe oublié ?
        </p>
        <p class="has-text-centered">
          Pas encore de compte ? <a>Creez en un</a>
        </p>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ConnectionItem'
}
</script>
