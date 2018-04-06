<template>
<li v-bind:class="{ 'task--done': task.done == 1 }" class="list__item__wrapper task">
  <div class="task__info">
    <span class='input__container input__container--checkbox'>
          <input :id="'task-' + task.id" type="checkbox" v-model="task.done" class="task__done input__container--hide-input input__radio" :checked="task.done == 1" v-on:change="toggleDone">
          <label :for="'task-' + task.id">
              <span class="icon-checkbox-checked"></span>
              <span class="icon-checkbox"></span>
          </label>
      </span>
    <router-link :to="{ name: 'task', params: { id: task.id }}">
      <div class="task__title list__item fade-out">
        {{ task.name }}</h4>
      </div>
    </router-link>
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

      if (d.getUTCHours() == 0 && d.getUTCMinutes() == 0) return `${d.getDate()}. ${mo}`
      else return `${d.getDate()}. ${mo} / ${d.getHours()}:${d.getMinutes()}`
    },
    toggleDone() {
      request.fetch(
          `http://localhost:3000/users/${auth.getUID()}/tasks/${this.task.id}.json`,
          'PUT', {
            'task[done]': this.task.done ? 1 : 0
          }
        )
    }
  },
  watch: {
    task: {
      handler: function(newValue) {

      },
      deep: true
    }
  }
}
</script>


<style lang="scss">
.task.list__item__wrapper {
    font-size: 1em;
    position: relative;
    display: flex;
    justify-content: space-between;
    align-items: center;


    &.task--done {
        color: #aaa;

        .task__description {
            display: none;
        }
    }

    &::before {
      top: 0;
    }

    .task__info {
        display: flex;
        font-weight: 500;
        white-space: nowrap;

        a, & {
          overflow-x: hidden;
          flex-grow: 1;
        }
    }

    .task__done {
        margin-right: 0.5em;
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

    .input__container.input__container--checkbox {
      display: flex;
      align-items: center;
      margin: 0 1em 0 0;

      label {
        input {
          position: absolute;
        }
      }
    }
}

.badge {
    margin-bottom: 0.5em;
}
</style>
