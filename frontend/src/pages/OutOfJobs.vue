<template>
  <div>
    <div class="container">
      <h1>Das war 's...</h1>
        <h3>
          Du hast alle Treffer gesehen.
        </h3>
        <p>
          Vielleicht möchtest du noch mehr
          <router-link :to="{ name: 'explore-childhood' }">
            Berufe suchen
          </router-link>?
        </p>
        <p>
          <router-link :to="{ name: 'saved-jobs' }">
          Hier
        </router-link> findest du deine gespeicherten Treffer.
        </p>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'out-of-jobs-page'
  }
</script>

<style lang="scss" scoped>
  .container p {
    padding: 0 2em;
  }

  h3 {
    text-align: center;
    margin-top: 0;
  }
</style>
