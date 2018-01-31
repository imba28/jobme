<template>
  <form>
    <h1>Task erstellen</h1>
    <div class="input__container">
      <input id="ID" class="input" type="text" :value="task_name"/>
      {{ task_name }}
      <label class="input__label" for="ID">
          LABEL TEXT
      </label>
    </div>
  </form>
</template>

<script>
  export default {
    name: 'task-add',
    props: ['task_name'],
  }
</script>
