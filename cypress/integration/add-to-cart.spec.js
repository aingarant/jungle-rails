

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

describe('Add to cart', () => {
  // beforeEach(() => {
  //   // Cypress starts out with a blank slate for each test
  //   // so we must tell it to visit our website with the `cy.visit()` command.
  //   // Since we want to visit the same URL at the start of all our tests,
  //   // we include it in our beforeEach function so that it runs before each test
  //   cy.visit('http://localhost:3000')

  // })

  it("first, go to home page", () =>
  {
    cy.visit('/')
  })


  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });


  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Show current items in cart -- should by 0.", () => {
    cy.get(".end-0").should("contain.text", "My Cart (0)");
  });

  it("Add an item to cart, and show new items in cart (item should be 1)", () => {
    cy.get('.products').contains('Add').click({force: true});
    cy.get(".end-0").should("contain.text", "My Cart (1)");
  });
});
