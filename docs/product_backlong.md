# Product Backlog - Cosmetics CRUD System

## Epic 1: Create Cosmetic Products

### User Story 1

**As** a system administrator,

**I want** to register a new cosmetic product,

**So that** I can keep the inventory up to date.

### Acceptance Criteria (Gherkin)

#### Successful Scenario

```gherkin
Feature: Create a Cosmetic Product

Scenario: Successful product registration

Given the administrator is on the product registration form
When the administrator enters a valid product name, category, brand, price, stock, and expiration date and clicks the "Save" button
Then the system stores the cosmetic product in the database
And displays the message "Product registered successfully"
```

#### Unsuccessful Scenario

```gherkin
Feature: Create a Cosmetic Product

Scenario: Registration fails because required fields are empty

Given the administrator is on the product registration form
When one or more required fields are left empty and the administrator clicks the "Save" button
Then the system does not save the cosmetic product
And displays the message "Please complete all required fields"
```

---

## Epic 2: Read Cosmetic Products

### User Story 2

**As** a system administrator,

**I want** to view the list of cosmetic products,

**So that** I can review all registered products.

### Acceptance Criteria (Gherkin)

#### Successful Scenario

```gherkin
Feature: Read Cosmetic Products

Scenario: Display all registered cosmetic products

Given cosmetic products are stored in the database
When the administrator opens the product list
Then the system displays all registered cosmetic products
```

#### Unsuccessful Scenario

```gherkin
Feature: Read Cosmetic Products

Scenario: No cosmetic products found

Given there are no cosmetic products stored in the database
When the administrator opens the product list
Then the system displays an empty list
And displays the message "No products found"
```

---

## Epic 3: Update Cosmetic Products

### User Story 3

**As** a system administrator,

**I want** to update the information of a cosmetic product,

**So that** I can keep the inventory accurate.

### Acceptance Criteria (Gherkin)

#### Successful Scenario

```gherkin
Feature: Update a Cosmetic Product

Scenario: Successful product update

Given the cosmetic product already exists in the database
When the administrator updates the product information and clicks the "Update" button
Then the system saves the updated information
And displays the message "Product updated successfully"
```

#### Unsuccessful Scenario

```gherkin
Feature: Update a Cosmetic Product

Scenario: Update fails because the product does not exist

Given the administrator searches for a cosmetic product using an ID that does not exist
When the administrator clicks the "Update" button
Then the system does not update any information
And displays the message "Product not found"
```

---

## Epic 4: Delete Cosmetic Products

### User Story 4

**As** a system administrator,

**I want** to delete a cosmetic product,

**So that** I can remove discontinued products from the inventory.

### Acceptance Criteria (Gherkin)

#### Successful Scenario

```gherkin
Feature: Delete a Cosmetic Product

Scenario: Successful product deletion

Given the cosmetic product exists in the database
When the administrator selects the product and clicks the "Delete" button
Then the system removes the cosmetic product from the database
And displays the message "Product deleted successfully"
```

#### Unsuccessful Scenario

```gherkin
Feature: Delete a Cosmetic Product

Scenario: Deletion fails because the product does not exist

Given the administrator enters a product ID that does not exist
When the administrator clicks the "Delete" button
Then the system does not delete any product
And displays the message "Product not found"
```
