select  nome,data_cadastro from usuario  ;

select  nome,data_cadastro from usuario 
where  data_cadastro > '2023-03-01'  ;

select  titulo, preco  from jogo  
where preco >100;

select   nome , ano_fundacao  from desenvolvedora 
where  ano_fundacao  > '2000-12-31' ;


SELECT jogo.titulo, desenvolvedora.nome
FROM jogo 
 join  desenvolvedora on jogo.id_desenvolvedora = desenvolvedora.id
 where  desenvolvedora.nome  like 'Valve Corporation' ;


select avg(preco) from  jogo ;

select sum(jogo.preco) from biblioteca  join usuario
on biblioteca.id_usuario = usuario.id
join  jogo
on biblioteca.id_jogo = jogo.id
where  usuario.nome  like 'Carlos Silva';

select  max(preco)  from  jogo  join desenvolvedora
on   jogo.id_desenvolvedora = desenvolvedora.id 
 where  desenvolvedora.nome  like 'Rockstar Games' ;
 
 select jogo.titulo , categoria.nome from jogocategoria  join categoria 
 on  id_categoria = categoria.id
 join  jogo
  on id_jogo = jogo.id 
  where  categoria.nome like 'RPG';
  
  select  usuario.nome, jogo.titulo  from  biblioteca 
  join usuario 
  on biblioteca.id_usuario = usuario.id
  join  jogo 
  on  biblioteca.id_jogo = jogo.id
  order by  usuario.nome;
  
 select count(id_desenvolvedora) from jogo
 join desenvolvedora
 on  jogo.id_desenvolvedora =  desenvolvedora.id
 where  desenvolvedora.pais   like "EUA";
 
  select id_desenvolvedora , desenvolvedora.pais,desenvolvedora.nome from jogo 
   join desenvolvedora
  on  jogo.id_desenvolvedora =  desenvolvedora.id
 where  desenvolvedora.pais   like "EUA";











