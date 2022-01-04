<template>
  <section class="section">
    <div class="container mt-3">
      <b-field message="Quelle producteur cherchez-vous?">
        <b-input
          placeholder="Rechercher..."
          type="search"
          icon="magnify"
          expanded
        />
        <p class="control">
          <b-button type="is-primary" label="Rechercher" />
        </p>
      </b-field>
    </div>
    <div class="columns is-multiline is-justify-content-center">
      <CardProducteur nom="John Doe" photo="poulet.jpg" :suivi="1" />
      <CardProducteur nom="Marcel Dupuis" photo="poulet.jpg" :suivi="0" />
      <CardProducteur nom="John Doe" photo="poulet.jpg" :suivi="1" />
      <CardProducteur nom="Marcel Dupuis" photo="poulet.jpg" :suivi="0" />
      <CardProducteur nom="John Doe" photo="poulet.jpg" :suivi="0" />
      <CardProducteur nom="Marcel Dupuis" photo="poulet.jpg" :suivi="0" />
    </div>
  </section>
</template>

<script>
import CardProducteur from '../../components/CardProducteur'
export default {
  name: 'IndexPage',
  components: {
    CardProducteur
  }
}
</script>
