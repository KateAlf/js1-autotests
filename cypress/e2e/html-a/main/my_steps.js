import {Before} from "cypress-cucumber-preprocessor/steps"
Before(() => {
    const baseApiUrl = Cypress.config('baseApiUrl');

    cy.request('GET', `${baseApiUrl}/data`);
})

Given("I am on empty home page", () => {
    cy.visit("/");
});

When("I type in {string} and submit", (boardName) => {
    cy.get("[data-cy=first-board]").type(`${boardName}{enter}`);
});

When("Create a list with the name {string}", (listName) => {
    cy.get('[data-cy="add-list-input"]').type(`${listName}{enter}`);
});

Then("I should be redirected to the board detail", () => {
    cy.location("pathname").should('match', /\/board\/\d/);
});
