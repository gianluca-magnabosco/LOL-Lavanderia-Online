--Peças de Roupa
INSERT INTO tb_item (descricao_item, preco_uni, tempo)
VALUES ('Calça','3','2');
INSERT INTO tb_item (descricao_item, preco_uni, tempo)
VALUES ('Camisa','2','2');
INSERT INTO tb_item (descricao_item, preco_uni, tempo)
VALUES ('Camiseta','2','2');
INSERT INTO tb_item (descricao_item, preco_uni, tempo)
VALUES ('Meia','1','1');
INSERT INTO tb_item (descricao_item, preco_uni, tempo)
VALUES ('Cueca','1','1');

--Funcionários

--Maria
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES ('3292','80240210','Avenida República Argentina','824','','Água Verde');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user)
VALUES ('1','05113230936','Maria','maria@lol.com','41128445541','12345','Funcionario');

--Mário
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES ('3292','82400000','Avenida Manoel Ribas','5630','','Santa Felicidade');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user)
VALUES ('2','33543033956','Mário','mario@lol.com','41805359911','12345','Funcionario');

--Clientes

--João
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES ('3464','83326000','Avenida Jacob Macanhan','2795','','Jardim Cláudia');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user)
VALUES ('3','37327465936','João','joao@lol.com','41206221988','12345','Cliente');

--José
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES ('3464','83321000','Avenida Iraí','438','','Weissópolis');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user)
VALUES ('4','88298368932','José','jose@lol.com','41374623828','12345','Cliente');

--Joana
INSERT INTO tb_endereco (id_cidade, cep_endereco, logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco)
VALUES ('3464','83323000','Avenida Camilo di Lelliss','689','','Centro');

INSERT INTO tb_user (id_endereco, cpf_user, nome_user, email_user, telefone_user, senha_user, tipo_user)
VALUES ('5','58056087907','Joana','joana@lol.com','41811053030','12345','Cliente');

--Pedidos

--João

--1
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas camisas e uma calça','7');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('1','2','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('1','1','1');
--2
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas calças e uma meia','7');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('2','1','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('2','4','1');
--3
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas meias e uma cueca','3');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('3','4','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('3','5','1');
--4
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Uma cueca e uma meia','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('4','5','1');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('4','4','1');
--5
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Uma calça e uma camiseta','5');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('5','1','1');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('5','3','1');
--6
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas camisetas e uma meia','5');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('6','3','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('6','4','1');

--2 Abertos
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('3','1','EM_ABERTO',(select cast(now() as date)),(select cast(now() as date) + 4));
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('3','2','EM_ABERTO',(select cast(now() as date)),(select cast(now() as date) + 3));
--Rejeitado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('3','3','REJEITADO',(select cast(now() as date) - 5),(select cast(now() as date) - 2));
--Cancelado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('3','4','CANCELADO',(select cast(now() as date) - 4),(select cast(now() as date) - 1));
--Recolhido
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('3','5','RECOLHIDO',(select cast(now() as date)),(select cast(now() as date) + 1));
--Finalizado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('3','6','FINALIZADO',(select cast(now() as date) - 3),(select cast(now() as date)));

--José

--7
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas camisas e uma calça','7');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('7','2','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('7','1','1');
--8
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas calças e uma meia','7');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('8','1','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('8','4','1');
--9
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas meias e uma cueca','3');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('9','4','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('9','5','1');
--10
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Uma cueca e uma meia','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('10','5','1');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('10','4','1');
--11
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Uma calça e uma camiseta','5');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('11','1','1');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('11','3','1');

--1 Em Aberto
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('4','8','EM_ABERTO',(select cast(now() as date)),(select cast(now() as date) + 4));
-- Aguardando Pagamento
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('4','9','AGUARDANDO_PAGAMENTO',(select cast(now() as date)),(select cast(now() as date) + 3));
--Pago
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('4','10','PAGO',(select cast(now() as date) - 5),(select cast(now() as date) - 2));
--Finalizado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('4','11','CANCELADO',(select cast(now() as date) - 4),(select cast(now() as date) - 1));
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('4','12','RECOLHIDO',(select cast(now() as date)),(select cast(now() as date) + 1));

--Joana
--12
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas camisas e uma calça','7');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('12','2','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('12','1','1');
--13
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas calças e uma meia','7');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('13','1','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('13','4','1');
--14
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Duas meias e uma cueca','3');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('14','4','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('14','5','1');
--15
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Uma cueca e uma meia','2');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('15','5','1');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('15','4','1');
--16
INSERT INTO tb_pedido (descricao_pedido, orcamento_pedido)
VALUES ('Uma calça e uma camiseta','5');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('16','1','1');
INSERT INTO pedido_has_item (id_pedido, id_item, qtd_item)
VALUES ('16','3','1');

--Recolhido
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('5','12','RECOLHIDO',(select cast(now() as date)),(select cast(now() as date) + 1));
--2 Aguardando Pagamento
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('5','13','AGUARDANDO_PAGAMENTO',(select cast(now() as date)),(select cast(now() as date) + 3));
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('5','14','AGUARDANDO_PAGAMENTO',(select cast(now() as date)),(select cast(now() as date) + 3));
--Pago
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('5','15','PAGO',(select cast(now() as date) - 5),(select cast(now() as date) - 2));
--Finalizado
INSERT INTO user_has_pedido (id_user, id_pedido, status, data_inicio, data_fim)
VALUES ('5','16','FINALIZADO',(select cast(now() as date) - 3),(select cast(now() as date)));