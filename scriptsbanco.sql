CREATE DATABASE lavanderia;

CREATE TABLE tb_user(
  id_user SERIAL,
  id_endereco NUMBER NOT NULL,
  cpf CHAR(11) NOT NULL UNIQUE,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  telefone VARCHAR(30) NOT NULL,
  senha CHAR(64) NOT NULL,
  funcionario BOOLEAN NOT NULL,
  CONSTRAINT pk_user PRIMARY KEY (id_user)
  CONSTRAINT fk_endereco_u FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco);
);

CREATE TABLE tb_pedido(
  id_pedido SERIAL,
  descricao VARCHAR(255) NOT NULL,
  orcamento NUMBER NOT NULL,
  CONSTRAINT pk_pedido PRIMARY KEY (id_pedido)
);

CREATE TABLE tb_item(
  id_item SERIAL,
  descricao VARCHAR(255) NOT NULL,
  preco_uni NUMBER NOT NULL,
  tempo NUMBER NOT NULL,
  CONSTRAINT pk_item PRIMARY KEY (id_item)
);

CREATE TABLE tb_estado (
  id_estado SERIAL PRIMARY KEY,
  nome_estado VARCHAR(50),
  uf_estado CHAR(2)
  CONSTRAINT pk_estado PRIMARY KEY (id_estado)
);

CREATE TABLE tb_cidade (
  id_cidade SERIAL PRIMARY KEY,
  id_estado INTEGER,
  nome_cidade VARCHAR(255),
  CONSTRAINT pk_cidade PRIMARY KEY (id_cidade)
  CONSTRAINT fk_cidade_es FOREIGN KEY (id_estado) REFERENCES tb_estado (id_estado)
);

CREATE TABLE tb_endereco (
  id_endereco SERIAL PRIMARY KEY,
  id_cidade INTEGER NOT NULL,
  cep CHAR(8) NOT NULL,
  logradouro VARCHAR(255) NOT NULL,
  numero INTEGER NOT NULL,
  complemento VARCHAR(255),
  bairro VARCHAR(255) NOT NULL,
  CONSTRAINT fk_cidade_en FOREIGN KEY (id_cidade) REFERENCES tb_cidade(id_cidade)
);

CREATE TABLE user_has_pedido(
  id_user NUMBER NOT NULL,
  id_pedido NUMBER NOT NULL,
  status VARCHAR(255) NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  CONSTRAINT pk_uhp PRIMARY KEY (id_user, id_pedido),
  CONSTRAINT fk_user_p FOREIGN KEY (id_user) REFERENCES tb_user(id_user),
  CONSTRAINT fk_pedido_u FOREIGN KEY (id_pedido) REFERENCES tb_pedido(id_user)
);

CREATE TABLE pedido_has_item(
  id_pedido NUMBER NOT NULL,
  id_item NUMBER NOT NULL,
  CONSTRAINT pk_phi PRIMARY KEY (id_pedido, id_item),
  CONSTRAINT fk_pedido_i FOREIGN KEY (id_pedido) REFERENCES tb_pedido(id_pedido),
  CONSTRAINT fk_item_p FOREIGN KEY (id_item) REFERENCES tb_item(id_pedido),
);
