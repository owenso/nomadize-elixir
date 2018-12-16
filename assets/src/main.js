import Vue from 'vue';
// import SuiVue from 'semantic-ui-vue';
import swal from 'sweetalert';
import Buefy from 'buefy';

import router from './router';
import store from './store';
import axiosConfig from '../config/axiosConfig';
import validateToken from '../utils/validateToken';

import App from './App.vue';

import 'vue-material-design-icons/styles.css';

axiosConfig();

Object.defineProperty(Vue.prototype, '$swal', { value: swal });

Vue.config.productionTip = false;
Vue.use(Buefy);
// Vue.use(SuiVue);

router.beforeEach((to, from, next) => {
  const authRequired = to.matched.some(route => route.meta.auth);
  if (!authRequired) {
    next();
  } else {
    validateToken()
      .then(data => {
        // when token is validated, set any user data that may have been cleared from the store
        store.commit('SET_USER_INFO', data);
        next();
      })
      .catch(() => {
        next('/');
      });
  }
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
