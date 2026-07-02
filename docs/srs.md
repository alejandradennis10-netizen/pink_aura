# Software Requirements Specification (SRS)
# Cosmetic Management Mobile Application

## 1. Functional Requirements

### FR-01. User Authentication
- The system shall allow users to sign in using an email address and password.
- The system shall validate user credentials through Firebase Authentication.
- The system shall display an error message if the login information is invalid.
- Users shall remain authenticated until they choose to log out.
- The system shall provide a secure logout option.

### FR-02. Cosmetic Product Management
The system shall allow authorized users to:
- Add new cosmetic products.
- Edit existing product information.
- Delete products from the database.
- View the complete list of registered cosmetics.

### FR-03. Cosmetic Information
Each cosmetic product shall store the following information:
- Product ID
- Product name
- Brand
- Category
- Description
- Price
- Stock quantity
- Expiration date
- Product image
- Creation date

### FR-04. Product Search and Filter
- Users shall be able to search products by name.
- Users shall be able to filter products by brand or category.
- The system shall display matching results instantly.

### FR-05. Inventory Management
- The system shall update product stock automatically whenever a product is added, edited, or removed.
- The system shall display the available quantity of each cosmetic.
- Products with zero stock shall be identified as unavailable.

### FR-06. Data Synchronization
- All product information shall be stored in Cloud Firestore.
- Any changes made to the data shall be synchronized in real time across the application.

---

# 2. Non-Functional Requirements

### NFR-01. Security
- User authentication shall be managed through Firebase Authentication.
- Access to the application shall be restricted to authenticated users.
- Product information shall be stored securely in Firebase.

### NFR-02. Performance
- The application shall load the main screen within 3 seconds.
- Product searches shall return results quickly.
- Data synchronization shall occur in real time whenever possible.

### NFR-03. Usability
- The application shall have a clean and intuitive interface.
- Navigation shall be simple and easy to understand.
- The design shall be optimized for Android and iOS mobile devices.

### NFR-04. Reliability
- The application shall maintain data consistency during updates.
- Product information shall remain available after restarting the application.

### NFR-05. Maintainability
- The project shall use a modular structure to simplify future maintenance and updates.
- The source code shall be organized and documented.

---

# 3. Technology Stack

| Technology | Purpose |
|------------|---------|
| **Flutter** | Cross-platform framework used to build the mobile application for Android and iOS from a single codebase. |
| **Dart** | Programming language used to develop the application's logic and user interface. |
| **Firebase Authentication** | Handles secure user registration, login, and authentication using email and password. |
| **Cloud Firestore** | NoSQL cloud database used to store cosmetic products, inventory, and application data in real time. |
| **Firebase Storage** | Stores cosmetic product images securely in the cloud. |
| **Visual Studio Code** | Main development environment for coding and debugging the application. |
| **Git** | Version control system used to manage project changes. |
| **GitHub** | Repository hosting platform used for collaboration, version control, and project backup. |

---

# 4. Cosmetic Data Structure

Each cosmetic product stored in the system shall contain the following information:

| Field | Description |
|-------|-------------|
| Product ID | Unique identifier for each cosmetic product. |
| Product Name | Commercial name of the cosmetic. |
| Brand | Manufacturer or cosmetic brand. |
| Category | Product classification (Makeup, Skincare, Hair Care, Fragrance, etc.). |
| Description | General information and product details. |
| Price | Selling price of the product. |
| Stock | Available inventory quantity. |
| Expiration Date | Product expiration date. |
| Product Image | Image stored in Firebase Storage. |
| Creation Date | Date when the product was added to the system. |
