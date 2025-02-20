-- criando BD 

CREATE DATABASE AutoTech;
USE AutoTech;

-- Tabela Clientes
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255) NOT NULL
);

-- Tabela Veículos
CREATE TABLE vehicles (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    plate CHAR(7) UNIQUE NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    FOREIGN KEY (idClient) REFERENCES clients(idClient) ON DELETE CASCADE
);

-- Tabela Funcionários (Mecânicos)
CREATE TABLE employees (
    idEmployee INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role ENUM('Mecânico', 'Atendente', 'Gerente') NOT NULL,
    phone CHAR(11) NOT NULL UNIQUE,
    salary DECIMAL(10,2) NOT NULL
);

-- Tabela Serviços
CREATE TABLE services (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Tabela Fornecedores
CREATE TABLE suppliers (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Tabela Peças
CREATE TABLE parts (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    idSupplier INT,
    name VARCHAR(100) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idSupplier) REFERENCES suppliers(idSupplier) ON DELETE SET NULL
);

-- Tabela Ordem de Serviço
CREATE TABLE work_orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idVehicle INT,
    idService INT,
    idEmployee INT,
    date DATE NOT NULL,
    status ENUM('Aberto', 'Em andamento', 'Finalizado') DEFAULT 'Aberto',
    total_price DECIMAL(10,2),
    FOREIGN KEY (idVehicle) REFERENCES vehicles(idVehicle) ON DELETE CASCADE,
    FOREIGN KEY (idService) REFERENCES services(idService) ON DELETE CASCADE,
    FOREIGN KEY (idEmployee) REFERENCES employees(idEmployee) ON DELETE SET NULL
);

-- Tabela de Peças usadas em Serviços
CREATE TABLE work_order_parts (
    idOrder INT,
    idPart INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idOrder, idPart),
    FOREIGN KEY (idOrder) REFERENCES work_orders(idOrder) ON DELETE CASCADE,
    FOREIGN KEY (idPart) REFERENCES parts(idPart) ON DELETE CASCADE
);
