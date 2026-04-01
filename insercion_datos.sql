-- =========================================
-- DATOS DE PRUEBA PARA PLATAFORMA DE VOLEY
-- =========================================

-- 1. USUARIOS (1 Admin, 4 Entrenadores, 24 Jugadores)
INSERT INTO Usuarios (nom_usr, ape_usr, email_usr, pass_usr, rol_usr, fec_reg) VALUES
('Carlos', 'Admin', 'admin@voley.com', 'hashpass123', 'Admin', '2023-01-10'),
-- Entrenadores (IDs 2 a 5)
('Marcelo', 'Mendez', 'mmendez@voley.com', 'hashpass123', 'Entrenador', '2023-01-15'),
('Julio', 'Velasco', 'jvelasco@voley.com', 'hashpass123', 'Entrenador', '2023-01-16'),
('Javier', 'Weber', 'jweber@voley.com', 'hashpass123', 'Entrenador', '2023-01-17'),
('Jon', 'Uriarte', 'juriarte@voley.com', 'hashpass123', 'Entrenador', '2023-01-18'),
-- Jugadores Equipo 1 (IDs 6 a 11)
('Luciano', 'De Cecco', 'ldececco@voley.com', 'hashpass123', 'Jugador', '2023-02-01'),
('Bruno', 'Lima', 'blima@voley.com', 'hashpass123', 'Jugador', '2023-02-01'),
('Facundo', 'Conte', 'fconte@voley.com', 'hashpass123', 'Jugador', '2023-02-01'),
('Ezequiel', 'Palacios', 'epalacios@voley.com', 'hashpass123', 'Jugador', '2023-02-01'),
('Agustin', 'Loser', 'aloser@voley.com', 'hashpass123', 'Jugador', '2023-02-01'),
('Santiago', 'Danani', 'sdanani@voley.com', 'hashpass123', 'Jugador', '2023-02-01'),
-- Jugadores Equipo 2 (IDs 12 a 17)
('Matias', 'Sanchez', 'msanchez@voley.com', 'hashpass123', 'Jugador', '2023-02-02'),
('Pablo', 'Koukartsev', 'pkoukartsev@voley.com', 'hashpass123', 'Jugador', '2023-02-02'),
('Nicolas', 'Lazo', 'nlazo@voley.com', 'hashpass123', 'Jugador', '2023-02-02'),
('Jan', 'Martinez', 'jmartinez@voley.com', 'hashpass123', 'Jugador', '2023-02-02'),
('Martin', 'Ramos', 'mramos@voley.com', 'hashpass123', 'Jugador', '2023-02-02'),
('Franco', 'Massimino', 'fmassimino@voley.com', 'hashpass123', 'Jugador', '2023-02-02'),
-- Jugadores Equipo 3 (IDs 18 a 23)
('Pablo', 'Uriarte', 'puriarte@voley.com', 'hashpass123', 'Jugador', '2023-02-03'),
('Federico', 'Pereyra', 'fpereyra@voley.com', 'hashpass123', 'Jugador', '2023-02-03'),
('Cristian', 'Poglajen', 'cpoglajen@voley.com', 'hashpass123', 'Jugador', '2023-02-03'),
('Lisandro', 'Zanotti', 'lzanotti@voley.com', 'hashpass123', 'Jugador', '2023-02-03'),
('Sebastian', 'Sole', 'ssole@voley.com', 'hashpass123', 'Jugador', '2023-02-03'),
('Ignacio', 'Fernandez', 'ifernandez@voley.com', 'hashpass123', 'Jugador', '2023-02-03'),
-- Jugadores Equipo 4 (IDs 24 a 29)
('Maximiliano', 'Cavanna', 'mcavanna@voley.com', 'hashpass123', 'Jugador', '2023-02-04'),
('Gaston', 'Giani', 'ggiani@voley.com', 'hashpass123', 'Jugador', '2023-02-04'),
('Rodrigo', 'Quiroga', 'rquiroga@voley.com', 'hashpass123', 'Jugador', '2023-02-04'),
('Lucas', 'Ocampo', 'locampo@voley.com', 'hashpass123', 'Jugador', '2023-02-04'),
('Joaquin', 'Gallego', 'jgallego@voley.com', 'hashpass123', 'Jugador', '2023-02-04'),
('Facundo', 'Santucci', 'fsantucci@voley.com', 'hashpass123', 'Jugador', '2023-02-04');

-- 2. CLUBES
INSERT INTO Clubes (nom_club, ciudad_club) VALUES
('UPCN San Juan Voley', 'San Juan'),
('Ciudad Voley', 'Buenos Aires'),
('Obras de San Juan', 'San Juan'),
('Policial Voley', 'Formosa');

-- 3. ENTRENADORES (Vinculados a Usuarios 2, 3, 4 y 5)
INSERT INTO Entrenadores (id_usr, niv_cert, anios_exp) VALUES
(2, 'FIVB Nivel III', 25),
(3, 'FIVB Nivel III', 35),
(4, 'FIVB Nivel II', 15),
(5, 'FIVB Nivel II', 20);

-- 4. EQUIPOS (Relacionando Clubes y Entrenadores)
INSERT INTO Equipos (id_club, categoria, rama, id_ent) VALUES
(1, 'Primera', 'Masculino', 1), -- UPCN
(2, 'Primera', 'Masculino', 2), -- Ciudad Voley
(3, 'Primera', 'Masculino', 3), -- Obras
(4, 'Primera', 'Masculino', 4); -- Policial

-- 5. JUGADORES (Vinculados a Usuarios 6 a 29)
INSERT INTO Jugadores (id_usr, pos_jug, alt_jug, peso_jug, alc_sal, mano_dom) VALUES
-- Equipo 1 (IDs Jugador 1 a 6)
(6, 'Armador', 1.91, 89.5, 3.30, 'Derecha'),
(7, 'Opuesto', 1.98, 92.0, 3.45, 'Derecha'),
(8, 'Punta', 1.97, 90.0, 3.50, 'Derecha'),
(9, 'Punta', 1.98, 85.0, 3.48, 'Derecha'),
(10, 'Central', 1.98, 87.0, 3.55, 'Derecha'),
(11, 'Libero', 1.76, 75.0, 3.00, 'Izquierda'),
-- Equipo 2 (IDs Jugador 7 a 12)
(12, 'Armador', 1.73, 72.0, 3.05, 'Derecha'),
(13, 'Opuesto', 2.03, 105.0, 3.52, 'Derecha'),
(14, 'Punta', 1.92, 85.0, 3.38, 'Derecha'),
(15, 'Punta', 1.90, 84.0, 3.35, 'Derecha'),
(16, 'Central', 1.97, 94.0, 3.48, 'Derecha'),
(17, 'Libero', 1.80, 78.0, 3.10, 'Derecha'),
-- Equipo 3 (IDs Jugador 13 a 18)
(18, 'Armador', 1.90, 82.0, 3.25, 'Derecha'),
(19, 'Opuesto', 2.00, 98.0, 3.50, 'Derecha'),
(20, 'Punta', 1.95, 93.0, 3.45, 'Izquierda'),
(21, 'Punta', 1.95, 88.0, 3.40, 'Derecha'),
(22, 'Central', 2.00, 96.0, 3.55, 'Derecha'),
(23, 'Libero', 1.78, 76.0, 3.05, 'Derecha'),
-- Equipo 4 (IDs Jugador 19 a 24)
(24, 'Armador', 1.88, 80.0, 3.20, 'Derecha'),
(25, 'Opuesto', 1.96, 90.0, 3.42, 'Derecha'),
(26, 'Punta', 1.90, 86.0, 3.35, 'Derecha'),
(27, 'Punta', 1.96, 92.0, 3.40, 'Derecha'),
(28, 'Central', 2.04, 98.0, 3.60, 'Derecha'),
(29, 'Libero', 1.82, 79.0, 3.15, 'Derecha');

-- 6. JUGADORES_EQUIPOS
INSERT INTO Jugadores_Equipos (id_jug, id_eq, fec_fed) VALUES
(1, 1, '2023-03-01'), (2, 1, '2023-03-01'), (3, 1, '2023-03-01'), (4, 1, '2023-03-01'), (5, 1, '2023-03-01'), (6, 1, '2023-03-01'),
(7, 2, '2023-03-01'), (8, 2, '2023-03-01'), (9, 2, '2023-03-01'), (10, 2, '2023-03-01'), (11, 2, '2023-03-01'), (12, 2, '2023-03-01'),
(13, 3, '2023-03-01'), (14, 3, '2023-03-01'), (15, 3, '2023-03-01'), (16, 3, '2023-03-01'), (17, 3, '2023-03-01'), (18, 3, '2023-03-01'),
(19, 4, '2023-03-01'), (20, 4, '2023-03-01'), (21, 4, '2023-03-01'), (22, 4, '2023-03-01'), (23, 4, '2023-03-01'), (24, 4, '2023-03-01');

-- 7. TORNEOS
INSERT INTO Torneos (nom_tor, categoria, fec_ini, fec_fin, premio) VALUES
('Liga de Voleibol Argentina', 'Primera', '2023-10-15', '2024-04-20', 'Copa y Clasificación Sudamericano');

-- 8. PARTIDOS (Formato Ultimos 4: 2 Semis, 3er Puesto, Final)
INSERT INTO Partidos (id_tor, eq_loc, eq_vis, res_loc, res_vis, fecha) VALUES
(1, 1, 4, 3, 1, '2024-04-15'), -- Semi 1: UPCN (1) vs Policial (4)
(1, 2, 3, 3, 2, '2024-04-16'), -- Semi 2: Ciudad (2) vs Obras (3)
(1, 4, 3, 1, 3, '2024-04-19'), -- 3er Puesto: Policial (4) vs Obras (3)
(1, 1, 2, 3, 2, '2024-04-20'); -- Final: UPCN (1) vs Ciudad (2)

-- 9. ESTADÍSTICAS DE PARTIDO
INSERT INTO Estadisticas_Partido (id_jug, id_par, puntos, bloqueos, aces, porc_rec) VALUES
-- Partido 1 (Semi 1: Eq 1 vs Eq 4)
(1, 1, 3, 1, 1, 0.00), (2, 1, 18, 2, 2, 0.00), (3, 1, 15, 1, 0, 55.5), (4, 1, 12, 0, 1, 62.0), (5, 1, 9, 4, 1, 0.00), (6, 1, 0, 0, 0, 75.0), -- Equipo 1
(19, 1, 2, 0, 1, 0.00), (20, 1, 14, 1, 0, 0.00), (21, 1, 11, 2, 1, 48.0), (22, 1, 10, 1, 0, 50.5), (23, 1, 8, 3, 0, 0.00), (24, 1, 0, 0, 0, 68.0), -- Equipo 4

-- Partido 2 (Semi 2: Eq 2 vs Eq 3)
(7, 2, 1, 1, 0, 0.00), (8, 2, 22, 3, 2, 0.00), (9, 2, 16, 1, 1, 60.0), (10, 2, 14, 2, 0, 58.5), (11, 2, 11, 5, 0, 0.00), (12, 2, 0, 0, 0, 80.0), -- Equipo 2
(13, 2, 4, 2, 1, 0.00), (14, 2, 25, 1, 3, 0.00), (15, 2, 12, 0, 0, 45.0), (16, 2, 13, 1, 1, 52.0), (17, 2, 7, 4, 0, 0.00), (18, 2, 0, 0, 0, 70.0), -- Equipo 3

-- Partido 3 (3er Puesto: Eq 4 vs Eq 3)
(19, 3, 3, 1, 0, 0.00), (20, 3, 12, 1, 1, 0.00), (21, 3, 9, 0, 0, 50.0), (22, 3, 8, 1, 0, 45.0), (23, 3, 6, 2, 0, 0.00), (24, 3, 0, 0, 0, 60.0), -- Equipo 4
(13, 3, 5, 1, 2, 0.00), (14, 3, 19, 2, 1, 0.00), (15, 3, 14, 1, 0, 65.0), (16, 3, 11, 2, 1, 58.0), (17, 3, 10, 3, 0, 0.00), (18, 3, 0, 0, 0, 72.0), -- Equipo 3

-- Partido 4 (Final: Eq 1 vs Eq 2 - Partido Largo de 5 sets)
(1, 4, 4, 2, 1, 0.00), (2, 4, 26, 3, 2, 0.00), (3, 4, 19, 2, 1, 65.0), (4, 4, 15, 1, 2, 70.0), (5, 4, 12, 6, 0, 0.00), (6, 4, 0, 0, 0, 82.0), -- Equipo 1
(7, 4, 2, 1, 0, 0.00), (8, 4, 28, 2, 4, 0.00), (9, 4, 17, 1, 1, 55.0), (10, 4, 16, 2, 0, 62.0), (11, 4, 14, 4, 1, 0.00), (12, 4, 0, 0, 0, 75.0); -- Equipo 2

-- 10. METRICAS FISICAS 
INSERT INTO Metricas_Fisicas (id_jug, fecha, salto_vert, peso_cor) VALUES
-- Evolución de Bruno Lima (Opuesto, id_jug = 2)
(2, '2023-08-01', 3.42, 93.5),
(2, '2023-12-01', 3.44, 92.5),
(2, '2024-04-01', 3.45, 92.0),
-- Evolución de Facundo Conte (Punta, id_jug = 3)
(3, '2023-08-01', 3.48, 91.0),
(3, '2023-12-01', 3.49, 90.5),
(3, '2024-04-01', 3.50, 90.0),
-- Evolución de Agustin Loser (Central, id_jug = 5)
(5, '2023-08-01', 3.52, 88.0),
(5, '2023-12-01', 3.54, 87.5),
(5, '2024-04-01', 3.55, 87.0);
