-- 1 Quantos carros fabricados em 2012 têm ocorrências?

create view carrosFabricadosEm2012ComOcorrencias as
select 
	count(c.ano) "carros de 2012 com ocorrencia",
     
    p.idocorrencia "ocorrencias"	
from possui p inner join carro c on p.idcarro = c.idcarro

where ano = 2012;

-- 2 Quais clientes com carros fabricados em 2014 estão na companhia?

create view clientesNaCompanhiaComCarrosDe2014 AS
select cl.nome, ca.ano, cl.cpf
from clientes cl inner join carro ca on cl.cpf = ca.cpfclientes
where ano = 2014;

-- 3 Quais são os clientes com mais ocorrências?

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


-- 4 Quais são os carros com mais ocorrências?

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

-- 5 Qual modelo com mais ocorrência?

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

-- 8 Quais carros não possuem ocorrências?

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


-- 10 Quais são os carros mais antigos com ocorrências?

create view carrosMaisAntigosComOcorrencias AS
select 
	ca.idcarro, 
    concat(ca.fabricante, ' - ', ca.modelo) "fabricante e modelo", 
    min(ca.ano) "ano do carro mais velho", 
    p.idocorrencia
from carro ca
inner join possui p on p.idcarro = ca.idcarro
group by "fabricante e modelo";

-- 11 Quais os carros mais novos com ocorrências?

create view carrosMaisNovosComOcorrencias AS
select 
	ca.idcarro, 
    concat(ca.fabricante, ' - ', ca.modelo) "fabricante e modelo", 
    max(ca.ano) "ano do carro mais velho", 
    p.idocorrencia
from carro ca
inner join possui p on p.idcarro = ca.idcarro
group by "fabricante e modelo"; 

-- 12 Quais carros têm menos ocorrências?

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

-- 13 Cidade com mais ocorrências?

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


-- 14 Cidade com menos ocorrências?

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


-- 16 Data de ocorrência de número 12?

create view DataOcorrenciaNumero12 AS
select 
	o.data,
    p.idocorrencia
from ocorrencia o
inner join possui p on p.idocorrencia = o.idocorrencia
where p.idocorrencia = 12;


-- 17 Modelos de carros com menos ocorrências?

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

-- 18 Quais clientes possuem ocorrências em Recife?

create view clientesQuePossuemOcorrenciaRecife AS
select cl.nome, cl.cpf, ca.idcarro, p.idocorrencia, o.cidadelocal
from clientes cl
inner join carro ca on ca.cpfclientes = cl.cpf
inner join possui p on p.idcarro = ca.idcarro
inner join ocorrencia o on o.idocorrencia = p.idocorrencia
where o.cidadelocal in (select cidadelocal from ocorrencia where cidadelocal = "Recife") ;

-- 19 Quais clientes possuem ocorrências em Paulista? 

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