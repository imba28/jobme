<template>
  <div class="bottom-menu">
    <ul class="bottom-menu__list">

        <li class="bottom-menu__list__item">
          <router-link :to="{ name: 'groups' }">
          <span class="icon-group-light"></span>
        </router-link>
        </li>

      <li class="vertical-line"></li>

      <li class="bottom-menu__list__item">
        <router-link :to="{ name: 'tasks' }">
          <span class="icon-task"></span>
        </router-link>
      </li>

      <li class="vertical-line"></li>

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
  height: $bottom-menu-height;
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

    list-style: none;

    a {
      color: $grey-darker;
      @include transition(color 500ms ease);
    }

    a.active {
      color: $blue;
    }
  }

  .vertical-line {
    display: block;
    width: 1px;
    background-color: #CCCCCC;
    height: 60%;
  }
}
</style>
