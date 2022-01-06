<template>
  <div class="columns border card">
    <div class="column is-10">
      <div class="columns">
        <div class="column is-4">
          <p><b>{{ question }}</b></p>
        </div>
        <div class="column is-6">
          <p class="has-text-centered">
            Recette: {{ recette }}
          </p>
        </div>
        <br>
        <div class="column is-4">
          <p>De {{ nom }}</p>
        </div>
      </div>
    </div>
    <div class="column is-2 vertical-middle border">
      <p class="has-text-centered">
        {{ nb_rep }} <br> réponses
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CardQuestion',
  // eslint-disable-next-line vue/require-prop-types
  props: ['question', 'nb_rep', 'recette', 'nom']
}
</script>

<style scoped>
.columns{
    width:100%;
    flex-wrap: wrap;
}

.border{
    border: solid rgb(196, 196, 196) 1px;
}

.vertical-middle{
    display: grid;
    vertical-align: middle;
}

@media screen and (max-width: 768px) {
 p{
     text-align: center;
 }
}
</style>
