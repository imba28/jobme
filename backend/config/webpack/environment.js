const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')

const customConfig = {
    resolve: {
        alias: {
            jquery: 'jquery/src/jquery',
            vue: 'vue/dist/vue.js',
            vue_resource: 'vue-resource/dist/vue-resource',
        }
    }
}

environment.loaders.append('vue', vue)
environment.config.merge(customConfig)

module.exports = environment
