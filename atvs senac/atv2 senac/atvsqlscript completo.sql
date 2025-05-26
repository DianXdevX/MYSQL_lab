create database  tempkart ;
use   tempkart ;

create table  temporada (
id  int not null   primary key auto_increment,
numero int  not null );


create table Etapa (
idETAPA int not null  auto_increment , 
localizacao varchar(100),
dat  date,
hora  varchar(45),
temporada  int ,
primary key (idETAPA ),
CONSTRAINT fk_temporada foreign key  (temporada) references temporada (id)
);

create table  patrocinio (
idpatrocinio  int  not null auto_increment primary key,
nomepatrocinio  varchar(45)

);

create table  equipe (
idequipe int  not null primary key auto_increment,
nome  varchar(100),
patrocinio int  null,
constraint fk_patrocinio  foreign key (patrocinio) references  patrocinio (idpatrocinio )
);





create table  piloto (
idpiloto  int, 
nome  varchar(150),
peso float,
capitao tinyint,
equipe  int  not NULL ,
nacionalidade  varchar(40),
constraint fk_equipe  foreign key(equipe) references equipe (idequipe)

);

create table  etapa_has_piloto(
etapa_idtapa int  not null ,
piloto_idpilot int not null,
PRIMARY KEY (etapa_idtapa, piloto_idpilot), 
constraint FK_etapapiloto  foreign key(etapa_idtapa) references Etapa (idETAPA),
constraint FK_pilotoetapa  foreign key(piloto_idpilot) references piloto (idpiloto)
);

alter table piloto  
modify idpiloto int primary key;

insert into temporada (id,numero) 
values (1,1);

insert into  etapa
values
(2,'Rio de Janeiro ','2024-2-20','16:00:00',1),
(3,'Campo grande ','2024-3-18','15:00:00',1),
(4,'Londrina ','2024-4-22','13:00:00',1),
(5,'Porto alegre ','2024-5-10','10:00:00',1);

insert into  patrocinio 
values
(1, 'MotorTech Brasil '),
(3,' Velocidade Extrema '),
(4,' Alta Performance  '),
(5,'  Turbo Racing '),
(6,'   Pneus ProDrive ');

insert into  equipe
values
(1,'Escuderia Veloz',1),
(2,'Rápidos & Furiosos',3),
(3,' Fênix Racing ',4),
(4,'Equipe Tempestade',5),
(5,'Corredores de Aço',6);
insert into  piloto
values
(1,'Lucas Andrade',70.5,1,1,'Brasil'),
(2,'Renato Figueiredo',75,0,1,'Brasil'),
(3,'Mateus Silva',68,0,2,'Brasil'),
(4,'Burno Almeida',78.3,1,2,'Brasil'),
(5,'Carla Pereira',60,1,3,'Brasil'),
(6,'Gabriela Torres',58.5,0,3,'Brasil'),
(7,'João Costa',80.5,0,4,'Brasil'),
(8,'Thiago Santos',72.5,0,4,'Brasil'),
(9,'Mariana Gomes ',62,1,5,'Brasil'),
(10,'Beatriz Lopes',63.2,1,5,'Brasil');
insert into etapa_has_piloto
values
(1,1),(1,3),(1,5),(1,7),(1,9),(1,2),(1,4),(1,6),(1,8),(1,10);

select * from piloto;
SET SQL_SAFE_UPDATES = 0;


UPDATE etapa
SET localizacao = 'Salvador'
WHERE idETAPA = 3;

UPDATE etapa
SET localizacao = 'Goiânia'
WHERE idETAPA = 4;

update equipe
SET patrocinio = null
WHERE idequipe = 5;

