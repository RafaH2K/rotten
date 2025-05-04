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


INSERT INTO facultad (nombre, fotografia, campus) VALUES
('Facultad de Artes Jedi', 'https://th.bing.com/th/id/OIP.fjb7pNjC5bna-e-0K2D08wHaFj?rs=1&pid=ImgDetMain', 'Coruscant'),
('Facultad de Artes Marciales', 'https://ihadojo.com/assets/iha-shuri-castle.jpg', 'Okinawa'),
('Facultad de Magia y Hechicería', 'https://th.bing.com/th/id/OIP.fqmpY7ruFe-m5pKudfRWoQHaFj?rs=1&pid=ImgDetMain', 'Hogwarts'),
('Facultad de Mutaciones', 'https://www.unitedheroesmush.com/images/b/b7/XaviersSchoolPlaque.jpg', 'Westchester'),
('Facultad de Ciencias', 'https://th.bing.com/th/id/R.775e5c5c8401660a2bd44ae7dc3449bf?rik=iDNI%2btDc%2fc9fiw&pid=ImgRaw&r=0&sres=1&sresct=1', 'Albuquerque'),
('Facultad de Música', 'https://alchetron.com/cdn/School-of-Rock-images-2c3a96c8-fb8c-42e5-a3f2-fb9e2ceccf4.jpg', 'Nueva York'),
('Facultad de Artes Ninja', 'https://th.bing.com/th/id/R.8119328f73cecee75bfe50dd238bb9c9?rik=duLWpAXZb8ZUEQ&pid=ImgRaw&r=0', 'Nueva York');


INSERT INTO maestro (nombre_completo, correo, materias, facultad_id, foto) VALUES
('Yoda', 'yoda@jediforce.com', 'La Fuerza, Filosofía Jedi', 1, 'https://th.bing.com/th/id/R.b0b3ef4995fa4c0128752f29fa920a7a?rik=FMSPoY9QbRgN%2fg&pid=ImgRaw&r=0'),
('Señor Miyagi', 'miyagi@karatekid.com', 'Karate, Filosofía Oriental', 2, 'https://th.bing.com/th/id/OIP.6MQMcg0hXYrE8J7d6kjLegHaEK?rs=1&pid=ImgDetMain'),
('Albus Dumbledore', 'dumbledore@hogwarts.edu', 'Magia Avanzada, Defensa Magica', 3, 'https://th.bing.com/th/id/OIP.9fqRGm9f4O074VwfrzedzQHaJ4?rs=1&pid=ImgDetMain'),
('Severus Snape', 'snape@hogwarts.edu', 'Pociones, Defensa Contra las Artes Oscuras 1', 3, 'https://th.bing.com/th/id/R.9cb16db6c4e5333602c1e9d16e787a9d?rik=nXNKQ3QVVahSdw&pid=ImgRaw&r=0'),
('Remus Lupin', 'lupin@hogwarts.edu', 'Defensa Contra las Artes Oscuras 2', 3, 'https://th.bing.com/th/id/OIP.0yp6xwHmneK4mfQULiirDwHaFj?rs=1&pid=ImgDetMain'),
('Charles Xavier', 'xavier@xmen.edu', 'Mutaciones, Liderazgo', 4, 'https://th.bing.com/th/id/OIP.JbOSxmNmfcANudAGhha1UAHaJ3?rs=1&pid=ImgDetMain'),
('Walter White', 'white@abqhigh.edu', 'Química', 5, 'https://th.bing.com/th/id/OIP.7si8CpGeIRH31LuKd_dFggHaHa?rs=1&pid=ImgDetMain'),
('Dewey Finn', 'dewey@schoolofrock.edu', 'Música, Rock', 6, 'https://th.bing.com/th/id/OIP.m1YVPucsDAQjGCN0ZAok6wAAAA?rs=1&pid=ImgDetMain'),
('Maestro Splinter', 'splinter@tmnt.com', 'Ninjutsu, Filosofía Ninja', 7, 'https://th.bing.com/th/id/OIP.l7bygFXhqH4_bZG62E-uJgHaEc?rs=1&pid=ImgDetMain');
