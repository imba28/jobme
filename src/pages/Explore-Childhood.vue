<template>
  <div class="explore-child">
    <div>
      <h1>My childhood</h1>
      <ul class="icons">
        <li v-for="hobby in hobbies">
          <div class="inner">
            <a :href="'#/details?'+hobby.name">
                <img :title="hobby.name" class="circle" :src="hobby.img" />
            </a>
          </div>
        </li>
    </ul>
    </div>
    <div class="forward">
      <a href="http://localhost:8080/#/explore-now">
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
