<template>
  <div class='uk-card uk-card-body uk-card-default'>
    <div class="uk-grid-small" uk-grid>
        <h2 class='uk-card-title'>Sign Up</h2>
        <div class="uk-margin-medium-top uk-width-1-1">
            <input v-validate="'required'" name='username' v-model="username" class="uk-input" type="text" placeholder="Username">
            <span v-show="errors.has('username')" class="help is-danger">{{ errors.first('username') }}</span>
        </div>
        <div class="uk-width-1-1">
            <input v-validate="'required|email'" name='email' v-model="email" class="uk-input" type="email" placeholder="Email">
            <span v-show="errors.has('email')" class="help is-danger">{{ errors.first('email') }}</span>
        </div>
        <div class="uk-width-1-1">
            <input v-model="firstName" class="uk-input" type="text" placeholder="First Name (Optional)">
        </div>
        <div class="uk-width-1-1">
            <input v-model="lastName" class="uk-input" type="text" placeholder="Last Name (Optional)">
        </div>
        <div class="uk-width-1-1">
            <input v-model="password" v-validate="'required|min:8'"  name='password' class="uk-input" type="password" placeholder="Password">
            <span v-show="errors.has('password')" class="help is-danger">{{ errors.first('password') }}</span>
        </div>
        <div class="uk-width-1-1">
            <input v-model="confirmPassword" v-validate="'required|confirmed:password'" data-vv-as="password" name='confirmPassword' class="uk-input" type="password" placeholder="Confirm Password">
            <span v-show="errors.has('confirmPassword') && !errors.has('password')" class="help is-danger">{{ errors.first('confirmPassword') }}</span>
        </div>
        <div class="uk-margin-small-bottom uk-margin-large-top uk-width-1-1">
            <button v-on:click='submitSignup()' :disabled="errors.any()" class='uk-button uk-button-default uk-width-1-1'>Sign Up</button>
        </div>
        <div class="uk-width-1-2 uk-text-center">
          <button class="uk-button uk-button-text" v-on:click="showSignIn">Already have an account?</button>
        </div>
        <div class="uk-width-1-2 uk-text-center">
          <button class="uk-button uk-button-text" v-on:click="showReset">Forgot Your Password?</button>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      confirmPassword: '',
      email: '',
      firstName: '',
      lastName: '',
    };
  },
  methods: {
    showSignIn() {
      this.$emit('show', 'signin');
    },
    showReset() {
      this.$emit('show', 'reset');
    },
    submitSignup() {
      this.$validator.validateAll().then((result) => {
        if (result) {
          const payload = {
            Username: this.username,
            Password: this.password,
            Provider: 'local',
            Email: this.email,
            FirstName: this.firstName,
            LastName: this.lastName,
          };
          this.$store.dispatch('signup', payload)
          .then(() => {
            this.$emit('show', 'emailSent');
          });
        } else {
          console.log('handle error');
        }
      });
    },
  },
};
</script>