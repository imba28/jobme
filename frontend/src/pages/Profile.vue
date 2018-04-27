<template>
  <div>
    <div>
      <div v-bind:style="{backgroundImage: `url(${avatarUrl})`, height: '200px', backgroundSize: 'cover'}">
      </div>
      <div class="padding">
        <h1>Profil</h1>
        <p>
          Hallo
          <strong>
            {{user.name}}
          </strong>!
        </p>
        <div class="buttons">
          <router-link :to="{ name: 'saved-jobs' }">
            <button class="btn btn--default">
              Deine Treffer
              <i class="fa fa-heart"></i> ({{ savedJobsCount }})
            </button>
          </router-link>
          <!--<button class="btn btn--default">Edit</button>-->
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
      },
      avatarUrl: function() {
        return this.user.avatar_url ? this.user.avatar_url : 'https://media3.giphy.com/media/Nx0rz3jtxtEre/giphy.gif'
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
