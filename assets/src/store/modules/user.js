import * as types from '../mutation-types';
import router from '../../router';
import axios from 'axios';
const apiRoot = process.env.API_ROOT;

const state = {
  info: {},
  startingLocation: {}
};

const getters = {
  getStartingLocation(state) {
    return state.startingLocation;
  },
  noStartingLocation(state) {
    return Object.keys(state.startingLocation).length === 0;
  }
};
const actions = {
  setUserInfo({ commit }, info) {
    commit(types.SET_USER_INFO, info);
  },
  clearUserInfo({ commit }) {
    commit(types.CLEAR_USER_INFO);
  },
  getUserInfo({ commit }) {
    commit(types.GET_USER_PENDING);
    axios
      .get(`${apiRoot}/user`)
      .then(response => {
        localStorage.setItem('ua', response.data.token);
        commit(types.GET_USER_SUCCESS);
        commit(types.SET_USER_INFO, response.data);
        router.push('/main');
      })
      .catch(err => {
        commit(types.GET_USER_FAILURE, err);
      });
  },
  saveStartingLocation({ commit }, locObject) {
    commit(types.SET_STARTING_LOCATION, locObject);
  }
};
const mutations = {
  [types.SET_STARTING_LOCATION](state, locObject) {
    state.startingLocation = locObject;
  }
};

export default {
  //   namespaced: true,
  state,
  getters,
  actions,
  mutations
};
