<template>
  <div class="explore-child">
    <div>
      <h1>What did you love to do as a kid?</h1>
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
    <div class="forward">
      <a href="http://localhost:8080/#/explore-now">
        <i style="color:white" class="fas fa-arrow-right fa-2x"></i>
      </a>
    </div>
  </div>
</template>

<script>
  import service from '@/lib/service'

  export default {
    name: 'start-page',
    data() {
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

  .explore-child {
    background-color: #4dd0e1;

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
