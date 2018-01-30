<template>
  <div>
    <h2 class="text--center text--left">Mitglieder</h2>
    <ul class="members">
      <li v-for="member in group_members" class="list__item__wrapper" :data-id="member.id">
        <div class="list__item fade-out">{{ member.name }}</div>
      </li>
    </ul>
    <button class="btn btn--red btn--left" v-on:click="leaveGroup">Gruppe verlassen</button>
    <h2 class="text--center text--left">Benachrichtigungen</h2>
    <p>Push</p>
    <p>E-Mail</p>
  </div>
</template>

<script>
  import auth from '@/auth'
  import request from '@/lib/request'

  export default {
    name: 'group',
    data() {
      return {
        user: {},
        group_members: []
      }
    },
    methods: {
      leaveGroup: function() {
        request.fetch(`http://localhost:3000/groups/${this.$route.params.id}/users/${auth.getUID()}.json`, method = 'DELETE', params = {})
      }
    },
    created() {
        request.fetch(`http://localhost:3000/users/${auth.getUID()}.json`)
          .then(user => {
            this.user = user;
          });

        request.fetch(`http://localhost:3000/groups/${this.$route.params.id}/users.json`)
          .then(members => {
            this.group_members = members;
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
