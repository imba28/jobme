<template>
<li>
  <h4>{{ task.name }}</h4>
  <p>
    {{ task.description }}
  </p>

  <label>
      Erledigt: <input type="checkbox" v-model="task.status">
      {{ task.status }}
      </label>

  <span v-if="task.duedate">{{ task.duedate }}</span>
</li>
</template>

<script>
export default {
  name: 'task-component',
  props: ['task'],
  watch: {
    task: {
      handler: function(newValue) {
        const formData = new FormData();
        formData.append('task[done]', this.task.status ? 1 : 0);
        formData.append('_method', 'PUT');

        fetch(`http://localhost:3000/users/2/tasks/${this.task.id}.json`, {
              mode: 'cors',
              method: 'POST',
              headers: {
                  'Accept': 'application/json',
              },
              body: formData
          }).then((response) => response.json())
          .then(data => {
              console.log(data);
          });
      },
      deep: true
    }
  }
}
</script>
