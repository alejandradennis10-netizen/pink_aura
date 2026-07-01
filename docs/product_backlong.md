# Product Backlog - Cosmetics CRUD System

## Epic 1: Create Cosmetic Products

### User Story 1

**As** a system administrator,

**I want** to register a new cosmetic product,

**So that** I can keep the inventory up to date.

### Acceptance Criteria

- The product name is required.
- The category, brand, price, stock, and expiration date must be entered.
- The system must save the product in the database.
- A confirmation message must be displayed after a successful registration.

#### Successful Scenario

```gherkin
Feature: Create a Cosmetic Product

Scenario: Successful product registration

Given the administrator is on the product registration form
When the administrator enters valid product information and clicks the "Save" button
Then the system stores the cosmetic product in the database
And displays the message "Product registered successfully"
```

#### Unsuccessful Scenario

```gherkin
Feature: Create a Cosmetic Product

Scenario: Registration fails because required fields are empty

Given the administrator is on the product registration form
When one or more required fields are left empty and the administrator clicks the "Save" button
Then the system does not save the product
And displays the message "Please complete all required fields"
```

---

## Epic 2: Read Cosmetic Products

### User Story 2

**As** a system administrator,

**I want** to view the list of cosmetic products,

**So that** I can review the registered products.

### Acceptance Criteria

- The system must display all registered cosmetic products.
- Each product must show its basic information.
- If there are no registered products, the system must notify the administrator.

#### Successful Scenario

```gherkin
Feature: Read Cosmetic Products

Scenario: Successfully display the product list

Given cosmetic products are stored in the database
When the administrator opens the product list
Then the system displays all registered cosmetic products
```

#### Unsuccessful Scenario

```gherkin
Feature: Read Cosmetic Products

Scenario: No products available

Given there are no cosmetic products stored in the database
When the administrator opens the product list
Then the system displays an empty list
And displays the message "No products found"
```

---

## Epic 3: Update Cosmetic Products

### User Story 3

**As** a system administrator,

**I want** to update cosmetic product information,

**So that** I can keep the inventory accurate.

### Acceptance Criteria

- The administrator must be able to edit an existing product.
- The updated information must be saved correctly.
- The system must display a confirmation message after the update.

#### Successful Scenario

```gherkin
Feature: Update a Cosmetic Product

Scenario: Successful product update

Given the cosmetic product already exists
When the administrator updates the product information and clicks the "Update" button
Then the system saves the new information
And displays the message "Product updated successfully"
```

#### Unsuccessful Scenario

```gherkin
Feature: Update a Cosmetic Product

Scenario: Product not found

Given the administrator searches for a product ID that does not exist
When the administrator attempts to update the product
Then the system does not update any information
And displays the message "Product not found"
```

---

## Epic 4: Delete Cosmetic Products

### User Story 4

**As** a system administrator,

**I want** to delete cosmetic products,

**So that** discontinued products are removed from the inventory.

### Acceptance Criteria

- The administrator must be able to delete an existing product.
- The system must remove the selected product from the database.
- The system must display a confirmation message after deletion.

#### Successful Scenario

```gherkin
Feature: Delete a Cosmetic Product

Scenario: Successful product deletion

Given the cosmetic product exists in the database
When the administrator selects the product and clicks the "Delete" button
Then the system deletes the product
And displays the message "Product deleted successfully"
```

#### Unsuccessful Scenario

```gherkin
Feature: Delete a Cosmetic Product

Scenario: Product not found

Given the administrator enters a product ID that does not exist
When the administrator clicks the "Delete" button
Then the system does not delete any product
And displays the message "Product not found"
```
