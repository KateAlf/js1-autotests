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

Given(/^выбираю изображение для загрузки$/, function () {
    // cy.fixture("image.jpg", {encoding: null}).as("myFixture");
    // cy.get("input[type=file]").selectFile("@myFixture");
    // cy.request("http://localhost:8888/assets/image.jpg").its("body").as("responseBody");
    // cy.get("input[type=file]").selectFile("@responseBody");
    cy.get("input#upload-file")
        .selectFile("cypress/fixtures/preview.jpg", {force: true})
        .then(($input) => {
            // const files = $input[0].files;
            // console.log("DEBUG", $input[0].files);
            // If the fileName is given, the MIME type will be inferred based on that.
            // expect(files[0].name).to.eq("file.png");
            // expect(files[0].type).to.eq("image/png");
        });
});

When(/^в поле "(.*)" ввожу текст "(.*)"$/, function (selector, text) {
    cy.get(".img-upload__wrapper")
        .find(selector)
        .type(text);
});

Then(/^форма успешно отправлена с комментарием "(.*)", эффектом "(.*)" и тэгами "(.*)"$/, function (comment, effect, hashtags) {
    cy.wait("@postData")
        .should(({request, response}) => {
            expect(request.method).to.eq("POST");
            console.log(request.headers);
            expect(request.headers["content-type"]).to.include("multipart/form-data;");
            expect(response.statusCode).to.eq(200);
            expect(response.body.description).to.eq(comment);
            expect(response.body.effect).to.eq(effect);
            expect(response.body.hashtags).to.eq(hashtags);
        });
});

When(/^нажимаю на кнопку "Опубликовать"$/, function () {
    cy.intercept("POST", "https://*.javascript.pages.academy/kekstagram").as("postData");
    cy.get(".img-upload__wrapper")
        .find(".img-upload__submit")
        .click();
});

Then(/^сообщение об ошибке отображается$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".pristine-error")
        .should("be.visible");
});
Then(/^отображается сообщение об ошибке или ограничение на ввод$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".pristine-error")
        .should("be.visible");
});
Then(/^сообщение об ошибке не отображается$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".pristine-error")
        .should("not.be.visible");
});

Then(/^появляется окно загрузки изображения$/, function () {
    cy.get(".img-upload__overlay").should("be.visible");
});

When(/^очищаю поле "(.*)"$/, function (selector) {
    cy.get(".img-upload__wrapper")
        .find(selector)
        .clear();
});

Then(/^выбран эффект "(.*)"$/, function (effect) {
    cy.get(".img-upload__wrapper")
        .find(`#effect-${effect}`)
        .should("be.checked");
});

Then(/^размер изображения (\d+%)$/, function (zoom) {
    cy.get(".img-upload__wrapper")
        .find(".scale__control--value")
        .should("have.value", zoom);
});
Then(/^поле "(.*)" содержит текст "(.*)"$/, function (selector, text) {
    cy.get(".img-upload__wrapper")
        .find(selector)
        .should("have.value", text);
});

When(/^форма успешно отправлена$/, function () {
    cy.wait("@postData")
        .should((xhr) => {
            expect(xhr.request.method).to.eq("POST");
            expect(xhr.response.statusCode).to.eq(200);
        });
});

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
When(/^открываем миниатюру номер (\d+)$/, function (nth) {
    cy.get("section.pictures")
        .find("a.picture")
        .eq(nth)
        .click();
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
Then(/^в элементе "(.*)" видим текст "(.*)"$/, function (selector, text) {
    cy.get(selector)
        .should("have.text", text);

});

Then(/^фильтр "(.*)" активен$/, function (filterName) {
    cy.contains(filterName).should("have.class", "img-filters__button--active");
});
When(/^переключаем на фильтр "(.*)"$/, function (filterName) {
    cy.contains(filterName).click();
});

Given(/^данные грузятся медленно$/, function () {
    // cy.intercept("GET", "https://*.javascript.pages.academy/kekstagram/data", {delay: 5})
    cy.intercept("GET", "https://*.javascript.pages.academy/kekstagram/data", (req) => {
        req.continue((res) => {
            console.log("DEBUG", res);
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

Then(/^превью выбранного изображения выбрано$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".img-upload__preview")
        .should("be.visible");
});
Then(/^к изображению применен стиль filter со значением "(.*)"$/, function (style) {
    // transform: scale(1); filter: sepia(1);
    cy.get(".img-upload__wrapper")
        .find(".img-upload__preview")
        .find("img")
        .should("have.css", "filter", style);
});
When(/^нажимаю на кнопку "минус"$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".scale__control--smaller")
        .click();
});
When(/^нажимаю на кнопку "плюс"$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".scale__control--bigger")
        .click();
});
When(/^выбираю эффект "(.*)"$/, function (effect) {
    cy.get(".img-upload__wrapper")
        .find(".effects__label")
        .find(`.effects__preview--${effect}`)
        .click();
});
When(/^отправляю форму$/, function () {
    cy.intercept("POST", "https://*.javascript.pages.academy/kekstagram").as("postData");
    cy.get(".img-upload__wrapper")
        .find(".img-upload__form")
        .submit();
});
Then(/^комментарий "(.*)" добавлен$/, function (comment) {
    cy.wait("@postData")
        .should((xhr) => {
            expect(xhr.request.method).to.eq("POST");
            expect(xhr.response.statusCode).to.eq(200);
            expect(xhr.response.body.description).to.eq(comment);
            expect(xhr.response.body.hashtags).to.eq("");
            expect(xhr.response.body.effect).to.eq("none");
        });
});


