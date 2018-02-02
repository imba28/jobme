<template>
  <div>
    <div class="title__container">
      <h1 class="new--account__title">Konto erstellen</h1>
    </div>
    <div class="logo__container">
      <img src="../assets/tom-logo-blue.svg" alt="Unser Robomaskottchen">
    </div>
    <div class="form__container">
      <form v-on:submit.prevent="register">
        <div class="input__container">
          <input ref="username" id="username" class="input" type="text" placeholder="Dein Username"/>
          <label class="input__label" id="username__label" for="username">
            <span class="icon-user"></span>
          </label>
        </div>
        <div class="input__container">
          <input ref="email" id="email" class="input" type="text" placeholder="Deine Email"/>
          <label class="input__label" id="email__label" for="email">
            <span class="icon-mail"></span>
          </label>
        </div>
        <div class="input__container">
          <input ref="password" id="password" class="input" type="password" placeholder="Dein Password"/>
          <label class="input__label" id="password__label" for="password">
            <span class="icon-key"></span>
          </label>
        </div>
        <div id="create_account--container">
        <button class="btn btn--default" id="create_account--button">Konto erstellen</button>
        </div>
      </form>
    </div>
    <div>
    </div>
    <div class="registertext__container">
      <p>Du hast schon ein Konto?</p>
      <a href="#/login">Hier geht's zum Login</a>
    </div>
  </div>
</template>

<script>
  import request from "@/lib/request"
  import auth from '@/auth'

  export default {

    name: 'register-page',
    methods: {
      register() {
        const username = this.$refs['username'].value
        const email = this.$refs['email'].value
        const password = this.$refs['password'].value

        request.fetch("http://localhost:3000/users.json","POST",{'user[name]':username ,'user[email]':email ,'user[password]':password,'user[password]':password })
          .then(data => {auth.signIn(email, password); this.$router.push({path:"/tasks"})})

      }

    },
    data(){
      return {
        page: "Register",
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
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    align-content: center;

    margin-top: 1em;
    margin-bottom: 2em;

    #create_account--container{
      display: flex;
      flex-direction: column;
      align-content: center;
    }

    #create_account--button{
      align-self: center;
    }
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
    align-self: center;

  p{
    margin: 0 0 0.2em 0;
    }
  }

  a{
    text-decoration: underline;
  }

  .icon-key::before, .icon-mail::before{
    font-size: 1.2em;
  }

  .icon-user::before{
    font-size: 1.3em;
  }

</style>
