<template>
  <form>
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
    mounted: function() {
      alert()
      console.log(this);
    }
  }
</script>
