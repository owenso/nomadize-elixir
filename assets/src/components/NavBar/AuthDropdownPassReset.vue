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
      <footer class="modal-card-foot is-grouped-centered" id="sign-in-actions">
        <button
          type="button"
          v-on:click="showSignUp"
          formnovalidate
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
  props: ['stateEmail'],
  created() {
    this.email = this.stateEmail;
  },
  methods: {
    showSignUp() {
      this.$store.dispatch('setAuthEmail', this.email);
      this.$emit('authdropdownshow', 'signin');
    },
    submitReset() {
      const email = this.email;
      console.log(email);
      this.$store.dispatch('sendReset', email);
    }
  }
};
</script>