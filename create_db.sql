CREATE DATABASE lavanderia
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
;

CREATE TABLE tb_estado (
  id_estado SERIAL PRIMARY KEY,
  nome_estado VARCHAR(50),
  uf_estado CHAR(2)
);

CREATE TABLE tb_cidade (
  id_cidade SERIAL PRIMARY KEY,
  id_estado INTEGER,
  nome_cidade VARCHAR(255),
  CONSTRAINT fk_cidade_es FOREIGN KEY (id_estado) REFERENCES tb_estado (id_estado)
);

CREATE TABLE tb_endereco (
  id_endereco SERIAL PRIMARY KEY,
  id_cidade INTEGER NOT NULL,
  cep_endereco CHAR(8) NOT NULL,
  logradouro_endereco VARCHAR(255) NOT NULL,
  numero_endereco INTEGER NOT NULL,
  complemento_endereco VARCHAR(255),
  bairro_endereco VARCHAR(255) NOT NULL,
  CONSTRAINT fk_cidade_en FOREIGN KEY (id_cidade) REFERENCES tb_cidade (id_cidade)
);

CREATE TABLE tb_pedido (
  id_pedido SERIAL PRIMARY KEY,
  descricao_pedido VARCHAR(255) NOT NULL,
  orcamento_pedido NUMERIC(10, 2) NOT NULL,
  tempo_pedido INTEGER NOT NULL
);

CREATE TABLE tb_item (
  id_item SERIAL PRIMARY KEY,
  descricao_item VARCHAR(255) NOT NULL,
  preco_uni NUMERIC(10, 2) NOT NULL,
  tempo_item INTEGER NOT NULL,
  imagem_item VARCHAR(255)
);

CREATE TABLE tb_user (
  id_user SERIAL PRIMARY KEY,
  id_endereco INTEGER NOT NULL,
  cpf_user CHAR(11) NOT NULL UNIQUE,
  nome_user VARCHAR(255) NOT NULL,
  email_user VARCHAR(255) NOT NULL UNIQUE,
  telefone_user CHAR(11) NOT NULL,
  senha_user CHAR(64) NOT NULL,
  CONSTRAINT fk_endereco_u FOREIGN KEY (id_endereco) REFERENCES tb_endereco (id_endereco)
);

CREATE TABLE tb_funcionario (
  id_funcionario SERIAL PRIMARY KEY,
  nome_funcionario VARCHAR(255) NOT NULL,
  email_funcionario VARCHAR(255) NOT NULL UNIQUE,
  senha_funcionario CHAR(64) NOT NULL,
  data_nascimento DATE NOT NULL 
);

CREATE TABLE user_has_pedido (
  id_user INTEGER NOT NULL,
  id_pedido INTEGER NOT NULL,
  status VARCHAR(255) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE,
  data_pagamento DATE,
  CONSTRAINT pk_uhp PRIMARY KEY (id_user, id_pedido),
  CONSTRAINT fk_user_p FOREIGN KEY (id_user) REFERENCES tb_user (id_user),
  CONSTRAINT fk_pedido_u FOREIGN KEY (id_pedido) REFERENCES tb_pedido (id_pedido)
);

CREATE TABLE pedido_has_item (
  id_pedido INTEGER NOT NULL,
  id_item INTEGER NOT NULL,
  qtd_item INTEGER NOT NULL,
  CONSTRAINT pk_phi PRIMARY KEY (id_pedido, id_item),
  CONSTRAINT fk_pedido_i FOREIGN KEY (id_pedido) REFERENCES tb_pedido (id_pedido),
  CONSTRAINT fk_item_p FOREIGN KEY (id_item) REFERENCES tb_item (id_item)
);

