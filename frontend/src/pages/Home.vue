<template>
  <div class="welcome">
    <div class="container">
      <div class="image">
        <h1>Welcome to JOB<span>me</span></h1>
      </div>
    </div>
    <div class="login--info__container">
      <div class="form__container">
        <div class="text-center pt-1">
          <div>
            <a href="https://jobme.herokuapp.com/login" target="_blank">
              <button id="sub" type="submit"
              class="btn btn--default display--center"
              style="display: block; bottom: 5em; width:80%;
              box-sizing:border-box;">Login</button>
            </a>
          </div>
        </div>
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
      margin-top: 0;
      padding: 1em 1em 5em;

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
