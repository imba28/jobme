<template>
  <div>
    <h2 class="text--center text--left">Deine Gruppen</h2>
    <router-link :to="{name: 'group-add' }" class="btn btn--default display--iblock">Neue Gruppe erstellen</router-link>
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
  </div>
</template>

<script>
  import auth from '@/auth'
  import request from '@/lib/request'

  export default {
    name: 'groups-page',
    data() {
      return {
        groups: [],
        user: {}
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
