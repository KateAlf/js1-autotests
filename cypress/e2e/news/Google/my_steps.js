import {Before, Given, Then} from "cypress-cucumber-preprocessor/steps"

Given(/^test one$/, function () {
    alert('test one')
});
Given(/^I kinda open Google page$/, function () {
    alert('I kinda open Google page')
});
Then(`I see {string} in the title`, title => {
    cy.title().should("include", title);
});

Before(() => {
    cy.log('e2e/news/google > before')
});
