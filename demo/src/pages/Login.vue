<template>
<div>
  <div class="title__container">
    <h1 class="login__title">Login</h1>
  </div>
  <div class="logo__container">
    <img src="../assets/tom-logo-blue.svg" alt="Unser Robomaskottchen">
  </div>
  <div class="form__container">
    <form v-on:submit.prevent="signIn">
      <div class="input__container">
        <input id="email" class="input" type="text" placeholder="Deine Email" />
        <label class="input__label" id="email__label" for="email">
            <span class="icon-mail"></span>
          </label>
      </div>
      <div class="input__container">
        <input id="password" class="input" type="text" placeholder="Dein Password" />
        <label class="input__label" id="password__label" for="password">
            <span class="icon-key"></span>
          </label>
      </div>
      <a href="#" class="link--more" id="forgot_password">Passwort vergessen?</a>
      <div>
        <button class="btn">Login</button>
      </div>
    </form>
  </div>
  <div class="registertext__container">
    <p>Noch kein Konto?</p>
    <a href="">Registrieren</a>
  </div>
</div>
</template>

<script>
import auth from '@/auth'

export default {
  name: 'login-page',
  data() {
    return {
      show: false,
      page: "Login",
      options: [{
          name: "Menüpunkt 1",
          path: ""
        },
        {
          name: "Menüpunkt 10",
          path: ""
        }
      ]
    }
  },
  methods: {
    signIn() {
      const email = this.$refs['email'].value
      const password = this.$refs['password'].value

      auth.signIn(email, password).then((user) => {
        console.log(user)
      })
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
    margin-top: 0.7em;
    margin-bottom: 1.8em;
  }

  .logo__container{
    display: flex;
    flex-direction: row;
    justify-content: center;
    height: 6em;
    margin-bottom: 1.2em;
  }

  .form__container form {
    flex-flow: row wrap;
    justify-content: space-around;
    display: flex;
    flex-direction: column;
    align-items: center;
    align-content: center;

    .input__container {
      display: inline-flex;

      &::after {
        display: block;
        content: "";
      }
    }

    margin-top: 1em;
  }

  .login__title{
    margin-left: 0.5em;
    padding-top: 0.4em;
  }


  #email__label, #password__label, #email, #password{
    height: 3em;
    border: 1.5px solid $blue;
  }

  #password__label, #email__label{
    border-right: none;
  }

  #password__label{
    padding-left: 23px;
    padding-right: 23px;

  }

  #forgot_password{
    align-self: flex-start;
    margin-bottom: 2em;
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

</style>
