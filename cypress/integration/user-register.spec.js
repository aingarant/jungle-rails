

/// <reference types="cypress" />

// Welcome to Cypress!
//
// This spec file contains a variety of sample tests
// for a todo list app that are designed to demonstrate
// the power of writing tests in Cypress.
//
// To learn more about how Cypress works and
// what makes it such an awesome testing tool,
// please read our getting started guide:
// https://on.cypress.io/introduction-to-cypress

describe('User Login', () => {
  // beforeEach(() => {
  //   // Cypress starts out with a blank slate for each test
  //   // so we must tell it to visit our website with the `cy.visit()` command.
  //   // Since we want to visit the same URL at the start of all our tests,
  //   // we include it in our beforeEach function so that it runs before each test
  //   cy.visit('http://localhost:3000')

  // })

  it("Visit Home page", () =>{
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });


  it("Show Login nav link", () => {
    cy.get(".nav-link").should("contain.text", "Login");
  });

  it("Click on Login link and show login form", () => {
    cy.get('.login-link').click({force:true})
    cy.get('#email').type('aingarant@gmail.com')
    cy.get('#password').type('aingaran')
    cy.contains('Submit').click({force: true})
    
  });


  it("Show user is logged in.", () => {

    cy.get(".current_user").should("contain.text", "Welcome,");
  });

  })
