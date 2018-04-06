<template>
  <div>
    <div>
      <h1>Meine Kindheit</h1>
      <ul class="icons">
        <li v-for="hobby in hobbies">
          <div class="inner">
            <a :href="'http://localhost:8080/#/details?'+hobby.name">
              <div class="icon">
                {{hobby.name}}
              </div>
            </a>
          </div>
        </li>
    </ul>
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
