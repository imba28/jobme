import config from '@/../config/app'
import auth from '@/auth'
import pluralize from 'pluralize'

export default function service(name, {
  format = 'json',
  data = {},
  method = 'GET',
  rawName = false
} = {}) {
  const namePlural = rawName ? name : pluralize(name)
  const requestOptions = {}
  requestOptions.method = method === 'GET' ? method : 'POST';
  requestOptions.headers = {}

  if (method !== 'GET') {
    const formData = new FormData();
    for (let key of Object.keys(data)) formData.append(key, data[key])
    requestOptions.body = formData
    formData.append('_method', method)
  }

  if (auth.isSignedIn()) {
    requestOptions.headers['Authorization'] = `Token ${auth.getAuthToken()}`
  }

  console.log(requestOptions)
  return new Promise((resolve, reject) => {
    fetch(`${config.api.host}/${namePlural}.${format}`, requestOptions)
      .then(response => response.json())
      .then(data => {
        resolve(data)
      })
      .catch(err => {
        reject(new Error(err))
      })
  })
}
