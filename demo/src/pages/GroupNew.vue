<template>
  <div class="content_wrapper">
    <h2>Neue Gruppe erstellen</h2>
    <div class="input__container">
      <input ref="group_name" id="groupname_input" class="input" type="text" placeholder="Name" />
      <label class="input__label" id="groupname_input--label" for="groupname_input">
        Gruppename
      </label>
    </div>
    <h3 id="invitation_headline">Einladungslink</h3>
    <p>Teile diesen Link mit deinen Freunden,
       um sie in deine gruppe einzuladen</p>
    <div class="input__container input__container--has-button input__container--reverse">
      <input class="input" type="text" id="invitation_link_input" value=""/>
      <button class="btn btn--default" v-on:click=" "  >kopieren</button>
    </div>
    <div class="action_button--container">
    <button class="btn btn--default" @click="createGroup()">Erstellen</button>
    <button class="btn btn--red" @click="abort()">Abbrechen</button>
    </div>
  </div>
</template>

<script>
  import request from "@/lib/request"
  import auth from '@/auth'

  export default {
    methods:{
      createGroup(){
        const groupName = this.$refs['group_name'].value
        console.log(groupName);

        request.fetch("http://localhost:3000/groups.json","POST",{'group[name]':groupName ,'group[admin_id]' :auth.getUID() })
        .then(data => {this.$router.push({path:"/groups"})})
      },
      abort(){
        this.$router.push({path:"/groups"})
      }
    }

  };


</script>

<style lang='scss'>

  .view{
    display: flex;
    flex-direction: column;
    align-content: center;
  }

  .content_wrapper{
    .input__container{
      align-items: stretch;
    }
    #invitation_link_input, #groupname_input--label{
      border: solid 1.5px #0091EA;
      border-right: 0;

    }
    #groupname_input{
      border: solid 1.5px #0091EA;
    }

    #invitation_headline{
      margin-top: 1em;
      margin-bottom: 0;
    }
    p{
      margin-top: 0.5em;
      opacity: 0.6;
    }
    .action_button--container{
      display: flex;
      flex-direction: column;
      align-content: stretch;
      align-items: stretch;
      justify-content: center;
      margin-top: 3em;
    }
  }

</style>
