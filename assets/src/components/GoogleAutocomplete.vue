<template>
  <div id="google-autocomplete">
    <vue-google-autocomplete
      ref="address"
      id="map"
      v-on:error="handleError"
      v-on:placechanged="getAddressData"
      v-on:no-results-found="foundNada"
      placeholder="Where are you starting from?"
      v-bind:enable-geolocation="true"
      types="(cities)"
    ></vue-google-autocomplete>
  </div>
</template>

<script>
import VueGoogleAutocomplete from 'vue-google-autocomplete';

export default {
  components: { VueGoogleAutocomplete },

  data: function() {
    return {
      address: '',
      selected: false
    };
  },

  mounted() {
    // To demonstrate functionality of exposed component functions
    // Here we make focus on the user input
    this.$refs.address.focus();
  },
  methods: {
    /**
     * When the location found
     * @param {Object} addressData Data of the found location
     * @param {Object} placeResultData PlaceResult object
     * @param {String} id Input container ID
     */
    getAddressData: function(addressData, placeResultData, id) {
      this.$emit('searchcomplete');
      this.$store.dispatch('saveStartingLocation', addressData);

      this.address = addressData;
    },
    foundNada: function(input) {
      console.log(input.name);
      this.$swal('Error', 'City not found. Try a nearby major city.', 'error');
    },
    geolocate: function() {
      this.$refs.address.geolocate();
    },
    handleError: function(x) {
      this.$emit('searchcomplete');
    }
  }
};
</script>

<style lang="scss">
#google-autocomplete {
  input {
    font-size: 1.5em;
    padding: 10px 15px;
    -webkit-box-shadow: none;
    box-shadow: none;
    border: 1px solid $accent-color;
    width: 100%;
    outline: none;
    // background-color: #;
    &:focus {
      background-color: $light-primary;
    }
  }
}
</style>
