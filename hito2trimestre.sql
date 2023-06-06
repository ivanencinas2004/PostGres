select * from datos_encuestas.provincia;
-- 4 --
select *,(sonido+imagen+usabilidad)/3 as media from encuestas;

-- 5 --
select *,(sonido+imagen+usabilidad)/3 as media from encuestas
INNER JOIN PROVINCIA
ON ENCUESTAs.CODPROV = PROVINCIA.CODPROV;

-- 6--
select PROVINCIA.CODPROV, NOMBRE, AVG(SONIDO)AS MEDIA_SONIDO,  
AVG(IMAGEN)AS MEDIA_IMAGEN, 
AVG(USABILIDAD)AS MEDIA_USABILIDAD from encuestas
INNER JOIN PROVINCIA
ON ENCUESTAs.CODPROV = PROVINCIA.CODPROV
GROUP BY NOMBRE;
-- 7--
select PROVINCIA.CODPROV, NOMBRE, AVG(SONIDO)AS MEDIA_SONIDO,
AVG(IMAGEN)AS MEDIA_IMAGEN, AVG(USABILIDAD)AS MEDIA_USABILIDAD, 
(sonido+imagen+usabilidad)/3 AS MEDIA_TOTAL from encuestas
INNER JOIN PROVINCIA
ON ENCUESTAs.CODPROV = PROVINCIA.CODPROV
GROUP BY NOMBRE order by NOMBRE desc
limit 7;

-- 8--
select PROVINCIA.CODPROV, NOMBRE, AVG(SONIDO)AS MEDIA_SONIDO, 
AVG(IMAGEN)AS MEDIA_IMAGEN, AVG(USABILIDAD)AS MEDIA_USABILIDAD,(sonido+imagen+usabilidad)/3 AS MEDIA_TOTAL from encuestas
INNER JOIN PROVINCIA
ON ENCUESTAs.CODPROV = PROVINCIA.CODPROV
WHERE (sonido+imagen+usabilidad)/3 <= 6
GROUP BY NOMBRE;

-- 9--

select *,(sonido+imagen+usabilidad)/3 as media from encuestas
WHERE  (sonido+imagen+usabilidad)/3= (select MAX((sonido+imagen+usabilidad)/3) from encuestas);

-- 10--
select idencuesta, codprov, sonido, imagen, usabilidad, valoracion(sonido, imagen, usabilidad) as resultado
from encuestas;

select valoracion(sonido, imagen, usabilidad) as resultado, count(*) as cantidad_encuestas
from encuestas
group by resultado;

-- 1 --
create table  encuesta_old like encuestas ;

select * from datos_encuestas.encuesta_old;
delete from datos_encuestas.encuestas where codprov = '20';
