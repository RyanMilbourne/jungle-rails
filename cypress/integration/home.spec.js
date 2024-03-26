describe("Jungle App - Homepage", () => {
  it("opens the homepage", () => {
    cy.visit("/");
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
