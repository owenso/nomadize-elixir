import validateToken from '../utils/validateToken';

module.exports = function(router, store) {
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
};
;