-- Script DDL para crear las tablas necesarias

CREATE DATABASE IF NOT EXISTS prueba_api;

CREATE TABLE candidates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE vacancies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    candidate_id INT NOT NULL,
    vacancy_id INT NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES candidates(id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancies(id)
);

-- Script DML para poblar las tablas con datos iniciales

INSERT INTO candidates (name, email, phone) VALUES
('Juan Pérez', 'juan.perez@example.com', '123456789'),
('María López', 'maria.lopez@example.com', '987654321');

INSERT INTO vacancies (title, description, location) VALUES
('Desarrollador Backend', 'Buscamos un desarrollador backend con experiencia en Node.js.', 'Remoto'),
('Diseñador UX/UI', 'Se requiere un diseñador con experiencia en diseño de interfaces.', 'Oficina');

INSERT INTO applications (candidate_id, vacancy_id, status) VALUES
(1, 1, 'applied'),
(2, 2, 'interviewed');