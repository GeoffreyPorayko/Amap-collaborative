<template>
  <section class="columns is-centered has-shadow">
    <div class="column is-8 box pl-5 pr-5 p-5 mt-6" id="accountView">
      <div>
        <AccountLayout />
      </div>
      <div class="mb-6">
        <AccountProfil />
      </div>
      <div class="columns mt-5">
        <div class="column is-3 box p-2">
          <AccountParams />
        </div>
        <div class="column is-4 is-offset-3 box" id="context">
          <AccountInfos />
        </div><br />
      </div>
    </div>
  </section>
</template>

<style scoped>
#accountView {
  border-radius: 20px;
}
</style>
