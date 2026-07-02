# Sprint Backlog - Cosmetics CRUD System

## Sprint Goal

Develop a functional CRUD system for managing cosmetic products, allowing administrators to create, read, update, and delete product information efficiently.

---

## User Story 1: Create Cosmetic Products

### Tasks
- Design the product registration form.
- Create the cosmetic products database table.
- Implement the "Create" functionality.
- Validate required fields.
- Test the product registration process.

### Impediments
- Missing database connection.
- Invalid user input.
- Required fields left empty.

### Dependencies
- Database must be created.
- Database connection must be established.
- Registration form must be completed before testing.

### Definition of Done (DoD)
- The product is successfully saved in the database.
- Required fields are validated.
- A success message is displayed.
- The feature passes all tests.

---

## User Story 2: Read Cosmetic Products

### Tasks
- Create the product list interface.
- Connect the application to the database.
- Display all cosmetic products.
- Test the product list.

### Impediments
- Database connection errors.
- No products stored in the database.
- Data retrieval failures.

### Dependencies
- Database connection must be available.
- Cosmetic products must exist in the database.

### Definition of Done (DoD)
- The system displays all cosmetic products.
- Product information is accurate.
- No display errors occur.
- The feature passes all tests.

---

## User Story 3: Update Cosmetic Products

### Tasks
- Create the update form.
- Implement the "Update" function.
- Validate edited information.
- Test the update process.

### Impediments
- Product ID not found.
- Database update errors.
- Invalid input data.

### Dependencies
- The product must already exist.
- Database connection must be active.

### Definition of Done (DoD)
- Product information is updated successfully.
- Changes are saved in the database.
- A success message is displayed.
- The feature passes all tests.

---

## User Story 4: Delete Cosmetic Products

### Tasks
- Create the delete option.
- Implement the "Delete" function.
- Confirm product deletion.
- Test the deletion process.

### Impediments
- Product ID not found.
- Database deletion errors.
- User cancels the deletion.

### Dependencies
- The product must exist.
- Database connection must be active.

### Definition of Done (DoD)
- The product is deleted successfully.
- The product no longer appears in the list.
- A confirmation message is displayed.
- The feature passes all tests.
