<template>
  <div class="explore-now">
    <div>
      <h1>Nowadays</h1>
      <ul class="icons">
        <li v-for="hobby in hobbies">
          <div class="inner">
            <a :href="'#/details?'+hobby.name">
                <img class="circle" :src="hobby.img" />
            </a>
          </div>
        </li>
    </ul>
    </div>
    <div>
      <div class="forward">
        <a href="#/jobs/zahntechniker">
          <i style="color:white"class="fas fa-arrow-right fa-2x" ></i>
        </a>
    </div>
    </div>
  </div>
  </template>

<script>
  import hobbies from '@/json/hobbies.json'
  export default {
    name: 'start-page',
    data(){
      return {
        hobbies: hobbies.category
      }
    },
    created() {
        //Scrolls to top when view is displayed
        window.scrollTo(0, 0);
    }
  }
</script>

<style lang="scss">
  .next{
    border-radius: 5%;
    width: 20%;

  }
  .circle{
    border-radius: 50%;
    width: 80%;
  }
  .icons {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;

    li {
      flex-basis: 50%;
      flex-grow: 0;
      flex-shrink: 0;
      align-content: center;
      text-align: center;
      list-style: none;
      .inner {
        padding: 2em;

        .icon {
          background: #ddd;
          border-radius: 50%;

          &::after {
            display: block;
            padding-top: 100%;
            content: '';
          }
        }
      }
    }
  }
</style>
