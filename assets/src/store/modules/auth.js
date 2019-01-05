import axios from 'axios';
import * as types from '../mutation-types';
// import router from '../../router';

const apiRoot = process.env.VUE_APP_API_ROOT;
// initial state
const state = {
  login: {
    loginPending: false,
    loginFailure: false,
    loginSuccess: false
  },
  signup: {
    signupPending: false,
    signupFailure: false,
    signupSuccess: false
  },
  creds: {
    email: ''
  },
  reset: {
    resetPending: false,
    resetFailure: false,
    resetSuccess: false,
    info: {}
  }
};

// getters
const getters = {
  getAuthEmail(state) {
    return state.creds.email;
  }
};

// actions
const actions = {
  login({ commit }, payload) {
    commit(types.LOGIN_PENDING);
    axios
      .post(`${apiRoot}/sessions`, payload)
      .then(response => {
        localStorage.setItem('ua', response.data.access_token);
        commit(types.LOGIN_SUCCESS);
        commit(types.SET_USER_INFO, response.data);
        // router.push('/main');
      })
      .catch(err => {
        commit(types.LOGIN_FAILURE, err);
      });
  },
  logout({ commit }) {
    localStorage.removeItem('ua');
    commit(types.LOGOUT);
    commit(types.CLEAR_USER_INFO);
    // router.push('/');
  },
  signup({ commit }, payload) {
    return new Promise((resolve, reject) => {
      commit(types.SIGNUP_PENDING);
      return axios
        .post(`${apiRoot}/signup`, payload)
        .then(response => {
          commit(types.SIGNUP_SUCCESS, response.data.email);
          resolve();
        })
        .catch(err => {
          commit(types.SIGNUP_FAILURE, err);
          console.log(err);
          reject(err);
        });
    });
  },
  setAuthEmail({ commit }, payload) {
    commit(types.SET_AUTH_EMAIL, payload);
  },
  sendReset({ commit }, payload) {
    return new Promise((resolve, reject) => {
      commit(types.RESET_PENDING);
      return axios
        .post(`${apiRoot}/password_resets`, payload)
        .then(response => {
          // commit(types.RESET_SUCCESS, response.data.info);
          resolve();
        })
        .catch(err => {
          commit(types.RESET_FAILURE, err);
          console.log(err);
          reject(err);
        });
    });
  }
};

// mutations
const mutations = {
  [types.LOGIN_PENDING](state) {
    state.login.loginPending = true;
    state.login.loginFailure = false;
    state.login.loginSuccess = false;
  },

  [types.LOGIN_FAILURE](state, error) {
    state.login.loginPending = false;
    state.login.loginFailure = error;
    state.login.loginSuccess = false;
  },

  [types.LOGIN_SUCCESS](state) {
    state.login.loginPending = false;
    state.login.loginFailure = false;
    state.login.loginSuccess = true;
  },

  [types.LOGOUT](state) {
    state.login.loginSuccess = false;
  },

  [types.SIGNUP_PENDING](state) {
    state.signup.signupPending = true;
    state.signup.signupFailure = false;
    state.signup.signupSuccess = false;
    state.signup.signupEmail = null;
  },

  [types.SIGNUP_FAILURE](state, error) {
    state.signup.signupPending = false;
    state.signup.signupFailure = error;
    state.signup.signupSuccess = false;
    state.signup.signupEmail = null;
  },

  [types.SIGNUP_SUCCESS](state, email) {
    state.signup.signupPending = false;
    state.signup.signupFailure = false;
    state.signup.signupSuccess = true;
    state.signup.signupEmail = email;
  },

  [types.SET_AUTH_EMAIL](state, email) {
    state.creds.email = email;
  },
  [types.RESET_PENDING](state) {
    state.reset.resetPending = true;
    state.reset.resetFailure = false;
    state.reset.resetSuccess = false;
  },

  [types.RESET_FAILURE](state, error) {
    state.reset.resetPending = false;
    state.reset.resetFailure = error;
    state.reset.resetSuccess = false;
  },

  [types.RESET_SUCCESS](state, info) {
    state.reset.resetInfo = info;
    state.reset.resetPending = false;
    state.reset.resetFailure = false;
    state.reset.resetSuccess = true;
  }
};

export default {
  state,
  getters,
  actions,
  mutations
};
