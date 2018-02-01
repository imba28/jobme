<template>
<div class="task__info">
  <h2 class="text--center text--left">{{ task.name }}</h2>
  <div class='input__container input__container--checkbox'>
    <div class="task__description">
      <h3>Anmerkung</h3>
      <div>
        {{ task.description }}
      </div>
    </div>
    <div class="task__finished">
      <input :id="'task-' + task.id" type="checkbox" v-model="task.done" class="task__done input__container--hide-input input__radio">
      <label :for="'task-' + task.id">
        <span class="icon-checkbox-checked"></span>
        <span class="icon-checkbox"></span>
      </label>
    </div>
  </div>
  <span v-if="task.due_date" class="task__duedate">{{ renderDate(task.due_date) }}</span>
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
      else return `${d.getDay()}. ${mo} / ${d.getHours()}:${d.getMinutes()}`
    }
  },
  data() {
    return {
      task: {},
    }
  },
  created() {
    request.fetch(`http://localhost:3000/tasks/${this.$route.params.id}.json`)
      .then(task => {
        this.task = task
      });
  }
}
</script>

<style lang="scss">
.members {
    width: 100%;
    float: left;
    padding: 0;
    margin-top: 1.3em;
}
</style>
