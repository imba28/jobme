<template>
  <div class="explore-now">
    <div>
      <h1>What do you love to do now?</h1>
      <ul class="icons">
        <li v-for="hobby in hobbies">
          <div class="inner">
            <router-link :to="{ name: 'details', params: {category: hobby, hobby_id: hobby.id} }">
              <img :title="hobby.name" class="circle" :src="hobby.icon" />
            </router-link>
          </div>
        </li>
    </ul>
    </div>
    <div>
      <div class="forward">
        <a href="#/jobs/j1">
          <i style="color:white"class="fas fa-arrow-right fa-2x" ></i>
        </a>
    </div>
    </div>
  </div>
  </template>

<script>
  //import hobbies from '@/json/hobbies.json'
  import service from '@/lib/service'

  export default {
    name: 'start-page',
    data(){
      return {
        hobbies: []
      }
    },
    created() {
      service('category')
      .then(categories => {
        this.hobbies = categories
      })
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
    padding: 2em;

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

  .explore-now {
    background-color: #2c0f2a;
    .icons {
      justify-content: flex-end;
      flex-direction: column;
      width: 100%;
    }

    .icons > li {
      align-self: flex-start;

      &:nth-child(2n) {
        align-self: flex-end;

        .inner {
          float: right;
        }
      }

      .inner {
        width: 60%;
        padding: 0 2em;
      }
    }
  }

</style>
