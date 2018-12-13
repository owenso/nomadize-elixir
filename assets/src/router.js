import Vue from 'vue';
import Router from 'vue-router';
import Landing from './views/Landing.vue';
import Main from './views/Main.vue';

import validateToken from '../utils/validateToken';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/main',
      name: 'main',
      component: Main,
      meta: { auth: true }
      // children: [
      //   {
      //     name: 'dashboard',
      //     path: '/',
      //     component: Dashboard,
      //   },
      //   {
      //     name: 'portfolioInfo',
      //     path: 'portfolio/:portfolioId',
      //     component: ProfileInfo,
      //     props: true,
      //   },
      // ],
    },
    {
      path: '/',
      name: 'landing',
      component: Landing,
      beforeEnter: (to, from, next) => {
        validateToken()
          .then(() => {
            next('/main');
          })
          .catch(() => {
            next();
          });
      }
    },
    { path: '*', redirect: '/' }

    // {
    //   path: '/about',
    //   name: 'about',
    //   // route level code-splitting
    //   // this generates a separate chunk (about.[hash].js) for this route
    //   // which is lazy-loaded when the route is visited.
    //   component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
    // }
  ]
});
