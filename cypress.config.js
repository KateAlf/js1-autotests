const {defineConfig} = require("cypress");

module.exports = defineConfig({
    e2e: {
        setupNodeEvents(on, config) {
            return require('./cypress/plugins/index.js')(on, config)
        },
        excludeSpecPattern: '*.js',
        specPattern: 'cypress/e2e/**/*.{feature,features}',
        baseUrl: 'http://localhost:3000',
        baseApiUrl: 'https://26.javascript.pages.academy/kekstagram'
    },
});
