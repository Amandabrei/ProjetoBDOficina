-- colocando dados para testes

-- Clientes
INSERT INTO clients (name, phone, email, address) VALUES
('Carlos Silva', '11999998888', 'carlos@email.com', 'Rua A, 123'),
('Maria Souza', '11888887777', 'maria@email.com', 'Rua B, 456');

select * from clients;

-- Veículos
INSERT INTO vehicles (idClient, plate, model, year) VALUES
(1, 'ABC1234', 'Honda Civic', 2020),
(2, 'XYZ5678', 'Toyota Corolla', 2018);

select * from vehicles;

-- Funcionários
INSERT INTO employees (name, role, phone, salary) VALUES
('João Mecânico', 'Mecânico', '11977776666', 4000.00),
('Paula Atendente', 'Atendente', '11966665555', 2500.00);

select * from employees;

-- Serviços
INSERT INTO services (description, price) VALUES
('Troca de óleo', 150.00),
('Revisão completa', 500.00);

select * from services;

-- Fornecedores
INSERT INTO suppliers (name, phone, email) VALUES
('Auto Peças Ltda', '11955554444', 'pecas@email.com');

-- Peças
INSERT INTO parts (idSupplier, name, stock, price) VALUES
(1, 'Óleo 5W30', 50, 40.00),
(1, 'Filtro de ar', 30, 30.00);

-- Ordem de Serviço
INSERT INTO work_orders (idVehicle, idService, idEmployee, date, total_price) VALUES
(1, 1, 1, '2024-02-15', 150.00);

-- Peças usadas no serviço
INSERT INTO work_order_parts (idOrder, idPart, quantity) VALUES
(1, 1, 1);


--  Listar todas as ordens de serviço com detalhes do cliente e veículo
SELECT wo.idOrder, c.name AS Cliente, v.plate AS Placa, s.description AS Serviço, wo.date, wo.status, wo.total_price
FROM work_orders wo
JOIN vehicles v ON wo.idVehicle = v.idVehicle
JOIN clients c ON v.idClient = c.idClient
JOIN services s ON wo.idService = s.idService
ORDER BY wo.date DESC;

-- Quantidade de serviços feitos por cada mecânico
SELECT e.name AS Mecânico, COUNT(wo.idOrder) AS TotalServiços
FROM employees e
LEFT JOIN work_orders wo ON e.idEmployee = wo.idEmployee
GROUP BY e.name
HAVING COUNT(wo.idOrder) > 0;

-- Peças mais utilizadas nos serviços
SELECT p.name AS Peça, SUM(wop.quantity) AS TotalUsado
FROM work_order_parts wop
JOIN parts p ON wop.idPart = p.idPart
GROUP BY p.name
ORDER BY TotalUsado DESC;

-- Média de valor dos serviços realizados
SELECT AVG(total_price) AS MediaValorServicos FROM work_orders;

-- Clientes que mais gastaram
SELECT c.name AS Cliente, SUM(wo.total_price) AS TotalGasto
FROM clients c
JOIN vehicles v ON c.idClient = v.idClient
JOIN work_orders wo ON v.idVehicle = wo.idVehicle
GROUP BY c.name
ORDER BY TotalGasto DESC;

