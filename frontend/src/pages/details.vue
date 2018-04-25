<template>
  <div>
    <div>
      <div class="overlay">
        <a onclick="window.history.back()">
          <div class="icon">
            <i class="fas fa-chevron-left fa-2x"></i>
          </div>
        </a>
      </div>
      <h1 class="full-width">
        <img class="full-width" :src="category.icon" />
      </h1>
      <ul class="icons" ref="icons">
        <li v-for="cat in cats" v-on:click="clickIcon(cat)">
          <div class="details-div">
            <img :id="cat.id" :title="cat.label" class="circle-details clickable" :src="cat.icon" />
            <span v-show="cat.isChecked">
              <i class="far fa-check-circle fa-2x tick"></i>
            </span>
          </div>
        </li>
      </ul>
    </div>
  </div>
  </template>

<script>
  import service from '@/lib/service'

  export default {
    props: ['category', 'hobby_id'],
    name: 'start-page',
    data(){
      const checkedIcons = this.$store.state.checkedIcons

      return {
        checkedIcons,
        cats: []
      }
    },
    methods: {
      clickIcon(category) {
        this.$store.commit('checkIcon', category)
        this.$forceUpdate() // naja
      }
    },
    created() {
      if (!this.category) {
        service('category', {id: this.hobby_id})
      }

      service(`categories/${this.hobby_id}/subcategory`)
      .then(subs => {
        subs.forEach(category => {
          if (this.$store.state.checkedIcons.includes(category.id)) {
            category.isChecked = true
          }
        })
        this.cats = subs
      })
    },
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

        .tick {
          position: absolute;
          margin-left: -1.2rem;
          margin-top: 3.5rem;
          color: green;
        }

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
