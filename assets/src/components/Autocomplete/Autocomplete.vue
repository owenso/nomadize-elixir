<template>
  <v-autocomplete
    :items="items"
    v-model="item"
    :get-label="getLabel"
    :component-item="template"
    @update-items="updateItems"
  ></v-autocomplete>
</template>

<script>
import ItemTemplate from './ItemTemplate.vue';
export default {
  data() {
    return {
      item: {
        id: 9,
        name: 'Lion',
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
      },
      items: [],
      template: ItemTemplate
    };
  },
  methods: {
    onSelect(item) {
      console.log('item selected');
      this.currentItem = item;
    },
    getLabel(item) {
      return item.name ? `${item.id} - ${item.name}` : '';
    },
    updateItems(text) {
      // yourGetItemsMethod(text).then(response => {
      //   this.items = response;
      // });
      console.log(text);
    }
  }
};
</script>

<style lang="scss">
.v-autocomplete .v-autocomplete-input-group .v-autocomplete-input {
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
</style>
