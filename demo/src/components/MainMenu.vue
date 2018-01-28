<template>
<ul class="mainmenu">
  <li>
    <a href="#">Home</a>
  </li>
  <li>
    <a href="#">Tasks</a>
  </li>
  <li>
    <a href="#">Groups</a>
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
