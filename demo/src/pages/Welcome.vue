<template>
  <div>
    <div class="welcome--text__container">
      <h1>Hallo Ich bin Tom!</h1>
      <p>Wie ich sehe bist du neu hier.<br>
      Erstelle ein Konto um  den <br> task-o-mat nutzen zu können.
      </p>
      <button class="btn">Jetzt registrieren</button>
    </div>
    <div class="arrow-down"></div>
   <div class="tom__container">
      <img src="../assets/tom-full-body.svg">
   </div>
   <div class="login--info__container">
      <p>Du hast schon ein Konto?</p>
      <a href="#/login" class="link--more">Hier geht's zum Login</a>
   </div>
  </div>
  </template>

<script>


  export default {
    name: 'welcome-page',
    data(){
      return {
        show: false,
        page: "Welcome",
        options: [
          {name: "Menüpunkt 1", path:""},
          {name: "Menüpunkt 10", path:""}
        ]
      }

    }
  }
</script>

<style lang="scss">
  .view{
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    height:100%;
  }

  .welcome--text__container{
    margin-top: 1.5em;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    background-color: $grey;
    padding: 0.8em;
    border-radius: 5%;
    align-self: center;


    h1{
      margin-bottom: 0.5em;
    }

    p{

      padding: 0 2em 0 2em;
    }

    button{
    align-self: center;
    }
  }

  .tom__container{
    height: 10em;
    width: 10em;
    margin-bottom: 5em;
    align-self: center;
  }

  .login--info__container{
    display: flex;
    flex-direction: column;
    align-items: center;
    align-self: center;
  //  margin: 0 4em 0 4em;
  }

  p{
    margin: 0 0 0.3em 0;
  }

  .arrow-down {
    align-self: center;
    width: 0;
    height: 0;
    border-left: 20px solid transparent;
    border-right: 20px solid transparent;

    border-top: 20px solid $grey;
    margin-bottom: 1em;
  }

</style>
