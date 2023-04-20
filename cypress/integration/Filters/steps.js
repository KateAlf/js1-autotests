import {Then, When} from "cypress-cucumber-preprocessor/steps";

Then(/^фильтр "(.*)" активен$/, function (filterName) {
    cy.contains(filterName).should("have.class", "img-filters__button--active");
});
When(/^переключаем на фильтр "(.*)"$/, function (filterName) {
    cy.contains(filterName).click();
});

Then(/^блок фильтров не виден$/, function () {
    cy.get(".img-filters__form").should("not.be.visible");
});
Then(/^блок фильтров виден$/, function () {
    cy.get(".img-filters__form").should("be.visible");
});

