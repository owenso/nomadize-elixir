<template>
  <form @submit.prevent="save">
    <div class="modal-card" style="width:300px;">
      <section class="modal-card-body">
        <b-field label="Email">
          <b-input type="email" v-model="email" placeholder="Your email" required></b-input>
        </b-field>

        <b-field label="Password">
          <b-input
            type="password"
            v-model="password"
            password-reveal
            placeholder="Your password"
            required
          ></b-input>
        </b-field>

        <b-field label="Confirm Your Password">
          <b-input
            type="password"
            v-model="password"
            password-reveal
            placeholder="Your password, again"
            required
          ></b-input>
        </b-field>
        <!-- <b-checkbox>Remember me</b-checkbox> -->
        <b-field class="has-text-centered">
          <a class="control" v-on:click="showReset">Already have an account, but forgot your Password?</a>
        </b-field>
      </section>
      <footer class="modal-card-foot is-grouped-centered" id="auth-actions">
        <button v-on:click="showSignIn" formnovalidate class="button cancel-button-override ">Back to Sign In</button>
        <button loading="this.state.signupPending" class="button">Create Account</button>
      </footer>
    </div>
  </form>
</template>

<script>
export default {
  props: ['stateEmail', 'setEmail', 'submit', 'state'],
  created() {
    this.email = this.stateEmail;
  },
  data() {
    return {
      email: '',
      password: ''
    };
  },
  methods: {
    showSignUp() {
      this.$store.dispatch('setAuthEmail', this.email);
      this.$emit('authdropdownshow', 'signin');
    },
    showReset() {
      this.setEmail(this.email);
      this.$emit('authdropdownshow', 'reset');
    },
    save() {
      this.submit({
        session: {
          email: this.email,
          password: this.password
        }
      });
    }
  }
};
</script>
