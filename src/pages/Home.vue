<template>
  <div class="welcome">
    <div class="container">
      <div class="image">
        <h1>JOB<span>me</span></h1>
      </div>
      <div class="button-group">
        <button class="btn btn--secondary btn--default">Sign up</button>
        <button class="btn btn--default--focus">Sign in</button>
      </div>
    </div>
    <div class="login--info__container">
      <div class="form__container">
        <form v-on:submit.prevent="signIn">
          <div class="input__container">
            <input ref="user" id="email" class="input" type="text" required="true" placeholder="What's your name?" />
            <label class="input__label" id="email__label" for="email">
              <span class="icon-user"></span>
            </label>
          </div>
          <div class="text-center pt-1">
            <div>
              <button type="submit" class="btn btn--default display--center" style="position: absolute; bottom: 5em; width:100%; box-sizing:border-box;">Login</button>
            </div>
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
        const email = this.$refs['user'].value

        auth.signIn(email, null)
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
    .input__container {
      margin-top: 1em;
    }
    .container {

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
        background: #ddd;
      }

      h1 {
        margin-bottom: 0.3em;
        span {
          font-weight: bolder;
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
