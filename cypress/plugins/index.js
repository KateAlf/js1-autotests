const cucumber = require('cypress-cucumber-preprocessor').default

module.exports = (on, config) => {
    console.info(config);
    on('file:preprocessor', cucumber())
}
