<template>
<div class="task__info">
  <h2 class="text--center text--left">{{ task.name }}</h2>
  <div class='input__container input__container--checkbox'>
    <div class="task__description">
      <h4>Anmerkung</h4>
      <div>
        {{ task.description }}
      </div>
    </div>
    <div v-if="task.due_date" class="task__deadline">
      <h4>zu erledigen bis</h4>
      <span class="task__duedate">{{ renderDate(task.due_date) }}</span>
    </div>
    <div v-if="group.name" class="task__group">
      <h4>Gruppe</h4>
      {{ group.name }}
      <p class="text--small">
        Erstellt von {{ group.admin.name }}, am {{ renderDate(task.created_at) }} Uhr
      </p>
    </div>
    <div class="task__finished">
      <h4>Erledigt</h4>
      <div class="task__done">
        <input id="done" type="checkbox" v-model="task.done" class="input__container--hide-input input__radio" :checked="task.done == 1" v-on:change="toggleDone">
        <label for="done">
          <span class="icon-checkbox-checked"></span>
          <span class="icon-checkbox"></span>
        </label>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import auth from '@/auth'
import request from '@/lib/request'

const getMonthName = (idx) => {
  const months = ['Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez']
  return months[idx]
}

export default {
  name: 'task',
  methods: {
    renderDate: (date) => {
      const d = new Date(date);
      const mo = getMonthName(d.getMonth());

      if (d.getUTCHours() == 0 && d.getUTCMinutes() == 0) return `${d.getDay()}. ${mo}`
      else return `${d.getDate()}. ${mo} / ${d.getHours()}:${d.getMinutes()}`
    },
    toggleDone() {
      request.fetch(
        `http://localhost:3000/tasks/${this.task.id}.json`,
        'PUT', {
          'task[done]': this.task.done ? 1 : 0
        }
      )
    }
  },
  data() {
    return {
      task: {},
      group: {}
    }
  },
  created() {
    request.fetch(`http://localhost:3000/tasks/${this.$route.params.id}.json`)
      .then(task => {
        this.task = task

        request.fetch(`http://localhost:3000/groups/${this.task.group_id}.json`)
          .then(group => {
            this.group = group
          });
      });
  }
}
</script>

<style lang="scss">
.task__done {
  font-size: 3rem;
  text-align: center;
}
</style>
