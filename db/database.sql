-- Tabla facultad
CREATE TABLE facultad (
    facultad_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fotografia VARCHAR(255),
    campus VARCHAR(100) NOT NULL
);

-- Tabla carrera
CREATE TABLE carrera (
    carrera_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    facultad_id INT,
    FOREIGN KEY (facultad_id) REFERENCES facultad(facultad_id)
);

-- Tabla maestro
CREATE TABLE maestro (
    maestro_id SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    materias VARCHAR(255),
    facultad_id INT,
    foto VARCHAR(255),
    FOREIGN KEY (facultad_id) REFERENCES facultad(facultad_id)
);

-- Tabla usuarios
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    carrera_id INT,
    rol VARCHAR(50),
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id)
);

-- Tabla materias
CREATE TABLE materias (
    materia_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    carrera_id INT,
    maestro_id INT,
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id),
    FOREIGN KEY (maestro_id) REFERENCES maestro(maestro_id)
);

-- Tabla opiniones
CREATE TABLE opiniones (
    opinion_id SERIAL PRIMARY KEY,
    valor INT NOT NULL CHECK (valor BETWEEN 0 AND 5), -- calificación de 0 a 5
    opinion VARCHAR(50) CHECK (opinion IN ('Buen dominio de los temas', 'Clases aburridas', 'Clases poco preparadas', 'Suban su sueldo', 'No sabe explicar', 'Clases chill', 'Clases estrictas')),
    pregunta_si_no BOOLEAN,
    maestro_id INT,
    usuario_id INT,
    FOREIGN KEY (maestro_id) REFERENCES maestro(maestro_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);


                                            -- Tablas intermediarias 

-- Maestro y facultad
CREATE TABLE maestro_facultad (
    maestro_facultad_id SERIAL PRIMARY KEY,
    maestro_id INT,
    facultad_id INT,
    FOREIGN KEY (maestro_id) REFERENCES maestro(maestro_id),
    FOREIGN KEY (facultad_id) REFERENCES facultad(facultad_id)
);

-- Maestro y carrera
CREATE TABLE maestro_carrera (
    maestro_carrera_id SERIAL PRIMARY KEY,
    maestro_id INT,
    carrera_id INT,
    FOREIGN KEY (maestro_id) REFERENCES maestro(maestro_id),
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id)
);

-- Maestro y materia
CREATE TABLE maestro_materia (
    maestro_materia_id SERIAL PRIMARY KEY,
    maestro_id INT,
    materia_id INT,
    FOREIGN KEY (maestro_id) REFERENCES maestro(maestro_id),
    FOREIGN KEY (materia_id) REFERENCES materias(materia_id)
);

-- Facultad y carrera
CREATE TABLE facultad_carrera (
    facultad_carrera_id SERIAL PRIMARY KEY,
    facultad_id INT,
    carrera_id INT,
    FOREIGN KEY (facultad_id) REFERENCES facultad(facultad_id),
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id)
);

-- Carrera y usuario
CREATE TABLE carrera_usuario (
    carrera_usuario_id SERIAL PRIMARY KEY,
    carrera_id INT,
    usuario_id INT,
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

-- Usuario y opinión
CREATE TABLE usuario_opinion (
    usuario_opinion_id SERIAL PRIMARY KEY,
    usuario_id INT,
    opinion_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (opinion_id) REFERENCES opiniones(opinion_id)
);
