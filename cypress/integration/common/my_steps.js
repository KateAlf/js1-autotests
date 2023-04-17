import {Given, Then, When} from "cypress-cucumber-preprocessor/steps";

Given("я нахожусь на главной странице сайта", () => {
    cy.visit("/");
});

When(/^загружаю данные с удалённого сервера$/, function () {
    cy.intercept("GET", "https://*.javascript.pages.academy/kekstagram/data").as("getData");
});

When(/^данные загружены$/, function () {
    cy.wait("@getData").its("response.statusCode").should("eql", 200);
});

When(/^кликаем по элементу "(.*)"$/, function (selector) {
    cy.get(selector)
        .scrollIntoView()
        .click();
});
When(/^нажимаем клавишу "(.*)"$/, function (key) {
    cy.get("body").type(`{${key}}`);
});

Then(/^элемент "(.*)" становится видимым$/, function (selector) {
    cy.get(selector).should("be.visible");
    // возможно понадобится изменить viewport с помощью cy.viewport(1280, 720)
});
Then(/^элемент "(.*)" становится невидимым$/, function (selector) {
    cy.get(selector).should("not.be.visible");
});

Given(/^элемент "(.*)" содержит класс "(.*)"$/, function (selector, cssClass) {
    cy.get(selector).should("have.class", cssClass);
});
Given(/^элемент "(.*)" не содержит класс "(.*)"$/, function (selector, cssClass) {
    cy.get(selector).should("not.have.class", cssClass);
});

Then(/^отображается сообщение с текстом "(.*)"$/, function (msg) {
    cy.contains(msg, {matchCase: false}).should("exist").should("be.visible");
});
