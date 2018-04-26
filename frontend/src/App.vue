<template>
  <div id="app">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <mainmenu v-if="$store.state.auth_token"></mainmenu>
    <div class="placeholders"></div>
    <div id="page">
      <notification ref="notification"/>
      <transition :name="$root.transitionName">
        <router-view class="view" :key="$route.path"></router-view>
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
    background: $black;
  }
  .details-div{
    padding-bottom: 80px;
    padding-top: 0;
    padding-left: 0;
    padding-right: 0;
    margin: 0;
    .subtitle {
      padding: 0;
      margin: 0 auto;
    }

  }
  .circle-details{
    border-radius: 50%;
    width: 40%;
    border: 1px solid;
  }
  .circle{
    border-radius: 50%;
    background-color: $white;
    width: 80%;
    border: 1px solid;
  }

  .forward{
    background-color: $blue;
    padding: 15px;
    margin: 2em 0 0;
    text-align: center;
  }
  .changeColor{
    fill: red;
    stroke: red;
    color: red;
  }
  .full-width {
    border: $grey solid 10px;
    width: 100%;
    height: 40vh;
    padding: 1em 0;
    margin-bottom: 30px;
    img {
      width: 200px;
    }
    .title {
      background: $grey;
      color: $white;
    }
  }
}

#page {
  position: relative;
  margin: 0 auto;
  max-height:100%;

  .clickable {
    cursor: pointer;
  }
  .view h2 {
    margin-top: 0;
  }

  h1 {
    margin: 0 auto;
    text-align:center;
    padding: 1em;
  }

  ul{
    margin: 0 auto;
    padding: 0;
  }

  .overlay {
    position: fixed;
    width: 100%;
    background: $black-light;
    .icon {
      padding: 0.3em;
    }
  }

}
</style>
