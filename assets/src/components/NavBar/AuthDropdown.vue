<template>
  <b-dropdown id="auth-dropdown" position="is-bottom-left">
    <a class="navbar-item" slot="trigger">
      <span>Login</span>
      <b-icon icon="menu-down"></b-icon>
    </a>
    <b-dropdown-item custom paddingless>
      <auth-dropdown-pass-reset
        v-on:authdropdownshow="setView"
        :setEmail="setAuthEmail"
        :stateEmail = "email"
        v-if="view == 'reset'"
      />
      <auth-dropdown-sign-in
        v-on:authdropdownshow="setView"
        :setEmail="setAuthEmail"
        :submit="login"
        :stateEmail = "email"
        v-if="view == 'signin'"
      />
    </b-dropdown-item>
  </b-dropdown>
</template>

<script>
import AuthDropdownSignIn from './AuthDropdownSignIn.vue';
import AuthDropdownPassReset from './AuthDropdownPassReset';
import { mapState, mapActions } from 'vuex';

export default {
  components: {
    AuthDropdownSignIn,
    AuthDropdownPassReset
  },
  data: function() {
    return {
      view: 'signin'
    };
  },
  computed: {
    ...mapState({
      email: state => state.auth.creds.email
    })
  },
  methods: {
    setView: function(view) {
      this.view = view;
    },
    ...mapActions({
      setAuthEmail: 'setAuthEmail',
      login: 'login'
    })
  }
};
</script>

<style lang="scss">
#auth-dropdown {
  span.icon.is-right.has-text-primary.is-clickable {
    color: $accent-color !important;
  }
  #sign-in-actions {
    .button {
      background-color: $accent-color;
      color: $text-icons;
      border: none;
    }

    .cancel-button-override {
      background-color: hsl(348, 100%, 61%);
    }
  }
}
</style>
