<template>
  <div class="explore-now">
    <div>
      <h1>Was machst du jetzt gerne?</h1>
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
        <a href="javascript:void(0)" v-on:click="calcJobs">
          <i style="color:white"class="fas fa-arrow-right fa-2x" ></i>
        </a>
    </div>
    </div>
  </div>
  </template>

<script>
  //import hobbies from '@/json/hobbies.json'
  import service from '@/lib/service'
  import router from '@/router'

  export default {
    name: 'start-page',
    data(){
      return {
        hobbies: []
      }
    },
    methods: {
      calcJobs() {
        const checkedSubcategories = this.$store.state.checkedIcons
        service('matching', {
          method: 'POST',
          data: {
            inCategory: checkedSubcategories
          }
        })
        .then(jobs => {
          this.$store.dispatch('setJobs', jobs)
          .then(() => {
            router.push({
              name: 'job',
              params: {
                name: jobs[0].id
              }
            })
          })
        })
      }
    },
    created() {
      service('now')
      .then(categories => {
        this.hobbies = categories
      })
        //Scrolls to top when view is displayed
      window.scrollTo(0, 0);
    }
  }
</script>

<style lang="scss">
  .forward a {
    display: block;
  }

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
