<template>
  <nav id="nav" class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
    <div class="container">
      <div class="navbar-brand">
        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>
      <div class="navbar-menu" id="navbar-menu" fixed="top">
        <div class="navbar-end">
          <a acontent="Logout" v-if="loggedIn"/>
          <auth-dropdown v-else></auth-dropdown>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
import AuthDropdown from '../components/NavBar/AuthDropdown.vue';

export default {
  components: {
    AuthDropdown
  },
  data: function() {
    return {
      loggedIn: false
    };
  },
  methods: {}
};
</script>


<style lang="scss" scoped>
</style>
