<template>
  <div class="about">
    <div class="padding">
      <h1>Über JOBme</h1>
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="https://jobme.herokuapp.com/system/uploads/jobme/jobmeTEAM.jpeg" alt="First slide">
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="" alt="Second slide">
          </div>

        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
  </div>
  </template>

<script>
  import notification from '@/lib/notification'

  export default {

    data(){
      return {
      }
    },
    methods: {

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
