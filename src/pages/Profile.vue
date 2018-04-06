<template>
  <div>
    <div>
      <h1>My profile</h1>
      <p>
        Hello there.
      </p>
      <div class="buttons">
        <router-link :to="{ name: 'saved-jobs' }">
          <button class="btn btn--default"><i class="fa fa-heart-o"></i> Jobs</button>
        </router-link>
        <button class="btn btn--default">Edit</button>
        <button class="btn btn--default">Reset</button>
      </div>
    </div>
  </div>
  </template>

<script
  export default {
    name: 'profile-page',
    data(){
      return {
      }
    }
  }
</script>

<style lang="scss">
  .buttons {
    button {
      display: block;
      width: 100%;
      box-sizing: border-box;
      margin-bottom: 1em;
    }
  }
</style>
