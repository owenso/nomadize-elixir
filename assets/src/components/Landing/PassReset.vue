<template>
  <div class='uk-card uk-card-body uk-card-default'>
    <div class="uk-grid-small" uk-grid>
        <h2 class='uk-card-title'>Password Reset</h2>
        <small>Enter the email you used to sign up and we'll send you a reset code.</small>
        <div class="uk-margin-medium-top uk-width-1-1">
            <input v-validate="'required|email'" name='email' v-model="email" class="uk-input" type="email" placeholder="Email">
            <span v-show="errors.has('email')" class="help is-danger">{{ errors.first('email') }}</span>
        </div>
        <div class="uk-margin-small-bottom uk-margin-large-top uk-width-1-1">
            <button v-on:click='submitReset()' class='uk-button uk-button-default uk-width-1-1'>Reset Password</button>
        </div>
        <div class="uk-width-1-2 uk-text-center">
          <button class="uk-button uk-button-text" v-on:click="showSignIn">Sign In</button>
        </div>
        <div class="uk-width-1-2 uk-text-center">
          <button class="uk-button uk-button-text" v-on:click="showSignUp">Sign Up</button>
        </div>
    </div>
  </div>
</template>

<script>
export default {
//   data() {
//     return {
//     };
//   },
  methods: {
    showSignUp() {
      this.$emit('show', 'signup');
    },
    showSignIn() {
      this.$emit('show', 'signin');
    },
    submitReset() {
      const email = this.email;
      console.log(email);
      this.$store.dispatch('sendReset', email);
    },
  },
};
</script>