-- SET SQL_SAFE_UPDATES = 1;
-- SET SQL_SAFE_UPDATES = 0;


-- select * from clientes;
-- delete from clientes;

insert into clientes (cpf, rg, nome, cepEndereco, ruaEndereco, bairroEndereco, numeroEndereco, cidadeEndereco) 
VALUES 	
('56073431465', '252226859', "Davi Lucas Peixoto", '55644162', "Rua José Candido do Amaral", "Cruzeiro", 69, "Gravatá"),
('05916352409', '419859226', "Juliana Nogueira", '53401250', "Praça Frederico Lundgren", "Centro", 96, "Paulista"),
('59698576452', NULL, "Isis Aragão", '53423290', "Rua Presidente Costa e Silva", "Engenho Maranguape", 70, "Paulista"),
('18533408471', '217945843', "Breno Lopes", '56316818', "Rua Maria José da Silva", "João de Deus", 23, "Petrolina"),
('61937963470', null, "Cauê da Mata", '54170010', "Rua Doutor Lourenço de Sá", "Socorro", 34, "Jaboatão dos Guararapes"),
('95939651496', '254104095', "Larissa da Rocha", '56321710', "Rua Bromélia", "Antônio Cassimiro", 56, "Petrolina"),
('91640502467', '144429123', "Enzo Silva", '55291854', "Rua Educador Paulo Freire", "Francisco Simão dos Santos Figueira", 51, "Garanhuns"),
('14777673472', '359820414', "Fernanda Alves", '56320095', "Rua Rio Pontal", "José e Maria", 68, "Petrolina"),
('21981861440', null, "Maysa Ribeiro", '54315455', "Rua Alto São Lourenço", "Jardim Jordão", 90, "Jaboatão dos Guararapes"),
('30163103410', '470135025', "Enrico Pinto", '53250040', "Avenida Coronel João Melo Moraes", "Fragoso", 343, "Olinda"),
('54263823469', '693571578', "Danilo Freitas", '52291334', "Rua Maria da Fé", "Passarinho", 22, "Recife");

-- ---------------------------------------------------------------------------------------------

-- select * from telefone;
-- delete from telefone;

insert into telefone (idTelefone, cpfClientes, numero) VALUES
(1, '56073431465', '81923132752'),
(2, '05916352409', '81934214328'),
(3, '59698576452', '81934810657'),
(4, '18533408471', '81920755376'),
(5, '61937963470', '81928753725'),
(6, '95939651496', '81922457584'),
(7, '91640502467', '81929858235'),
(8, '14777673472', '81939426783'),
(9, '21981861440', '81935125851'),
(10, '30163103410', '81921712824'),
(11, '54263823469', '81926856681');

-- ALTER TABLE telefone AUTO_INCREMENT = 1;

-- ---------------------------------------------------------------------------------------------

-- select * from carro;
-- delete from carro;

insert into carro (idCarro, codRenavam, fabricante, modelo, ano, cpfClientes, placa) VALUES 
(1, 49192478411, "ASTON MARTIN", "Rapide 6.0 V12 477cv", 2012, '56073431465', "KFO8252"),
(2, 81608040394, "Renault", "SANDERO TechRun Hi-Flex 1.0 16V 5p", 2014, '05916352409', "KFV7359"),
(3, 03588979362, "LAMBORGHINI", "AVENTADOR LP 700-4", 2012, '59698576452', "KKN6675"),
(4, 66608666087, "Wake", "Way 1.8 Total Flex 8V Mec.", 2009, '18533408471', "KMD6673"),
(5, 55272979349, "Fibravan", "Buggy Off Road 1.8 8V", 2009, '61937963470', "KIK5267"),
(6, 22730114237, "Volvo", "XC 90 T-6 MOMENTUM 2.0 320cv 5P", 2016, '95939651496', "KLN8168"),
(7, 30707572861, "RELY", "PICK-UP Q22B CS 1.0 2p", 2012, '91640502467', "KJA6471"),
(8, 09111271162, "LAMBORGHINI", "Gallardo Spyder Performante LP570-4", 2012, '14777673472', "KKU6232"),
(9, 21211260153, "Mahindra", "PIK-UP CS 2.2 4X4 (diesel) Mec.", 2013, '21981861440', "KLN7479"),
(10, 73726237685, "Cross Lander", "CL-330 2.8 132cv 4x4 TB Int. Diesel", 2006, '30163103410', "KFG2171"),
(11, 08734294846, "Acura", "NSX 3.0", 1991, '54263823469', "KJJ7342");

-- ALTER TABLE carro AUTO_INCREMENT = 1;

-- ---------------------------------------------------------------------------------------------

-- select * from ocorrencia;
-- delete from ocorrencia;

insert into ocorrencia (idOcorrencia, descricao, bairroLocal, cidadeLocal, ruaLocal, cepLocal, data) VALUES 
(1, "Dirigir sem atenção ou sem os cuidados indispensáveis à segurança", "Prado", "Recife", "Rua Caratinga", 50720425, '2022-05-23'),
(2, "Estacionar veículo afastado de 50 centímetros a 1 metro do meio-fio", "Triunfo", "Igarassu", "Rua Santa Cruz do Capibaribe", 53625758, '2022-04-30'),
(3, "Estacionar veículo nos acostamentos, salve motivo de força maior", "Kennedy", "Caruaru", "Rua Quinze de Janeiro", 55036200, '2022-05-19'),
(4, "Parar o veículo afastado de 50 centímetros a 1 metro do meio-fio", "COHAB", "Recife", "Rua São Jorge", 51270710, '2022-09-18'),
(5, "Parar o veículo em desacordo com as posições estabelecidas no CTB", "João Mota", "Caruaru", "Rua Cláudio Coutinho", 55010075, '2022-03-15'),
(6, "Parar o veículo na calçada ou faixa de pedestres", "Monte", "Olinda", "Rua Mosteiro do Monte", 53240690, '2022-08-23'),
(7, "Ultrapassar veículo em movimento que integre cortejo, préstito, desfile e formações militares", "Topázio", "Petrolina", "Rua Tanzânia", 56325100, '2022-07-30'),
(8, "Usar luz alta dos faróis em vias com iluminação pública", "Santo Amaro", "Recife", "Rua Guabiraba", 50110830, '2022-06-21'),
(9, "Usar buzina em desacordo com os padrões e frequências estabelecidas pelo Contran", "Santa Luzia", "Gravatá", "Rua Quinze", 55641488, '2022-02-15'),
(10, "Conduzir veículo sem os documentos de porte obrigatório (CNH e CRLV)", "Fragoso", "Paulista", "Rua D2", 53402603, '2022-02-18'),
(11, "Deixar de atualizar o cadastro de registro do veículo ou de habilitação do condutor", "Jardim Jordão", "Jaboatão dos Guararapes", "Rua Manoel Pampoula", 54315205, '2022-09-17');

insert into possui (idCarro, idOcorrencia) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11);

 -- select * from possui;
-- delete from possui;

insert into ocorrencia (idOcorrencia, descricao, bairroLocal, cidadeLocal, ruaLocal, cepLocal, data) values
(12, "Conduzir veículo sem os documentos de porte obrigatório (CNH e CRLV)", "Boa Vista", "Arcoverde", "Rua U", 56519310, '2022-01-26');

insert into possui (idCarro, idOcorrencia) values (2, 12);