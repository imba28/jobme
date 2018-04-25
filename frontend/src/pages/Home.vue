<template>
  <div class="welcome">
    <div class="container">
      <div class="image">
        <h1>Welcome to JOB<span>me</span></h1>
      </div>
    </div>
    <div class="login--info__container">
      <div class="form__container">
        <form v-on:submit.prevent="signIn">
          <div class="input__container">
            <input ref="user" id="email" class="input" type="text" required="true" placeholder="What's your name?" />
            <label style="border-radius:0;" class="input__label" id="email__label" for="email">
              <span class="icon-user"></span>
            </label>
          </div>
          <div class="input__container">
            <input ref="pwd" id="pwd" class="input" type="password" placeholder="Your password" required="true" />
            <label style="border-radius:0;" class="input__label" id="pwd__label" for="pwd">
              <span class="icon-key"></span>
            </label>
          </div>
          <div class="text-center pt-1">
            <div class="input__container">
              <button id="sub" type="submit" class="btn btn--default display--center" style="display: block; bottom: 5em; width:100%; box-sizing:border-box;">Login</button>
            </div>
            <a href="https://jobme.herokuapp.com/users/new">New to JOBme?</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
  import auth from '@/auth'
  import router from '@/router'

  export default {
    name: 'welcome-page',
    data() {
      return {
        page: "Welcome",
      }
    },
    methods: {
      signIn() {
        const name = $('#email').val()
        const pwd = $('#pwd').val()

        auth.signIn(name, pwd)
          .then((user) => {
            router.push({
              path: '/explore-childhood'
            })
          })
      }
    }
  }

</script>

<style lang="scss">
  .welcome {
    height: 100%;
    .text-center {
      text-align: center;
    }

    a {
        color: $grey;
        &:hover {
          text-decoration: underline;
        }
    }

    .input__container {
      margin: 0;
      padding: 1em 1em;

    }
    .container {
      width: 100%;
      .button-group {
        display: flex;

        .btn {
          width: 50%;

          &:last-child {
            border-left-width: 0;
          }
        }
      }

      .image {
        display: flex;
        width: 100%;
        max-width: 400px;
        height: 200px;
        margin: 0 auto;
        background: $black;
        color: $grey;
      }

      h1 {
        margin-bottom: 0.3em;

        span {
          font-weight: bolder;
          color: $grey;
        }
      }
      p {
        padding: 0 2em 0 2em;
      }

      button {
        margin: 0;
        align-self: center;
        border-radius: 0;
        border: none;

      }

    }

  }

</style>
