# Product Backlog - Cosmetics Management System

## Epic 1: Cosmetic Registration

### User Story 1

**As** a system administrator,

**I want** to register a new cosmetic product,

**So that** I can keep the inventory up to date.

### Acceptance Criteria

#### Successful Scenario

```gherkin
Feature: Register a Cosmetic Product

Scenario: Successful registration

Given the administrator is on the product registration form
When the administrator enters the product name, category, brand, price, stock, and expiration date correctly and clicks the "Save" button
Then the system saves the cosmetic product in the database
And displays the message "Product registered successfully"
```

#### Unsuccessful Scenario

```gherkin
Feature: Register a Cosmetic Product

Scenario: Registration fails due to missing required fields

Given the administrator is on the product registration form
When one or more required fields are left empty and the administrator clicks the "Save" button
Then the system does not save the cosmetic product
And displays the message "Please complete all required fields"
```

---

## Epic 2: View Cosmetic Products

### User Story 2

**As** a system administrator,

**I want** to view all registered cosmetic products,

**So that** I can manage the inventory.

### Acceptance Criteria

#### Successful Scenario

```gherkin
Feature: View Cosmetic Products

Scenario: Display registered products

Given cosmetic products exist in the database
When the administrator opens the product list
Then the system displays all registered cosmetic products
```

#### Unsuccessful Scenario

```gherkin
Feature: View Cosmetic Products

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

**So that** the inventory remains accurate.

### Acceptance Criteria

#### Successful Scenario

```gherkin
Feature: Update a Cosmetic Product

Scenario: Successful update

Given the cosmetic product already exists
When the administrator edits the product information and clicks the "Update" button
Then the system updates the product successfully
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

#### Successful Scenario

```gherkin
Feature: Delete a Cosmetic Product

Scenario: Successful deletion

Given the cosmetic product exists in the database
When the administrator selects the product and clicks the "Delete" button
Then the system removes the product from the database
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

---

## Epic 5: Search Cosmetic Products

### User Story 5

**As** a system administrator,

**I want** to search cosmetic products by name or ID,

**So that** I can quickly find a specific product.

### Acceptance Criteria

#### Successful Scenario

```gherkin
Feature: Search Cosmetic Products

Scenario: Product found

Given cosmetic products exist in the database
When the administrator searches by product name or ID
Then the system displays the requested product information
```

#### Unsuccessful Scenario

```gherkin
Feature: Search Cosmetic Products

Scenario: Product not found

Given the requested cosmetic product does not exist
When the administrator performs a search
Then the system displays the message "Product not found"
```

---

## Epic 6: Manage Product Categories

### User Story 6

**As** a system administrator,

**I want** to organize products into categories,

**So that** the inventory is easier to manage.

---

## Epic 7: Stock Management

### User Story 7

**As** a system administrator,

**I want** to update product stock,

**So that** I always know the available quantity of each cosmetic product.

---

## Epic 8: Expiration Date Control

### User Story 8

**As** a system administrator,

**I want** to monitor cosmetic product expiration dates,

**So that** expired products can be removed from the inventory before being sold.
