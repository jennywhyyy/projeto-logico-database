SHOW databases;
USE ecommerce;
SHOW TABLES;

-- cliente, endereço de entrega, entrega, estoque, fornecedor, fornecimento de produto, pagamento, pedido, pessoa física,
-- pessoa jurídica, produto, produto em estoque, relação de produto por pedido, venda de produto, vendero terceirizado

-- inserindo dados nas tabelas:

INSERT INTO `Pessoa` (`cod_pessoa`) 
VALUES
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10),
    (11),
    (12),
    (13),
    (14),
    (15),
    (16),
    (17),
    (18),
    (19),
    (20);

SELECT * FROM `Pessoa`;

DESC `Pessoa Física`;

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO `Pessoa Física` (`Pessoa_cod_pessoa`, `CPF`)
VALUES
  (1, 21913456794),
  (2, 21438017814),
  (3, 50510273536),
  (4, 39773021733),
  (5, 46745027656),
  (6, 24536547159),
  (7, 74062917564),
  (8, 12451315598),
  (9, 62330141542),
  (10, 27542874508);

SELECT * FROM `Pessoa Física`;

INSERT INTO `Pessoa Jurídica` (`Pessoa_cod_pessoa`, `CNPJ`)
VALUES
  (11, 21913456794),
  (12, 21438017814),
  (13, 50510273536),
  (14, 39773021733),
  (15, 46745027656),
  (16, 24536547159),
  (17, 74062917564),
  (18, 12451315598),
  (19, 62330141542),
  (20, 27542874508);
  
SELECT * FROM `Pessoa Jurídica`;

INSERT INTO `Cliente` (`Pessoa_cod_pessoa`, `email`,`primeiro_nome`,`segundo_nome`,`sobrenome`, `ano_nascimento`,`endereço_cobrança`)
VALUES
  (1, "donec@hotmail.org","Burke","Melinda","Evans",1929,"687-903 Enim Av."),
  (2, "congue.in@outlook.org","Cherokee","Candice","Cleveland",1926,"Ap #280-5810 Sed Av."),
  (3, "habitant.morbi@yahoo.edu","Quinn","Stacy","Barrera",1942,"1390 Natoque Avenue"),
  (4, "cursus.diam.at@aol.edu","Cassidy","Imogene","Powell",1971,"840-9636 Enim, St."),
  (5, "aenean.egestas@icloud.org","Kadeem","Logan","Hess",1937,"9465 Ante Rd."),
  (6, "at.risus@google.org","Griffin","Carolyn","Wagner",1999,"Ap #271-3839 Sed, Street"),
  (7, "tincidunt.donec.vitae@hotmail.couk","Pascale","Gretchen","O'Neill",1960,"Ap #492-744 Interdum Road"),
  (8, "dolor@protonmail.com","Yeo","Nero","Kelley",1939,"Ap #334-8379 Feugiat Rd."),
  (9, "semper@aol.couk","Penelope","Jameson","Lyons",1936,"7761 Viverra. Av."),
  (10, "imperdiet.ornare@icloud.com","Felix","Tad","Gonzalez",1964,"1159 Sed Street"),
  (11, "posuere.cubilia@protonmail.couk","Sylvia","Eliana","Dawson",1935,"889-5829 Urna, Street"),
  (12, "est.mauris@yahoo.org","Briar","Dillon","Holman",1971,"4880 Vestibulum Avenue"),
  (13, "phasellus.in.felis@aol.ca","Jasper","Camden","Horn",1953,"Ap #886-1023 Blandit Avenue"),
  (14, "vitae@hotmail.com","Hiroko","Echo","Watson",1982,"9148 Morbi Rd."),
  (15, "tristique@google.org","Gregory","Amos","Berry",1968,"781-7292 Aliquet. Rd."),
  (16, "sit.amet.consectetuer@protonmail.com","Cheyenne","Wayne","Moreno",1937,"Ap #905-4950 Mus. Street"),
  (17, "urna@hotmail.org","Mannix","Abel","Hunt",1978,"487-8817 Vel, Av."),
  (18, "amet.faucibus.ut@protonmail.com","Jacqueline","Cyrus","Woodward",1943,"P.O. Box 864, 8471 Augue St."),
  (19, "pellentesque.tincidunt.tempus@hotmail.net","Nita","Colleen","Becker",1921,"7220 Nulla. Ave"),
  (20, "eu.turpis@aol.couk","Boris","Hakeem","Schmidt",1969,"300-2812 Nec, Avenue");


SELECT * FROM `cliente`;

SHOW TABLES;

DESC `Produto`;


-- 'categoria', 'enum(\'Eletrônicos\',\'Decoração\',\'Ferramentas\',\'Alimentação\',\'Vestuário\')', 

INSERT INTO `Produto` (`descrição`, `valor`, `categoria`, `avaliação_produto`)
VALUES 
("Fone de ouvido bluetooth", "237", "Eletrônicos", 5),
("Computador gamer", "5235", "Eletrônicos", 4),
("Abajur", "307", "Decoração", 4.5),
("Fita LED 50m", "65", "Decoração", 5),
("Serra elétrica", "2270", "Ferramentas", 4),
("Jogo de chaves de fenda", "110", "Ferramentas", 3),
("Óleo de gergelim", "18", "Alimentação", 5),
("Macarrão instantâneo", "1.50", "Alimentação", 4),
("Calça moletom", "77.90", "Vestuário", 5),
("Conjunto de meias", "27.50", "Vestuário", 2);

SELECT * FROM `Produto`;

DESC `Entrega`;

-- 'status', 'enum(\'Não enviado\',\'Enviado\',\'A caminho\',\'Entregue\')', 'NO', '', 'Não enviado', ''


INSERT INTO `Entrega` (`código_rastreio`, `status`)
VALUES
  ("WUG15DDQ6VL7F","Não enviado"),
  ("DLL14RJY8VQ7B","Não enviado"),
  ("WVL21UOY0GP4S","Não enviado"),
  ("QKK49FQR6VK3F","Não enviado"),
  ("PZA14SNP5CQ1R","Não enviado"),
  ("UKE95TXD8CT4O","Enviado"),
  ("OKE17XXC2EL0R","Enviado"),
  ("EBR33WAU5PZ7C","Enviado"),
  ("VBE84YDF8YQ5E","Enviado"),
  ("OKJ07QVX8FJ1L","Enviado"),
  ("LVU83NJP8TD9L","A caminho"),
  ("TSP43PPO6ZT4V","A caminho"),
  ("FIG90MIE4CT5P","A caminho"),
  ("PPP35ACB3MP1N","A caminho"),
  ("JMZ88KMX6BM7G","A caminho"),
  ("FWD37LZU6SW2A","Entregue"),
  ("QYD42ZHY1GG6D","Entregue"),
  ("DYU48QUL1XI7B","Entregue"),
  ("TNL79YDT8MO1T","Entregue"),
  ("FNQ92NNT3BH7U","Entregue");


SELECT * FROM `Entrega`;

DESC `Pagamento`;

INSERT INTO `Pagamento` (`Cliente_cod_cliente`, `Cliente_Pessoa_cod_pessoa`, `modo_pagamento`, `status`)
VALUES
 (1, 1, "Crédito", "Processando"),
 (2, 2, "Crédito", "Confirmado"),
 (3, 3, "Crédito", "Negado"),
 (4, 4, "Débito", "Confirmado"),
 (5, 5, "Débito", "Negado"),
 (6, 6, "Débito", "Processando"),
 (7, 7, "Boleto", "Confirmado"),
 (8, 8, "Boleto", "Negado"),
 (9, 9, "Boleto", "Processando"),
 (10, 10, "Crédito", "Confirmado"),
 (11, 11, "Crédito", "Processando"),
 (12, 12, "Crédito", "Negado"),
 (13, 13, "Débito", "Confirmado"),
 (14, 14, "Débito", "Negado"),
 (15, 15, "Débito", "Processando"),
 (16, 16, "Boleto", "Confirmado"),
 (17, 17, "Boleto", "Processando"),
 (18, 18, "Boleto", "Negado"),
 (19, 19, "Crédito", "Confirmado"),
 (20, 20, "Crédito", "Processando");
 
 SHOW TABLES;
 DESC `endereço de entrega`;
 
 INSERT INTO `endereço de entrega` (`CEP`, `Número`, `Complemento`, `Frete`)
 VALUES
  (91215222,73,"798-968 Dignissim St.",88),
  (21236970,62,"442-9580 Aenean St.",111),
  (97178438,74,"Ap #178-605 Neque Street",102),
  (27963266,96,"Ap #771-9139 Nunc, Avenue",76),
  (51819307,76,"P.O. Box 245, 9605 Et Rd.",72),
  (90064231,90,"355-1319 Adipiscing Rd.",55),
  (92404061,97,"Ap #733-348 Dui Rd.",59),
  (59624058,66,"P.O. Box 297, 6360 Est Street",149),
  (85017029,47,"P.O. Box 892, 4061 Id, Rd.",112),
  (14662656,73,"Ap #898-4933 Orci St.",131),
  (38422790,94,"Ap #676-2503 Lorem, St.",75),
  (68105123,24,"Ap #141-1378 Velit Avenue",112),
  (75986407,83,"Ap #377-1287 Tellus Avenue",127),
  (22314815,54,"Ap #457-4679 In, Rd.",11),
  (26863811,72,"8696 Ullamcorper Street",54),
  (38422790,94,"Ap #676-2503 Lorem, St.",75),
  (68105123,24,"Ap #141-1378 Velit Avenue",112),
  (75986407,83,"Ap #377-1287 Tellus Avenue",127),
  (22314815,54,"Ap #457-4679 In, Rd.",11),
  (26863811,72,"8696 Ullamcorper Street",54);

INSERT INTO `Estoque` (`local`, `quantidade`)
VALUES 
  ("Broken Hill",28),
  ("Kotli",25),
  ("Kraków",77),
  ("Vallenar",31),
  ("Leverkusen",68),
  ("Deline",247),
  ("Oviedo",273),
  ("Buguma",273),
  ("Geertruidenberg",145),
  ("Buguma",296);
  
  INSERT INTO `produto em estoque` (`cod_produto`, `cod_estoque`, `quantidade`)
  VALUES 
  (10,1,45),
  (9,2,16),
  (8,3,4),
  (7,4,29),
  (6,5,49),
  (5,6,45),
  (4,7,16),
  (3,8,4),
  (2,9,29),
  (1,10,49);

  
  INSERT INTO `Fornecedor` (`razão_social`, `CNPJ`, `email`, `contato`)
  VALUES
  ("Denise Petersen",44693814534060,"volutpat@aol.org","(536) 668-8685"),
  ("Brody F. Cross",74629424484737,"placerat.augue@icloud.org","(935) 375-2426"),
  ("Kennedy Payne",19521297944176,"gravida.mauris@yahoo.edu","(353) 666-7338"),
  ("Mariam Hall",87123600154928,"ac.mi@aol.edu","1-225-435-8535"),
  ("Ezekiel Gordon",73296668206299,"sem.nulla@protonmail.org","(413) 834-6931"),
  ("Shaine Underwood",70931871829450,"euismod.est.arcu@hotmail.edu","(621) 514-8532"),
  ("Acton Whitehead",64552626171605,"augue.eu@google.net","1-512-252-4523"),
  ("Chelsea M. Sims",89327524307901,"eget@outlook.edu","1-837-626-2325"),
  ("Adrienne Benjamin",71700475896122,"montes@aol.couk","(751) 698-2482"),
  ("Marshall Roy",37300300776783,"vitae@yahoo.net","1-751-895-7334");

SHOW TABLES;

INSERT INTO `fornecimento de produto` (`cod_fornecedor`, `cod_produto`, `quantidade`)
VALUES 
  (1,10, 523),
  (2,9, 321),
  (3,8, 42),
  (4,7,75),
  (5,6,856),
  (5,5,67),
  (6,4,56),
  (7,3,6),
  (8,2,764),
  (9,1,523);

SHOW TABLES;

DESC `vendedor terceirizado`;

INSERT INTO `Vendedor Terceirizado` (`razão_social`, `nome_fantasia`, `localização`, `email`, `contato`, `CPF`)
VALUES
  ("Melinda O. Blanchard","Faucibus Ut LLP","Chungju","neque.tellus@yahoo.com","1-851-776-2246",93690035545),
  ("Benedict Crawford","Vel Turpis Foundation","Central Water Catchment","donec.feugiat@icloud.ca","(573) 813-3973",16716931341),
  ("Lance K. Ramsey","Egestas Sed Corp.","Kropyvnytskyi","mauris.eu@protonmail.ca","1-325-228-4678",82991814072),
  ("May W. Owens","Nisi Industries","Monte Patria","interdum.sed@protonmail.org","(581) 556-8753",59664009219),
  ("Alisa T. Guerra","Dolor Dolor Tempus Incorporated","Kitsman","nec@hotmail.org","1-596-373-3381",51354039676),
  ("Paula Q. Bernard","Eu Elit Nulla Industries","Braunau am Inn","vestibulum.ut@yahoo.ca","1-708-896-6282",94017109704),
  ("Theodore Villarreal","Feugiat Sed Corp.","Akron","cras.convallis@icloud.ca","1-551-557-4641",79149214611),
  ("Andrew Atkinson","Erat Incorporated","Vienna","lorem@google.net","1-724-109-4172",77057759664),
  ("Zenia Fields","Tristique Ac Institute","Vashkivtsi","montes@aol.net","(880) 236-6017",75664358998),
  ("Whitney L. Fuentes","Sit Amet Company","Punggol","integer.eu@google.couk","1-698-388-8466",74514746111);

INSERT INTO `venda de produto` (`cod_produto`, `cod_vendedor`, `quantidade`)
VALUES
  (1,10,154),
  (2,9,161),
  (3,8,11),
  (4,7,80),
  (5,6,27),
  (5,5,154),
  (6,4,161),
  (7,3,11),
  (8,2,80),
  (9,1,27);

-- cod_pagamento = cod_cliente = cod_pessoa

DESC `Pedido`;

INSERT INTO `Pedido` (`Cliente_cod_cliente`, `Cliente_Pessoa_cod_pessoa`, `Pagamento_cod_pagamento`, `cod_endereço`, 
`cod_postagem`, `descrição`, `status_pedido`)
VALUES
  (20,20,20,1,10,"convallis, ante lectus","Em análise"),
  (19,19,19,2,9,"nec","Enviado"),
  (18,18,18,3,8,"mollis lectus pede et risus","Em andamento"),
  (17,17,17,4,7,"Sed id risus quis diam luctus","Em andamento"),
  (16,16,16,5,6,"vel, venenatis vel, faucibus","Em análise"),
  (15,15,15,6,5,"convallis, ante lectus convallis est","Enviado"),
  (14,14,14,7,4,"nec","Em andamento"),
  (13,13,13,8,3,"mollis lectus pede et risus","Em andamento"),
  (12,12,12,9,2,"Sed id risus quis diam luctus","Em análise"),
  (11,11,11,10,1,"vel, venenatis vel, faucibus","Enviado"),
  (10,10,10,11,20,"convallis, ante lectus","Entregue"),
  (9,9,9,12,19,"nec","Em andamento"),
  (8,8,8,13,18,"mollis lectus pede et risus","Em análise"),
  (7,7,7,14,17,"Sed id risus quis diam luctus","Enviado"),
  (6,6,6,15,16,"vel, venenatis vel, faucibus","Entregue"),
  (5,5,5,16,15,"vitae sodales","Em andamento"),
  (4,4,4,17,14,"nec","Em análise"),
  (3,3,3,18,13,"mollis lectus pede et risus","Enviado"),
  (2,2,2,19,12,"risus quis diam luctus","Entregue"),
  (1,1,1,20,11,"vel, venenatis vel, faucibus","Em andamento");

INSERT INTO `relação de produto por pedido` (`cod_pedido`, `cod_produto`, `quantidade`, `status`)
VALUES 
  (1,9,10,"Disponível"),
  (2,8,5,"Disponível"),
  (3,1,1,"Indisponível"),
  (4,8,9,"Indisponível"),
  (5,3,11,"Disponível"),
  (6,9,10,"Disponível"),
  (7,8,5,"Indisponível"),
  (8,1,1,"Indisponível"),
  (9,8,9,"Disponível"),
  (10,3,11,"Disponível"),
  (11,9,10,"Indisponível"),
  (12,8,5,"Indisponível"),
  (13,1,1,"Disponível"),
  (14,8,9,"Disponível"),
  (15,3,11,"Indisponível"),
  (16,3,13,"Indisponível"),
  (17,7,14,"Disponível"),
  (18,1,15,"Disponível"),
  (19,6,7,"Indisponível"),
  (20,6,11,"Disponível");



-- QUERIES PROPOSTAS:

-- Quantos pedidos foram feitos por cada cliente?
SHOW TABLES;
DESC `pedido`;

SELECT c.cod_cliente, primeiro_nome, COUNT(*) as Número_de_pedidos FROM cliente c
INNER JOIN pedido p ON c.cod_cliente = p.Cliente_cod_cliente
GROUP BY cod_cliente; 

-- Algum vendedor também é fornecedor?
SHOW TABLES;
DESC `vendedor terceirizado`;
DESC `fornecedor`; 

SELECT * FROM `vendedor terceirizado` v, `fornecedor` f
WHERE v.razão_social = f.razão_social OR v.email = f.email OR v.contato = f.contato
GROUP BY v.cod_vendedor, f.cod_fornecedor;


-- Relação de produtos, fornecedores e estoques;

SELECT DISTINCT fp.cod_fornecedor, f.razão_social, fp.cod_produto, p.descrição, pe.quantidade AS quantidade_produto_em_estoque, pe.cod_estoque
FROM `fornecimento de produto` fp, `produto` p, `fornecedor` f, `produto em estoque` pe
WHERE fp.cod_produto = p.cod_produto AND f.cod_fornecedor = fp.cod_fornecedor AND pe.cod_produto = p.cod_produto
ORDER BY f.cod_fornecedor;



 
-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT DISTINCT f.razão_social AS nome_fornecedor, p.descrição AS nome_produto
FROM `fornecimento de produto` fp, `produto` p, `fornecedor` f
WHERE fp.cod_produto = p.cod_produto AND f.cod_fornecedor = fp.cod_fornecedor;


-- Quais são os produtos que possuem mais de 15 unidades em estoque:

SELECT p.descrição AS nome_produto, pe.quantidade AS quantidade_de_produto
FROM `produto em estoque` pe, `produto` p
WHERE p.cod_produto = pe.cod_produto
GROUP BY p.cod_produto
HAVING pe.quantidade > 15;