describe('My Test', () => {
    it('GestForm', () => {
        cy.visit('http://localhost:8040/');
    });

    it('clique sur se connecter', () => {
        cy.get('h3').click();
    });

    it('remplis les informations de connexion', () => {
        cy.get('#username')
            .type('Valerian')
        cy.get('#password')
            .type('123456')
        cy.contains('Valider').click()
    });

});