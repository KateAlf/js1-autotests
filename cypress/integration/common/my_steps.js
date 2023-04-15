import {Given, When} from "cypress-cucumber-preprocessor/steps";

Given("я нахожусь на главной странице сайта", () => {
    cy.visit("/");
});

When(/^загружаю данные с удалённого сервера$/, function () {
    cy.intercept("GET", "https://*.javascript.pages.academy/kekstagram/data").as("getData");
});

When(/^данные загружены$/, function () {
    cy.wait("@getData").its("response.statusCode").should("eql", 200);
});
