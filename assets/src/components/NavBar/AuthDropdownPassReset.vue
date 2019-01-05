<template>
  <form v-on:submit.prevent="submitReset">
    <div class="modal-card" style="width:300px;">
      <section class="modal-card-body">
        <b-field class="has-text-centered">
          <p>Enter your email and we'll send a link to reset your password</p>
        </b-field>
        <b-field label="Email">
          <b-input type="email" placeholder="Your email" v-model="email" required></b-input>
        </b-field>
      </section>
      <footer class="modal-card-foot is-grouped-centered" id="auth-actions">
        <button
          type="button"
          v-on:click="showSignIn"
          formnovalidate
          :class="{isLoading: this.state.resetPending}"
          class="button is-fullwidth cancel-button-override"
        >Cancel</button>
        <button class="button is-fullwidth">Submit</button>
      </footer>
    </div>
  </form>
</template>


<script>
export default {
  data() {
    return {
      email: ''
    };
  },
  props: ['stateEmail', 'submit', 'state'],
  created() {
    this.email = this.stateEmail;
  },
  methods: {
    showSignIn() {
      this.$store.dispatch('setAuthEmail', this.email);
      this.$emit('authdropdownshow', 'signin');
    },
    submitReset() {
      this.submit({
        password_reset: {
          email: this.email
        }
      });
    }
  }
};
</script>
