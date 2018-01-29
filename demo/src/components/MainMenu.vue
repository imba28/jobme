<template>
<ul class="mainmenu">
  <li>
    <router-link to="/">Home</router-link>
  </li>
  <li>
   <router-link to="/tasks">Tasks</router-link>
  </li>
  <li>
    <router-link to="/groups">Gruppen</router-link>
  </li>
</ul>
</template>

<script>
export default {
  name: 'mainmenu'
}
</script>

<style lang="scss">
.mainmenu {
  display: flex;

  li {
    margin-left: 1em;
  }
}
</style>
