create table JOGADOR (
ID  INT  primary key ,
NOME VARCHAR(45) NOT NULL ,
NUMERO   INT  NOT NULL,
TECNICAONE INT,
TECNICATWO  INT
);
alter table  jogador
add column id  int  primary key  auto_increment FIRST  ;

alter table  jogador 
modify tecnicaone  varchar (45),
modify tecnicatwo  varchar (45);

describe JOGADOR;
 insert into jogador
 values
(default,'Goenji',15,'furacaodefogo','tempestadedefogo'),
(default,'Fubiki',11,'Lobolegendario','Vendavaleterno'),
(default,'Endou',1,'MaodeDeus','Punhodefogo');

describe  jogador ;
 
 select * from jogador ; 
 create table  Times(
 id int  primary key   auto_increment  not null ,
 nome  varchar (50) not null,
 menbros int 
 );
