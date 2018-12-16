<template>
  <div id="app">
    <!-- <div id="nav"> -->
    <!-- <router-link to="/">Home</router-link> | -->
    <!-- <router-link to="/about">About</router-link> -->
    <!-- </div> -->
    <section class="hero is-fullheight">
      <div class="hero-head">
        <navbar></navbar>
      </div>
      <div class="hero-body">
        <router-view/>
      </div>
      <div class="hero-foot">
      </div>
    </section>
  </div>
</template>

<script>
import Navbar from '@/views/Navbar.vue';

export default {
  components: {
    Navbar
  }
};
</script>

<style lang="scss">
@import '~bulma/sass/utilities/_all';
@import '~bulma';
@import '~buefy/src/scss/buefy';

html,
body {
  overflow: hidden;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: $primary-text;
  background-color: $primary-color;
}
</style>
