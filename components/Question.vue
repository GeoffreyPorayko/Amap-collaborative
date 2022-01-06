<template>
  <div class="columns border card">
    <div class="column is-12 border">
        <p>{{question}}</p>
        <p>Recette : {{recette}}</p>
    </div>
    <div class="column is-2 is-justify-content-center border">
        <img :src="url_img" alt="" style="text-align:center;">
        <br>
        <p class="has-text-centered">
          {{ nom }}
        </p>
        <br>
        <p class="has-text-centered">
          {{ date }}
        </p>
    </div>
    <div class="column">
      <p>{{ detail }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CardQuestion',
  // eslint-disable-next-line vue/require-prop-types
  props: ['question', 'url_img', 'recette', 'nom', 'date', 'detail']
}
</script>

<style scoped>

.columns{
    flex-wrap: wrap;
}

img{
    max-width: 100px;
    text-align:center;
    margin:auto;
    display:flex;
}

.border{
    border: solid rgb(196, 196, 196) 1px;
}

@media screen and (max-width: 768px) {
 div{
    margin:auto;
 }
}

</style>
