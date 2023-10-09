--Inserindo dados
INSERT INTO Usuario (UsuarioID, Nome, Email, Senha)
VALUES
    (1, 'Primeiro Usuário', 'primeiro@email.com', 'senha1'),
    (2, 'Segundo Usuário', 'segundo@email.com', 'senha2');


INSERT INTO Produtos (ProdutosID, Nome, Quantidade, PrecoVenda)
VALUES
    (1, 'Produto1', 5, 19),
    (2, 'Produto2', 10, 29);

--Consultas
Select * from Usuario;
Select *from Produtos;
Select * from PessoaFisica;
Select * from PessoaJuridica;
Select * from Pessoa;
select * from MovimentoCompra;

--Sequence
create sequence seqID as numeric start with 100 increment by 1;
--Preenchendo tabelas
insert into Pessoa (PessoaID, Nome, Endereco, Telefone) 
values (next value for seqID, 'Caique', 'rua das ruas', '0022224444');

insert into Pessoa (PessoaID, Nome, Endereco, Telefone) 
values (next value for seqID, 'Bait', 'r. Gralha azul', '00666999');

insert into PessoaFisica (PessoaFisicaID, Pessoa_PessoaID, CPF)
values ('100','100', '222666888');

insert into PessoaJuridica (PessoaJuridicaID, Pessoa_PessoaID, CNPJ)
values ('101','101', '333555777');

--Consultas
select Pessoa.PessoaID, Pessoa.Nome, Pessoa.Endereco, Pessoa.Telefone, PessoaFisica.CPF
from Pessoa inner join PessoaFisica on Pessoa.PessoaID = PessoaFisica.Pessoa_PessoaID;

select Pessoa.PessoaID, Pessoa.Nome, Pessoa.Endereco, Pessoa.Telefone, PessoaJuridica.CNPJ
from Pessoa inner join PessoaJuridica on Pessoa.PessoaID = PessoaJuridica.Pessoa_PessoaID;


INSERT INTO MovimentoCompra (MovimentoCompraID,PessoaJuridica_PessoaJuridicaID, Produtos_ProdutosID, Usuario_UsuarioID, Quantidade, PrecoUnitario)
VALUES (1,101,1,1, 2,10);

UPDATE MovimentoCompra
SET Quantidade = Quantidade - 2  WHERE Produtos_ProdutosID = 1;



