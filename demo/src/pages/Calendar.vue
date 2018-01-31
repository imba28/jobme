<template>
  <div>
    <h1>Kalender</h1>
    <p>{{ attrs.dates }}</p>
    <button v-on:click="attrs.dates = [new Date(2018,0,10),new Date(2018,1,15)]">Add 1</button>

  <v-calendar
    :attributes="attrs"
  >
  </v-calendar>

  </div>
</template>

<script>
  import auth from '@/auth'
  import request from '@/lib/request'

  export default {

    methods: {
      updateDate: function(e) {
        this.dates = [new Date(2018,0,10),new Date(2018,1,15)];
      }
    },

    data() {
      return {
        attrs: [
          {
            key: 'today',
            dates: function(){
              new Date(2018,0,10)
            },
            highlight: {
              backgroundColor: "#0091EA",
            },
            contentStyle: {
              color: '#fafafa',
            },
            popover: {
              label: "ToDo show Tasktitle + time"
            }
          }
        ],
        tasks: [],
      };
    },

    methods:{},

      created(){
        request.fetch(`http://localhost:3000/users/${auth.getUID()}/tasks.json`).then(tasks => {
          this.tasks = tasks;

          let arr = [];
          for(let a of tasks) {
            if (a.due_date != undefined) {
              let due_date_string = a.due_date.toString().substring(0, 10);
              due_date_string = due_date_string.split("-");
              let year_due_date = due_date_string[0];
              let month_due_date = Number.parseInt(due_date_string[1]);
              let day_due_date = Number.parseInt(due_date_string[2]);

              arr.push(new Date(
                  year_due_date,
                  month_due_date,
                  day_due_date
              ));
            }
          }
          console.log(arr)
          this.attrs.dates = arr;
        });
      },





  };
</script>

<style lang='scss'>


</style>
