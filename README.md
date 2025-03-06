# API Carrito de Compras - Ruby on Rails

## Descripción
Esta es una API desarrollada en **Ruby on Rails** que permite gestionar productos y un carrito de compras. Los productos pueden ser estáticos o generados dinámicamente según la necesidad del usuario.

###  **Funcionalidades principales**
- Obtener la lista de productos disponibles (`GET /api/v1/products`).
- Generar dinámicamente una cantidad específica de productos (`GET /api/v1/products/limit/:quantity`).
- Agregar un producto al carrito (`POST /api/v1/cart/:id`).
- Ver el contenido del carrito (`GET /api/v1/cart`).
- Vaciar el carrito (`DELETE /api/v1/cart`).
- **Reiniciar la lista de productos a su estado original** (`DELETE /api/v1/products`).

---

## **Instalación y Configuración**
### **Prerrequisitos**
Antes de comenzar, asegúrate de tener instalado:
- **Ruby** (`>= 3.0.0`)
- **Rails** (`>= 7.0`)
- **Bundler** (`gem install bundler`)

### **Clonar el Repositorio**
```sh
  git clone https://github.com/caltamar/carrito-compras-api.git
  cd carrito_api
```

### **Instalar Dependencias**
```sh
  bundle install
```

### **Ejecutar el Servidor**
```sh
  rails server
```

La API se ejecutará en `http://localhost:3000`.

---

## **Uso de la API**

### 🔹 **Obtener Productos Disponibles**
```sh
GET /api/v1/products
```
Devuelve la lista de productos estáticos y los generados dinámicamente.

### 🔹 **Generar Productos Dinámicos**
```sh
GET /api/v1/products/limit/:quantity
```
Crea `quantity` productos adicionales y los agrega a la lista de productos.

### 🔹 **Agregar un Producto al Carrito**
```sh
POST /api/v1/cart/:id
```
Agrega un producto específico al carrito de compras.

### 🔹 **Ver Contenido del Carrito**
```sh
GET /api/v1/cart
```
Devuelve los productos agregados al carrito.

### 🔹 **Vaciar el Carrito**
```sh
DELETE /api/v1/cart
```
Elimina todos los productos del carrito.

### 🔹 **Reiniciar la Lista de Productos**
```sh
DELETE /api/v1/products
```
Restaura la lista de productos a su estado original, eliminando los productos generados dinámicamente.

---

## **Estructura del Proyecto**
```sh
app/
 ├── controllers/
 │    ├── api/
 │    │    ├── v1/
 │    │    │    ├── products_controller.rb
 │    │    │    ├── cart_controller.rb
 ├── models/
 │    ├── product.rb
 ├── services/
 │    ├── product_service.rb
```

---

## **Consideraciones Técnicas**
- Se utilizó **Rails API Mode** (`rails new carrito_api --api`).
- Se implementó un **servicio (`ProductService`)** para manejar los productos.
- Se empleó **ActiveModel Serializers** para estructurar las respuestas JSON.
- El carrito se gestiona en memoria, sin persistencia en base de datos.
- **La API permite reiniciar los productos a su estado original con `DELETE /api/v1/products`**.

---