CREATE DATABASE VitiTech;

USE VitiTech;

CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(40),
email VARCHAR(250) UNIQUE,
senha VARCHAR(250) NOT NULL,
cnpj CHAR(20) UNIQUE,
telefone CHAR(11),
cep CHAR (9),
CONSTRAINT chCep CHECK (cep LIKE '_____-___'),
CONSTRAINT chEmail CHECK (email LIKE ('%@%.%')),
CONSTRAINT chCnpj CHECK (cnpj LIKE '___.___.___/000_-__')
)AUTO_INCREMENT = 1;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(250) NOT NULL,
	email VARCHAR(250) UNIQUE,
	senha VARCHAR(20) NOT NULL,
	idEmpresa INT NOT NULL,
	CONSTRAINT chEmailUsuario CHECK (email LIKE ('%@%.%'))
)AUTO_INCREMENT = 1;

CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	nivelProfundidade INT,
	linha INT NOT NULL,
	coluna INT NOT NULL,
	dataInstalacao DATETIME DEFAULT CURRENT_TIMESTAMP,
	idEmpresa INT NOT NULL,
	statusSensor VARCHAR(200),
	CONSTRAINT chProfundidade CHECK (nivelProfundidade IN (1, 2, 3)),
	CONSTRAINT chStatus CHECK (statusSensor IN ('Inativo', 'Ativo', 'Manutenção'))
)AUTO_INCREMENT = 1;

CREATE TABLE registroSensor (
	idRegistro INT PRIMARY KEY AUTO_INCREMENT,
	percentualUmidade DECIMAL (5,2) NOT NULL,
	dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
	idSensor INT NOT NULL
)AUTO_INCREMENT = 1;

INSERT INTO registroSensor (percentualUmidade,dataHora,idSensor)VALUES
	(87.7, DEFAULT, 1),
	(50.9, DEFAULT, 2),
	(23.4, DEFAULT, 3),
	(97.6, DEFAULT, 4);

INSERT INTO empresa (nomeEmpresa, email, senha, cnpj, telefone, cep) VALUES
	('Cantinho do Velho','CantinhodoVelho@gmail.com', 'Cantinho123@', '123.456.789/0001-01', '11956780912', '05972-170'),
	('Velha Aurora', 'VelhaAurora@gmail.com', 'VelhaAurora123@', '578.174.098/0001-02', '11950981214', '05476-180'),
	('Vale do Vinho','ValedoVinho@gmail.com', 'ValedoVinho123@', '897.125.390/0001-03', '11978230974', '05912-170'),
	('Tinto da Mesa', 'TintodaMesa@gmail.com', 'TintoDaMesa123@', '930.167.390/0001-04', '11967341980', '05967-190'),
	('Fazenda Cabernet', 'FazendaCabernet@gmail.com', 'Cabernet123@', '900.800.700/0001-05', '11956781234', '05980-150'),
	('Fazenda da Uva', 'FazendaDaUva@hotmail.com', 'Uva123@', '256.800.700/0001-05', '11978401836', '05980-140');

INSERT INTO usuario (nome, email, senha, idEmpresa) VALUES
	('Guilherme Zanin', 'Guilherme.Zanin@gmail.com', 'GuilhermeZanin123@', 1),
	('Adriano Souza', 'Adriano.Souza@gmail.com', 'AdrianoSouza123@', 2),
	('Heitor Torres', 'Heitor.Torres@gmail.com', 'HeitorTorres123@', 3),
	('Marcelo Santos', 'Marcelo.Santos@gmail.com', 'MarceloSantos123@', 4);

INSERT INTO sensor (nivelProfundidade, linha, coluna, dataInstalacao, idEmpresa, statusSensor) VALUES
	(1, 2, 9, DEFAULT, 1, 'Ativo'),
	(3, 1, 5, DEFAULT, 2, 'Inativo'),
	(2, 1, 7, DEFAULT, 3, 'Manutenção'),
	(3, 4, 5, DEFAULT, 4, 'Manutenção'),
	(1, 7, 8, DEFAULT, 5, 'Ativo');

SELECT * FROM empresa;

SELECT * FROM empresa WHERE email LIKE '%@hotmail%';

SELECT * FROM registroSensor WHERE percentualUmidade < 40.0 OR percentualUmidade > 55.0;

SELECT * FROM registroSensor WHERE percentualUmidade BETWEEN 40.0 AND 55.0;

SELECT *,
	CASE
		WHEN percentualUmidade < 40 THEN 'Solo seco'
        WHEN percentualUmidade BETWEEN 40.0 AND 55.0 THEN 'Solo ideal'
        ELSE 'Encharcado'
	END AS 'Condição do solo'
FROM registroSensor;

-- --------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO usuario (nome,email,senha,idEmpresa) VALUES
('Marcelo Santos', 'Marcelo.Santos@sptech.com', 'Marcelo123@', 5),  
('Gabriel Pereira', 'Gabriel.Pereira@sptech.com', 'Gabriel123@', 6); -- Apresentação

INSERT INTO sensor(nivelProfundidade, linha, coluna, dataInstalacao, idEmpresa, statusSensor) VALUES
(1, 2, 9, DEFAULT, 1, 'Ativo'),
(3, 7, 2, DEFAULT, 4, 'Manutenção'); -- Apresentação

SELECT concat('O sensor ', idSensor, ' esta na profundidade ', nivelProfundidade) AS 'Profundidade do sensor' FROM sensor;

SELECT * FROM empresa WHERE telefone = '11956780912';

SELECT * FROM sensor WHERE nivelProfundidade = 1 AND coluna = 8;