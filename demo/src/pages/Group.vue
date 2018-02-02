<template>
<div class="group-page">
  <h2 class="text--left">Mitglieder</h2>
  <div class="members">
    <div class="members__item" v-on:click="inviteMember">
      <div class="members__item__content  members__item__add">
        <span class="icon-plus"></span>
      </div>
    </div>

    <div id="info" class="info">
      <h3 class="info__header  text--left"></h3>
      <input type="radio" id="admin" name="rights" value="0">
      <label for="admin">Administrator</label><br>
      <input type="radio" id="member" name="rights" value="1">
      <label for="member">Mitglied</label><br>
      <input type="radio" id="spectator" name="rights" value="2">
      <label for="spectator">Beobachter</label><br>
    </div>

    <div v-for="(item, index) in group_members" class="members__item" v-on:click="editRights(item.id)" :data-id="item.id">
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
import router from '@/router'
import request from '@/lib/request'
import notification from '@/lib/notification'

var $ = require("jquery")

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
      request.fetch(`http://localhost:3000/groups/${this.$route.params.id}/users/${auth.getUID()}.json`, 'DELETE', {})
        .then((status) => {
          notification.success(status.message)
          router.push({
            name: 'groups'
          })
        })
        .catch((err) => {
          notification.error(err.error)
        })
  },
  inviteMember: function() {
    router.push({
      name: 'member-add'
    });
  },
  editRights: function(id) {
    let info = $('#info');
    let elem = event.target.parentElement;

    if (elem.classList.contains('members__item')) {
      request.fetch(`http://localhost:3000/users/${id}.json`)
        .then(user => {
          info.fadeToggle();
          info.find('.info__header').text(`Rechte von ${user.name} ändern`);
        });
    }
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
.group-page {
    display: flex;
    flex-flow: column;
}

.members {
    display: flex;
    flex-flow: wrap;
    margin-top: 1.3em;

    .members__item {
        flex-grow: 1;
        width: 33%;
        margin-bottom: 1.3em;

        &:last-child {
            margin-right: 0;
        }

        .members__item__content {
            width: 90px;
            height: 90px;
            background-color: $grey;
            border-radius: 1em;
            margin: 0 auto;
        }

        .members__item__add {
            display: flex;
            align-items: center;
            justify-content: center;
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

        .members__item__name {
            font-weight: 400;
            color: $black;
            margin: 0.3em auto 0;
        }
    }

    .info {
        display: none;
        z-index: 90;
        position: absolute;
        background: $grey;
        height: auto;
        width: 100%;
        top: 25%;
        margin: 0 auto 6px;
        border-radius: 0.7em;
        padding: 1.5em;

        h3 {
            margin-top: 0;
        }

        input,
        label {
            float: left;
        }

        label {
            margin-left: 1em;
        }
    }
}

button.btn {
    margin-top: 0.5em;
}
</style>
