<template>
  <div>
    <div class="job">
      <div class="job__image" id="asd"></div>
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
        <p>
          lalalal
        </p>
        <h3>Employers</h3>
        <ul>
          <li v-for="(a, key) in employers">
            Employer {{key+1}}
          </li>
        </ul>
      </div>
    </div>
  </div>
  </template>

<script>
  import sphereImage from '@/lib/360degree'

  export default {
    name: 'job-info-page',
    props: ['name'],
    data(){
      return {
        'employers': new Array(5),
        'image': 'http://via.placeholder.com/400x400',
        'description': 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita.'
      }
    },
    mounted() {
      sphereImage.start(document.getElementById('asd'))
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

      button {
        flex-basis: 33.33%;
      }
    }
  }
</style>
