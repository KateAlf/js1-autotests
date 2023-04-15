When(/^нажимаю на кнопку загрузить$/, function () {
    // cy.get(".img-upload__control").click();
    // cy.wait(5000)
    cy.get('input#upload-file').selectFile('cypress/fixtures/preview.jpg')
});

// cy.get('#upload')
//     .selectFile('cypress/fixtures/logo.png')
