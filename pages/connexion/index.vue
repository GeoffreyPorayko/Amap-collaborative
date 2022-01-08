<template>
  <section class="section">
    <div class="columns is-multiline is-justify-content-center">
      <Connection :log-function="loginUser" :erreur-email="erreurEmail" :erreur-password="erreurPassword" />
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
      erreurEmail: '',
      erreurPassword: ''
    }
  },
  methods: {
    validEmail (email) {
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      return re.test(email)
    },
    // eslint-disable-next-line require-await
    async loginUser (loginInfo) {
      this.erreurEmail = ''
      this.erreurPassword = ''

      if (!loginInfo.email) {
        this.erreurEmail = 'Email nécessaire'
      } else if (!this.validEmail(loginInfo.email)) {
        this.erreurEmail = 'Email valide nécessaire'
      }

      if (!loginInfo.password) {
        this.erreurPassword = 'Mot de passe nécessaire'
      }

      if (!this.erreurEmail.length && !this.erreurPassword.length) {
        try {
          const response = await this.$auth.loginWith('local', { data: loginInfo })
          // eslint-disable-next-line no-console
          console.log(response)
        } catch (err) {
          // eslint-disable-next-line no-console
          console.log(err)
        }
      }
    }
  }
}
</script>
