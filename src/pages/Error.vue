<template>
  <div>
    <div class="welcome--text__container">
      <h1>Fehler</h1>
    </div>
  </div>
  </template>

<script
  export default {
    name: 'error-page',
    data(){
      return {
        page: "Error",
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
    margin-bottom: 0.3em;
  }

  p{
    padding: 0 2em 0 2em;
  }

  button{
    align-self: center;
    margin: 0.5em 0 0.5em 0em;
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
  }

  p{
    margin: 0 0 0.3em 0;
  }

  a{
    text-decoration: underline;
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
