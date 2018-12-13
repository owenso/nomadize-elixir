import axios from 'axios';

export default function() {
  axios.interceptors.request.use(config => {
    const token = window.localStorage.getItem('ua');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  });
}
