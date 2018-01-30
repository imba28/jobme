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
    {{ this.pageHeader }}
  </h1>
  </header>
  <transition name="fade">
    <nav v-if="show" id="side__nav">
      <ul>
        <li v-for="(option, index) in options">
          <router-link active-class="active" :to="option.path" @click.native="triggerBurger">
            <i v-bind:class="[`icon-${option.icon}`]"></i> {{ option.name }}
          </router-link>
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
  data() {
    return {
      show: false,
      page: 'task-o-mat',
      options: [{
          icon: 'calendar',
          name: "Jonas",
          path: "/"
        },
        {
          icon: 'calendar',
          name: "Home",
          path: "/"
        },
        {
          icon: 'calendar',
          name: "Tasks",
          path: "/tasks"
        },
        {
          icon: 'calendar',
          name: "Gruppen",
          path: "/groups"
        },
        {
          icon: 'calendar',
          name: "Test",
          path: "/test"
        }
      ]
    }

  },
  methods: {
    triggerBurger: function(event) {
      if (document.getElementById("menu-burger").className == "hamburger hamburger--collapse") {
        document.getElementById("menu-burger").className += " is-active"
        this.show = !this.show
      } else {
        document.getElementById("menu-burger").className = "hamburger hamburger--collapse"
        this.show = !this.show
      }
    }
  },
  computed: {
    pageHeader: {
      get: function() {
        return this.page
      },
      set: function(header) {
        this.page = header
      }
    }
  },
  created() {
    console.log("mainmenu")
    this.$root.setPageHeader = (header) => {
      console.log(header);
      this.pageHeader = header
    }
  }
}
</script>

<style lang="scss">
@import "../sass/global/hamburgers.css";

.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.5s;
}
/* .fade-leave-active below version 2.1.8 */
.fade-enter,
.fade-leave-to {
    opacity: 0;
}

.mainmenu {
    display: flex;

    li {
        margin-left: 1em;
    }
}

  .header{
    height: 3.5em;
    position: relative;

  }

.header__title {
    position: absolute;
    width: 100%;
    left: 0;
    top: 50%;
    @include translate(0, -50%);
    text-align: center;
    margin: 0;
    font-weight: 300;
}

h1 {
    align-self: center;
    padding-right: 0;
}

#side__nav {
    background-color: #0091EA;
    box-shadow: 0.25em 0 0.5em rgba(0,0,0,0.2);

    position: absolute;
    z-index: 101;
    height: 100%;
    width: 75%;

    ul {
        padding: 0;
        display: flex;
        flex-flow: column;
        justify-content: space-around;

        li {
            list-style: none;
            margin-bottom: 2em;
            align-items: left;
            padding: 0 2em;
            text-align: left;

            a {
                color: #ffffff;
                padding-bottom: 0.25em;
                position: relative;
                display: block;
                font-size: 1.75em;

                [class^="icon-"],
                [class*=" icon-"] {
                    color: #FFFFFF;
                    margin-right: 0.75em;
                    font-size: 0.9em;
                }

                &::after {
                    content: "";
                    position: absolute;
                    bottom: -3px;
                    left: 0;
                    right: 0;
                    height: 3px;
                    background: #ffffff;
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
