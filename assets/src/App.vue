<template>
  <div id="app">
    <!-- <div id="nav"> -->
      <!-- <router-link to="/">Home</router-link> | -->
      <!-- <router-link to="/about">About</router-link> -->
    <!-- </div> -->
    <navbar></navbar>
    <router-view/>
  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';

export default {
  components: {
    Navbar
  }
};
</script>

<style lang="scss">
html,
body {
  overflow: hidden;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: $primary-text;
  height: 100%;
  background-color: $primary;
}
#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: $primary-text;
    &.router-link-exact-active {
      color: $accent-color;
    }
  }
}
</style>
