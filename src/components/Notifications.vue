<template>
  <transition-group name="fade" tag="ul" id="notifications">
    <li v-for="(note, idx) in notes" :class="note.type" v-bind:key="idx" class="note">
      {{ note.message }}
      <button @click="removeNote(idx)">
        x
      </button>
    </li>
  </transition-group>
</template>

<script>
export default {
  name: 'notification',
  methods: {
    removeNote(idx) {
      this.notes.splice(idx, 1);
    }
  },
  props: {
    notes: {
      default: () => [/*{
          type: 'error',
          message: "Das ist eine Fehlermeldung!"
        },
        {
          type: 'warn',
          message: "Das ist eine Warnung."
        },
        {
          type: 'success',
          message: "Das hat funktioniert!"
        },
        {
          type: 'info',
          message: "Das ist eine nützliche Information!"
        }*/
      ],
      type: Array
    }
  },
  created() {
    this.$root.addNotification = (message, type, duration = 2500) => {
      const note = {
        type,
        message
      }
      this.notes.push(note)

      if (duration && duration > 0) {
        setTimeout(() => {
          this.removeNote(this.notes.indexOf(note));
        }, duration)
      }
    }
  }
}
</script>

<style lang="scss">
#notifications {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    padding: 0;
    margin: 0;
    z-index: 100;

    .note {
        list-style: none;
        background: lighten($blue-light, 35%);
        color: $white;
        padding: 1em;
        box-sizing: border-box;
        font-weight: 700;
        margin-bottom: 0.25em;
        @include border-radius(4px);

        box-shadow: 0.5em 0 0 lighten($blue-light, 30%) inset, 0 0 1em rgba($black, 0.1);

        &.success {
            background: $green;
            box-shadow: 0.5em 0 0 darken($green, 5%) inset, 0 0 1em rgba($black, 0.1);
        }

        &.error {
            background: $red;
            box-shadow: 0.5em 0 0 darken($red, 5%) inset, 0 0 1em rgba($black, 0.1);
        }

        &.warn {
            background: $orange;
            box-shadow: 0.5em 0 0 darken($orange, 10%) inset, 0 0 1em rgba($black, 0.1);
        }
    }
}
</style>
