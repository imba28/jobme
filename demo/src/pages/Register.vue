<template>
  <div>
    <div class="title__container">
      <h1 class="new--account__title">Konto erstellen</h1>
    </div>
    <div class="logo__container">
      <img src="../assets/tom-logo-blue.svg" alt="Unser Robomaskottchen">
    </div>
    <div class="form__container">
      <div class="input__container">
        <input id="username" class="input" type="text" placeholder="Dein Username"/>
        <label class="input__label" id="username__label" for="username">
          <span class="icon-user"></span>
        </label>
      </div>
      <div class="input__container">
        <input id="email" class="input" type="text" placeholder="Deine Email"/>
        <label class="input__label" id="email__label" for="email">
          <span class="icon-mail"></span>
        </label>
      </div>
      <div class="input__container">
        <input id="password" class="input" type="text" placeholder="Dein Password"/>
        <label class="input__label" id="password__label" for="password">
          <span class="icon-key"></span>
        </label>
      </div>
    </div>
    <div>
      <button class="btn">Konto erstellen</button>
    </div>
    <div class="registertext__container">
      <p>Du hast schon ein Konto?</p>
      <a href="">Hier geht's zum Login</a>
    </div>
  </div>
</template>

<script>


  export default {
    name: 'login-page',
    data(){
      return {
        show: false,
        page: "Login",
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
    justify-content: flex-start;
    margin-bottom: 100px;
  }

  .title__container{
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    height: 3em;
    margin-left: 1.2em;
    margin-top: 1.75em;
    margin-bottom: 1.8em;
  }

  .logo__container{
    display: flex;
    flex-direction: row;
    justify-content: center;
    height: 6em;
    margin-bottom: 1.2em;
  }

  .form__container{
    display: flex;
    flex-flow: row wrap;
    justify-content: space-around;


    margin-top: 1em;
    margin-bottom: 2em;
  }


  .login__title{
    margin-left: 0.5em;
    padding-top: 0.4em;
  }


  #email__label, #password__label, #email, #password , #username, #username__label{
    height: 3em;
    border: 1.5px solid $blue;
  }

  #password__label, #email__label, #username__label{
    border-right: none;
  }

  #password__label, #username__label{
    padding-left: 23px;
    padding-right: 23px;

  }

  .registertext__container{
    margin-top: 3em;

    p{
      margin: 0 0 0.2em 0;
    }
  }

  a{
    text-decoration: underline;
  }

  .icon-key::before, .icon-mail::before{
    // color: $blue;
    font-size: 1.2em;
  }

  .icon-user::before{
    font-size: 1.3em;
  }

</style>
