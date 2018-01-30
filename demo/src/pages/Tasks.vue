<template>
  <div>
    <div class="input__container input__container--has-button input__container--reverse add-task">
        <input ref="task_name" id="add_task" class="input" type="text" placeholder="Neue Aufgabe hinzufügen..."/>
        <button class="btn btn--default" v-on:click.native="createTask">
          <i class="icon-plus"></i>
        </button>
    </div>
    <button @click.native="createTask">
      Submit
    </button>
    <ul class="groups">
      <button v-for="group in groups" class="badge" v-on:click="changeGroup" :data-id="group.id">
        {{ group.name }}
      </button>
    </ul>
    <ul>
      <task-component :task="task" v-for="task in tasks"></task-component>
      <span v-if="tasks.length === 0">Keine Tasks in dieser Gruppe!</span>
    </ul>
  </div>
</template>

<script>
  import router from '@/router'
  import TaskComponent from '@/components/Task'

  import auth from '@/auth'
  import request from '@/lib/request'

  export default {
    name: 'task-page',
    components: {
      TaskComponent
    },
    methods: {
      createTask: function() {
        router.push({
          path: 'add',
          props: {
            task_name: this.$refs.task_name.value
          }
        });
      },
      changeGroup: function(e) {
        const groupId = parseInt(e.target.getAttribute('data-id'));
        this.tasks = this.tasks_all.filter(task => task.group_id === groupId );
      }
    },
    data() {
      return {
        tasks_all: [],
        tasks: [],
        groups: [],
        user: {}
      }
    },
    created() {
      request.fetch(`http://localhost:3000/users/${auth.getUID()}/tasks.json`)
      .then(tasks => {
        this.tasks = tasks;
        this.tasks_all = tasks;
      });

      request.fetch(`http://localhost:3000/users/${auth.getUID()}.json`)
      .then(user => {
        this.user = user;
        this.groups = user.groups
      });
    }
  }
</script>

<style lang="scss">
.add-task {
  display: flex;

  input {
    min-width: 0;
    flex-grow: 0;
    flex-shrink: 1;
    flex-basis: auto;
    box-sizing: border-box;
  }
}

ul {
  padding: 0;

  li {
    list-style: none;
  }
}

.groups {
  .badge {
    margin-right: 1em;
  }
}
</style>
