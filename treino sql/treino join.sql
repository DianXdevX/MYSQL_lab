use cadastro;
describe gafanhotos;
select gafanhotos.nome, gafanhotos.nacionalidade, cursos.nome from gafanhotos left  join cursos 
on  cursos.idcurso = gafanhotos.cursando 
order by  gafanhotos.nome;

select  gafanhotos.nome , gafanhotos.altura , cursos.nome from gafanhotos inner join cursos 
on  cursos.idcurso = gafanhotos.cursando
where  altura <1.98
order by gafanhotos.altura ;

alter table gafanhotos
add column cursando  int,
add foreign key (cursando ) references cursos(idcurso);
update gafanhotos set cursando = 2  
 where id <1;