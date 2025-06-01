-- BASE DE DATOS PAGINA WEB ver. 1.0
-- Programacion WEB
-- Hecha por Oswaldo Silfrid Chavez Carmona
-- 

CREATE DATABASE PaginaWeb;
USE PaginaWeb;

-- Tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contra_hash VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Métodos de pago
CREATE TABLE metodos_pago (
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pago ENUM('tarjeta', 'paypal', 'transferencia') NOT NULL,
    detalles TEXT,
    fecha_agregado DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario)
);

-- Categorías digital 3D
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    tipo ENUM('Digital', '3D') NOT NULL,
    subcategoria VARCHAR(100)
);

-- Productos 
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio FLOAT(10,2) NOT NULL,
    formato_archivo VARCHAR(20),
    imagen_url TEXT,
    stock INT DEFAULT 1,
    visible BOOLEAN DEFAULT TRUE,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias (id_categoria)
);

-- Carritos de compra
CREATE TABLE carrito (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario)
);

-- Items del carrito
CREATE TABLE carrito_items (
    id_carritoItem INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    producto_id INT,
    cantidad INT DEFAULT 1,
    FOREIGN KEY (carrito_id) REFERENCES carrito (id_carrito),
    FOREIGN KEY (producto_id) REFERENCES productos (id_producto)
);

-- Pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    metodo_pago_id INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'pagado', 'completado', 'cancelado') DEFAULT 'pendiente',
    total FLOAT(10,2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (metodo_pago_id) REFERENCES metodos_pago (id_metodo)
);

-- Items de pedidos
CREATE TABLE pedido_items (
    id_pedidoItems INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario FLOAT(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos (id_pedido),
    FOREIGN KEY (producto_id) REFERENCES productos (id_producto)
);

-- Descargas de los productos
CREATE TABLE descargas (
    id_descarga INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    producto_id INT,
    pedido_id INT,
    archivo_url TEXT,
    fecha_descarga DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (producto_id) REFERENCES productos (id_producto),
    FOREIGN KEY (pedido_id) REFERENCES pedidos (id_pedido)
);