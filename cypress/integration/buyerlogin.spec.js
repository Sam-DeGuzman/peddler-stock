// userlogin.spec.js created with Cypress
//
// Start writing your Cypress tests below!
// If you're unfamiliar with how Cypress works,
// check out the link below and learn how to write your first test:
// https://on.cypress.io/writing-first-test



        
describe('Buyer Login Test', () => {  
    it('Visits the User Login Page', () => {
    cy.visit('http://localhost:5017/users/sign_in')
    })
    // have a look at cypress/app_commands/clean.rb
    
    it('Verifies Email and Password Inputs', () => {
        cy.appFactories([
            ['create', 'user',{role_id: 1}]
          ])
          cy.get('#user_email')
          .type('person1@example.com')
          .should('have.value', 'person1@example.com')
          
          cy.get('#user_password')
          .type('123456')
          .should('have.value', '123456')
      })

      it('Logs in the user to buyer index page', () => {
          cy.get('#login_btn').click()
          cy.wait(200)
          cy.url().should('include', '/buyers')
          cy.app('clean')
        })
  }) 
