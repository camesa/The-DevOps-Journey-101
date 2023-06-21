-- Crear una tabla de ejemplo
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INTEGER
);

-- Insertar algunos datos de ejemplo
INSERT INTO usuarios (nombre, edad) VALUES
    ('Juan', 25),
    ('Manuel', 30),
    ('Fangio', 40);

