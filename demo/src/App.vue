<template>
  <div id="app">
    <mainmenu></mainmenu>
    <div class="placeholders"></div>
    <div id="page">
      <notification ref="notification"/>
      <transition :name="$root.transitionName">
        <router-view class="view"></router-view>
      </transition>
    </div>
    <div class="placeholders"></div>
    <bottommenu v-if="$root.isSignedIn"></bottommenu>
  </div>
</template>

<script>
import mainmenu from './components/MainMenu'
import bottommenu from './components/BottomMenu'
import notification from './components/Notifications'

export default {
  name: 'App',
  components: {
    mainmenu,
    bottommenu,
    notification
  }
}
</script>

<style lang="scss">
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;

  width: 100%;

  .placeholders {
    height: $bottom-menu-height;
  }
  .wrapper + .placeholders {
    margin-bottom: 1em;
  }
}

#page {
  position: relative;
  margin: 0 auto;
  padding: 0 2em;

  .view > h2:first-child {
    margin-top: 0;
  }

  h1 {
    margin-top: 0;
  }
}
</style>
