<template>
  <div>
    <div class="welcome--text__container">
      <h1>You have seen it all!</h1>
      <p>
        Head back to
        <router-link :to="{ name: 'explore-childhood' }">
          the start
        </router-link>
        to start a new round.
      </p>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'out-of-jobs-page'
  }
</script>
