<template>
  <section class="section">
    <div class="container mt-3">
      <b-field message="Quelle recette cherchez-vous?">
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
    <div class="columns is-multiline is-justify-content-center mt-6">
      <CardQuestion question="Quel cuisson pour un poisson ?" nb_rep="2" recette="Poulet braisé" nom="Jeanne Delart" />
    </div>
  </section>
</template>

<script>
import CardQuestion from '../../components/CardQuestion'
export default {
  name: 'QuestionsPage',
  components: {
    CardQuestion
  }
}
</script>
