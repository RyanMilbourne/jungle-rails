describe("Jungle App - Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Adding a product to the cart should increment the cart quantity by 1", () => {
    // findout default cart value
    cy.get(".nav-item.end-0").contains("My Cart (0)");

    // add product to cart
    cy.get(".products article:first")
      .find("form.button_to")
      .find(".btn")
      .click({ force: true }); // had to add because the sticky navbar COVERS the button when Cypress navigates

    // findout default cart value
    cy.get(".nav-item.end-0").contains("My Cart (1)");
  });
});
