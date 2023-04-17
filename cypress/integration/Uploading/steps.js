import {Given, Then, When} from "cypress-cucumber-preprocessor/steps";

Given(/^загружаю изображение$/, function () {
    // cy.get(".img-upload__control").click();
    // cy.wait(5000)
    cy.get("input#upload-file")
        .selectFile("cypress/fixtures/preview.jpg", {force: true})
        .then(($input) => {
            const files = $input[0].files;
            // console.log("DEBUG", $input[0].files);
            // If the fileName is given, the MIME type will be inferred based on that.
            // expect(files[0].name).to.eq("file.png");
            // expect(files[0].type).to.eq("image/png");
        });
});

// cy.fixture('file.json', { encoding: null }).as('myFixture')
// cy.get('input[type=file]').selectFile('@myFixture')
//
// cy.request('http://localhost:8888/users/827').its('body').as('responseBody')
// cy.get('input[type=file]').selectFile('@responseBody')
Then(/^появляется окно загрузки изображения$/, function () {
    cy.get(".img-upload__overlay").should("be.visible");
});
Then(/^превью выбранного изображения выбрано$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".img-upload__preview")
        .should("be.visible");
});
Then(/^выбран эффект "(.*)"$/, function (effect) {
    cy.get(".img-upload__wrapper")
        .find(`#effect-${effect}`)
        .should("be.checked");
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
Then(/^размер изображения (\d+\%)$/, function (zoom) {
    cy.get(".img-upload__wrapper")
        .find(".scale__control--value")
        .should("have.value", zoom);
});
When(/^выбираю эффект "(.*)"$/, function (effect) {
    cy.get(".img-upload__wrapper")
        .find(".effects__label")
        .find(`.effects__preview--${effect}`)
        .click();
});
When(/^очищаю поле "(.*)"$/, function (selector) {
    cy.get(".img-upload__wrapper")
        .find(selector)
        .clear();
});
When(/^в поле "(.*)" ввожу текст "(.*)"$/, function (selector, text) {
    cy.get(".img-upload__wrapper")
        .find(selector)
        .type(text);
});
Then(/^поле "(.*)" содержит текст "(.*)"$/, function (selector, text) {
    cy.get(".img-upload__wrapper")
        .find(selector)
        .should("have.value", text);
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

Then(/^форма успешно отправлена с комментарием "(.*)", эффектом "(.*)" и тэгами "(.*)"$/, function (comment, effect, hashtags) {
    cy.wait("@postData")
        .should((xhr) => {
            expect(xhr.request.method).to.eq("POST");
            expect(xhr.response.statusCode).to.eq(200);
            expect(xhr.response.body.description).to.eq(comment);
            expect(xhr.response.body.effect).to.eq(effect);
            expect(xhr.response.body.hashtags).to.eq(hashtags);
        });
});

Then(/^сообщение об ошибке отображается$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".pristine-error")
        .should("be.visible");
});
Then(/^сообщение об ошибке не отображается$/, function () {
    cy.get(".img-upload__wrapper")
        .find(".pristine-error")
        .should("not.be.visible");
});
