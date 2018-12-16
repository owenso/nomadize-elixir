import * as types from '../mutation-types';

const state = {
  authModal: null
};

const getters = {
  getAuthModalView(state) {
    return state.authModal;
  }
};

const actions = {
  setAuthModalView({ commit }, view) {
    commit(types.SET_AUTH_MODAL_VIEW, view);
  }
};

const mutations = {
  [types.SET_AUTH_MODAL_VIEW](state, view) {
    state.authModal = view;
  }
};

export default {
  state,
  getters,
  actions,
  mutations
};
