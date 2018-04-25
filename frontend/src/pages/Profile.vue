<template>
  <div>
    <div>
      <div style="background: url(https://i.ytimg.com/vi/q5qV_TPLwzw/maxresdefault.jpg);background-size: cover; height: 200px;"></div>
      <div class="padding">
        <h1>My profile</h1>
        <p>
          Hello
          <strong>
            {{user}}
          </strong>!
        </p>
        <div class="buttons">
          <router-link :to="{ name: 'saved-jobs' }">
            <button class="btn btn--default">
              Jobs you liked
              <i class="fa fa-heart"></i> ({{ savedJobsCount }})
            </button>
          </router-link>
          <button class="btn btn--default">Edit</button>
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
    },
    computed: {
      savedJobsCount: function(){
        return this.$store.state.savedJobs.length
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
