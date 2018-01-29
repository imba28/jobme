<template>
<li v-bind:class="{ 'task--done': task.status }" class="task">
  <h4>{{ task.name }}</h4>
  <p class="task__description">
    {{ task.description }}
  </p>

  <label>
      Erledigt: <input type="checkbox" v-model="task.status">
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


<style lang="scss">
.task {
  margin-bottom: 2em;

  h4 {
    margin: 0;
    margin-bottom: .5em;
  }

  .task__description {
    margin: 0;
  }
}

.badge {
  margin-bottom: .5em;
}

.task--done {
  color: #aaa;

  .task__description {
    display: none;
  }
}
</style>
