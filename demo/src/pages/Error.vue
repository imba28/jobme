<template>
  <div>
    <div class="welcome--text__container">
      <h1>Etwas ist schiefgelaufen!</h1>
      <p>
        Es ist ein unerwarteter Fehler aufgetreten.
      </p>
      <p>
        Versuche die Seite neu zu laden oder melde dich bei <a href="mailto:help@taskomat.at">help@taskomat.at</a>
      </p>
      <button class="btn btn--default" @click="router.go(-1)">Zurück</button>
    </div>
    <div class="arrow-down"></div>
   <div class="tom__container">
      <img src="../assets/tom-full-body-destroyed.svg">
   </div>
  </div>
  </template>

<script>
import router from '@/router'

export default {
  name: 'error-page'
}
</script>

<style lang="scss">
.welcome--text__container {
    background-color: $grey;
    padding: 1em 1.5em;
    border-radius: 5%;
    font-weight: 500;

    h1 {
        margin-bottom: 0.3em;
        font-size: 1.25em;
    }

    p {
      margin-bottom: 1em;
    }

    button {
        align-self: center;
        margin: 0.5em 0;
    }
}

.tom__container {
    width: 80%;
    margin-top: 2em;
    align-self: center;
}

.login--info__container {
    display: flex;
    flex-direction: column;
    align-items: center;
    align-self: center;
    //  margin: 0 4em 0 4em;
}

p {
    margin: 0 0 0.3em;
}

a {
    text-decoration: underline;
}

.arrow-down {
    width: 0;
    height: 0;
    border-left: 20px solid transparent;
    border-right: 20px solid transparent;

    border-top: 20px solid $grey;
    margin: 0 auto;
}
</style>
