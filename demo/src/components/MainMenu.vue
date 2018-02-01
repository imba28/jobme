<template>
<div class="wrapper">
  <header class="header">
    <button v-if="$root.isSignedIn" id="menu-burger" class="hamburger hamburger--collapse" type="button" v-on:click="triggerBurger">
    <span class="hamburger-box">
      <span class="hamburger-inner">
      </span>
    </span>
  </button>
    <h1 class="header__title">
    {{ this.pageHeader }}
  </h1>
  </header>
  <transition name="fade" v-if="$root.isSignedIn">
    <nav v-if="show" id="side__nav">
      <ul>
        <li v-if="$root.isSignedIn">
          <h3 id="greeting_user">Hallo {{ capitalizeFirstLetter($root.user.name) }}! </h3>
        </li>
        <li v-for="(option, index) in options">
          <router-link v-if="option.path" active-class="active" :to="option.path" @click.native="triggerBurger">
            <i v-bind:class="[`icon-${option.icon}`]"></i> {{ option.name }}
          </router-link>
          <div v-else @click="option.onClick">
            <i v-bind:class="[`icon-${option.icon}`]"></i> {{ option.name }}
          </div>
        </li>
      </ul>
      <div class="container_signOut">
        <button class="btn btn--red" @click="signOut">Logout</button>
      </div>
    </nav>
  </transition>
</div>
</template>

<script>
import router from '@/router'
import auth from '@/auth'

export default {
  name: 'mainmenu',
  data() {
    return {
      show: false,
      user: null,
      page: 'task-o-mat',
      options: [
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
        },
        {
          icon: 'calendar',
          name: 'Login',
          path: '/login'
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
    },
    signOut: () => {
      auth.signOut()
      router.push( {path: "/login"} )
    },
    capitalizeFirstLetter(string) {
      return string.charAt(0).toUpperCase() + string.slice(1);
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
    },
    isSignedIn: {
      get: () => this.$root.isSignedIn
    }
  },
  created() {
    this.$root.setPageHeader = (header) => {
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
    height: $top-menu-height;
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 99;
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

    position: fixed;
    z-index: 101;
    height: 100%;
    width: 75%;
    top: $top-menu-height;

    display: flex;
    flex-flow: column;
    justify-content: space-between;

    ul {
        padding: 0;
        display: flex;
        flex-flow: column;
        justify-content: space-around;

        #greeting_user{
            align-self: center;
            text-align: center;
            color: white;
            margin-top: 0.5em;
            margin-bottom: 0;
           // padding-left: 2em;
        }

        li {
            list-style: none;
            margin-bottom: 1em;
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
  .container_signOut{

    align-self: center;
    margin-bottom: 5em;
    button{
      background-color: $red;
      color: $white;
      font-size: 125%;
    }
  }
}
</style>
