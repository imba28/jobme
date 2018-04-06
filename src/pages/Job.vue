<template>
  <div>
    <div class="job">
      <div class="job__image">
        <img :src="image">
      </div>
      <h1 class="job__name">
        Jobs <i class="fa fa-angle-double-right"></i> {{name}}
      </h1>
      <p class="job__description">
        {{description}}
      </p>
      <div class="job__options button-group">
        <button class="btn btn--red">
          <i class="fa fa-times"></i>
        </button>
        <button class="btn btn--default">
          <i class="fa fa-info"></i>
        </button>
        <button class="btn btn--green">
          <i class="fa fa-heart"></i>
        </button>
      </div>
    </div>
  </div>
  </template>

<script>
  export default {
    name: 'job-page',
    props: ['name'],
    data(){
      return {
        'image': 'http://via.placeholder.com/400x400',
        'description': 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'
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

    &__options {
      display: flex;

      button {
        flex-basis: 33.33%;
      }
    }
  }
</style>
