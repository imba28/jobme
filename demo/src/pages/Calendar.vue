<template>
<div>
  <h1>Kalender</h1>
  <p>{{ attrs.dates }}</p>

  <v-calendar :attributes="attrs"></v-calendar>
</div>
</template>

<script>
import auth from '@/auth'
import request from '@/lib/request'

export default {
  data() {
    return {
      attrs: [{
        key: 'today',
        dates: [],
        highlight: {
          backgroundColor: "#0091EA",
        },
        contentStyle: {
          color: '#fafafa',
        },
        popover: {
          label: "ToDo show Tasktitle + time"
        }
      }],
      tasks: [],
    }
  },
  created() {
    request.fetch(`http://localhost:3000/users/${auth.getUID()}/tasks.json`).then(tasks => {
      this.tasks = tasks;

      for (let a of tasks) {
        if (a.due_date != undefined) {
          this.attrs[0].dates.push(new Date(a.due_date));
        }
      }
    });
  },





};
</script>

<style lang='scss'>


</style>
