<template>
  <div>
    <v-touch @swipeleft="nope" @swiperight="save">
    <div class="job" ref="container">
      <div class="job__image">
        <img :src="job.image">
      </div>
      <div class="padding">
        <div class="icon">
          <div style="height: .5em"></div>
          <a href="javascript:history.go(-1)">
            <i class="fa fa-arrow-left"></i> back
          </a>
        </div>
        <h1 class="job__name">
          {{job.name}}
        </h1>
        <hr class="hr">
        <p class="job__description">
          {{job.description}}
        </p>
        <div class="job__options button-group">
          <button class="btn btn--red" v-on:click="save">
            <i class="fa fa-times"></i>
          </button>
          <router-link :to="{ name: 'job-info', params: { name } }" class="btn btn--default">
            <i class="fa fa-info"></i>
          </router-link>
          <button class="btn btn--green" v-on:click="nope">
            <i class="fa fa-heart"></i>
          </button>
        </div>
      </div>
    </div>
  </v-touch>
  </div>
  </template>

<script>
  import note from '@/lib/notification'
  import router from '@/router'
  import $ from 'jquery'
  import jobs from '@/json/jobs'

  export default {
    name: 'job-page',
    props: ['name'],
    data(){
      return {
        'job': {}
      }
    },
    methods: {
      nope() {
        const idx = jobs.indexOf(this.job);

        if(idx > 0) {
          note.success('Job saved!', 750)
          router.push({name: 'job', params: {name: jobs[idx-1].slug, bottomMenuIndex: 1}})
        }
      },
      save() {
        const idx = jobs.indexOf(this.job);

        if(idx < jobs.length -1 ) {
          note.success('Job removed!', 750)
          router.push({name: 'job', params: {name: jobs[idx+1].slug, bottomMenuIndex: -1}})
        }
      }
    },
    created() {
      this.job = jobs.find((item) => item.slug === this.name)
    }
  }
</script>

<style lang="scss">
  .job {

    .hr {
      height: 3px;
      border: none;
      background: $green;
      margin-bottom: .5em;
    }

    &__image {
      img {
        max-width: 400px;
        width: 100%;
        margin: 0 auto;
        display: block;
      }
    }

    &__name {
      text-transform: uppercase;
      font-weight: 700;
      padding-left: 0!important;
      text-align: left!important;
      margin-top: .5em!important;
      padding-bottom: .25em!important;
    }

    &__description {
      line-height: 1.7;
    }

    &__options {
      display: flex;

      button, a {
        flex-basis: 33.33%;
      }
    }
  }
</style>
