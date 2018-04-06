<template>
  <div class="saved">
    <div class="padding">
      <h1>Saved</h1>
      <ul>
        <li v-for="(job, key) in jobs" class="list__item__wrapper">
          <h3>{{job}}</h3>
          <router-link :to="{ name: 'job', params: { name: job }}">
            more
          </router-link>
          <a href="#" v-on:click="remove(key)">delete</a>
        </li>
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
        'jobs': [
          'Zahntechniker',
          'Mechatroniker',
          'Steuerberater',
          'Notar'
        ]
      }
    },
    methods: {
      remove(id) {
        this.jobs.splice(id, 1)
        notification.success('successfully deleted!', 1000)
      }
    }
  }
</script>

<style lang="scss">
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
      position: relative;
    }
  }
}
</style>
