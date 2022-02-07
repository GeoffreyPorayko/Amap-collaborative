<template>
  <div class="columns border card mt-3">
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
      <p>{{ reponse }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CardReponse',
  // eslint-disable-next-line vue/require-prop-types
  props: ['reponse', 'url_img', 'nom', 'date']
}
</script>

<style scoped>

.columns{
    width: 80%;
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

    .columns{
        width: 100%;
    }

}

</style>
