

USE db_jardineria; --- este comando es para usar la base de datos creada: jardineria--
go


select * from cliente;
go 

select count (*) as total_clientes from cliente; -- muestra el total en número de clientes de la tabla, count (*) : muestreme todo
go												--  total_clientes: este nombre es el nombre del encabezado que se mostrara en el resultado, se puede escoger--

select count (limite_credito) as clientes_con_credito from cliente; -- cuenta todo lo que este en la tabla, de cuantos tienen credito
go																	--  clientes_con_credito: este nombre es el nombre del encabezado que se mostrara en el resultado, se puede escoger--

select sum (limite_credito) as total_credito from cliente; -- suma el valor total de la tabla.
go																	--  límite_credito: este nombre es el nombre del encabezado que se mostrara en el resultado, se puede escoger--


select sum (codigo_cliente) as total_codigos_clientes from cliente; -- suma el valor total de la tabla.
go																	--  límite_credito: este nombre es el nombre del encabezado que se mostrara en el resultado, se puede escoger--

select avg (limite_credito) as promedio_credito from cliente;  -- saca el promedio de la tabla de limite de créito.
go																	--  promedio_credito: este nombre es el nombre del encabezado que se mostrara en el resultado, se puede escoger--


select avg (codigo_empleado_rep_ventas) as codigo_empleados from cliente;  -- codigo_empleado_rep_ventas
go																			--  codigo_empleados: este nombre es el nombre del encabezado que se mostrara en el resultado, se puede escoger--

select min (limite_credito) as credito_minimo from cliente;--  muestra el mínimo. el valor proyectado es el minimo de esa tabla.
go               --  credito_minimo: este nombre es el nombre del encabezado que se mostrara en el resultado
go

select min (total) as pago_minimo from pago;  --  muestra el mínimo. el valor proyectado es el minimo de esa tabla.
go               --  pago_minimo: este nombre es el nombre del encabezado que se mostrara en el resultado


select max (limite_credito) as credito_maximo from cliente; --  muestra el maximo. el valor proyectado es el maximo de esa tabla.
go															--  credito_maximo: este nombre es el nombre del encabezado que se mostrara en el resultado


/* use of max, min, count, avg,sum, limite credito*/

select 
max (limite_credito) as max_limite_credito, --  muestra varios resultados en una misma sentencia. 
min (limite_credito) as min_limite_credito,
count (limite_credito) as conteo_limite_credito,
avg (limite_credito) as promedio_credito,
sum (limite_credito) as suma_limite_credito
from cliente;
go


select codigo_cliente, -- esta sentencia selecciona de la tabla de pedido, el total de pedidos y los agrupa por codigo de cliente, pedidos que hayan sido solicitados >5 por los clientes
count (*)
as total_pedidos from pedido
group by codigo_cliente having count (*) > 5;
go


select gama, -- esta sentencia selecciona dos columnas y le pedimos nos lo agrupe, having se utiliza con varias agrupaciones.
avg (precio_venta)  -- sacamos primero el promedio para que el pueda filtrar despues varias agrupaciones con having.
as promedio_precio from producto
group by gama having avg (precio_venta) > 10;
go

select * from producto;
go 

select * from detalle_pedido
go

select codigo_pedido, -- Total de productos vendidos por pedido (solo pedidos grandes)/ all products from detalle_pedido, that has been sold, but just big orders.
sum(cantidad) as total_productos 
from detalle_pedido 
group by codigo_pedido 
having sum(cantidad) > 100;
go

-- clientes por pais ( solo paises con muchos clientes)--

select pais, -- Total de productos vendidos por pedido (solo pedidos grandes)/ all products from detalle_pedido, that has been sold, but just big orders.
count (*)
as total_clientes from cliente
group by codigo_cliente having count (*) > 5;
go


as total_pedidos from pedido --- revisar este en el word y copiarlo correcto--
group by codigo_cliente having count (*) > 5;
go

-- INNER JOIN compara dos tablas y ver la coincidencia, agarrar dos campos de cada tabla y ver donde se juntan o relacionan los dos. debe llevar una letra de referencia--

select 
c.nombre_cliente,
p.codigo_pedido,
p.fecha_pedido
from cliente c inner join pedido p
on c.codigo_cliente = p.codigo_cliente
go

select c.nombre_cliente, p.codigo_pedido, pr.nombre as producto, dp.cantidad
from cliente c
inner join pedido p on c.codigo_cliente = p.codigo_cliente
inner join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
inner join producto pr on dp.codigo_producto = pr.codigo_producto;
go

-- LEFT JOIN: combina filas de dos tablas y devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha, si no hay coincidencias en la tabla derecha el resultado será null en esa segunda tabla--

select c.nombre_cliente, p.codigo_pedido from cliente c  --  from cliente c significa que la tabla principal ( o tabla izquierda) es cliente y la letra c es un alias corto para no escriir todo el nombre de la tabla
left join pedido p   --  pedido p es la tabla derecha, la letra p es su alias
on c.codigo_cliente = p.codigo_cliente;    -- condición de union. vincula ambas tablas utilizando el campo codigo_cliente
go

---

select c.nombre_cliente from cliente c
left join pedido p on c.codigo_cliente= p.codigo_cliente
where p.codigo_pedido is null;
go

---
select p.codigo_pedido, pr.nombre, dp.cantidad
from producto pr right join detalle_pedido dp
on pr.codigo_producto = dp.codigo_producto right join pedido p
on dp.codigo_pedido = p.codigo_pedido;
go