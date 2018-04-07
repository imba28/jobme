<template>
  <div>
    <div>
      <div class="overlay">
        <a href="#/explore-childhood">
          <div class="icon">
            <i class="fas fa-chevron-left fa-2x"></i>
          </div>
        </a>
      </div>
      <h1 class="full-width">
        <img class="full-width" :src="cat.img" />
      </h1>
      <ul class="icons">
        <li v-for="cat in cats">
          <div class="details-div">
            <img :id="cat.id" :title="cat.label" class="circle-details clickable" v-on:click="addHobby(cat.id)" :src="cat.img" />
          </div>
        </li>
      </ul>
    </div>
  </div>
  </template>

<script>
  import hobbies from '@/json/hobbies.json'
  export default {
    props: ['name'],
    name: 'start-page',
    data(){
      let hash = window.location.hash
      let cat = hash.split("?")[1]

      return {
        cats: hobbies.category[cat].types,
        cat: hobbies.category[cat]
      }

    },
    methods: {
      //TODO: write onload method that ticks all details which are in local storage
      addHobby: function(chosenCat) {
        let el = document.getElementById(chosenCat)
        let storedHobbies = {'hobbies': []}
        let tickIcon = document.createElement("i");
        tickIcon.className = 'far fa-check-circle fa-2x tick'
        tickIcon.id = 'tick-'+chosenCat

        if((sessionStorage.getItem('hobbies'))) {
          storedHobbies = JSON.parse(sessionStorage.getItem('hobbies'))
        }

        console.info(storedHobbies)

        if((el.className.includes('added'))||storedHobbies.hobbies.includes(el.id)) {
          // remove it!
          el.classList.remove('added')
          $('#'+tickIcon.id).remove()
          let index = storedHobbies.hobbies.indexOf(el.id)
          storedHobbies.hobbies.splice(index,1)
        }
        else {
          // add it!
          el.classList.add('added')
          el.insertAdjacentElement("afterend", tickIcon)
          storedHobbies.hobbies.push(el.id)
        }

        // finally update sessionStorage
        sessionStorage.setItem('hobbies', JSON.stringify(storedHobbies))

      }
    }
  }

</script>

<style lang="scss">
  .icons {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;

    li {
      flex-basis: 50%;
      flex-grow: 0;
      flex-shrink: 0;
      align-content: center;
      text-align: center;
      list-style: none;
      .inner {
        padding: 2em;

        .tick {
          position: absolute;
          margin-left: -1.2rem;
          margin-top: 3.5rem;
          color: green;
        }

        .icon {
          background: #ddd;
          border-radius: 50%;

          &::after {
            display: block;
            padding-top: 100%;
            content: '';
          }
        }
      }
    }
  }
</style>
