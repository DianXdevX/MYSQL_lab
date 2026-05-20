use cadastro;
describe gafanhotos;
select gafanhotos.nome, gafanhotos.nacionalidade, cursos.nome from gafanhotos left  join cursos 
on  cursos.idcurso = gafanhotos.cursando 
order by  gafanhotos.nome;

select  gafanhotos.nome , gafanhotos.altura , cursos.nome from gafanhotos inner join cursos 
on  cursos.idcurso = gafanhotos.cursando
where  altura <1.98
order by gafanhotos.altura ;

create table gafanhoto_asiste_curso(
id int not null auto_increment,
data date,
idgafanhoto int,  
idcurso int,
primary key (id),
foreign key (idgafanhoto) references gafanhotos(id),
foreign key (idcurso) references cursos(idcurso )
);
insert into gafanhoto_asiste_curso 
values
(default,'2013-01-01','1','2'),
(default,'2013-01-01','2','1'),
(default,'2013-01-01','3','1'),
(default,'2013-01-01','4','3'),
(default,'2013-01-01','5','4');

select g.nome, c.nome  from gafanhotos as g 
join gafanhoto_asiste_curso as a
on g.id = a.idgafanhoto
join cursos  as c
on  c.idcurso = a.idcurso  ;

alter table gafanhotos
add column cursando  int,
add foreign key (cursando ) references cursos(idcurso);
update gafanhotos set cursando = 2  
 where id <1;