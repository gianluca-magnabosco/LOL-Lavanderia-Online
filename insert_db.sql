--Peças de Roupa
INSERT INTO tb_item (descricao_item, preco_uni, tempo_item, imagem_item) VALUES
('Calça', 9.75, 3, 'images/calca.png'),
('Camisa', 8.25, 2, 'images/camisa.png'),
('Camiseta', 6.00, 2, 'images/camiseta.png'),
('Meia', 2.50, 1, 'images/meia.png'),
('Cueca', 3.99, 1, 'images/cueca.png')
;

--Funcionários

--Maria
INSERT INTO tb_funcionario (id_funcionario, nome_funcionario, email_funcionario, senha_funcionario, data_nascimento)
VALUES (1, 'Maria', 'maria@lol.com', '55a5e9e78207b4df8699d60886fa070079463547b095d1a05bc719bb4e6cd251', '1970-04-20');

--Mário
INSERT INTO tb_funcionario (id_funcionario, nome_funcionario, email_funcionario, senha_funcionario, data_nascimento)
VALUES (2, 'Mário', 'mario@lol.com', '55a5e9e78207b4df8699d60886fa070079463547b095d1a05bc719bb4e6cd251', '1965-06-13');

--Clientes

--João
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES (3464, '83326000', 'Avenida Jacob Macanhan', 2795, '', 'Jardim Cláudia');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user)
VALUES (1, '26242320010', 'João', 'joao@lol.com', '41206221988', '55a5e9e78207b4df8699d60886fa070079463547b095d1a05bc719bb4e6cd251');

--José
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES (3464, '83321000', 'Avenida Iraí', 438, 'AP 169', 'Weissópolis');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user)
VALUES (2, '88298368932', 'José', 'jose@lol.com', '41374623828', '55a5e9e78207b4df8699d60886fa070079463547b095d1a05bc719bb4e6cd251');

--Joana
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES (3464, '83323000', 'Avenida Camilo di Lelliss', 689, '', 'Centro');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user)
VALUES (3, '92645693083', 'Joana', 'joana@lol.com', '41811053030', '55a5e9e78207b4df8699d60886fa070079463547b095d1a05bc719bb4e6cd251');

--Pedidos

--João

--1
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas camisas e uma calça', 26.25, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES 
(1, 2, 2),
(1, 1, 1);
--2
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas calças e uma meia', 22.00, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES 
(2, 1, 2),
(2, 4, 1);
--3
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas meias e uma cueca', 8.99, 1);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(3, 4, 2),
(3, 5, 1);
--4
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Uma cueca e uma meia', 6.49, 1);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES 
(4, 5, 1),
(4, 4, 1);
--5
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Uma calça e uma camiseta', 15.75, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES 
(5, 1, 1),
(5, 3, 1);
--6
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas camisetas e uma meia', 14.50, 2);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(6, 3, 2),
(6, 4, 1);

--2 Abertos
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim) VALUES
(1, 1, 'EM ABERTO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 4)),
(1, 2, 'EM ABERTO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 3));
--Rejeitado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (1, 3, 'REJEITADO', (SELECT CAST(now() as DATE) - 5), (SELECT CAST(now() as DATE) - 2));
--Cancelado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (1, 4, 'CANCELADO', (SELECT CAST(now() as DATE) - 4), (SELECT CAST(now() as DATE) - 1));
--Recolhido
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (1, 5, 'RECOLHIDO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 1));
--Finalizado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (1, 6, 'FINALIZADO', (SELECT CAST(now() as DATE) - 3), (SELECT CAST(now() as DATE)));

--José

--7
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas camisas e uma calça', 26.25, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(7, 2, 2),
(7, 1, 1);
--8
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas calças e uma meia', 22.00, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(8, 1, 2),
(8, 4, 1);
--9
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas meias e uma cueca', 8.99, 1);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(9, 4, 2),
(9, 5, 1);
--10
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Uma cueca e uma meia', 6.49, 1);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(10, 5, 1),
(10, 4, 1);
--11
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Uma calça e uma camiseta', 15.75, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES 
(11, 1, 1),
(11, 3, 1);

--1 Em Aberto
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (2, 7, 'EM ABERTO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 4));
-- Aguardando Pagamento
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (2, 8, 'AGUARDANDO PAGAMENTO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 3));
--Pago
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (2, 9, 'PAGO', (SELECT CAST(now() as DATE) - 5), (SELECT CAST(now() as DATE) - 2));
--Finalizado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim) VALUES
(2, 10, 'FINALIZADO', (SELECT CAST(now() as DATE) - 4), (SELECT CAST(now() as DATE) - 1)),
(2, 11, 'FINALIZADO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 1));

--Joana
--12
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas camisas e uma calça', 26.25, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES 
(12, 2, 2),
(12, 1, 1);
--13
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas calças e uma meia', 22.00, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(13, 1, 2),
(13, 4, 1);
--14
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Duas meias e uma cueca', 8.99, 1);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES 
(14, 4, 2),
(14, 5, 1);
--15
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Uma cueca e uma meia', 6.49, 1);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(15, 5, 1),
(15, 4, 1);
--16
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido, tempo_pedido)
VALUES ('Uma calça e uma camiseta', 15.75, 3);
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item) VALUES
(16, 1, 1),
(16, 3, 1);

--Recolhido
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (3, 12, 'RECOLHIDO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 1));
--2 Aguardando Pagamento
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim) VALUES
(3, 13, 'AGUARDANDO PAGAMENTO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 3)),
(3, 14, 'AGUARDANDO PAGAMENTO', (SELECT CAST(now() as DATE)), (SELECT CAST(now() as DATE) + 3));
--Pago
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (3, 15, 'PAGO', (SELECT CAST(now() as DATE) - 5), (SELECT CAST(now() as DATE) - 2));
--Finalizado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES (3, 16, 'FINALIZADO', (SELECT CAST(now() as DATE) - 3), (SELECT CAST(now() as DATE)));