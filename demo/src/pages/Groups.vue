<template>
  <div>
    <h2 class="text--center text--left">Deine Gruppen</h2>
    <router-link to="group-add"><button class="btn btn--default btn--left">Neue Gruppe erstellen</button></router-link>
    <ul class="groups">
      <li v-for="group in groups" class="list__item__wrapper" :data-id="group.id">
        <router-link :to="{ name: 'group_id', params: { id: group.id }}">
          <div class="list__item fade-out">{{ group.name }}</div>
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
  import router from '@/router'

  export default {
    name: 'groups-page',
    data() {
      return {
        groups: [],
        user: {}
      }
    },
    created() {
      fetch(`http://localhost:3000/users/2.json`)
        .then((response) => response.json())
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
  float: left;
  padding: 0;
  margin-top: 1.3em;

  li {
    list-style: none;
  }
}
</style>
