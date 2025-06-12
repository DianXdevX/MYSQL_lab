create database GMA ;
create table itens (
iditens  int  primary key  auto_increment,
nome varchar(100),
desscricao varchar (255),
peso  int

) ;
create table inventario (
id  int  primary key  auto_increment,
itens int ,
peso  int,
idplayer int,
quantitade int, 
foreign key(itens) references itens(iditens)
) ;
create table player (
id  int  primary key  auto_increment,
nivel  int ,
raca int,
 experiencia int,
aliamento int, 
caracteristicas varchar(255),
idiomas varchar (255),
inspiracao int

); 
alter table inventario  
ADD CONSTRAINT fk_player 
foreign key(idplayer) references player(id);

create table  classes (
idclase  int primary key  auto_increment , 
dado  int , 
descricao  varchar(255 )
);


create table  playerhasclass  (
idplayer  int , 
idclass  int ,
foreign key (idplayer) references player(id),
foreign key(idclass)references classes(idclase) 
);

insert into  itens
values 
(default,'Potion of Speed ', 'When you drink this potion, you gain the effect of the haste spell for 1 minute ', 0 ),
(default,'Poção de Sangue Anão ', ' ganhe  +1 para interagir com  anoes', 0 );

alter table  classes 
add  column  nome  varchar(45);

insert into classes 
values
(default,10,'O Guerreiro é um mestre do combate armado e da técnica marcial, capaz de enfrentar qualquer inimigo com força, resistência e versatilidade em batalha','Guerreiro');

delete  from  itens   
where iditens = 1 ;

alter table player
modify inspiracao tinyint;


insert into player 
values
(default,1,2,0,2,'alto do olho verde','comun , elfico ',0);


describe player ;

insert into playerhasclass 
values 
(1,1);

insert into inventario 
values (default,2,0,1,10);



alter  table playerhasclass  
add constraint playerhasclass_ibfk_2
foreign key (idclass) references classes(idclase);



alter table player 
add column nome varchar(45);
 
select * from  inventario ;
describe  playerhasclass ;

select  player.nome, classes.nome , inventario.quantitade, itens.nome from  playerhasclass join player
on playerhasclass.idplayer = player.id
join classes
on playerhasclass.idclass = classes.idclase
join inventario 
on player.id = inventario.idplayer
join itens
on inventario.itens = itens.iditens
  ;
insert into classes 
values 
(default, 6 ,  'domina os elementos' , 'mago' ) ;

insert into  playerhasclass 
values 
(1,2);


select *from playerhasclass ;

update player 
set  nome  ='pablito'
where id = 1;

