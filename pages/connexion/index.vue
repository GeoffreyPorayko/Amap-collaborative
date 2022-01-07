<template>
  <section class="section">
    <div class="columns is-multiline is-justify-content-center">
      <Connection :log-function="loginUser"/>
    </div>
  </section>
</template>

<script>
import Connection from '../../components/Connection'

export default {
  name: 'IndexPage',
  components: {
    Connection
  },
  data () {
    return {
      errorMessage: ''
    }
  },
  methods: {
    async loginUser (loginInfo) {
      try {
        const response = await this.$auth.loginWith('local', { data: loginInfo })
        console.log(response)
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>
