import Vue from 'vue';
import Vuex from 'vuex';
import user from './modules/user';
import view from './modules/view';
import auth from './modules/auth';

import createLogger from 'vuex/dist/logger';

Vue.use(Vuex);

const debug = process.env.NODE_ENV !== 'production';

export default new Vuex.Store({
  modules: { user, view, auth },
  strict: debug,
  plugins: debug ? [createLogger()] : []
});
