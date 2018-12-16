<template>
  <div class="container has-text-centered">
    <div id="landing" textAlign="center">
      <h1 id="landing-header" class="title">Untitled Project</h1>
      <h2 class="subtitle">Something something something something. Witty. <br />Just select a departure city or click "Find Me" to let us try to figure out where you are.</h2>
      <div id="landing-searchbar" aligned="center">
        <google-autocomplete v-on:searchcomplete="geolocateComplete" ref="googleAutocomplete"></google-autocomplete>
      </div>
      <div class="buttons is-centered" id="landing-actions">
        <a
          class="button is-medium"
          v-on:click="geolocate"
          v-bind:class="{ 'is-loading': geoLoading}"
        >
          <span class="icon-button">
            <map-search-icon/>
          </span>
          <span>Find Me</span>
        </a>
        <a class="button is-medium" v-bind:disabled="startLocationEmpty">
          <span class="icon-button">
            <earth-icon/>
          </span>
          <span>Lets Go</span>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import GoogleAutocomplete from '@/components/GoogleAutocomplete.vue';
import EarthIcon from 'vue-material-design-icons/Earth.vue';
import MapSearchIcon from 'vue-material-design-icons/MapSearch.vue';

export default {
  name: 'landing',
  data: function() {
    return {
      geoLoading: false,
      nextDisabled: true
    };
  },
  components: {
    GoogleAutocomplete,
    MapSearchIcon,
    EarthIcon
  },
  computed: {
    startLocationEmpty() {
      return this.$store.getters.noStartingLocation;
    }
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
#landing {
  h1 {
    font-size: 10vh;
  }
  .title {
    color: $text-icons;
  }
  .subtitle {
    color: $light-primary;
  }
  #landing-searchbar {
    width: 75%;
    margin: 0 auto 1em;
    padding: 0;
  }

  #landing-actions {
    .button {
      background-color: $accent-color;
      color: $text-icons;
      border: none;

      .icon-button {
        padding-right: 5px;
      }
    }
  }
}
</style>
