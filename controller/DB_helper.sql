-- Active: 1739597103554@@127.0.0.1@3306@restaurante_manjares

-- DROP DATABASE restaurante_manjares;
CREATE DATABASE restaurante_manjares;
USE restaurante_manjares;
-- Tabla Proveedor
CREATE TABLE Proveedor (
    codigo_proveedor VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    rtn VARCHAR(45) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);


-- Tabla Telefono Proveedores
CREATE TABLE Telefono (
    id_telefono VARCHAR(20) PRIMARY KEY,
    numero VARCHAR(45) NOT NULL,
    Proveedor_codigo_proveedor VARCHAR(20) NOT NULL, 
    FOREIGN KEY (Proveedor_codigo_proveedor) REFERENCES Proveedor(codigo_proveedor) ON DELETE CASCADE
);

-- Producto
CREATE TABLE Producto (
    codigo_producto VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    ubicacion_bodega VARCHAR(45) NOT NULL,
    existencia_actual DOUBLE NOT NULL,
    precio_costo DOUBLE NOT NULL,
    precio_venta DOUBLE NOT NULL
);

--  Acompañante
CREATE TABLE Acompañante (
    codigo_acompañante VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    precio DOUBLE NOT NULL
);

--  Plato
CREATE TABLE Plato (
    codigo_plato VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    precio DOUBLE NOT NULL,
    fecha_de_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_de_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Menu
CREATE TABLE Menu (
    codigo_menu VARCHAR(20) PRIMARY KEY,
    fecha_elaboracion DATE NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    fecha_hora_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_de_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--  Bitacora_Menu
CREATE TABLE Bitacora_Menu (
    codigo_bitacora VARCHAR(20) PRIMARY KEY,
    usuario VARCHAR(45) NOT NULL,
    descripcion_operacion VARCHAR(100) NOT NULL,
    fecha_hora_operacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Menu_codigo_menu VARCHAR(20),
    FOREIGN KEY (Menu_codigo_menu) REFERENCES Menu(codigo_menu) ON DELETE CASCADE
);


-- TABLAS INTERMEDIAS (RELACIONES N:M)


-- Producto <-> Proveedor
CREATE TABLE Producto_Proveedor (
    precio_compra DOUBLE NOT NULL,
    Proveedor_codigo_proveedor VARCHAR(20) NOT NULL,
    Producto_codigo_producto VARCHAR(20) NOT NULL,
    PRIMARY KEY (Proveedor_codigo_proveedor, Producto_codigo_producto),
    FOREIGN KEY (Proveedor_codigo_proveedor) REFERENCES Proveedor(codigo_proveedor) ON DELETE CASCADE,
    FOREIGN KEY (Producto_codigo_producto) REFERENCES Producto(codigo_producto) ON DELETE CASCADE
);

-- Producto <-> Acompañante
CREATE TABLE Producto_Acompañante (
    cantidad DOUBLE NOT NULL,
    unidad_medida VARCHAR(45) NOT NULL,
    Producto_codigo_producto VARCHAR(20) NOT NULL,
    Acompañante_codigo_acompañante VARCHAR(20) NOT NULL,
    PRIMARY KEY (Producto_codigo_producto, Acompañante_codigo_acompañante),
    FOREIGN KEY (Producto_codigo_producto) REFERENCES Producto(codigo_producto) ON DELETE CASCADE,
    FOREIGN KEY (Acompañante_codigo_acompañante) REFERENCES Acompañante(codigo_acompañante) ON DELETE CASCADE
);

-- Plato <-> Acompañante
CREATE TABLE Plato_Acompañante (
    Plato_codigo_plato VARCHAR(20) NOT NULL,
    Acompañante_codigo_acompañante VARCHAR(20) NOT NULL,
    PRIMARY KEY (Plato_codigo_plato, Acompañante_codigo_acompañante),
    FOREIGN KEY (Plato_codigo_plato) REFERENCES Plato(codigo_plato) ON DELETE CASCADE,
    FOREIGN KEY (Acompañante_codigo_acompañante) REFERENCES Acompañante(codigo_acompañante) ON DELETE CASCADE
);

-- Menu <-> Plato
CREATE TABLE Menu_Plato (
    cantidad_producir INT NOT NULL,
    existencia_actual INT NOT NULL,
    Plato_codigo_plato VARCHAR(20) NOT NULL,
    Menu_codigo_menu VARCHAR(20) NOT NULL,
    PRIMARY KEY (Plato_codigo_plato, Menu_codigo_menu),
    FOREIGN KEY (Plato_codigo_plato) REFERENCES Plato(codigo_plato) ON DELETE CASCADE,
    FOREIGN KEY (Menu_codigo_menu) REFERENCES Menu(codigo_menu) ON DELETE CASCADE
);

-- 2. INSERCIÓN DE DATOS
INSERT INTO Proveedor (codigo_proveedor, nombre, direccion, rtn, ciudad) VALUES
('prov01', 'Distribuidora San Pedro', 'Barrio El Benque, 5 Ave', '08011990123450', 'San Pedro Sula'),
('prov02', 'Avícola El Cortijo', 'Anillo Periférico, KM 3', '08011985543210', 'Tegucigalpa'),
('prov03', 'Lácteos Sula', 'Bo. La Guardia, Ave. New Orleans', '05011978998870', 'San Pedro Sula'),
('prov04', 'Agrícola El Zamorano', 'Valle del Yeguare, KM 30', '08011965112230', 'Valle de Ángeles'),
('prov05', 'Comercializadora Mexicana', 'Col. Palmira, Ave. República de México', '08012001445560', 'Tegucigalpa'),
('prov06', 'Embutidos Delicia', 'Zona Industrial Búfalo', '05011992778890', 'Villanueva'),
('prov07', 'Carnes de Honduras', 'Bo. Guacerique', '08011988332210', 'Tegucigalpa'),
('prov08', 'Verduras y Mas', 'Mercado Las Américas', '03011995667780', 'Comayagua'),
('prov09', 'Especias Mesoamérica', 'Bo. El Centro, 2da Calle', '01011999223340', 'La Ceiba'),
('prov10', 'Distribuidora El Maizal', 'Bo. Abajo, Frente a Parque', '06011982889900', 'Choluteca');


INSERT INTO Telefono (id_telefono, numero, Proveedor_codigo_proveedor) VALUES
('tel01', '+504 2550-1122', 'prov01'), 
('tel02', '+504 2234-5678', 'prov02'), 
('tel03', '+504 2557-9000', 'prov03'),
('tel04', '+504 2280-2000', 'prov04'), 
('tel05', '+504 2221-4321', 'prov05'), 
('tel06', '+504 2570-8888', 'prov06'),
('tel07', '+504 2225-1111', 'prov07'), 
('tel08', '+504 2772-3344', 'prov08'), 
('tel09', '+504 2443-5566', 'prov09'),
('tel10', '+504 2782-7788', 'prov10');


INSERT INTO Producto (codigo_producto, nombre, ubicacion_bodega, existencia_actual, precio_costo, precio_venta) VALUES
('prod01', 'Pollo Entero', 'Estante A1 - Congelador', 150.0, 38.0, 50.0),
('prod02', 'Harina de Trigo', 'Estante B2 - Secos', 300.0, 12.0, 18.0),
('prod03', 'Harina de Maíz Nixtamalizada', 'Estante B3 - Secos', 250.0, 10.0, 15.0),
('prod04', 'Quesillo Olanchano', 'Estante C1 - Refrigerado', 80.0, 45.0, 65.0),
('prod05', 'Frijoles Rojos', 'Estante B1 - Secos', 200.0, 18.0, 25.0),
('prod06', 'Carne de Res (Tajo)', 'Estante A2 - Congelador', 100.0, 85.0, 110.0),
('prod07', 'Carne de Cerdo para Pastor', 'Estante A3 - Congelador', 90.0, 60.0, 85.0),
('prod08', 'Plátano Verde', 'Estante D1 - Frescos', 400.0, 4.0, 8.0),
('prod09', 'Aguacate Hass', 'Estante D2 - Frescos', 120.0, 15.0, 25.0),
('prod10', 'Chile Guajillo', 'Estante B4 - Secos', 50.0, 30.0, 45.0);


INSERT INTO Acompañante (codigo_acompañante, nombre, precio) VALUES
('acomp01', 'Tajadas de Plátano Verde', 25.0),
('acomp02', 'Ensalada de Repollo Chismol', 20.0),
('acomp03', 'Frijoles Refritos con Mantequilla', 30.0),
('acomp04', 'Arroz Blanco con Verduras', 25.0),
('acomp05', 'Guacamole y Totopos', 35.0);


INSERT INTO Plato (codigo_plato, nombre, precio) VALUES
('plat01', 'Pollo Chuco Sanpedrano', 140.0),
('plat02', 'Baleada Súper Especial', 65.0),
('plat03', 'Plato Típico Catracho', 160.0),
('plat04', 'Tacos al Pastor', 120.0),
('plat05', 'Sopa de Caracol estilo Ceibeño', 180.0);


INSERT INTO Menu (codigo_menu, fecha_elaboracion, descripcion) VALUES
('menu01', '2026-03-01', 'Menú Típico de Inicio de Mes'),
('menu02', '2026-03-02', 'Menú Especial Catracho'),
('menu03', '2026-03-03', 'Menú Fusión Catracho-Mexicano'),
('menu04', '2026-03-04', 'Menú Ejecutivo Costero'),
('menu05', '2026-03-05', 'Menú Fin de Semana de Asados');


INSERT INTO Producto_Proveedor (precio_compra, Proveedor_codigo_proveedor, Producto_codigo_producto) VALUES
(37.5, 'prov02', 'prod01'), 
(11.5, 'prov04', 'prod02'), 
(44.0, 'prov03', 'prod04'), 
(17.0, 'prov10', 'prod05'),
(58.0, 'prov07', 'prod07'); 

INSERT INTO Producto_Acompañante (cantidad, unidad_medida, Producto_codigo_producto, Acompañante_codigo_acompañante) VALUES
(2.0, 'Unidades', 'prod08', 'acomp01'), 
(0.5, 'Libras', 'prod05', 'acomp03'),  
(0.2, 'Libras', 'prod04', 'acomp03'),  
(1.5, 'Unidades', 'prod09', 'acomp05'), 
(0.1, 'Libras', 'prod10', 'acomp02');  


INSERT INTO Plato_Acompañante (Plato_codigo_plato, Acompañante_codigo_acompañante) VALUES
('plat01', 'acomp01'), 
('plat01', 'acomp02'), 
('plat02', 'acomp03'), 
('plat03', 'acomp03'), 
('plat04', 'acomp05'); 


INSERT INTO Menu_Plato (cantidad_producir, existencia_actual, Plato_codigo_plato, Menu_codigo_menu) VALUES
(50, 45, 'plat01', 'menu01'), 
(100, 90, 'plat02', 'menu01'),
(30, 28, 'plat03', 'menu02'), 
(60, 55, 'plat04', 'menu03'), 
(40, 35, 'plat05', 'menu04');

/** Consultas semana 9*/

/**Mostrar todos los platos de un menú registrado y además, cada plato debe mostrar
todos los acompañantes que lo conforman.*/

SELECT m.codigo_menu, m.descripcion AS descripcion_menu, p.nombre AS nombre_plato, a.nombre AS nombre_acompanante
FROM Menu m
JOIN Menu_Plato mp ON m.codigo_menu = mp.Menu_codigo_menu
JOIN Plato p ON mp.Plato_codigo_plato = p.codigo_plato
LEFT JOIN Plato_Acompañante pa ON p.codigo_plato = pa.Plato_codigo_plato
LEFT JOIN Acompañante a ON pa.Acompañante_codigo_acompañante = a.codigo_acompañante
WHERE m.codigo_menu = 'menu01';

/* Mostrar cuántos platos tienen un acompañante elegido por el estudiante (Se debe de una tabla con la suma total de los platos que tiene el acompañante que el estudiante eligió).*/
SELECT a.codigo_acompañante, a.nombre AS nombre_acompanante, COUNT(b.Plato_codigo_plato) AS total_platos
FROM Acompañante a
INNER JOIN Plato_Acompañante b ON a.codigo_acompañante = b.Acompañante_codigo_acompañante
WHERE a.codigo_acompañante = 'acomp03'
GROUP BY a.codigo_acompañante, a.nombre;

/* Listar todos los platos que pertenecen al menú de una fecha en específico.*/

SELECT a.fecha_elaboracion, a.descripcion AS descripcion_menu, c.nombre AS nombre_plato, b.cantidad_producir
FROM Menu a
INNER JOIN Menu_Plato b ON a.codigo_menu = b.Menu_codigo_menu
INNER JOIN Plato c ON b.Plato_codigo_plato = c.codigo_plato
WHERE a.fecha_elaboracion = '2026-03-01';

/*4-	Mostrar una tabla con el nombre de los proveedores y el nombre de productos que proporciona cada uno de ellos.*/
SELECT a.nombre AS nombre_proveedor, c.nombre AS nombre_producto, b.precio_compra
FROM Proveedor a
INNER JOIN Producto_Proveedor b ON a.codigo_proveedor = b.Proveedor_codigo_proveedor
INNER JOIN Producto c ON b.Producto_codigo_producto = c.codigo_producto;

/*5-	Mostar los nombres de los productos que proporciona cada proveedor que pertenece a una determinada ciudad.*/
SELECT a.nombre AS nombre_proveedor, a.ciudad, c.nombre AS nombre_producto
FROM Proveedor a
INNER JOIN Producto_Proveedor b ON a.codigo_proveedor = b.Proveedor_codigo_proveedor
INNER JOIN Producto c ON b.Producto_codigo_producto = c.codigo_producto
WHERE a.ciudad = 'San Pedro Sula';



/**1- Un trigger que sirva para agregar la fecha y hora de creación de los platos
cuando se esté ingresando un plato. (Se debe de mostrar el agregado de un plato en la tabla
donde se visualice su fecha y hora de creación.)*/

DELIMITER //

CREATE TRIGGER creacion_platos
BEFORE INSERT ON Plato
FOR EACH ROW 
BEGIN
    SET NEW.fecha_de_creacion = NOW();
END //

DELIMITER ;

/*3-Un trigger que sirva para agregar la fecha y hora de creación de los menús
cuando se esté ingresando un menú. (Se debe de mostrar el agregado de un menú en la
tabla donde se visualice su fecha y hora de creación.)*/