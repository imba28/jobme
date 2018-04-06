<template>
  <div id="app">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <mainmenu></mainmenu>
    <div class="placeholders"></div>
    <div id="page">
      <notification ref="notification"/>
      <transition :name="$root.transitionName">
        <router-view class="view"></router-view>
      </transition>
    </div>
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
    height: $top-menu-height;
  }

  .circle{
    border-radius: 50%;
    width: 80%;
  }

  .full-width {
    width: 100%;
    padding: 0;
  }
}

#page {
  position: relative;
  margin: 0 auto;
  padding-bottom: 1em;

  .view h2 {
    margin-top: 0;
  }

  h1 {
    margin: 0 auto;
    text-align:center;
    padding: 0.5em;
  }

  ul{
    margin: 0 auto;
    padding: 0;
  }

  .overlay {
    position: absolute;
    width: 100%;
    background: rgba(255,255,255,0.7);
  }

}
</style>
