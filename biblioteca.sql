-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2025 a las 22:46:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_LIBRO` int(11) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `TIPO_LIBRO` int(11) DEFAULT NULL,
  `TITULO` varchar(100) DEFAULT NULL,
  `AUTOR` varchar(100) DEFAULT NULL,
  `EDITORIAL` varchar(100) DEFAULT NULL,
  `ANIO_PUBLICACION` date DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `CATEGORIA` varchar(50) DEFAULT NULL,
  `FECHA_REGISTRO` datetime DEFAULT NULL,
  `USUARIO_REGISTER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_LIBRO`, `ISBN`, `TIPO_LIBRO`, `TITULO`, `AUTOR`, `EDITORIAL`, `ANIO_PUBLICACION`, `CANTIDAD`, `CATEGORIA`, `FECHA_REGISTRO`, `USUARIO_REGISTER`) VALUES
(1, '9788498388122', 1, 'Cien Años de Soledad', 'Gabriel García Márquez', 'Sudamericana', '1967-05-30', 5, 'Novela', '2025-06-11 18:50:33', 1),
(2, '9783161484100', 2, 'El Principito', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock', '1943-04-06', 3, 'Fábula', '2025-06-11 18:50:33', 2),
(3, '9788437604947', 1, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Francisco de Robles', '1605-01-16', 4, 'Novela', '2025-06-11 18:50:33', 1),
(4, '9789871138209', 3, 'La Sombra del Viento', 'Carlos Ruiz Zafón', 'Planeta', '2001-04-12', 6, 'Misterio', '2025-06-11 18:50:33', 3),
(5, '9780000000005', 1, 'El Laberinto de los Espíritus', 'Carlos Ruiz Zafón', 'Planeta', '2016-11-17', 5, 'Misterio', '2025-06-11 18:50:33', 1),
(6, '9780000000006', 2, 'Rayuela', 'Julio Cortázar', 'Sudamericana', '1963-06-28', 3, 'Novela', '2025-06-11 18:50:33', 2),
(7, '9780000000007', 1, '1984', 'George Orwell', 'Secker & Warburg', '1949-06-08', 4, 'Distopía', '2025-06-11 18:50:33', 1),
(8, '9780000000008', 3, 'Fahrenheit 451', 'Ray Bradbury', 'Ballantine Books', '1953-10-19', 2, 'Ciencia Ficción', '2025-06-11 18:50:33', 3),
(9, '9780000000009', 1, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 'Sudamericana', '1981-03-01', 6, 'Novela', '2025-06-11 18:50:33', 2),
(10, '9780000000010', 2, 'El Aleph', 'Jorge Luis Borges', 'Emecé Editores', '1949-01-01', 5, 'Filosofía', '2025-06-11 18:50:33', 1),
(11, '9780000000011', 1, 'Ensayo sobre la ceguera', 'José Saramago', 'Alfaguara', '1995-05-01', 3, 'Novela', '2025-06-11 18:50:33', 2),
(12, '9780000000012', 2, 'La casa de los espíritus', 'Isabel Allende', 'Plaza & Janés', '1982-04-01', 7, 'Realismo mágico', '2025-06-11 18:50:33', 3),
(13, '9780000000013', 1, 'Pedro Páramo', 'Juan Rulfo', 'Fondo de Cultura Económica', '1955-01-01', 4, 'Novela', '2025-06-11 18:50:33', 1),
(14, '9780000000014', 3, 'Los detectives salvajes', 'Roberto Bolaño', 'Editorial Anagrama', '1998-01-01', 6, 'Poesía', '2025-06-11 18:50:33', 2),
(15, '9780000000015', 1, 'Siddhartha', 'Hermann Hesse', 'Editorial Sudamericana', '1922-11-01', 5, 'Filosofía', '2025-06-11 18:50:33', 3),
(16, '9780000000016', 1, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Oveja Negra', '1985-09-01', 5, 'Novela', '2025-06-11 18:50:33', 2),
(17, '9780000000017', 2, 'La tregua', 'Mario Benedetti', 'Editorial Alfa', '1960-01-01', 4, 'Romance', '2025-06-11 18:50:33', 1),
(18, '9780000000018', 1, 'Los renglones torcidos de Dios', 'Torcuato Luca de Tena', 'Planeta', '1979-05-10', 3, 'Suspenso', '2025-06-11 18:50:33', 2),
(19, '9780000000019', 2, 'Un mundo feliz', 'Aldous Huxley', 'Chatto & Windus', '1932-08-31', 4, 'Distopía', '2025-06-11 18:50:33', 3),
(20, '9780000000020', 3, 'La metamorfosis', 'Franz Kafka', 'Kurt Wolff Verlag', '1915-10-01', 6, 'Ficción', '2025-06-11 18:50:33', 1),
(21, '9780000000021', 2, 'El túnel', 'Ernesto Sabato', 'Editorial Sur', '1948-06-01', 3, 'Psicológica', '2025-06-11 18:50:33', 2),
(22, '9780000000022', 1, 'La ciudad y los perros', 'Mario Vargas Llosa', 'Seix Barral', '1963-10-01', 4, 'Novela', '2025-06-11 18:50:33', 1),
(23, '9780000000023', 2, 'Sobre héroes y tumbas', 'Ernesto Sabato', 'Losada', '1961-01-01', 2, 'Filosofía', '2025-06-11 18:50:33', 3),
(24, '9780000000024', 1, 'Las venas abiertas de América Latina', 'Eduardo Galeano', 'Siglo XXI', '1971-01-01', 5, 'Historia', '2025-06-11 18:50:33', 1),
(25, '9780000000025', 3, 'Cuentos completos', 'Julio Cortázar', 'Alfaguara', '1994-01-01', 3, 'Cuentos', '2025-06-11 18:50:33', 2),
(26, '9780000000026', 1, 'La fiesta del chivo', 'Mario Vargas Llosa', 'Alfaguara', '2000-01-01', 4, 'Política', '2025-06-11 18:50:33', 3),
(27, '9780000000027', 1, 'Aura', 'Carlos Fuentes', 'Fondo de Cultura Económica', '1962-01-01', 6, 'Misterio', '2025-06-11 18:50:33', 1),
(28, '9780000000028', 2, 'La invención de Morel', 'Adolfo Bioy Casares', 'Editorial Losada', '1940-01-01', 4, 'Ciencia Ficción', '2025-06-11 18:50:33', 2),
(29, '9780000000029', 1, 'Zama', 'Antonio Di Benedetto', 'Losada', '1956-01-01', 2, 'Novela', '2025-06-11 18:50:33', 3),
(30, '9780000000030', 2, 'Papelucho', 'Marcela Paz', 'Editorial Universitaria', '1947-01-01', 5, 'Infantil', '2025-06-11 18:50:33', 1),
(31, '9780000000031', 1, 'El llano en llamas', 'Juan Rulfo', 'FCE', '1953-01-01', 3, 'Cuentos', '2025-06-11 18:50:33', 2),
(32, '9780000000032', 2, 'Cien sonetos de amor', 'Pablo Neruda', 'Seix Barral', '1959-01-01', 4, 'Poesía', '2025-06-11 18:50:33', 1),
(33, '9780000000033', 3, 'Los de abajo', 'Mariano Azuela', 'Editorial Porrúa', '1915-01-01', 6, 'Revolución', '2025-06-11 18:50:33', 3),
(34, '9780000000034', 1, 'La muerte de Artemio Cruz', 'Carlos Fuentes', 'Fondo de Cultura Económica', '1962-01-01', 4, 'Política', '2025-06-11 18:50:33', 2),
(35, '9780000000035', 1, 'El otoño del patriarca', 'Gabriel García Márquez', 'Sudamericana', '1975-01-01', 5, 'Novela', '2025-06-11 18:50:33', 1),
(36, '9780000000036', 2, 'Amor', 'Isabel Allende', 'Plaza & Janés', '1995-01-01', 3, 'Romance', '2025-06-11 18:50:33', 3),
(37, '9780000000037', 2, 'Casa de muñecas', 'Henrik Ibsen', 'Gyldendal', '1879-12-21', 2, 'Teatro', '2025-06-11 18:50:33', 2),
(38, '9780000000038', 1, 'El retrato de Dorian Gray', 'Oscar Wilde', 'Ward, Lock and Company', '1890-07-01', 4, 'Clásico', '2025-06-11 18:50:33', 1),
(39, '9780000000039', 3, 'El extranjero', 'Albert Camus', 'Gallimard', '1942-01-01', 4, 'Existencialismo', '2025-06-11 18:50:33', 2),
(40, '9780000000040', 1, 'El viejo y el mar', 'Ernest Hemingway', 'Charles Scribners Sons', '1952-09-01', 3, 'Aventura', '2025-06-11 18:50:33', 1),
(41, '9780000000041', 2, 'Ana Karenina', 'León Tolstói', 'The Russian Messenger', '1877-01-01', 4, 'Drama', '2025-06-11 18:50:33', 3),
(42, '9780000000042', 1, 'Madame Bovary', 'Gustave Flaubert', 'Revue de Paris', '1856-01-01', 4, 'Realismo', '2025-06-11 18:50:33', 2),
(43, '9780000000043', 2, 'Drácula', 'Bram Stoker', 'Archibald Constable', '1897-05-26', 5, 'Terror', '2025-06-11 18:50:33', 1),
(44, '9780000000044', 1, 'Frankenstein', 'Mary Shelley', 'Lackington, Hughes, Harding, Mavor & Jones', '1818-01-01', 4, 'Terror', '2025-06-11 18:50:33', 2),
(45, '9780000000045', 3, 'Matar a un ruiseñor', 'Harper Lee', 'J. B. Lippincott & Co.', '1960-07-11', 6, 'Justicia', '2025-06-11 18:50:33', 1),
(46, '9780000000046', 1, 'Orgullo y prejuicio', 'Jane Austen', 'T. Egerton', '1813-01-28', 3, 'Romance', '2025-06-11 18:50:33', 3),
(47, '9780000000047', 2, 'Jane Eyre', 'Charlotte Brontë', 'Smith, Elder & Co.', '1847-10-16', 4, 'Romance', '2025-06-11 18:50:33', 2),
(48, '9780000000048', 1, 'Cumbres borrascosas', 'Emily Brontë', 'Thomas Cautley Newby', '1847-12-01', 3, 'Romance', '2025-06-11 18:50:33', 1),
(49, '9780000000049', 2, 'Hamlet', 'William Shakespeare', 'N. Ling', '1603-01-01', 4, 'Teatro', '2025-06-11 18:50:33', 2),
(50, '9780000000050', 1, 'La Odisea', 'Homero', 'Desconocido', '0800-01-01', 5, 'Épica', '2025-06-11 18:50:33', 1),
(52, '978-607-747-236-2', 0, 'PRUEBA', 'SERGIO', 'UTP', '2025-07-05', 2, 'ACADEMICO', '2025-07-21 20:04:06', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(500) NOT NULL,
  `Correo` varchar(500) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ID`, `Nombre`, `Correo`, `rol`) VALUES
(1, 'Sergio', 'U17304698@utp.edu.pe', 'admin'),
(2, 'Edward', 'U19202253@utp.edu.pe', 'admin'),
(3, 'Jomar', 'U21317793@utp.edu.pe', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `ID` int(11) NOT NULL,
  `ID_persona` int(11) DEFAULT NULL,
  `libro` varchar(255) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`ID`, `ID_persona`, `libro`, `fecha_prestamo`, `fecha_vencimiento`) VALUES
(1, 1, 'Cien Años de Soledad', '2025-06-10', '2025-06-12'),
(2, 2, 'El Principito', '2025-06-10', '2025-06-15'),
(3, 3, '1984', '2025-06-10', '2025-06-11'),
(4, 1, 'Don Quijote', '2025-06-10', '2025-06-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `ID_RESERVA` int(11) NOT NULL,
  `ID_LIBRO` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `FECHA_RESERVA` date DEFAULT NULL,
  `FECHA_DEVOLUCION` date DEFAULT NULL,
  `ESTADO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`ID_RESERVA`, `ID_LIBRO`, `ID_USUARIO`, `FECHA_RESERVA`, `FECHA_DEVOLUCION`, `ESTADO`) VALUES
(1, 1, 1, '2025-07-21', '2025-07-23', 'RESERVADO'),
(2, 2, 2, '2025-07-22', '2025-07-24', 'RESERVADO'),
(3, 9, 2, '2025-07-23', '2025-07-23', 'RESERVADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUSUARIO` int(11) NOT NULL,
  `CORREO` varchar(100) NOT NULL,
  `CLAVE` varchar(100) NOT NULL,
  `ROL` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `FOTO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUSUARIO`, `CORREO`, `CLAVE`, `ROL`, `NOMBRE`, `FOTO`) VALUES
(1, 'U17304698@utp.edu.pe', '73456423', 'admin', 'Sergio', '1753216092215_pngwing.com.png'),
(2, '1234@gmail.com', 'prueba', 'Supervisor', 'Eloy', '1753215680930_Eloy.png'),
(6, 'U21317793@utp.edu.pe', 'prueba', 'admin', 'Edward', 'Edward.png'),
(10, '123@gmail.com', 'prueba', 'admin', 'Edward', '1753216081738_icon-6007530_640.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_LIBRO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_persona` (`ID_persona`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`ID_RESERVA`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD UNIQUE KEY `USUARIO` (`CORREO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_LIBRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `ID_RESERVA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`ID_persona`) REFERENCES `persona` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
