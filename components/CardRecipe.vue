<template>
  <div class="column is-4">
    <div class="card" @click="redirect()">
      <div class="card-image">
        <div class="headercard is-flex is-justify-content-space-between p-3">
          <p>{{ timeConv }}</p>
          <span class="icon">
            <i class="fas fa-heart" />
          </span>
        </div>
        <figure class="image is-4by3">
          <img :src="photo" alt="Placeholder image">
        </figure>
      </div>
      <div class="card-content">
        <div class="columns is-mobile">
          <div class="column is-3 content has-text-centered">
            <p class="has-text-centered">
              {{ level }}
            </p>
          </div>
          <div class="column is-6 content">
            <p class="has-text-centered">
              {{ recipename }}
            </p>
          </div>
          <div class="column is-3 content has-text-centered">
            <span class="icon-text">
              <span>{{ personnes }}</span>
              <span class="icon">
                <i class="fas fa-utensil-spoon" />
              </span>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CardRecipe',
  // eslint-disable-next-line vue/require-prop-types
  props: ['recipename', 'difficulty', 'personnes', 'photo', 'time', 'id'],

  computed: {
    level () {
      switch (this.difficulty) {
        case 1:
          return 'Facile'
        case 2:
          return 'Normal'
        case 3:
          return 'Difficile'
        default:
          return 'Not filled in'
      }
    },

    timeConv () {
      let time = this.time
      let heures = ''
      let minutes = ''
      let secondes = ''

      if ((time / 3600) >= 1) {
        heures = Math.trunc(time / 3600) + 'h '
        time -= 3600 * Math.trunc(time / 3600)
      }

      if ((time / 60) >= 1) {
        minutes = Math.trunc(time / 60) + 'min '
        time -= 60 * Math.trunc(time / 60)
      }

      if (time > 0) {
        secondes = time + 'sec'
      }

      return heures + minutes + secondes
    }
  },

  methods: {

    redirect () {
      window.location.href = '/recette/' + this.id
    }

  }
}
</script>

<style scoped>
.headercard {
  position: absolute;
  z-index: 1;
  font-weight: bold;
  width: 100%;
}

.headercard p {
  background-color: rgba(255,255,255);
  border-radius: 10px;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
  padding: 5px;
}

div.column p {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.headercard span {
  transform: scale(1.3);
  color: white;
}

.headercard span i {
  box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset, rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
  text-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px;
}

.headercard span:hover {
  transform: scale(1.5);
  color: red;
}

</style>
