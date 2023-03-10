-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema companhiadesegurosautomotivo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema companhiadesegurosautomotivo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `companhiadesegurosautomotivo` DEFAULT CHARACTER SET utf8 ;
USE `companhiadesegurosautomotivo` ;

-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Clientes` (
  `cpf` VARCHAR(14) NOT NULL,
  `rg` VARCHAR(15) NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cepEndereco` VARCHAR(15) NOT NULL,
  `ruaEndereco` TEXT(100) NULL,
  `bairroEndereco` TEXT(50) NOT NULL,
  `numeroEndereco` VARCHAR(10) NULL,
  `cidadeEndereco` TEXT(50) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `cpfClientes` VARCHAR(14) NOT NULL,
  `numero` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `CPF_clientes_idx` (`cpfClientes` ASC) VISIBLE,
  CONSTRAINT `cpf_clientes`
    FOREIGN KEY (`cpfClientes`)
    REFERENCES `companhiadesegurosautomotivo`.`Clientes` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Carro` (
  `idCarro` INT NOT NULL AUTO_INCREMENT,
  `codRenavam` VARCHAR(12) NOT NULL,
  `fabricante` TEXT(100) NOT NULL,
  `modelo` TEXT(50) NOT NULL,
  `ano` INT NOT NULL,
  `cpfClientes` VARCHAR(14) NOT NULL,
  `placa` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCarro`),
  INDEX `CPF_clientes_idx` (`cpfClientes` ASC) VISIBLE,
  CONSTRAINT `cpfClientes`
    FOREIGN KEY (`cpfClientes`)
    REFERENCES `companhiadesegurosautomotivo`.`Clientes` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Ocorrencia` (
  `idOcorrencia` INT NOT NULL AUTO_INCREMENT,
  `descricao` TEXT(500) NOT NULL,
  `bairroLocal` TEXT(50) NOT NULL,
  `cidadeLocal` TEXT(50) NOT NULL,
  `ruaLocal` TEXT(50) NOT NULL,
  `cepLocal` VARCHAR(15) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`idOcorrencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companhiadesegurosautomotivo`.`Possui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `companhiadesegurosautomotivo`.`Possui` (
  `idCarro` INT NOT NULL,
  `idOcorrencia` INT NOT NULL,
  PRIMARY KEY (`idCarro`, `idOcorrencia`),
  INDEX `data_ocorrencia_idx` (`idOcorrencia` ASC) VISIBLE,
  CONSTRAINT `id_carro`
    FOREIGN KEY (`idCarro`)
    REFERENCES `companhiadesegurosautomotivo`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_ocorrencia`
    FOREIGN KEY (`idOcorrencia`)
    REFERENCES `companhiadesegurosautomotivo`.`Ocorrencia` (`idOcorrencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- SET SQL_SAFE_UPDATES = 1;
-- SET SQL_SAFE_UPDATES = 0;


-- select * from clientes;
-- delete from clientes;

insert into clientes (cpf, rg, nome, cepEndereco, ruaEndereco, bairroEndereco, numeroEndereco, cidadeEndereco) 
VALUES 	
('56073431465', '252226859', "Davi Lucas Peixoto", '55644162', "Rua Jos?? Candido do Amaral", "Cruzeiro", 69, "Gravat??"),
('05916352409', '419859226', "Juliana Nogueira", '53401250', "Pra??a Frederico Lundgren", "Centro", 96, "Paulista"),
('59698576452', NULL, "Isis Arag??o", '53423290', "Rua Presidente Costa e Silva", "Engenho Maranguape", 70, "Paulista"),
('18533408471', '217945843', "Breno Lopes", '56316818', "Rua Maria Jos?? da Silva", "Jo??o de Deus", 23, "Petrolina"),
('61937963470', null, "Cau?? da Mata", '54170010', "Rua Doutor Louren??o de S??", "Socorro", 34, "Jaboat??o dos Guararapes"),
('95939651496', '254104095', "Larissa da Rocha", '56321710', "Rua Brom??lia", "Ant??nio Cassimiro", 56, "Petrolina"),
('91640502467', '144429123', "Enzo Silva", '55291854', "Rua Educador Paulo Freire", "Francisco Sim??o dos Santos Figueira", 51, "Garanhuns"),
('14777673472', '359820414', "Fernanda Alves", '56320095', "Rua Rio Pontal", "Jos?? e Maria", 68, "Petrolina"),
('21981861440', null, "Maysa Ribeiro", '54315455', "Rua Alto S??o Louren??o", "Jardim Jord??o", 90, "Jaboat??o dos Guararapes"),
('30163103410', '470135025', "Enrico Pinto", '53250040', "Avenida Coronel Jo??o Melo Moraes", "Fragoso", 343, "Olinda"),
('54263823469', '693571578', "Danilo Freitas", '52291334', "Rua Maria da F??", "Passarinho", 22, "Recife");

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
(1, "Dirigir sem aten????o ou sem os cuidados indispens??veis ?? seguran??a", "Prado", "Recife", "Rua Caratinga", 50720425, '2022-05-23'),
(2, "Estacionar ve??culo afastado de 50 cent??metros a 1 metro do meio-fio", "Triunfo", "Igarassu", "Rua Santa Cruz do Capibaribe", 53625758, '2022-04-30'),
(3, "Estacionar ve??culo nos acostamentos, salve motivo de for??a maior", "Kennedy", "Caruaru", "Rua Quinze de Janeiro", 55036200, '2022-05-19'),
(4, "Parar o ve??culo afastado de 50 cent??metros a 1 metro do meio-fio", "COHAB", "Recife", "Rua S??o Jorge", 51270710, '2022-09-18'),
(5, "Parar o ve??culo em desacordo com as posi????es estabelecidas no CTB", "Jo??o Mota", "Caruaru", "Rua Cl??udio Coutinho", 55010075, '2022-03-15'),
(6, "Parar o ve??culo na cal??ada ou faixa de pedestres", "Monte", "Olinda", "Rua Mosteiro do Monte", 53240690, '2022-08-23'),
(7, "Ultrapassar ve??culo em movimento que integre cortejo, pr??stito, desfile e forma????es militares", "Top??zio", "Petrolina", "Rua Tanz??nia", 56325100, '2022-07-30'),
(8, "Usar luz alta dos far??is em vias com ilumina????o p??blica", "Santo Amaro", "Recife", "Rua Guabiraba", 50110830, '2022-06-21'),
(9, "Usar buzina em desacordo com os padr??es e frequ??ncias estabelecidas pelo Contran", "Santa Luzia", "Gravat??", "Rua Quinze", 55641488, '2022-02-15'),
(10, "Conduzir ve??culo sem os documentos de porte obrigat??rio (CNH e CRLV)", "Fragoso", "Paulista", "Rua D2", 53402603, '2022-02-18'),
(11, "Deixar de atualizar o cadastro de registro do ve??culo ou de habilita????o do condutor", "Jardim Jord??o", "Jaboat??o dos Guararapes", "Rua Manoel Pampoula", 54315205, '2022-09-17');

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
(12, "Conduzir ve??culo sem os documentos de porte obrigat??rio (CNH e CRLV)", "Boa Vista", "Arcoverde", "Rua U", 56519310, '2022-01-26');

insert into possui (idCarro, idOcorrencia) values (2, 12);



-- 1 Quantos carros fabricados em 2012 t??m ocorr??ncias?

create view carrosFabricadosEm2012ComOcorrencias as
select 
	count(c.ano) "carros de 2012 com ocorrencia",
     
    p.idocorrencia "ocorrencias"	
from possui p inner join carro c on p.idcarro = c.idcarro

where ano = 2012;

-- 2 Quais clientes com carros fabricados em 2014 est??o na companhia?

create view clientesNaCompanhiaComCarrosDe2014 AS
select cl.nome, ca.ano, cl.cpf
from clientes cl inner join carro ca on cl.cpf = ca.cpfclientes
where ano = 2014;

-- 3 Quais s??o os clientes com mais ocorr??ncias?

create view clientesComMaisOcorrencias AS
select 
	concat(cl.nome, ' - ', cl.cpf) "nome e CPF",
	ca.placa, 
    p.idocorrencia "quantidade de ocorrencias", 
    p.idcarro "carro com mais ocorrencias", 
    p.idcarro "id do carro", 
    count(cl.nome) "quantidade de clientes com mais ocorrencias",
    concat(cl.nome, ' - ', cl.cpf) "nome"
from possui p
inner join carro ca on ca.idcarro = p.idcarro
inner join clientes cl on cl.cpf = ca.cpfclientes
where idocorrencia = (select idocorrencia from possui where idocorrencia = 2)
order by 4 desc;


-- 4 Quais s??o os carros com mais ocorr??ncias?

create view carrosComMaisOcorrencias AS
select 
	count(p.idcarro) "quantidade de carro com mais ocorrencias", 
    ca.placa, 
    p.idocorrencia "quantidade de ocorrencias", 
    p.idcarro "id do carro",
    concat(ca.fabricante, ' - ', ca.modelo)
from possui p
inner join carro ca on ca.idcarro = p.idcarro
where idocorrencia = (select idocorrencia from possui where idocorrencia = 2)
order by 1 desc;

-- 5 Qual modelo com mais ocorr??ncia?

create view modeloComMaisOcorrencia AS
select 
	count(p.idcarro) "quantidade de carro com mais ocorrencias", 
      ca.modelo,
    p.idocorrencia "quantidade de ocorrencias", 
    p.idcarro "id do carro"
    
from possui p
inner join carro ca on ca.idcarro = p.idcarro
where idocorrencia = 2
order by 1 desc;
 
-- 6 Quais clientes possuem mais carros?

create view clientesPossuemMaisCarros AS
select 
	count(cl.nome) "quantidade de clientes com mais de 1 carro", 
    cl.nome,
	ca.idcarro 
from clientes cl
inner join carro ca on ca.cpfclientes = cl.cpf
having cl.nome = max(idcarro) 
order by idcarro;
 
-- 7  Quais clientes possuem carros de apenas 1 fabricante?

create view clientesPossuemCarros1Fabricante AS
select count(cl.nome), cl.cpf, count(ca.fabricante)
from clientes cl 
inner join carro ca on ca.cpfclientes = cl.cpf;

-- 8 Quais carros n??o possuem ocorr??ncias?

create view carrosNaoPossuemOcorrencias AS
select ca.idcarro, ca.fabricante, p.idocorrencia
from carro ca
inner join possui p on p.idcarro = ca.idcarro
where ca.idcarro not in (1, 2, 3,4,5,6,7,8,9,10,11,12);

-- 9 Quais clientes possuem mais de 1 carro?

create view clientesPossuemMais1Carro AS
select ca.idcarro, count(*), cl.nome, cl.cpf
from carro ca
inner join clientes cl on ca.cpfclientes = cl.cpf
group by ca.idcarro having count(*)>1;


-- 10 Quais s??o os carros mais antigos com ocorr??ncias?

create view carrosMaisAntigosComOcorrencias AS
select 
	ca.idcarro, 
    concat(ca.fabricante, ' - ', ca.modelo) "fabricante e modelo", 
    min(ca.ano) "ano do carro mais velho", 
    p.idocorrencia
from carro ca
inner join possui p on p.idcarro = ca.idcarro
group by "fabricante e modelo";

-- 11 Quais os carros mais novos com ocorr??ncias?

create view carrosMaisNovosComOcorrencias AS
select 
	ca.idcarro, 
    concat(ca.fabricante, ' - ', ca.modelo) "fabricante e modelo", 
    max(ca.ano) "ano do carro mais velho", 
    p.idocorrencia
from carro ca
inner join possui p on p.idcarro = ca.idcarro
group by "fabricante e modelo"; 

-- 12 Quais carros t??m menos ocorr??ncias?

create view carrosMenosOcorrencia AS
select 
	p.idcarro "id dos carros com menos ocorrencias", 
    ca.placa, 
    p.idocorrencia "quantidade de ocorrencias", 
    p.idcarro "id do carro",
    concat(ca.fabricante, ' - ', ca.modelo)
from possui p
inner join carro ca on ca.idcarro = p.idcarro
where idocorrencia != 12
order by p.idcarro asc; 

-- 13 Cidade com mais ocorr??ncias?

create view cidadeComMaisOcorrencia AS
select 
	count(o.cidadelocal) "quantidade de cidade com mais ocorrencias", 
	o.cidadelocal "cidade", 
    o.idocorrencia, 
    p.idcarro
from ocorrencia o 
inner join possui p on p.idocorrencia = o.idocorrencia
where p.idocorrencia != 12
group by o.cidadelocal
order by "quantidade de cidade com mais ocorrencias";


-- 14 Cidade com menos ocorr??ncias?

create view cidadeComMenosOcorrencia AS
select 
	count(o.cidadelocal) "quantidade de ocorrencias", 
	o.cidadelocal "cidade", 
    o.idocorrencia, 
    p.idcarro
from ocorrencia o 
inner join possui p on p.idocorrencia = o.idocorrencia
group by o.cidadelocal
having max(p.idocorrencia)
order by "quantidade de ocorrencias";


-- 15 Clientes com mais de 1 telefone?

create view clientesComMais1Telefone AS
select numero, count(*)
from telefone
group by numero
having count(*)>1; 


-- 16 Data de ocorr??ncia de n??mero 12?

create view DataOcorrenciaNumero12 AS
select 
	o.data,
    p.idocorrencia
from ocorrencia o
inner join possui p on p.idocorrencia = o.idocorrencia
where p.idocorrencia = 12;


-- 17 Modelos de carros com menos ocorr??ncias?

create view modeloCarroMenosOcorrencia AS
select 
	count(p.idcarro) "quantidade de ocorrencias", 
      ca.modelo,
    p.idocorrencia "id de ocorrencias", 
    p.idcarro "id do carro"
    
from possui p
inner join carro ca on ca.idcarro = p.idcarro
where idocorrencia != 12
group by ca.modelo
order by 1 desc;

-- 18 Quais clientes possuem ocorr??ncias em Recife?

create view clientesQuePossuemOcorrenciaRecife AS
select cl.nome, cl.cpf, ca.idcarro, p.idocorrencia, o.cidadelocal
from clientes cl
inner join carro ca on ca.cpfclientes = cl.cpf
inner join possui p on p.idcarro = ca.idcarro
inner join ocorrencia o on o.idocorrencia = p.idocorrencia
where o.cidadelocal in (select cidadelocal from ocorrencia where cidadelocal = "Recife") ;

-- 19 Quais clientes possuem ocorr??ncias em Paulista? 

create view clientesQuePossuemOcorrenciaPaulista AS
select cl.nome, cl.cpf, ca.idcarro, p.idocorrencia, o.cidadelocal
from clientes cl
inner join carro ca on ca.cpfclientes = cl.cpf
inner join possui p on p.idcarro = ca.idcarro
inner join ocorrencia o on o.idocorrencia = p.idocorrencia
where o.cidadelocal in (select cidadelocal from ocorrencia where cidadelocal = "Paulista");


-- 20 Quais clientes possuem Lamborghini?

create view clientesQuePossuemLambo AS
select cl.nome, cl.cpf, ca.fabricante
from clientes cl
inner join carro ca on ca.cpfclientes = cl.cpf
where ca.fabricante in (select fabricante from carro where fabricante = "lamborghini");
