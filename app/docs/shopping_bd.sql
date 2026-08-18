DROP DATABASE IF EXISTS shopping_db;

CREATE DATABASE shopping_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE shopping_db;

-- ==========================================
-- USUARIOS
-- ==========================================

CREATE TABLE usuarios(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombres VARCHAR(100) NOT NULL,

    apellidos VARCHAR(100) NOT NULL,

    email VARCHAR(150) NOT NULL UNIQUE,

    password VARCHAR(255) NOT NULL,

    activo BOOLEAN DEFAULT TRUE,

    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- ==========================================
-- CATEGORIAS
-- ==========================================

CREATE TABLE categorias(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    descripcion VARCHAR(255),

    activo BOOLEAN DEFAULT TRUE

);

-- ==========================================
-- PRODUCTOS
-- ==========================================

CREATE TABLE productos(

    id INT AUTO_INCREMENT PRIMARY KEY,

    categoria_id INT NOT NULL,

    nombre VARCHAR(150) NOT NULL,

    descripcion TEXT,

    precio DECIMAL(10,2) NOT NULL,

    stock INT NOT NULL,

    imagen VARCHAR(255),

    activo BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY(categoria_id)
        REFERENCES categorias(id)

);

-- ==========================================
-- CARRITO
-- ==========================================

CREATE TABLE carrito(

    id INT AUTO_INCREMENT PRIMARY KEY,

    usuario_id INT NOT NULL,

    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    estado ENUM('ACTIVO','FINALIZADO')
        DEFAULT 'ACTIVO',

    CONSTRAINT fk_carrito_usuario
        FOREIGN KEY(usuario_id)
        REFERENCES usuarios(id)

);

-- ==========================================
-- DETALLE CARRITO
-- ==========================================

CREATE TABLE carrito_detalle(

    id INT AUTO_INCREMENT PRIMARY KEY,

    carrito_id INT NOT NULL,

    producto_id INT NOT NULL,

    cantidad INT NOT NULL,

    precio DECIMAL(10,2) NOT NULL,

    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_detalle_carrito
        FOREIGN KEY(carrito_id)
        REFERENCES carrito(id),

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY(producto_id)
        REFERENCES productos(id)

);

-- ==========================================
-- PEDIDOS
-- ==========================================

CREATE TABLE pedidos(

    id INT AUTO_INCREMENT PRIMARY KEY,

    usuario_id INT NOT NULL,

    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    total DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_pedido_usuario
        FOREIGN KEY(usuario_id)
        REFERENCES usuarios(id)

);

-- ==========================================
-- DETALLE PEDIDO
-- ==========================================

CREATE TABLE pedido_detalle(

    id INT AUTO_INCREMENT PRIMARY KEY,

    pedido_id INT NOT NULL,

    producto_id INT NOT NULL,

    cantidad INT NOT NULL,

    precio DECIMAL(10,2) NOT NULL,

    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_detallepedido_pedido
        FOREIGN KEY(pedido_id)
        REFERENCES pedidos(id),

    CONSTRAINT fk_detallepedido_producto
        FOREIGN KEY(producto_id)
        REFERENCES productos(id)

);
