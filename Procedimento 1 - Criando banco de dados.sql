CREATE TABLE Pessoa (
  PessoaID INTEGER   NOT NULL ,
  Nome VARCHAR(100)    ,
  Endereco VARCHAR(100)    ,
  Telefone INTEGER    ,
  TipoPessoa VARCHAR(100)      ,
PRIMARY KEY(PessoaID));




CREATE TABLE Produtos (
  ProdutosID INTEGER   NOT NULL ,
  Nome VARCHAR(100)    ,
  Quantidade INTEGER    ,
  PrecoVenda INTEGER      ,
PRIMARY KEY(ProdutosID));




CREATE TABLE Usuario (
  UsuarioID INTEGER   NOT NULL ,
  Nome VARCHAR(100)    ,
  Email VARCHAR(100)    ,
  Senha VARCHAR(100)      ,
PRIMARY KEY(UsuarioID));




CREATE TABLE PessoaJuridica (
  PessoaJuridicaID INTEGER   NOT NULL ,
  Pessoa_PessoaID INTEGER   NOT NULL ,
  CNPJ INTEGER      ,
PRIMARY KEY(PessoaJuridicaID)  ,
  FOREIGN KEY(Pessoa_PessoaID)
    REFERENCES Pessoa(PessoaID));


CREATE INDEX PessoaJuridica_FKIndex1 ON PessoaJuridica (Pessoa_PessoaID);


CREATE INDEX IFK_Rel_10 ON PessoaJuridica (Pessoa_PessoaID);


CREATE TABLE PessoaFisica (
  PessoaFisicaID INTEGER   NOT NULL ,
  Pessoa_PessoaID INTEGER   NOT NULL ,
  CPF INTEGER      ,
PRIMARY KEY(PessoaFisicaID)  ,
  FOREIGN KEY(Pessoa_PessoaID)
    REFERENCES Pessoa(PessoaID));


CREATE INDEX PessoaFisica_FKIndex1 ON PessoaFisica (Pessoa_PessoaID);


CREATE INDEX IFK_Rel_09 ON PessoaFisica (Pessoa_PessoaID);


CREATE TABLE MovimentoCompra (
  MovimentoCompraID INTEGER   NOT NULL ,
  PessoaJuridica_PessoaJuridicaID INTEGER   NOT NULL ,
  Usuario_UsuarioID INTEGER   NOT NULL ,
  Produtos_ProdutosID INTEGER   NOT NULL ,
  Quantidade INTEGER    ,
  PrecoUnitario INTEGER      ,
PRIMARY KEY(MovimentoCompraID)      ,
  FOREIGN KEY(Produtos_ProdutosID)
    REFERENCES Produtos(ProdutosID),
  FOREIGN KEY(Usuario_UsuarioID)
    REFERENCES Usuario(UsuarioID),
  FOREIGN KEY(PessoaJuridica_PessoaJuridicaID)
    REFERENCES PessoaJuridica(PessoaJuridicaID));


CREATE INDEX MovimentoCompra_FKIndex1 ON MovimentoCompra (Produtos_ProdutosID);
CREATE INDEX MovimentoCompra_FKIndex2 ON MovimentoCompra (Usuario_UsuarioID);
CREATE INDEX MovimentoCompra_FKIndex3 ON MovimentoCompra (PessoaJuridica_PessoaJuridicaID);


CREATE INDEX IFK_Rel_11 ON MovimentoCompra (Produtos_ProdutosID);
CREATE INDEX IFK_Rel_12 ON MovimentoCompra (Usuario_UsuarioID);
CREATE INDEX IFK_Rel_13 ON MovimentoCompra (PessoaJuridica_PessoaJuridicaID);


CREATE TABLE MovimentoVenda (
  MovimentoVendaID INTEGER   NOT NULL ,
  Produtos_ProdutosID INTEGER   NOT NULL ,
  PessoaFisica_PessoaFisicaID INTEGER   NOT NULL ,
  Usuario_UsuarioID INTEGER   NOT NULL ,
  Quantidade INTEGER      ,
PRIMARY KEY(MovimentoVendaID)      ,
  FOREIGN KEY(Usuario_UsuarioID)
    REFERENCES Usuario(UsuarioID),
  FOREIGN KEY(PessoaFisica_PessoaFisicaID)
    REFERENCES PessoaFisica(PessoaFisicaID),
  FOREIGN KEY(Produtos_ProdutosID)
    REFERENCES Produtos(ProdutosID));


CREATE INDEX MovimentoVenda_FKIndex1 ON MovimentoVenda (Usuario_UsuarioID);
CREATE INDEX MovimentoVenda_FKIndex2 ON MovimentoVenda (PessoaFisica_PessoaFisicaID);
CREATE INDEX MovimentoVenda_FKIndex3 ON MovimentoVenda (Produtos_ProdutosID);


CREATE INDEX IFK_Rel_14 ON MovimentoVenda (Usuario_UsuarioID);
CREATE INDEX IFK_Rel_15 ON MovimentoVenda (PessoaFisica_PessoaFisicaID);
CREATE INDEX IFK_Rel_16 ON MovimentoVenda (Produtos_ProdutosID);





