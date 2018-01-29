<template>
  <div id="app">
    <mainmenu/>
    <div id="page">
      <transition name="page">
        <router-view class="view"></router-view>
      </transition>
    </div>
    <!--<bottommenu/>-->
  </div>
</template>

<script>
import mainmenu from './components/MainMenu'
//import bottommenu from './components/BottomMenu'

export default {
  name: 'App',
  components: {
    mainmenu,
    //bottommenu
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
  position: relative;
  padding: 0 1em;
  h1 {
    margin-top: 0;
  }
}
</style>
