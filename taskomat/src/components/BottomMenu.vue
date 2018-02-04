<template>
<footer>
  <div class="placeholders"></div>
  <div class="bottom-menu">
    <ul class="bottom-menu__list">

      <li class="bottom-menu__list__item">
        <router-link :to="{ name: 'groups' }">
          <div class="bottom-menu__list__item__icon">
            <span class="icon-group-light"></span>
          </div>
          <span class="bottom-menu__list__item__name">Gruppen</span>
        </router-link>
      </li>

      <li class="vertical-line"></li>

      <li class="bottom-menu__list__item">
        <router-link :to="{ name: 'tasks' }">
          <div class="bottom-menu__list__item__icon">
            <span class="icon-task"></span>
          </div>
          <span class="bottom-menu__list__item__name">Aufgaben</span>
        </router-link>
      </li>

      <li class="vertical-line"></li>
      <li class="bottom-menu__list__item">
        <router-link :to="{ name: 'calendar' }">
          <div class="bottom-menu__list__item__icon">
            <span class="icon-calendar"></span>
          </div>
          <span class="bottom-menu__list__item__name">Kalender</span>
        </router-link>
      </li>
    </ul>
  </div>
</footer>
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
    background-color: $grey;
}

.bottom-menu__list {
    float: none;
    height: 100%;
    margin: 0;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    padding: 0;

    .bottom-menu__list__item {
        display: flex;
        font-size: 2em;

        list-style: none;

        a {
            color: $grey-darker;
            @include transition(color 500ms ease);
        }

        a.active, a.active .bottom-menu__list__item__name {
          color: $blue;
        }

        &__icon {
            text-align: center;
        }

        &__name {
            display: block;
            font-size: 0.4em;
            color: $grey-dark;
            margin-top: .1em;
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
