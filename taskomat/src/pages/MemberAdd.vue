<template>
  <div>
    <h2 class="text--center text--left">Mitglieder hinzufügen</h2>
    <p>Sende deinen Freunden diesen Code, damit sie der Gruppe beitreten können</p>

    <input id="invite-code" type="text" :value="invite.code">
    <button class="btn btn--default" v-on:click="copyToClipboard('invite-code')">Copy</button>
  </div>
</template>

<script>
  import auth from '@/auth'
  import request from '@/lib/request'
  const random = require('meteor-random');

  export default {
    name: 'member-add',
    data() {
      return {
        invite: { code: null }
      }
    },
    methods: {
      copyToClipboard: function(id) {
        let input = document.createElement('input');
        document.body.appendChild(input)
        input.value = document.getElementById(id).value
        input.select();
        document.execCommand('copy');
        input.remove();
      }
    },
    created() {
      this.invite.group = this.$route.params.id;
      request.fetch(`http://localhost:3000/invitecodes.json`, 'POST', { code: random.secret(), group_id: this.$route.params.id })
              .then(code => {
                this.invite.code = code.code;
      });
    }
  }
</script>
