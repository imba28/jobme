<template>
  <div class="saved">
    <div class="padding">
      <h1>Deine Treffer</h1>
      <ul>
        <li v-for="(job, key) in jobs" class="list__item__wrapper">
          <router-link :to="{ name: 'job-info', params: { name: job.id }}">
            <img v-if="job.image" :src="job.image" alt="preview image">
          </router-link>
          <div>
            <router-link :to="{ name: 'job-info', params: { name: job.id }}">
              <h3>{{job.name}}</h3>
            </router-link>
            <small>
              <a href="#" v-on:click="remove(key)">löschen</a>
            </small>
          </div>
        </li>
        <div v-if="jobs.length == 0">
          Oh nein, es sieht aus aus, als ob du noch keine Berufe gefunden hast!<br>
          Du solltest sofort beginnen, einige zu
          <router-link :to="{ name: 'explore-childhood'}">
            suchen
          </router-link>
          <i class="far fa-smile fa-2x"></i>
        </div>
      </ul>
    </div>
  </div>
</template>

<script>
  import notification from '@/lib/notification'

  export default {
    name: 'saved-jobs-page',
    data(){
      return {
        jobs: this.$store.state.savedJobs
      }
    },
    methods: {
      remove(idx) {
        this.$store.commit('dislikeJob', this.jobs[idx])
        notification.success('Beruf wurde erfolgreich aus deiner Liste entfernt!', 1000)
      }
    }
  }
</script>

<style lang="scss" scoped>
.saved {

  h3 {
    margin-top: 0!important;
    margin-bottom: .5em;
  }

  ul {
    margin-top: 1em;
    padding: 0;

    li {
      margin: 1em 0;
      padding-bottom: 1em;
      position: relative;
      display: flex;

      &:first-child {
        margin-top: 0;
      }


      img {
        max-width: 3em;
        align-self: center;
        box-shadow: .25em .25em 1em rgba(0,0,0,0.1);
        margin-right: 1em;
      }
    }
  }
}
</style>
