<template>
  <div>
    <Navbar/>
    <section class="main-content columns is-justify-content-center">
      <div class="column is-10">
        <Nuxt/>
      </div>
    </section>
  </div>
</template>

<script>
import Navbar from '@/components/Navbar'

export default {
  name: 'DefaultLayout',
  components: { Navbar },
  data () {
    return {
      items: [
        {
          title: 'Home',
          icon: 'home',
          to: { name: 'index' }
        },
        {
          title: 'Inspire',
          icon: 'lightbulb',
          to: { name: 'inspire' }
        }
      ]
    }
  }
}
</script>

<style scoped>

</style>
