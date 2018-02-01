<template>
<div id="calendar_container">
  <v-calendar
    :attributes="attrs"
    :theme-styles='themeStyles'
  >

  </v-calendar>
</div>
</template>

<script>
import auth from '@/auth'
import request from '@/lib/request'

export default {
  data() {

    return {
      attrs: [],
      themeStyles:{
        wrapper:{
          background: 'white',
          borderRadius: "5px",
        },
        header:{

        },
      }

    }
  },
  created() {
    request.fetch(`http://localhost:3000/users/${auth.getUID()}/tasks.json`).then(tasks => {
      this.tasks = tasks;

      for (let a of tasks) {
        if (a.due_date != undefined) {
          let b = {
            dates: new Date(a.due_date),
            highlight: {
              backgroundColor: "#0091EA",
            },
            contentStyle: {
              color: '#fafafa',
            },
            popover: {
              label: a.name
            }
        }
        this.attrs.push(b);
        }
      }
    });
  },





};
</script>

<style lang='scss'>
  .view{
    display: flex;
    flex-direction: column;
    align-content: center;
  }

  #calendar_container{

  }


</style>
