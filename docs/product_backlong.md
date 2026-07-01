# Product Backlog - Sistema CRUD de Cosméticos

## Epic 1: Registro de Cosméticos

### User Story 1

**Como** administrador del sistema,

**Quiero** registrar un nuevo cosmético,

**Para** mantener actualizado el inventario.

### Acceptance Criteria

#### Escenario exitoso

```gherkin
Feature: Registrar un cosmético

Scenario: Registro exitoso

Given que el administrador se encuentra en el formulario de registro
When ingresa correctamente el nombre, categoría, marca, precio, stock y fecha de caducidad y presiona "Guardar"
Then el sistema registra el producto en la base de datos
And muestra el mensaje "Producto registrado correctamente"
```

#### Escenario no exitoso

```gherkin
Feature: Registrar un cosmético

Scenario: Registro fallido

Given que el administrador se encuentra en el formulario de registro
When deja uno o más campos obligatorios vacíos y presiona "Guardar"
Then el sistema no registra el producto
And muestra el mensaje "Complete todos los campos obligatorios"
```

---

## Epic 2: Actualización de Cosméticos

### User Story 2

**Como** administrador del sistema,

**Quiero** actualizar la información de un cosmético,

**Para** mantener los datos correctos.

### Acceptance Criteria

#### Escenario exitoso

```gherkin
Feature: Actualizar un cosmético

Scenario: Actualización exitosa

Given que el producto ya está registrado
When el administrador modifica la información y presiona "Actualizar"
Then el sistema guarda los cambios
And muestra el mensaje "Producto actualizado correctamente"
```

#### Escenario no exitoso

```gherkin
Feature: Actualizar un cosmético

Scenario: Actualización fallida

Given que el administrador busca un producto con un ID que no existe
When intenta actualizar la información y presiona "Actualizar"
Then el sistema no realiza ninguna modificación
And muestra el mensaje "Producto no encontrado"
```

---

## Epic 3: Eliminación de Cosméticos

### User Story 3

**Como** administrador del sistema,

**Quiero** eliminar un cosmético registrado,

**Para** mantener actualizado el inventario.

### Acceptance Criteria

#### Escenario exitoso

```gherkin
Feature: Eliminar un cosmético

Scenario: Eliminación exitosa

Given que el producto existe en la base de datos
When el administrador selecciona el producto y presiona "Eliminar"
Then el sistema elimina el registro
And muestra el mensaje "Producto eliminado correctamente"
```

#### Escenario no exitoso

```gherkin
Feature: Eliminar un cosmético

Scenario: Eliminación fallida

Given que el administrador ingresa un ID que no existe
When presiona el botón "Eliminar"
Then el sistema no elimina ningún registro
And muestra el mensaje "Producto no encontrado"
```
