CREATE DATABASE veloz_car;
USE veloz_car;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf_cliente VARCHAR(14) UNIQUE NOT NULL,
    email_cliente VARCHAR(100),
    telefone_cliente VARCHAR(20),
    endereco_cliente VARCHAR(150),
    data_cadastro DATE,
    cnh VARCHAR(20)
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    cpf_funcionario VARCHAR(14) NOT NULL,
    email_funcionario VARCHAR(100),
    telefone_funcionario VARCHAR(20),
    cargo VARCHAR(50),
    valor_salario DECIMAL(10,2),
    data_admissao DATE
);

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    cor VARCHAR(30),
    ano_fabricado INT,
    valor_diaria DECIMAL(10,2),
    status_veiculo ENUM('disponivel','alugado','manutencao'),
    ano_aquisicao INT
);

CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    id_veiculo INT,
    data_inicial DATE,
    data_final DATE,
    data_registro DATE,
    status_contrato ENUM('ativo','finalizado','atrasado'),
    valor_total DECIMAL(10,2),
    observacao VARCHAR(200),

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT UNIQUE,
    forma_pagamento ENUM('pix','credito','debito','boleto'),
    data_pagamento DATE,
    valor_pagamento DECIMAL(10,2),
    status_pagamento ENUM('pendente','concluido','cancelado'),
    descricao VARCHAR(200),

    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    id_funcionario INT,
    data_manutencao DATE,
    custo_manutencao DECIMAL(10,2),
    tempo_servico VARCHAR(50),
    observacao VARCHAR(200),

    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

INSERT INTO cliente (nome_cliente, cpf_cliente, email_cliente, telefone_cliente, endereco_cliente, data_cadastro, cnh) VALUES
('Ana Silva','11111111111','ana@email.com','8391111','Rua A','2024-01-01','123'),
('João Souza','22222222222','joao@email.com','8392222','Rua B','2024-01-02','124'),
('Maria Lima','33333333333','maria@email.com','8393333','Rua C','2024-01-03','125'),
('Carlos Mendes','44444444444','carlos@email.com','8394444','Rua D','2024-01-04','126'),
('Fernanda Rocha','55555555555','fernanda@email.com','8395555','Rua E','2024-01-05','127'),
('Lucas Alves','66666666666','lucas@email.com','8396666','Rua F','2024-01-06','128'),
('Paula Gomes','77777777777','paula@email.com','8397777','Rua G','2024-01-07','129'),
('Rafael Costa','88888888888','rafael@email.com','8398888','Rua H','2024-01-08','130'),
('Juliana Dias','99999999999','juliana@email.com','8399999','Rua I','2024-01-09','131'),
('Bruno Nunes','10101010101','bruno@email.com','8391010','Rua J','2024-01-10','132');

INSERT INTO funcionario (nome_funcionario, cpf_funcionario, cargo, valor_salario, data_admissao) VALUES
('Pedro','111','Atendente',2000,'2023-01-01'),
('Marcos','222','Gerente',5000,'2022-01-01'),
('Lucas','333','Atendente',2100,'2023-02-01'),
('Ana','444','Financeiro',3000,'2023-03-01'),
('Paulo','555','Atendente',2000,'2023-04-01'),
('Carla','666','RH',3200,'2023-05-01'),
('Julio','777','Atendente',2000,'2023-06-01'),
('Beatriz','888','Financeiro',3100,'2023-07-01'),
('Rita','999','Gerente',5200,'2022-08-01'),
('Daniel','000','Atendente',2000,'2023-09-01');

INSERT INTO veiculo (placa, modelo, cor, ano_fabricado, valor_diaria, status_veiculo, ano_aquisicao) VALUES
('ABC1234','Onix','Preto',2020,100,'disponivel',2021),
('DEF1234','HB20','Branco',2021,120,'alugado',2022),
('GHI1234','Corolla','Prata',2019,200,'disponivel',2020),
('JKL1234','Civic','Preto',2018,180,'manutencao',2019),
('MNO1234','Argo','Vermelho',2022,110,'disponivel',2022),
('PQR1234','Gol','Branco',2017,90,'alugado',2018),
('STU1234','Uno','Azul',2016,80,'disponivel',2017),
('VWX1234','Tracker','Preto',2023,250,'disponivel',2023),
('YZA1234','Compass','Cinza',2022,300,'alugado',2022),
('BCD1234','Renegade','Preto',2021,220,'disponivel',2021);

INSERT INTO contrato (id_cliente, id_funcionario, id_veiculo, data_inicial, data_final, data_registro, status_contrato, valor_total) VALUES
(1,1,1,'2025-01-01','2025-01-05','2025-01-01','finalizado',500),
(2,2,2,'2025-01-02','2025-01-06','2025-01-02','ativo',480),
(3,1,3,'2025-01-03','2025-01-07','2025-01-03','finalizado',800),
(4,3,4,'2025-01-04','2025-01-08','2025-01-04','atrasado',700),
(5,2,5,'2025-01-05','2025-01-09','2025-01-05','ativo',550),
(6,1,6,'2025-01-06','2025-01-10','2025-01-06','finalizado',400),
(7,3,7,'2025-01-07','2025-01-11','2025-01-07','ativo',320),
(8,2,8,'2025-01-08','2025-01-12','2025-01-08','ativo',1000),
(9,1,9,'2025-01-09','2025-01-13','2025-01-09','finalizado',1200),
(10,2,10,'2025-01-10','2025-01-14','2025-01-10','ativo',900);

INSERT INTO pagamento (id_contrato, forma_pagamento, data_pagamento, valor_pagamento, status_pagamento) VALUES
(1,'pix','2025-01-05',500,'concluido'),
(2,'credito','2025-01-06',480,'pendente'),
(3,'debito','2025-01-07',800,'concluido'),
(4,'boleto','2025-01-08',700,'pendente'),
(5,'pix','2025-01-09',550,'concluido'),
(6,'credito','2025-01-10',400,'concluido'),
(7,'debito','2025-01-11',320,'pendente'),
(8,'pix','2025-01-12',1000,'concluido'),
(9,'boleto','2025-01-13',1200,'concluido'),
(10,'credito','2025-01-14',900,'pendente');

INSERT INTO manutencao (id_veiculo, id_funcionario, data_manutencao, custo_manutencao) VALUES
(4,1,'2025-01-10',300),
(2,2,'2025-01-11',200),
(6,3,'2025-01-12',150),
(9,1,'2025-01-13',400),
(3,2,'2025-01-14',250);

UPDATE veiculo SET status_veiculo = 'manutencao' WHERE id_veiculo = 1;
UPDATE pagamento SET status_pagamento = 'concluido' WHERE id_pagamento = 2;

SELECT COUNT(*) AS total_clientes FROM cliente;

SELECT status_veiculo, COUNT(*) 
FROM veiculo
GROUP BY status_veiculo;

SELECT AVG(valor_total) AS media_aluguel FROM contrato;

SELECT status_pagamento, SUM(valor_pagamento)
FROM pagamento
GROUP BY status_pagamento;

SELECT c.nome_cliente, v.modelo, ct.valor_total
FROM contrato ct
INNER JOIN cliente c ON ct.id_cliente = c.id_cliente
INNER JOIN veiculo v ON ct.id_veiculo = v.id_veiculo;

SELECT f.nome_funcionario, COUNT(ct.id_contrato) AS total_contratos
FROM funcionario f
LEFT JOIN contrato ct ON f.id_funcionario = ct.id_funcionario
GROUP BY f.nome_funcionario;

SELECT v.modelo, m.custo_manutencao
FROM veiculo v
RIGHT JOIN manutencao m ON v.id_veiculo = m.id_veiculo;