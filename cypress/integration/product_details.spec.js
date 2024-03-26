describe("Jungle App - Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should navigate to and display the product detail page for the first product", () => {
    cy.get(".products article:first").click();
    cy.get(".products-show article.product-detail").should("exist");
  });

  it("should navigate to and display the product detail page for the last product", () => {
    cy.get(".products article:last").click();
    cy.get(".products-show article.product-detail").should("exist");
  });
});
