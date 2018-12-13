<template>
  <div class='uk-card uk-card-body uk-card-default'>
    <!-- <div class="uk-grid-small" uk-grid> -->
        <h2 class='uk-card-title'>Email Sent</h2>
        <div class="uk-card-body uk-text-center">
            <span uk-icon="icon: mail; ratio: 3.5"></span>
            <p>Okay, we've sent an email to {{ signupEmail }}. Please open it and click the link to confirm.</p>
        </div>
    <!-- </div> -->
  </div>
</template>

<script>

export default {
  data() {
    return {
    };
  },
  methods: {
  },
  computed: {
    signupEmail() {
      return this.$store.state.auth.signupEmail;
    },
  },
};
</script>
