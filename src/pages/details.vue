<template>
  <div>
    <div>
      <div class="overlay">
        <a href="http://localhost:8080/#/explore-childhood">
          <div class="icon">
            <i class="fas fa-chevron-left fa-2x"></i>
          </div>
        </a>
      </div>
      <h1 class="full-width">
        <img class="full-width" :src="cat.img" />
      </h1>
      <ul class="icons">
        <li v-for="cat in cats">
          <div class="inner">
            <div class="icon">
              {{cat.img}}
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
  </template>

<script>
  import hobbies from '@/json/hobbies.json'
  export default {
    props: ['name'],
    name: 'start-page',
    data(){
      let hash = window.location.hash
      let cat = hash.split("?")[1]

      return {
        cats: hobbies.category[cat].types,
        cat: hobbies.category[cat]
      }

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
