<template>
  <div>
    <div class="title__container">
      <h1 class="login__title">Login</h1>
    </div>
    <div class="logo__container">
      <img src="../assets/tom-logo-blue.svg" alt="Unser Robomaskottchen">
    </div>
    <div class="form__container">
      <div class="input__container">
        <input id="email" class="input" type="text" placeholder="Deine Email"/>
        <label class="input__label" for="email">
          #
        </label>
      </div>
      <div class="input__container">
        <input id="password" class="input" type="text" placeholder="Dein Password"/>
        <label class="input__label" for="password">
          #
        </label>
      </div>
      </div>
    <a href="#" class="link--more" id="forgot_passwort">Passwort vergessen?</a>
    <div>
      <button class="btn">Login</button>
     </div>
     <p>Noch kein Konto?</p>
     <a href="">Registrieren</a>
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
  }

  .title__container{
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
  }

  .logo__container{
    display: flex;
    flex-direction: row;
    justify-content: center;
  }

  .form__container{
    display: flex;
    flex-flow: row wrap;
    justify-content: space-around;

    margin-top: 1em;

  }

  .login__title{
    margin-left: 1em;
    padding-top: 1em;
  }

  .input__container{

  }

  #forgot_passwort{
    margin-bottom: 1em;
  }

</style>
