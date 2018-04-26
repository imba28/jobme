<template>
  <div>
    <div class="overlay">
      <a onclick="window.history.back()">
        <div class="icon">
          <i class="fas fa-chevron-left fa-2x"></i>
        </div>
      </a>
    </div>
    <div class="job">
      <div class="job__image" id="asd">
      </div>
      <div class="padding">
        <h1 class="job__name">
          {{job.name}}
        </h1>
        <hr class="hr">
        <p class="job__description">
          {{job.description}}
        </p>
        <h3>Related Companies</h3>
        <ul class="job__companies">
          <li v-for="(a, key) in employers">
            <img src="http://via.placeholder.com/150x80">
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
        'job': {},
        'employers': new Array(2),
      }
    },
    mounted() {
      this.job = this.$store.state.savedJobs.find(job => job.id == this.name)
      sphereImage.start(document.getElementById('asd'))
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

    &__description {
      line-height: 1.75;
    }

    &__name {
      word-wrap: break-word;
      hyphens: auto;
      text-transform: uppercase;
      font-weight: 700;
      padding-left: 0!important;
      text-align: left!important;
      margin-top: .5em!important;
      padding-bottom: .25em!important;
    }

    &__options {
      display: flex;

      button {
        flex-basis: 33.33%;
      }
    }

    &__companies {
      display: flex;
      flex-wrap: wrap;

      li {
        flex-basis: 50%;

        &:nth-child(2n) {
          padding-left: .5em;
        }

        &:nth-child(2n + 1) {
          padding-right: .5em;
        }
        list-style: none;

        img {
          width: 100%;
        }
      }
    }

    &__description {
      line-height: 1.7;
    }

    h3 {
      font-weight: 700;
      font-size: 1.1em;
      margin: 1em 0;
    }
  }
</style>
