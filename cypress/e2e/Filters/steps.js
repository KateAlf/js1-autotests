import {Given, Then, When} from "cypress-cucumber-preprocessor/steps";

Then(/^фильтр "([^"]*)" активен$/, function (filterName) {
    cy.contains(filterName).should("have.class", "img-filters__button--active");
});
When(/^переключаем на фильтр "([^"]*)"$/, function (filterName) {
    cy.contains(filterName).click();
});

Given(/^данные грузятся медленно$/, function () {
    // cy.intercept("GET", "https://*.javascript.pages.academy/kekstagram/data", {delay: 5})
    cy.intercept("GET", "https://*.javascript.pages.academy/kekstagram/data", (req) => {
        req.continue((res) => {
            console.log(res);
            return Cypress.Promise.delay(3000);
        });
    })
        .as("getData");
});

Then(/^блок фильтров не виден$/, function () {
    cy.get(".img-filters__form").should("not.be.visible");
});
Then(/^блок фильтров виден$/, function () {
    cy.get(".img-filters__form").should("be.visible");
});

