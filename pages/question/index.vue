<template>
  <section class="section">
    <div class="columns is-multiline is-justify-content-center mt-6">
      <Question
        question="Quel cuisson pour un poisson ?"
        recette="Poulet braisé"
        nom="Jeanne Delart"
        url_img="https://mbdev.dev/img/profil.png"
        date="02/07/2021"
        detail="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra molestie vehicula. Integer sodales pharetra viverra. Quisque massa ipsum, laoreet non semper rhoncus, porttitor sed risus. Nam tortor dui, rhoncus et justo at, dignissim lacinia lectus. Nam ultrices vestibulum sapien, eget fringilla lorem ultrices accumsan. Sed malesuada est massa, vitae eleifend eros viverra eu. Curabitur nisl sem, feugiat eu vestibulum sed, euismod id augue. Mauris pharetra dui ipsum, sed vestibulum tellus gravida vitae. Aliquam erat volutpat. Suspendisse potenti. Nunc non venenatis lacus, vitae gravida turpis. In eleifend tortor a est tristique, a tempor urna luctus. Donec mollis tempus mi, non tempor sapien gravida non. Donec sem lorem, fringilla vel aliquam id, vehicula et est. Sed non eros eu magna porttitor congue a id ante. Cras dapibus enim vitae sapien placerat, at varius lorem tincidunt. Duis vehicula tortor in augue eleifend, sed vestibulum augue sagittis. Ut quis dui a sem vestibulum pharetra et in urna. Vestibulum sed viverra ipsum. Ut vestibulum sapien nibh, eu efficitur ex suscipit in. Suspendisse velit orci, dignissim id rutrum a, gravida nec tellus."
      />
      <Reponse
        nom="Jeanne Delart"
        url_img="https://mbdev.dev/img/profil.png"
        date="04/07/2021"
        reponse="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra molestie vehicula. Integer sodales pharetra viverra. Quisque massa ipsum, laoreet non semper rhoncus, porttitor sed risus. Nam tortor dui, rhoncus et justo at, dignissim lacinia lectus. Nam ultrices vestibulum sapien, eget fringilla lorem ultrices accumsan. Sed malesuada est massa, vitae eleifend eros viverra eu. Curabitur nisl sem, feugiat eu vestibulum sed, euismod id augue. Mauris pharetra dui ipsum, sed vestibulum tellus gravida vitae. Aliquam erat volutpat. Suspendisse potenti. Nunc non venenatis lacus, vitae gravida turpis. In eleifend tortor a est tristique, a tempor urna luctus. Donec mollis tempus mi, non tempor sapien gravida non. Donec sem lorem, fringilla vel aliquam id, vehicula et est. Sed non eros eu magna porttitor congue a id ante. Cras dapibus enim vitae sapien placerat, at varius lorem tincidunt. Duis vehicula tortor in augue eleifend, sed vestibulum augue sagittis. Ut quis dui a sem vestibulum pharetra et in urna. Vestibulum sed viverra ipsum. Ut vestibulum sapien nibh, eu efficitur ex suscipit in. Suspendisse velit orci, dignissim id rutrum a, gravida nec tellus."
      />
    </div>
  </section>
</template>

<script>
import Question from '../../components/Question'
import Reponse from '../../components/Reponse'
export default {
  name: 'QuestionPage',
  components: {
    Question,
    Reponse
  }
}

</script>
