<template>
  <div id="navbar">
    <sui-menu id="navbar-menu" fixed="top">
      <div id="navbar-container" is="sui-container">
        <sui-menu-menu v-if="loggedIn" position="right">
          <a is="sui-menu-item" content="Logout"/>
        </sui-menu-menu>
        <sui-menu-menu v-else position="right">
          <a is="sui-menu-item" content="Sign-In"/>
          <a is="sui-menu-item" content="Sign-Up"/>
        </sui-menu-menu>
      </div>
    </sui-menu>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      loggedIn: false
    };
  }
};
</script>


<style lang="scss" scoped>
#navbar-menu {
  background-color: $dark-primary;
  color: $text-icons;

  a {
    color: $text-icons;
  }
}
</style>
