# Entity Relationship Diagram

This Entity Relationship Diagram represents the database structure for the Cosmetics CRUD System.

```mermaid
erDiagram

    CATEGORY {
        int category_id PK
        string category_name
    }

    BRAND {
        int brand_id PK
        string brand_name
    }

    COSMETIC {
        int product_id PK
        string product_name
        decimal price
        int stock
        date expiration_date
        int category_id FK
        int brand_id FK
    }

    CATEGORY ||--o{ COSMETIC : contains
    BRAND ||--o{ COSMETIC : manufactures
```

## Description

- **CATEGORY** stores the cosmetic categories (Lipstick, Foundation, Mascara, Skincare, etc.).
- **BRAND** stores the cosmetic brands.
- **COSMETIC** stores all product information, including name, price, stock, expiration date, category, and brand.
- One category can contain many cosmetic products.
- One brand can manufacture many cosmetic products.
