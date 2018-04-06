<template>
  <div>
    <div>
      <a href="http://localhost:8080/#/explore-childhood">
        <div class="icon">
          back-icon
        </div>
      </a>
      <h1>Details</h1>
      <ul class="icons">
        <li v-for="hobby in nature">
          <div class="inner">
            <div class="icon">
              {{hobby}}
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
  </template>

<script>
  import nature from '@/json/nature.json'
  export default {
    props: ['name'],
    name: 'start-page',
    data(){
      return {
        hobbies: nature
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
