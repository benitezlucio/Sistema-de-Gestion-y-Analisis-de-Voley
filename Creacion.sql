-- =========================================
-- CREACIÓN DE BASE DE DATOS
-- =========================================

CREATE DATABASE voleibol_db;
USE voleibol_db;

-- =========================================
-- TABLA: Usuarios
-- =========================================

CREATE TABLE Usuarios (
    id_usr INT AUTO_INCREMENT,
    nom_usr VARCHAR(50) NOT NULL,
    ape_usr VARCHAR(50) NOT NULL,
    email_usr VARCHAR(100) NOT NULL,
    pass_usr VARCHAR(255) NOT NULL,
    rol_usr VARCHAR(20) NOT NULL,
    fec_reg DATE NOT NULL,
    
    PRIMARY KEY (id_usr),
    UNIQUE (email_usr),
    INDEX (rol_usr),
    CHECK (rol_usr IN ('Jugador','Entrenador','Admin'))
);

-- =========================================
-- TABLA: Jugadores
-- =========================================

CREATE TABLE Jugadores (
    id_jug INT AUTO_INCREMENT,
    id_usr INT NOT NULL,
    pos_jug VARCHAR(30) NOT NULL,
    alt_jug DECIMAL(4,2) NOT NULL,
    peso_jug DECIMAL(5,2) NOT NULL,
    alc_sal DECIMAL(4,2) NOT NULL,
    mano_dom VARCHAR(10) NOT NULL,

    PRIMARY KEY (id_jug),
    FOREIGN KEY (id_usr) REFERENCES Usuarios(id_usr),
    CHECK (alt_jug > 0),
    CHECK (peso_jug > 0),
    CHECK (alc_sal > 0),
    CHECK (mano_dom IN ('Derecha','Izquierda'))
);

-- =========================================
-- TABLA: Entrenadores
-- =========================================

CREATE TABLE Entrenadores (
    id_ent INT AUTO_INCREMENT,
    id_usr INT NOT NULL,
    niv_cert VARCHAR(50),
    anios_exp INT,

    PRIMARY KEY (id_ent),
    FOREIGN KEY (id_usr) REFERENCES Usuarios(id_usr),
    CHECK (anios_exp >= 0)
);

-- =========================================
-- TABLA: Clubes
-- =========================================

CREATE TABLE Clubes (
    id_club INT AUTO_INCREMENT,
    nom_club VARCHAR(100) NOT NULL,
    ciudad_club VARCHAR(100) NOT NULL,

    PRIMARY KEY (id_club)
);

-- =========================================
-- TABLA: Equipos
-- =========================================

CREATE TABLE Equipos (
    id_eq INT AUTO_INCREMENT,
    id_club INT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    rama VARCHAR(20) NOT NULL,
    id_ent INT NOT NULL,

    PRIMARY KEY (id_eq),
    FOREIGN KEY (id_club) REFERENCES Clubes(id_club),
    FOREIGN KEY (id_ent) REFERENCES Entrenadores(id_ent),
    CHECK (rama IN ('Masculino','Femenino'))
);

-- =========================================
-- TABLA: Jugadores_Equipos
-- =========================================

CREATE TABLE Jugadores_Equipos (
    id_je INT AUTO_INCREMENT,
    id_jug INT NOT NULL,
    id_eq INT NOT NULL,
    fec_fed DATE NOT NULL,

    PRIMARY KEY (id_je),
    FOREIGN KEY (id_jug) REFERENCES Jugadores(id_jug),
    FOREIGN KEY (id_eq) REFERENCES Equipos(id_eq)
);

-- =========================================
-- TABLA: Torneos
-- =========================================

CREATE TABLE Torneos (
    id_tor INT AUTO_INCREMENT,
    nom_tor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    fec_ini DATE NOT NULL,
    fec_fin DATE NOT NULL,
    premio VARCHAR(100),

    PRIMARY KEY (id_tor),
    CHECK (fec_fin >= fec_ini)
);

-- =========================================
-- TABLA: Partidos
-- =========================================

CREATE TABLE Partidos (
    id_par INT AUTO_INCREMENT,
    id_tor INT NOT NULL,
    eq_loc INT NOT NULL,
    eq_vis INT NOT NULL,
    res_loc INT NOT NULL,
    res_vis INT NOT NULL,
    fecha DATE NOT NULL,

    PRIMARY KEY (id_par),
    FOREIGN KEY (id_tor) REFERENCES Torneos(id_tor),
    FOREIGN KEY (eq_loc) REFERENCES Equipos(id_eq),
    FOREIGN KEY (eq_vis) REFERENCES Equipos(id_eq),
    CHECK (res_loc >= 0),
    CHECK (res_vis >= 0),
    CHECK (eq_loc <> eq_vis)
);

-- =========================================
-- TABLA: Estadisticas_Partido
-- =========================================

CREATE TABLE Estadisticas_Partido (
    id_est INT AUTO_INCREMENT,
    id_jug INT NOT NULL,
    id_par INT NOT NULL,
    puntos INT DEFAULT 0,
    bloqueos INT DEFAULT 0,
    aces INT DEFAULT 0,
    porc_rec DECIMAL(5,2),

    PRIMARY KEY (id_est),
    FOREIGN KEY (id_jug) REFERENCES Jugadores(id_jug),
    FOREIGN KEY (id_par) REFERENCES Partidos(id_par),
    CHECK (puntos >= 0),
    CHECK (bloqueos >= 0),
    CHECK (aces >= 0),
    CHECK (porc_rec BETWEEN 0 AND 100)
);

-- =========================================
-- TABLA: Metricas_Fisicas
-- =========================================

CREATE TABLE Metricas_Fisicas (
    id_met INT AUTO_INCREMENT,
    id_jug INT NOT NULL,
    fecha DATE NOT NULL,
    salto_vert DECIMAL(4,2) NOT NULL,
    peso_cor DECIMAL(5,2) NOT NULL,

    PRIMARY KEY (id_met),
    FOREIGN KEY (id_jug) REFERENCES Jugadores(id_jug),
    CHECK (salto_vert > 0),
    CHECK (peso_cor > 0)
);
