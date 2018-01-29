<template>
  <div class="wrapper">
<header class="header">
  <button id="menu-burger" class="hamburger hamburger--collapse" type="button" v-on:click="triggerBurger">
    <span class="hamburger-box">
      <span class="hamburger-inner">
      </span>
    </span>
  </button>
  <h1 class="header__title">
    {{ page }}
  </h1>
</header>
  <transition name="fade">
    <nav v-if="show" id="side__nav">
      <ul>
        <li v-for="(option, index) in options">
          <a :href="option.path" v-on:click.prevent="goto(index)"> {{ option.name }}</a>
        </li>
      </ul>
    </nav>
  </transition>
  </div>
</template>

<script>
  import router from '@/router'

  export default {
    name: 'mainmenu',
    data(){
      return {
        show: false,
        page: "Startseite",
        options: [
          {name: "Jonas", path:"/"},
          {name: "Home", path:"/"},
          {name: "Tasks", path:"/tasks"},
          {name: "Gruppen", path:"/groups"}
        ]
      }

    },
    methods: {
      triggerBurger: function(event) {
        if (document.getElementById("menu-burger").className == "hamburger hamburger--collapse") {
          document.getElementById("menu-burger").className += " is-active"
          this.show = !this.show
        }
        else {
          document.getElementById("menu-burger").className = "hamburger hamburger--collapse"
          this.show = !this.show
        }
      },
      goto: function(idx) {
        this.triggerBurger();
        router.push(this.options[idx].path);
      }
    }
  }
</script>


<style lang="scss">
  @import "../sass/global/hamburgers.css";

  .fade-enter-active, .fade-leave-active {

      transition: opacity .5s;
    }
    .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
        opacity: 0;
      }

  .mainmenu {
    display: flex;

    li {
      margin-left: 1em;
    }
  }

  .header__title {
    position: absolute;
    width: 100%;
    left: 0;
    text-align: center;
    margin: 0;
    font-weight: 300;
  }

  h1{
    align-self: center;
    padding-right: 0%;
  }

  #side__nav{
    background-color: #0091EA ;
    position: absolute;
    z-index: 99;
    height: 100%;
    width: 40%;

    ul {
      padding: 0;
      display: flex;
      flex-flow: column;
      justify-content: space-around;

      li {
        padding-top: 10px;
        list-style: none;
        margin-right: 0.5em;
        align-items: center;


        a {
          color: #ffffff;
          font-weight: 700;
          padding-bottom: .25em;
          position: relative;
          display: block;


          &::after {
            content: "";
            position: absolute;
            bottom: -3px;
            left: 0;
            right: 0;
            height: 3px;
            background: #ffffff;;
            opacity: 0;
          }

          &:hover {
            color: #ddd;


            &::after {
              opacity: 1;
            }
          }
        }
      }
    }
  }

</style>
