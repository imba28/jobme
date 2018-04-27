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
        <img :src="category.icon" />
        <h2 class="title">{{category.name}}</h2>
      </h1>
      <ul class="icons" ref="icons">
        <li v-for="cat in cats" v-on:click="clickIcon(cat)">
          <div class="details-div">
            <div class="container">
              <img :id="cat.id" :title="cat.name" class="circle-details clickable" :src="cat.icon" />
              <span v-show="cat.isChecked">
                <i class="tick far fa-check-circle fa-2x"></i>
              </span>
            </div>
            <h3 class="subtitle">{{cat.name}}</h3>
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
      service(`categories/${this.hobby_id}/subcategory`)
      .then(subs => {
        subs.forEach(category => {
          if (this.$store.state.checkedIcons.includes(category.id)) {
            category.isChecked = true
          }
        })
        this.cats = subs
      })
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

      .tick {
        position: absolute;
        margin-top: 3.5rem;
        color: $success;
      }
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
