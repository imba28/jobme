<template>
  <div>
    <div>
      <div style="background: url(https://i.ytimg.com/vi/q5qV_TPLwzw/maxresdefault.jpg);background-size: cover; height: 200px;"></div>
      <div class="padding">
        <h1>My profile</h1>
        <p>
          <strong>Name</strong>: {{user}}
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
  </div>
  </template>

<script>
  import auth from '@/auth'

  export default {
    name: 'profile-page',
    data(){
      return {
        user: auth.getUser()
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
