<template>
<span v-touch:swipe="swipeHandler">
  <div>
    <h2 class="text--center text--left">Deine Gruppen</h2>
    <input id="invite-code" type="text" placeholder="Füge hier einen Beitrittscode ein">
    <button class="btn btn--default" v-on:click="joinGroup('invite-code')">Beitreten</button>
    <ul class="groups">
      <li v-for="group in groups" class="list__item__wrapper" :data-id="group.id">
        <router-link :to="{ name: 'group_id', params: { id: group.id }}">
          <div class="list__item fade-out">{{ group.name }}</div>
        </router-link>
      </li>
      <li v-if="groups.length == 0">
        Keine Gruppen gefunden.
      </li>
    </ul>
    <router-link :to="{name: 'group_new' }" class="btn btn--default display--iblock">Neue Gruppe erstellen</router-link>
  </div>
</span>
</template>

<script>
  import auth from '@/auth'
  import request from '@/lib/request'
  import notification from '@/lib/notification'

  export default {
    name: 'groups-page',
    data() {
      return {
        groups: [],
        user: {}
      }
    },
    methods: {
      joinGroup: function(id) {
        request.fetch(`http://localhost:3000/invitecodes.json`)
          .then(codes => {
            let codeInput = document.getElementById(id).value;
            let inviteCode = codes.find(elem => elem.code === codeInput)

            // input matches code in database
            if(inviteCode !== undefined) {
              if(isUserInGroup(inviteCode.group_id, this.groups)) {
                notification.error("Du bist bereits in der Gruppe");
              }
              else {
                // join the group
                request.fetch(`http://localhost:3000/groups/${inviteCode.group_id}/users.json`, 'POST', { id: auth.getUID() })
                       .then(() => // reload data
                         request.fetch(`http://localhost:3000/users/${auth.getUID()}.json`)
                           .then(user => {
                             this.user = user;
                             this.groups = user.groups
                         })
                      );

                // go to the group page
                this.$router.push({ path: `groups/${inviteCode.group_id}`})

                notification.success("Gruppe erfolgreich beigetreten");
              }
            }
            else {
              notification.error("Falscher Beitrittscode");
            }
          });
      },
      swipeHandler (direction) {
        if(direction == "right") {
          this.$router.push({
            path: "/tasks"
          })
        }
      }
    },
    created() {
      request.fetch(`http://localhost:3000/users/${auth.getUID()}.json`)
             .then(user => {
               this.user = user;
               this.groups = user.groups
             });
    }
  }

  function isUserInGroup(group_id, groups) {
    if(groups.find(group => group.id === group_id)) {
      return true;
    }
    else {
      return false;
    }
  }

</script>

<style lang="scss">

button.btn {
  margin-top: 0.5em;
}

.groups {
  width: 100%;
  padding: 0;
  margin-top: 1.3em;

  li {
    position: relative;
    list-style: none;
  }
}
</style>
