import Vue from 'vue';
import SuiVue from 'semantic-ui-vue';
// import Autocomplete from 'v-autocomplete';
import swal from 'sweetalert';

import App from './App.vue';
import router from './router';
import store from './store';
import axiosConfig from '../config/axiosConfig';
import routerConfig from '../config/routerConfig';

import 'semantic-ui-css/semantic.min.css';
import 'v-autocomplete/dist/v-autocomplete.css';

axiosConfig();
routerConfig(router, store);

Object.defineProperty(Vue.prototype, '$swal', { value: swal });

Vue.config.productionTip = false;
Vue.use(SuiVue);
// Vue.use(Autocomplete);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
