<template>
  <div>
    <div class="job">
      <div class="job__image">
        <img :src="image">
      </div>
      <div class="padding">
        <div class="icon">
          <div style="height: .5em"></div>
          <a href="javascript:history.go(-1)">
            <i class="fa fa-arrow-left"></i> back
          </a>
        </div>
        <h1 class="job__name">
          Jobs <i class="fa fa-angle-double-right"></i> {{name}}
        </h1>
        <p class="job__description">
          {{description}}
        </p>
        <div class="job__options button-group">
          <button class="btn btn--red" v-on:click="nope">
            <i class="fa fa-times"></i>
          </button>
          <router-link :to="{ name: 'job-info', params: { name } }" class="btn btn--default">
            <i class="fa fa-info"></i>
          </router-link>
          <button class="btn btn--green" v-on:click="save">
            <i class="fa fa-heart"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
  </template>

<script>
  import note from '@/lib/notification'
  import router from '@/router'

  export default {
    name: 'job-page',
    props: ['name'],
    data(){
      return {
        'image': 'http://via.placeholder.com/400x400',
        'description': 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita.'
      }
    },
    methods: {
      nope() {
        note.success('Job removed!')

        router.push({name: 'job', params: {name: Math.random()}})
      },
      save() {
        note.success('Job saved!')
      }
    }
  }
</script>

<style lang="scss">
  .job {
    &__image {
      img {
        max-width: 400px;
        width: 100%;
        margin: 0 auto;
        display: block;
      }
    }

    &__name {
      margin-top: .5em!important;
    }

    &__options {
      display: flex;

      button, a {
        flex-basis: 33.33%;
      }
    }
  }
</style>
