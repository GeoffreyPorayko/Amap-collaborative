<template>
  <div>
    <div>
      <figure class="image is-128x128 mr-3">
        <img src="http://images5.fanpop.com/image/photos/31700000/Bulma-braid-hair-icon-dragon-ball-females-31777843-150-150.jpg" alt="avatar">
      </figure>
      <h1 class="mb-5 has-text-weight-semibold">
        Bulma San
      </h1>
      <p>Avis : {{ nbAvis }}</p>
      <p>Questions : {{ nbTopics }}</p>
      <p>Membre depuis : 12/07/2022</p>
    </div>
    <div style="clear:both;" />
  </div>
</template>

<script>
export default {
  name: 'AccountProfil',
  props: ['nbAvis', 'nbTopics']
}
</script>

<style scoped>
  figure {
    border: solid black;
    float: left;
  }
  h1 {
    font-size: 20px;
  }
  p{
    font-size: 15px;
  }
</style>
