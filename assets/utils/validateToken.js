import axios from 'axios';

const apiRoot = process.env.API_ROOT;

export default function() {
  const token = localStorage.getItem('ua');
  return new Promise((resolve, reject) => {
    if (!token) {
      reject();
    } else {
      axios
        .get(`${apiRoot}/auth/validate`)
        .then(response => {
          resolve(response.data);
        })
        .catch(() => {
          localStorage.removeItem('ua');
          reject();
        });
    }
  });
}
