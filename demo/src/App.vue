<template>
  <div id="app">
    <mainmenu/>
    <div id="page">
      <notification ref="notification"/>
      <transition name="page">
        <router-view class="view"></router-view>
      </transition>
    </div>
    <bottommenu/>
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
  text-align: center;
  color: #2c3e50;

  width: 100%;
}

#page {
  width: 85%;
  position: relative;
  margin: 0 auto;
  margin-top: $top-menu-height;
  margin-bottom: $bottom-menu-height;
  padding-top: 2.2em;
  padding-bottom: 2em;

  .view > h2:first-child {
    margin-top: 0;
  }

  h1 {
    margin-top: 0;
  }
}
</style>
