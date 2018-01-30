import auth from '@/auth'

export default {
    fetch(foo, method = 'GET', params = {}) {
        return new Promise((resolve, reject) => {
            if (method == 'PUT' || method == 'PATCH') {
                params['_method'] = method
                method = 'POST'
            }

            const headers = {
                'Accept': 'application/json'
            }
            if (auth.isSignedIn()) headers['Authorization'] = `Token ${auth.getAuthToken()}`

            const options = {
                method,
                headers,
            }

            if(method != "GET") {
                const formData = new FormData();
                for (let key in params) formData.append(key, params[key])

                options.body = formData
            }

            fetch(foo, options)
            .then(response => response.json())
            .then(data => {
                if (!data.error) resolve(data)
                else reject(data)
            })
            .catch(err => reject(err))
        })
    }
}
