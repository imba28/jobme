<template>
  <div id="app">
    <mainmenu/>
    <router-view/>
  </div>
</template>

<script>
import mainmenu from './components/MainMenu'

export default {
  name: 'App',
  components: {
    mainmenu
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
