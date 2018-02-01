<template>
<form v-on:submit.prevent="onSubmit">
  <div class="input__container input__container--light">
    <input id="ID" class="input" type="text" ref="name" :value="task_name" placeholder="Was ist zu tun?" />
  </div>
  <div class="inputgroup">
    <span class="label">Fälligkeitsdatum</span>
    <div class="input__container">
      <button type="button" class="btn btn--default">Uhrzeit <i class="icon-calendar"></i></button>
      <button type="button" class="btn btn--default">Datum <i class="icon-calendar"></i></button>
    </div>
  </div>
  <div class="inputgroup">
    <span class="label">Gruppe</span>
    <select ref="group_id">
      <option v-for="group in groups" :value="group.id">{{ group.name }}</option>
    </select>
  </div>
  </div>
  <div class="inputgroup">
    <span class="label">Jedem Mitglied zuweisen?</span>
    <div class="switch-wrapper">
      <div class="switch">
          <input type="checkbox" class="switch__checkbox" ref="share" id="share" checked="checked">
          <label class="switch__label" for="share"></label>
      </div>
    </div>
  </div>
  </div>
  <div class="inputgroup">
    <span class="label">Anmerkung</span>
    <textarea class="textarea" ref="description">
      </textarea>
  </div>
  <div class="inputgroup">
    <div class="input__container submit">
      <router-link :to="{name: 'tasks'}" tag="button" class="btn btn--default">Abbrechen</router-link>
      <button class="btn btn--default btn--default--hover">Erstellen</button>
    </div>
  </div>

  <div v-on:doubletap="t" style="height: 50px; background: pink;"></div>
</form>
</template>

<script>
import request from '@/lib/request'
import notification from '@/lib/notification'
import auth from '@/auth'

export default {
  name: 'task-add',
  props: ['task_name'],
  data: () => {
    return {
      groups: []
    }
  },
  methods: {
    t() {
      console.log("TOUCH")
    },
    onSubmit() {
      const data = {
        group_id: this.$refs.group_id.value,
        user_id: auth.getUID(),
        name: this.$refs.name.value,
        description: this.$refs.description.value,
        share: this.$refs.share.checked ? 1 : 0
      }

      const params = {}
      for(let key in data) {
        params[`task[${key}]`] = data[key]
      }

      console.log(this.$refs.share)

      request.fetch(`http://localhost:3000/tasks.json`, 'POST', params)
        .then(task => {
          notification.success('Aufgabe wurde erstellt!')
          this.$router.push({ name: 'tasks' })
        })
        .catch(err => {
          console.error(err);
        })
    }
  },
  created() {
    request.fetch(`http://localhost:3000/users/${auth.getUID()}.json`)
      .then(user => {
        this.groups = user.groups
      });
  }
}
</script>

<style lang="scss">
.inputgroup {
    margin-bottom: 1.25em;

    .label {
        font-weight: 500;
        margin-bottom: 0.5em;
        display: block;
    }

    > .btn {
        margin-top: 0;
    }

    .input__container {
        .btn {
            padding: 0.6em 1em;
        }
    }

    .submit {
      font-size: 1.25em;

      button {
        width: 50%;
      }
    }
}
</style>
