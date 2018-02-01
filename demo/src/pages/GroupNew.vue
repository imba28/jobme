<template>
  <div class="content_wrapper">
    <h1>Neue Gruppe erstellen</h1>
    <div class="input__container">
      <input ref="group_name" id="group_name" class="input" type="text" placeholder="Name" />
      <label class="input__label" id="name__label" for="group_name">
        Gruppename
      </label>
    </div>
    <h2>Einladungslink</h2>
    <p>Teile diesen Link mit deinen Freunden,
       um sie in deine gruppe einzuladen</p>
    <div class="input__container input__container--has-button input__container--reverse">
      <input class="input" type="text" />
      <button class="btn btn--default">kopieren</button>
    </div>
    <button>Erstellen</button>
    <button>Abbrechen</button>
  </div>
</template>

<script>

  export default {


  };


</script>

<style lang='scss'>

  .view{
    display: flex;
    flex-direction: column;
    align-content: center;
  }

</style>
