<template>
  <ul id="notifications" ref="notifications">
    <li v-for="(note, idx) in notes" :class="note.type" class="note">
      {{ note.message }}
      <button @click="removeNote(idx)">
        x
      </button>
    </li>
  </ul>
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
      default: () => [
        /*{ type: 'error', message: "Das ist eine Fehlermeldung!"},
        { type: 'warn', message: "Das ist eine Warnung."},
        { type: 'success', message: "Das hat funktioniert!"},
        { type: 'info', message: "Das ist eine nützliche Information!"}*/
      ],
      type: Array
    }
  },
  created() {
    this.$root.addNotification = (message, type, duration = 2500) => {
      const note = { type, message }
      this.notes.push(note)

      if(duration && duration > 0) {
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
    position: absolute;
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
      padding: 1em 0;
      box-sizing: border-box;
      font-weight: 700;
      box-shadow: 0 3px 0 rgba($white, 0.1) inset;

      &.success {
        background: $green;
      }

      &.error {
        background: $red;
      }

      &.warn {
        background: $orange;
      }
    }
  }
</style>
