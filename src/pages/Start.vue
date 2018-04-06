<template>
  <div>
    <div>
      <h1>Start</h1>
      <ul class="icons">
        <li>
          <div class="inner">
            <div class="icon">
              fancy icon
            </div>
          </div>
        </li>
        <li>
          <div class="inner">
            <div class="icon">
              fancy icon
            </div>
          </div>
        </li>
        <li>
          <div class="inner">
            <div class="icon">
              fancy icon
            </div>
          </div>
        </li>
        <li>
          <div class="inner">
            <div class="icon">
              fancy icon
            </div>
          </div>
        </li>
        <li>
          <div class="inner">
            <div class="icon">
              fancy icon
            </div>
          </div>
        </li>
        <li>
          <div class="inner">
            <div class="icon">
              fancy icon
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
  </template>

<script
  export default {
    name: 'start-page',
    data(){
      return {
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
      flex-basis: 25%;
      flex-grow: 0;
      flex-shrink: 0;
      align-content: center;
      text-align: center;

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
