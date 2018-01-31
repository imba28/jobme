<template>
<li v-bind:class="{ 'task--done': task.status }" class="task">
  <div class="task__info">
    <input type="checkbox" v-model="task.status" class="task__done">
    <div class="task__title">
      {{ task.name }}</h4>
    </div>
  </div>
  <!--<div class="task__description">
    {{ task.description }}
  </div>-->
  <span v-if="task.due_date" class="task__duedate">{{ renderDate(task.due_date) }}</span>
</li>
</template>

<script>
import request from '@/lib/request'
import auth from '@/auth'

const getMonthName = (idx) => {
  const months = ['Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez']
  return months[idx]
}

export default {
  name: 'task-component',
  props: ['task'],
  methods: {
    renderDate: (date) => {
      const d = new Date(date);
      const mo = getMonthName(d.getMonth());

      if(d.getUTCHours() == 0 && d.getUTCMinutes() == 0) return `${d.getDay()}. ${mo}`
      else return `${d.getDay()}. ${mo} / ${d.getHours()}:${d.getMinutes()}`
    }
  },
  watch: {
    task: {
      handler: function(newValue) {
        request.fetch(
            `http://localhost:3000/users/${auth.getUID()}/tasks/${this.task.id}.json`,
            'PUT', {
              'task[done]': this.task.status ? 1 : 0
            }
          )
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
    display: flex;
    justify-content: space-between;

    .task__info {
      display: flex;
      font-weight: 500;
    }

    .task__done {
        margin-right: .5em;
    }

    .task__duedate {
      color: $grey-dark;
      font-size: 0.8em;
    }
    h4 {
        margin: 0 0 0.5em;
    }

    .task__description {
        margin: 0;
    }
}

.badge {
    margin-bottom: 0.5em;
}

.task--done {
    color: #aaa;

    .task__description {
        display: none;
    }
}
</style>
