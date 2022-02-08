<template>
  <section class="columns is-centered">
    <div class="column is-8 box pl-5 pr-5 p-5 mt-6" id="accountView">
      <div>
        <AccountLayout />
      </div>
      <div class="mb-6">
        <AccountProfil :nb-avis="nbAvis" :nb-topics="nbTopics" />
      </div>
      <div class="columns mt-5">
        <div class="column is-3 box p-2 has-background-grey-lighter">
          <AccountParams />
        </div>
        <div class="column is-4 is-offset-3 box has-background-grey-lighter" id="context">
          <AccountInfos />
        </div><br />
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'Params',
  data () {
    return {
      member: this.$store.state.member,
      avis: [],
      nbAvis: 0,
      topics: [],
      nbTopics: 0
    }
  },
  mounted () {
    this.chargerAvis()
    this.chargerTopics()
  },
  methods: {
    chargerAvis () {
      // this.$axios.get(`users/${this.member.id}/avis`).then((response) => {
      this.$axios.get('http://localhost:8000/users/2/avis').then((response) => {
        this.avis = response.data
        this.nbAvis = response.data.length
      })
    },
    chargerTopics () {
      // this.$axios.get(`users/${this.member.id}/topics`).then((response) => {
      this.$axios.get('http://localhost:8000/users/2/topics').then((response) => {
        this.topics = response.data
        this.nbTopics = response.data.length
      })
    }
  }
}
</script>

<style scoped>
#accountView {
  border-radius: 20px;
}
</style>
