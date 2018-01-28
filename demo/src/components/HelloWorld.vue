<template>
<div class="hello">
  <h1>Hallo {{ user.name }}!</h1>
  <h2>Deine Aufgaben</h2>
  <ul>
    <task-component :task="task" v-for="task in tasks"></task-component>
  </ul>
  <h2>Deine Gruppen</h2>
  <ul>
    <li v-for="group in groups">
      <h4>{{ group.name }}</h4> {{ group.admin }}
    </li>
  </ul>
</div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      tasks: [],
      groups: [],
      user: {}
    }
  },
  created() {
    fetch(`http://localhost:3000/users/2/tasks.json`)
      .then((response) => response.json())
      .then(tasks => {
        this.tasks = tasks;
      });

    fetch(`http://localhost:3000/users/2.json`)
      .then((response) => response.json())
      .then(user => {
        this.user = user;
        this.groups = user.groups
      });
  }
}
</script>
