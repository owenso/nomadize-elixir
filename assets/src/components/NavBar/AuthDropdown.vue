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
        :submit="sendReset"
        :stateEmail="email"
        :state="passResetState"
        v-if="view == 'reset'"
      />
      <auth-dropdown-sign-in
        v-on:authdropdownshow="setView"
        :setEmail="setAuthEmail"
        :submit="login"
        :stateEmail="email"
        :state="signInState"
        v-if="view == 'signin'"
      />
      <auth-dropdown-sign-up
        v-on:authdropdownshow="setView"
        :setEmail="setAuthEmail"
        :submit="signup"
        :state="signUpState"
        :stateEmail="email"
        v-if="view == 'signup'"
      />
    </b-dropdown-item>
  </b-dropdown>
</template>

<script>
import AuthDropdownSignIn from './AuthDropdownSignIn.vue';
import AuthDropdownSignUp from './AuthDropdownSignUp.vue';
import AuthDropdownPassReset from './AuthDropdownPassReset';
import { mapState, mapActions } from 'vuex';

export default {
  components: {
    AuthDropdownSignIn,
    AuthDropdownPassReset,
    AuthDropdownSignUp
  },
  data: function() {
    return {
      view: 'signin'
    };
  },
  computed: {
    ...mapState({
      email: state => state.auth.creds.email,
      passResetState: state => state.reset,
      signUpState: state => state.signup,
      signInState: state => state.login
    })
  },
  methods: {
    setView: function(view) {
      this.view = view;
    },
    ...mapActions({
      setAuthEmail: 'setAuthEmail',
      login: 'login',
      sendReset: 'sendReset',
      signup: 'signup'
    })
  }
};
</script>

<style lang="scss">
#auth-dropdown {
  span.icon.is-right.has-text-primary.is-clickable {
    color: $accent-color !important;
  }
  #auth-actions {
    .button {
      background-color: $accent-color;
      color: $text-icons;
      border: none;
    }

    .cancel-button-override {
      background-color: hsl(348, 100%, 61%);
    }

    .tall-button {
      height: auto;
    }
  }
}
</style>
