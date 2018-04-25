import config from '@/../config/app'
import pluralize from 'pluralize'

export default function service(name, {format = 'json', data = {}, method = 'GET'} = {}) {
    const namePlural = pluralize(name)
    const requestOptions = {}
    requestOptions.method = method;

    if (method !== 'GET') {
        const formData = new FormData();
        for (let key of Object.keys(data)) formData.append(key, data[key])
        requestOptions.body = formData
    }

    console.log("fetch", method, requestOptions)

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
