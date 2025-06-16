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

INSERT INTO player VALUES
(default,1,2,0,2,'Alto do Olho Verde','Comum, Élfico',0,'Elfo Verde'),
(default,2,3,1,1,'Baixo do Cabelo Prateado','Anão, Comum',0,'Anão Prateado'),
(default,3,4,0,3,'Cicatriz na Face Esquerda','Élfico, Silvestre',0,'Elfo Cicatriz'),
(default,1,1,1,2,'Tatuagem de Dragão no Braço','Comum',0,'Guerreiro Dragão'),
(default,4,2,0,4,'Olhos Vermelhos Brilhantes','Élfico',0,'Elfo Rubro'),
(default,2,5,1,1,'Chifre Quebrado','Dracônico, Comum',0,'Draconato Quebrado'),
(default,3,3,0,3,'Cabelo Azul Luminoso','Comum',0,'Mago Azul'),
(default,4,4,1,2,'Pele Escamada','Élfico, Comum',0,'Elfo Escama'),
(default,1,5,0,4,'Olho Cego Esquerdo','Comum',0,'Veterano Cego'),
(default,2,1,1,1,'Cicatriz no Peitoral','Élfico',0,'Elfo Guerreiro'),
(default,3,2,0,3,'Braço Mecânico','Anão, Comum',0,'Anão Mecânico'),
(default,4,3,1,2,'Orelhas Alongadas','Comum, Dracônico',0,'Mestiço Longo'),
(default,1,4,0,4,'Pele Pálida como Neve','Comum',0,'Fantasma Branco'),
(default,2,2,1,1,'Dente Canino Saltado','Élfico, Comum',0,'Elfo Lupino'),
(default,3,5,0,2,'Cabelo Dourado','Comum',0,'Mago Dourado'),
(default,4,1,1,3,'Olhos Amarelos de Fera','Élfico, Anão',0,'Fera Selvagem'),
(default,1,3,0,4,'Garras Afiadas','Comum',0,'Predador'),
(default,2,4,1,2,'Cauda Longa','Élfico',0,'Caudato'),
(default,3,1,0,3,'Chifres Retorcidos','Comum, Dracônico',0,'Bode Negro'),
(default,4,5,1,4,'Asas Negras Pequenas','Comum',0,'Anjo Caído'),
(default,1,2,0,1,'Rosto Coberto de Escamas','Anão, Comum',0,'Reptiliano'),
(default,2,3,1,2,'Cabelo Verde Musgo','Élfico, Comum',0,'Elfo Musgo'),
(default,3,4,0,3,'Mão Direita com Runas','Comum',0,'Runico'),
(default,4,2,1,4,'Olho de Cristal Azul','Anão, Comum',0,'Olho Azul'),
(default,1,5,0,2,'Cicatriz Cruzada no Rosto','Élfico, Comum',0,'Veterano Cruzado');

INSERT INTO classes VALUES
(3, '8', 'Usuário de magia arcana que altera a realidade.', 'Bardo'),
(4, '12', 'Combatente corpo a corpo resistente.', 'Bárbaro'),
(5, '8', 'Especialista em truques e furtividade.', 'Bruxo'),
(6, '6', 'Usuário de magia das sombras e pactos.', 'Feiticeiro'),
(7, '8', 'Lançador divino, protetor e curandeiro.', 'Clérigo'),
(8, '8', 'Caçador, arqueiro e perito em sobrevivência.', 'Patrulheiro'),
(9, '10', 'Especialista em combate com armas.', 'Guerreiro'),
(10, '8', 'Combina combate e magia arcana.', 'Paladino'),
(11, '6', 'Estudioso das artes arcanas.', 'Mago'),
(12, '8', 'Ágil, especialista em golpes furtivos.', 'Ladino'),
(13, '8', 'Transforma-se em animais e conjura magias da natureza.', 'Druida'),
(14, '10', 'Guerreiro ágil e preciso.', 'Monge'),
(15, '8', 'Combina magia com combate físico.', 'Bruxo (Warlock)');


INSERT INTO itens (nome, desscricao, peso) VALUES
('Espada Longa', 'Uma espada de uma mão, comum entre guerreiros.', 3),
('Poção de Cura', 'Recupera 2d4 + 2 pontos de vida.', 0),
('Arco Longo', 'Arma de longo alcance, ideal para arqueiros.', 2),
('Flechas (20)', 'Vinte flechas padrão para uso com arcos.', 1),
('Machado de Batalha', 'Arma pesada, usada com uma ou duas mãos.', 4),
('Escudo', 'Aumenta a Classe de Armadura em +2.', 6),
('Túnica de Aventureiro', 'Roupa resistente, usada por viajantes.', 4),
('Tocha', 'Ilumina uma área por uma hora.', 1),
('Corda (15 metros)', 'Essencial para escalar ou amarrar.', 5),
('Kit de Herborismo', 'Ferramentas para coletar e preparar ervas.', 3),
('Livro de Magia', 'Contém magias aprendidas por magos.', 3),
('Adaga', 'Arma leve e arremessável.', 1),
('Martelo de Guerra', 'Arma poderosa usada por clérigos e guerreiros.', 5),
('Tranca de Mão', 'Usada para prender alguém ou algo.', 1),
('Ração de Viagem (1 dia)', 'Comida suficiente para um dia.', 2),
('Frasco de Óleo', 'Pode ser usado para iluminação ou ataque.', 1),
('Saco de Dormir', 'Permite descanso confortável.', 5),
('Cantil', 'Recipiente para água.', 2),
('Mapa Antigo', 'Mostra localizações esquecidas.', 0),
('Anel Mágico', 'Concede bônus ou habilidades especiais.', 0),
('Cajado Arcano', 'Foco mágico para conjuradores.', 4),
('Grimório', 'Contém magias e rituais secretos.', 3),
('Botas Élficas', 'Permitem passos silenciosos.', 1),
('Poção de Invisibilidade', 'Torna o usuário invisível por 1 hora.', 0),
('Pedra do Mensageiro', 'Permite enviar mensagens mágicas.', 0);



INSERT INTO inventario (itens, peso, idplayer, quantitade ) VALUES
(3, 3, 1, 1),
(4, 0, 2, 3),
(5, 2, 3, 1),
(6, 1, 1, 2),
(7, 4, 4, 1),
(8, 6, 2, 1),
(9, 4, 1, 1),
(10, 1, 3, 4),
(11, 5, 5, 1),
(12, 3, 2, 1),
(13, 3, 4, 1),
(14, 1, 1, 2),
(15, 5, 3, 1),
(16, 1, 4, 2),
(17, 2, 2, 5),
(18, 1, 5, 2),
(19, 5, 3, 1),
(20, 2, 1, 1),
(21, 0, 4, 1),
(22, 0, 5, 1),
(23, 4, 1, 1),
(24, 3, 2, 1),
(25, 1, 3, 1),
(26, 0, 4, 1),
(27, 0, 5, 1);


select *from  playerhasclass;

delete  from  playerhasclass 
where  idplayer = 1 ; 
  




delete from classes  
where  idclase  <3 ;


DESCRIBE  inventario  ;

INSERT INTO playerhasclass (idplayer, idclass) VALUES
(1, 3),
(1, 7),
(2, 4),
(3, 5),
(4, 6),
(5, 3),
(6, 8),
(6, 12),
(7, 10),
(8, 11),
(9, 9),
(10, 13),
(11, 14),
(12, 5),
(13, 6),
(14, 4),
(15, 3),
(16, 15),
(17, 11),
(18, 7),
(19, 8),
(20, 12),
(21, 13),
(22, 10),
(23, 9);
