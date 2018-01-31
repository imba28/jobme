<template>
  <div>
    <h2 class="text--center text--left">Mitglieder</h2>
    <div class="members">
      <div class="members__item members__item__add"><span class="icon-plus"></span></div>
      <div v-for="(item, index) in group_members" class="members__item" :data-id="item.id">
        <!-- add placeholder image if there is no avater set for the user -->
        <div v-if="item.avatar == null" class="members__item__content"></div>
        <img v-else src="">

        <div class="members__item__name">{{ item.name }}</div>
      </div>
    </div>
    <button class="btn btn--red btn--left" v-on:click="leaveGroup">Gruppe verlassen</button>

    <span class="horizontal-line"></span>

    <h2 class="text--center text--left">Benachrichtigungen</h2>

    <div class="switch-wrapper">
      <div class="switch">
          <input type="checkbox" name="switch" class="switch__checkbox" id="push">
          <label class="switch__label" for="push"></label>
      </div>
      <p>Push</p>
    </div>

    <div class="switch-wrapper">
      <div class="switch">
          <input type="checkbox" name="switch" class="switch__checkbox" id="email">
          <label class="switch__label" for="email"></label>
      </div>
      <p>E-Mail</p>
    </div>

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
        console.log("exec leaveGroup");
        console.log(`http://localhost:3000/groups/${this.$route.params.id}/users/${auth.getUID()}.json`);
        request.fetch(`http://localhost:3000/groups/${this.$route.params.id}/users/${auth.getUID()}.json`, 'DELETE', params = {});
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
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  margin-top: 1.3em;

  .members__item {
    width: 30%;
    margin-bottom: 1.3em;

    &:last-child {
      margin-right: 0;
    }

    .members__item__content {
      width: 90px;
      height: 90px;
      background-color: $grey;
      border-radius: 1em;
    }

    .members__item__name {
      font-weight: 400;
      color: $black;
      margin-top: 0.3em;
    }
  }

  .members__item__add {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 90px;
    height: 90px;
    background-color: inherit;
    color: $blue;
    border: 3px solid rgba($blue, 0.4);
    border-radius: 1em;
    margin-bottom: 2.4em;

    span {
      font-size: 3.3em;
      color: rgba($blue, 0.4);
    }
  }
}

button.btn {
  margin-top: 0.5em;
}
</style>
