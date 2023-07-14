-- Criação da tabela "Cliente"
CREATE TABLE Cliente (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  tipo ENUM('PJ', 'PF') NOT NULL
);

-- Criação da tabela "Endereco"
CREATE TABLE Endereco (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  rua VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  estado VARCHAR(50) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- Criação da tabela "Categoria"
CREATE TABLE Categoria (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL
);

-- Criação da tabela "Produto"
CREATE TABLE Produto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  categoria_id INT,
  FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

-- Criação da tabela "Pedido"
CREATE TABLE Pedido (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  data_pedido DATE NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- Criação da tabela "ItemPedido"
CREATE TABLE ItemPedido (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT,
  produto_id INT,
  quantidade INT NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
  FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- Criação da tabela "Pagamento"
CREATE TABLE Pagamento (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT,
  forma_pagamento VARCHAR(50) NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

-- Criação da tabela "Entrega"
CREATE TABLE Entrega (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT,
  status VARCHAR(50) NOT NULL,
  codigo_rastreio VARCHAR(100) NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

