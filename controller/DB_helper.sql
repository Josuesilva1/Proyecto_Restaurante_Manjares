-- Active: 1739597103554@@127.0.0.1@3306@restaurante_manjares
-- ============================================================
-- Proyecto: Restaurante "Manjares de Honduras"
-- Entregable Semana 8: Creacion e insert de  datos
-- ============================================================

CREATE DATABASE restaurante_manjares;
USE restaurante_manjares;

-- Tabla Proveedor
CREATE TABLE Proveedor (
    codigo_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    rtn VARCHAR(45) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

-- Tabla Telefono Proveedores
CREATE TABLE Telefono (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(45) NOT NULL,
    Proveedor_codigo_proveedor INT NOT NULL,
    FOREIGN KEY (Proveedor_codigo_proveedor) REFERENCES Proveedor(codigo_proveedor) ON DELETE CASCADE
);

-- Producto
CREATE TABLE Producto (
    codigo_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    ubicacion_bodega VARCHAR(45) NOT NULL,
    existencia_actual DOUBLE NOT NULL,
    precio_costo DOUBLE NOT NULL,
    precio_venta DOUBLE NOT NULL
);

--  Acompañante
CREATE TABLE Acompañante (
    codigo_acompañante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    precio DOUBLE NOT NULL
);

--  Plato
CREATE TABLE Plato (
    codigo_plato INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    precio DOUBLE NOT NULL,
    fecha_de_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_de_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Menu
CREATE TABLE Menu (
    codigo_menu INT AUTO_INCREMENT PRIMARY KEY,
    fecha_elaboracion DATE NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    fecha_hora_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_de_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--  Bitacora_Menu
CREATE TABLE Bitacora_Menu (
    codigo_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(45) NOT NULL,
    descripcion_operacion VARCHAR(100) NOT NULL,
    fecha_hora_operacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Menu_codigo_menu INT NOT NULL,
    FOREIGN KEY (Menu_codigo_menu) REFERENCES Menu(codigo_menu) ON DELETE CASCADE
);


-- TABLAS INTERMEDIAS (RELACIONES N:M)


-- Producto <-> Proveedor
CREATE TABLE Producto_Proveedor (
    precio_compra DOUBLE NOT NULL,
    Proveedor_codigo_proveedor INT NOT NULL,
    Producto_codigo_producto INT NOT NULL,
    PRIMARY KEY (Proveedor_codigo_proveedor, Producto_codigo_producto),
    FOREIGN KEY (Proveedor_codigo_proveedor) REFERENCES Proveedor(codigo_proveedor) ON DELETE CASCADE,
    FOREIGN KEY (Producto_codigo_producto) REFERENCES Producto(codigo_producto) ON DELETE CASCADE
);

-- Producto <-> Acompañante
CREATE TABLE Producto_Acompañante (
    cantidad DOUBLE NOT NULL,
    unidad_medida VARCHAR(45) NOT NULL,
    Producto_codigo_producto INT NOT NULL,
    Acompañante_codigo_acompañante INT NOT NULL,
    PRIMARY KEY (Producto_codigo_producto, Acompañante_codigo_acompañante),
    FOREIGN KEY (Producto_codigo_producto) REFERENCES Producto(codigo_producto) ON DELETE CASCADE,
    FOREIGN KEY (Acompañante_codigo_acompañante) REFERENCES Acompañante(codigo_acompañante) ON DELETE CASCADE
);

-- Plato <-> Acompañante
CREATE TABLE Plato_Acompañante (
    Plato_codigo_plato INT NOT NULL,
    Acompañante_codigo_acompañante INT NOT NULL,
    PRIMARY KEY (Plato_codigo_plato, Acompañante_codigo_acompañante),
    FOREIGN KEY (Plato_codigo_plato) REFERENCES Plato(codigo_plato) ON DELETE CASCADE,
    FOREIGN KEY (Acompañante_codigo_acompañante) REFERENCES Acompañante(codigo_acompañante) ON DELETE CASCADE
);

-- Menu <-> Plato
CREATE TABLE Menu_Plato (
    cantidad_producir INT NOT NULL,
    existencia_actual INT NOT NULL,
    Plato_codigo_plato INT NOT NULL,
    Menu_codigo_menu INT NOT NULL,
    PRIMARY KEY (Plato_codigo_plato, Menu_codigo_menu),
    FOREIGN KEY (Plato_codigo_plato) REFERENCES Plato(codigo_plato) ON DELETE CASCADE,
    FOREIGN KEY (Menu_codigo_menu) REFERENCES Menu(codigo_menu) ON DELETE CASCADE
);

-- 2. INSERCIÓN DE DATOS
--Insertar 10 Proveedores
INSERT INTO Proveedor (nombre, direccion, rtn, ciudad) VALUES
('Distribuidora San Pedro', 'Barrio El Benque, 5 Ave', '08011990123450', 'San Pedro Sula'),
('Avícola El Cortijo', 'Anillo Periférico, KM 3', '08011985543210', 'Tegucigalpa'),
('Lácteos Sula', 'Bo. La Guardia, Ave. New Orleans', '05011978998870', 'San Pedro Sula'),
('Agrícola El Zamorano', 'Valle del Yeguare, KM 30', '08011965112230', 'Valle de Ángeles'),
('Comercializadora Mexicana', 'Col. Palmira, Ave. República de México', '08012001445560', 'Tegucigalpa'),
('Embutidos Delicia', 'Zona Industrial Búfalo', '05011992778890', 'Villanueva'),
('Carnes de Honduras', 'Bo. Guacerique', '08011988332210', 'Tegucigalpa'),
('Verduras y Mas', 'Mercado Las Américas', '03011995667780', 'Comayagua'),
('Especias Mesoamérica', 'Bo. El Centro, 2da Calle', '01011999223340', 'La Ceiba'),
('Distribuidora El Maizal', 'Bo. Abajo, Frente a Parque', '06011982889900', 'Choluteca');

-- Insertar teléfonos para los proveedores
INSERT INTO Telefono (numero, Proveedor_codigo_proveedor) VALUES
('+504 2550-1122', 1), ('+504 2234-5678', 2), ('+504 2557-9000', 3),
('+504 2280-2000', 4), ('+504 2221-4321', 5), ('+504 2570-8888', 6),
('+504 2225-1111', 7), ('+504 2772-3344', 8), ('+504 2443-5566', 9),
('+504 2782-7788', 10);

--Insertar 10 Productos
INSERT INTO Producto (nombre, ubicacion_bodega, existencia_actual, precio_costo, precio_venta) VALUES
('Pollo Entero', 'Estante A1 - Congelador', 150.0, 38.0, 50.0),
('Harina de Trigo', 'Estante B2 - Secos', 300.0, 12.0, 18.0),
('Harina de Maíz Nixtamalizada', 'Estante B3 - Secos', 250.0, 10.0, 15.0),
('Quesillo Olanchano', 'Estante C1 - Refrigerado', 80.0, 45.0, 65.0),
('Frijoles Rojos', 'Estante B1 - Secos', 200.0, 18.0, 25.0),
('Carne de Res (Tajo)', 'Estante A2 - Congelador', 100.0, 85.0, 110.0),
('Carne de Cerdo para Pastor', 'Estante A3 - Congelador', 90.0, 60.0, 85.0),
('Plátano Verde', 'Estante D1 - Frescos', 400.0, 4.0, 8.0),
('Aguacate Hass', 'Estante D2 - Frescos', 120.0, 15.0, 25.0),
('Chile Guajillo', 'Estante B4 - Secos', 50.0, 30.0, 45.0);

--Insertar 5 Acompañantes
INSERT INTO Acompañante (nombre, precio) VALUES
('Tajadas de Plátano Verde', 25.0),
('Ensalada de Repollo Chismol', 20.0),
('Frijoles Refritos con Mantequilla', 30.0),
('Arroz Blanco con Verduras', 25.0),
('Guacamole y Totopos', 35.0);

-- Insertar 5 Platos (Comida Hondureña y Mexicana)
INSERT INTO Plato (nombre, precio) VALUES
('Pollo Chuco Sanpedrano', 140.0),
('Baleada Súper Especial', 65.0),
('Plato Típico Catracho', 160.0),
('Tacos al Pastor', 120.0),
('Sopa de Caracol estilo Ceibeño', 180.0);

-- 2.5 Insertar 5 Menús
INSERT INTO Menu (fecha_elaboracion, descripcion) VALUES
('2026-03-01', 'Menú Típico de Inicio de Mes'),
('2026-03-02', 'Menú Especial Catracho'),
('2026-03-03', 'Menú Fusión Catracho-Mexicano'),
('2026-03-04', 'Menú Ejecutivo Costero'),
('2026-03-05', 'Menú Fin de Semana de Asados');

-- 2.6 Insertar 5 filas en Producto_Proveedor
INSERT INTO Producto_Proveedor (precio_compra, Proveedor_codigo_proveedor, Producto_codigo_producto) VALUES
(37.5, 2, 1), -- Avícola El Cortijo provee Pollo Entero
(11.5, 4, 2), -- Zamorano provee Harina de Trigo
(44.0, 3, 4), -- Lácteos Sula provee Quesillo
(17.0, 10, 5),-- El Maizal provee Frijoles
(58.0, 7, 7); -- Carnes de Honduras provee Carne de Cerdo

-- 2.7 Insertar 5 filas en Producto_Acompañante
INSERT INTO Producto_Acompañante (cantidad, unidad_medida, Producto_codigo_producto, Acompañante_codigo_acompañante) VALUES
(2.0, 'Unidades', 8, 1), -- Plátano para Tajadas
(0.5, 'Libras', 5, 3),   -- Frijoles para Frijoles Refritos
(0.2, 'Libras', 4, 3),   -- Quesillo para Frijoles Refritos
(1.5, 'Unidades', 9, 5), -- Aguacate para Guacamole
(0.1, 'Libras', 10, 2);  -- Chile para Chismol

-- 2.8 Insertar 5 filas en Plato_Acompañante
INSERT INTO Plato_Acompañante (Plato_codigo_plato, Acompañante_codigo_acompañante) VALUES
(1, 1), -- Pollo Chuco lleva Tajadas
(1, 2), -- Pollo Chuco lleva Ensalada de Repollo
(2, 3), -- Baleada lleva Frijoles Refritos
(3, 3), -- Plato Típico lleva Frijoles
(4, 5); -- Tacos al Pastor llevan Guacamole

-- 2.9 Insertar 5 filas en Menu_Plato
INSERT INTO Menu_Plato (cantidad_producir, existencia_actual, Plato_codigo_plato, Menu_codigo_menu) VALUES
(50, 45, 1, 1), -- 50 Pollo Chuco en Menú 1
(100, 90, 2, 1),-- 100 Baleadas en Menú 1
(30, 28, 3, 2), -- 30 Platos Típicos en Menú 2
(60, 55, 4, 3), -- 60 Tacos al Pastor en Menú 3
(40, 35, 5, 4); -- 40 Sopas de Caracol en Menú 4
