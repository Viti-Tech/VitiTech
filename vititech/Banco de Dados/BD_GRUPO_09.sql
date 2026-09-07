CREATE DATABASE VitiTech;

USE VitiTech;

CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(250) UNIQUE,
senha VARCHAR(250) NOT NULL,
nomeEmpresa VARCHAR(40),
cnpj CHAR(18) UNIQUE,
telefone CHAR(11),
cep CHAR (9),
CONSTRAINT chCep CHECK ('_____-___'),
CONSTRAINT chEmail CHECK (email LIKE ('%@%.%')),
CONSTRAINT chCnpj CHECK (cnpj LIKE '__.___.___/000_-__')
)AUTO_INCREMENT = 1;

SELECT * FROM empresa;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(250) NOT NULL,
email VARCHAR(250) UNIQUE,
senha VARCHAR(20) NOT NULL,
idEmpresa INT NOT NULL,
CONSTRAINT chEmailUsuario CHECK (email LIKE ('%@%.%'))
)AUTO_INCREMENT = 1;

SELECT * FROM usuario;

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
modeloSensor VARCHAR(40),
nivelProfundidade INT,
linha INT NOT NULL,
coluna INT NOT NULL,
dataInstalacao DATETIME DEFAULT CURRENT_TIMESTAMP,
idEmpresa INT NOT NULL,
statusSensor VARCHAR(200),
CONSTRAINT chProfundidade CHECK (nivelProfundidade IN (1, 2, 3)),
CONSTRAINT chStatus CHECK (statusSensor IN ('Inativo', 'Ativo', 'Manuntenção'))
)AUTO_INCREMENT = 1;

SELECT * FROM sensor;

CREATE TABLE registroSensor (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
percentualUmidade DECIMAL (5,2) NOT NULL,
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
idSensor INT NOT NULL
)AUTO_INCREMENT = 1;

SELECT * FROM registroSensor;

INSERT INTO 