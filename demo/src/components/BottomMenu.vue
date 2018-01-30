<template>
  <div class="bottom-menu">
    <ul class="bottom-menu__list">

      <router-link :to="{ name: 'groups' }">
        <li class="bottom-menu__list__item">
          <span class="icon-group-light"></span>
        </li>
      </router-link>

      <span class="line"></span>

      <router-link :to="{ name: 'tasks' }">
        <li class="bottom-menu__list__item">
          <span class="icon-task"></span>
        </li>
      </router-link>

      <span class="line"></span>

      <li class="bottom-menu__list__item">
        <span class="icon-calendar"></span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'bottommenu'
}
</script>

<style lang="scss">
.bottom-menu {
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 80px;
  padding: 0 12% 0 12%;
  background-color: $grey;
}

.bottom-menu__list {
  float: none;
  height: 100%;
  margin: 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0;

  .bottom-menu__list__item {
    display: flex;
    font-size: 2.4em;
    color: $grey-darker;
    list-style: none;
  }

  .bottom-menu__list.bottom-menu__list__item--active {
    color: $blue;
  }

  .line {
    display: block;
    width: 1px;
    background-color: #CCCCCC;
    height: 60%;
  }
}
</style>
