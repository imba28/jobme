import config from '@/../config/app'
import pluralize from 'pluralize'

export default function service(name, {format = 'json'} = {}) {
    const namePlural = pluralize(name)

    return new Promise((resolve, reject) => {
        fetch(`${config.api.host}/${namePlural}.${format}`)
        .then(response => response.json())
        .then(data => {
            resolve(data)
        })
        .catch(err => {
            reject(new Error(err))
        })
    })
}
