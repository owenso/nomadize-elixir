<template>
  <div is="sui-container" class="landing" textAlign="center">
    <h1 id="landing-header">Untitled Project</h1>
    <sui-segment id="landing-searchbar" aligned="center">
      <google-autocomplete v-on:searchcomplete="geolocateComplete" ref="googleAutocomplete"></google-autocomplete>
    </sui-segment>
    <div id="landing-actions">
      <sui-grid :columns="2">
        <sui-grid-row stretched>
          <sui-grid-column>
            <sui-button
              v-on:click="geolocate"
              v-bind:loading="geoLoading"
              class="landing-buttons"
              icon="globe"
            >Find Me</sui-button>
          </sui-grid-column>
          <sui-grid-column>
            <sui-button class="landing-buttons" icon="paper plane">Lets Go</sui-button>
          </sui-grid-column>
        </sui-grid-row>
      </sui-grid>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import GoogleAutocomplete from '@/components/GoogleAutocomplete.vue';

export default {
  name: 'landing',
  data: function() {
    return {
      geoLoading: false
    };
  },
  components: {
    GoogleAutocomplete
  },
  methods: {
    geolocate() {
      this.geoLoading = true;
      this.$refs.googleAutocomplete.geolocate();
    },
    geolocateComplete() {
      this.geoLoading = false;
    }
  }
};
</script>

<style lang="scss">
#landing-header {
  color: $text-icons;
  font-size: 5em;
  padding-top: 2.5em;
  margin-bottom: 0.75em;
  font-family: Arial, sans-serif;
}

#landing-searchbar {
  width: 75%;
  margin: 0 auto 1.5em;
  padding: 0;
}

.landing {
  height: 100%;
}

#landing-actions {
  margin: 0 auto;
  width: 50%;

  .landing-buttons {
    background-color: $accent-color;
    color: $text-icons;
  }
}
</style>
