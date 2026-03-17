-- =========================================
-- CREACIÓN DE VISTAS
-- =========================================
CREATE VIEW vista_rendimiento_jugadores AS
SELECT 
    j.id_jug,
    u.nom_usr,
    SUM(e.puntos) AS total_puntos,
    SUM(e.bloqueos) AS total_bloqueos,
    AVG(e.porc_rec) AS promedio_recepcion
FROM Jugadores j
JOIN Usuarios u ON j.id_usr = u.id_usr
JOIN Estadisticas_Partido e ON j.id_jug = e.id_jug
GROUP BY j.id_jug;

CREATE VIEW vista_rendimiento_fisico AS
SELECT 
    j.id_jug,
    u.nom_usr,
    AVG(m.salto_vert) AS promedio_salto,
    AVG(m.peso_cor) AS promedio_peso,
    MAX(m.salto_vert) AS mejor_salto
FROM Metricas_Fisicas m
JOIN Jugadores j ON m.id_jug = j.id_jug
JOIN Usuarios u ON j.id_usr = u.id_usr
GROUP BY j.id_jug;

-- =========================================
-- CREACIÓN DE FUNCIONES
-- =========================================

DELIMITER //
CREATE FUNCTION fn_promedio_puntos(p_id_jug INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(5,2);

    SELECT AVG(puntos)
    INTO promedio
    FROM Estadisticas_Partido
    WHERE id_jug = p_id_jug;

    RETURN promedio;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION fn_partidos_jugados(p_id_jug INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM Estadisticas_Partido
    WHERE id_jug = p_id_jug;

    RETURN total;
END //
DELIMITER ;

-- =========================================
-- CREACIÓN DE STORED PROCEDURES
-- =========================================

DELIMITER //
CREATE PROCEDURE sp_buscar_jugadores_posicion(IN p_pos VARCHAR(30))
BEGIN
    SELECT u.nom_usr, u.ape_usr, j.pos_jug
    FROM Jugadores j
    JOIN Usuarios u ON j.id_usr = u.id_usr
    WHERE j.pos_jug = p_pos;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estadisticas_partido(IN p_id_par INT)
BEGIN
    SELECT 
        u.nom_usr,
        e.puntos,
        e.bloqueos,
        e.aces
    FROM Estadisticas_Partido e
    JOIN Jugadores j ON e.id_jug = j.id_jug
    JOIN Usuarios u ON j.id_usr = u.id_usr
    WHERE e.id_par = p_id_par;
END //
DELIMITER ;

-- =========================================
-- CREACIÓN DE TRIGGERS
-- =========================================

DELIMITER //
CREATE TRIGGER trg_validar_puntos
BEFORE INSERT ON Estadisticas_Partido
FOR EACH ROW
BEGIN
    IF NEW.puntos < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Los puntos no pueden ser negativos';
    END IF;
END //
DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_validar_porcentaje_recepcion
BEFORE INSERT ON Estadisticas_Partido
FOR EACH ROW
BEGIN
    IF NEW.porc_rec < 0 OR NEW.porc_rec > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El porcentaje de recepción debe estar entre 0 y 100';
    END IF;
END //

DELIMITER ;
