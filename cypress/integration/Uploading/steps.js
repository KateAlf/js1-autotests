import {Then, When} from "cypress-cucumber-preprocessor/steps";

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


