import {Given, Then, When} from "cypress-cucumber-preprocessor/steps";

Given("я нахожусь на главной странице сайта", () => {
    cy.visit("/");
});
Then(/^ни одно изображение не загружено$/, function () {
    cy.get("section.pictures")
        .find("a.picture")
        .should("have.length", 0);
});

Then(/^загружаются все изображения от других пользователей$/, function () {
    cy.wait("@getData").its("response.statusCode").should("eql", 200);
    cy.get("section.pictures")
        .find("a.picture")
        .should("have.length", 25);
});
Given(/^при загрузке данных с сервера получаем ошибку$/, function () {
    cy.intercept("GET", "https://*.javascript.pages.academy/kekstagram/data", {statusCode: 500}).as("getDataError");
});
Then(/^вижу сообщение об ошибке "([^"]*)"$/, function (msg) {
    cy.contains(msg, {matchCase: false}).should("exist");
});
When(/^открываем миниатюру номер (\d+)$/, function (nth) {
    cy.get("section.pictures")
        .find("a.picture")
        .eq(nth)
        .click();
});
Then(/^элемент "(.*)" становится видимым$/, function (selector) {
    cy.get(selector).should("be.visible");
    // возможно понадобится изменить viewport с помощью cy.viewport(1280, 720)
});
Then(/^элемент "(.*)" становится невидимым$/, function (selector) {
    cy.get(selector).should("not.be.visible");
});
Given(/^элемент "([^"]*)" содержит класс "(.*)"$/, function (selector, cssClass) {
    cy.get(selector).should("have.class", cssClass);
});
Given(/^элемент "([^"]*)" не содержит класс "(.*)"$/, function (selector, cssClass) {
    cy.get(selector).should("not.have.class", cssClass);
});
Then(/^большое изображение показывает "(.*)"$/, function (imgUrl) {
    cy.get(".big-picture__img")
        .find("img")
        .should("have.attr", "src")
        .and("eql", imgUrl);
});
Then(/^количество лайков (\d+)$/, function (likesCount) {
    cy.get(".big-picture")
        .find(".likes-count")
        .should("have.text", likesCount);
});
Then(/^показано (\d+) из (\d+) комментариев$/, function (commentsCountVisible, commentsCountAll) {
    cy.get(".big-picture")
        .find(".social__comment-count")
        .should("have.text", `${commentsCountVisible} из ${commentsCountAll} комментариев`);

    cy.get(".big-picture")
        .find(".social__comments")
        .scrollIntoView()
        .find(".social__comment:visible")
        .should("have.length", commentsCountVisible);
});
Then(/^показано (\d+) комментариев$/, function (commentsCount) {
    cy.get(".big-picture")
        .find(".social__comments")
        .scrollIntoView()
        .find(".social__comment:visible")
        .should("have.length", commentsCount);
});
When(/^кликаем по элементу "(.*)"$/, function (selector) {
    cy.get(".big-picture")
        .find(selector)
        .scrollIntoView()
        .click();
});
When(/^нажимаем клавишу "([^"]*)"$/, function (key) {
    cy.get("body").type(`{${key}}`);
});
Then(/^в элементе "(.*)" видим текст "(.*)"$/, function (selector, text) {
    cy.get(selector)
        .should("have.text", text);

});
