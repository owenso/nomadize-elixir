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
        <!-- <b-checkbox>Remember me</b-checkbox> -->
        <b-field class="has-text-centered">
          <a class="control" v-on:click="showReset">Forgot your Password?</a>
        </b-field>
      </section>
      <footer class="modal-card-foot is-grouped-centered" id="auth-actions">
        <button loading="this.state.loginPending" class="button is-fullwidth">Log In</button>
        <button v-on:click="showSignUp" formnovalidate class="button is-fullwidth">Sign Up</button>
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
      this.$emit('authdropdownshow', 'signup');
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
