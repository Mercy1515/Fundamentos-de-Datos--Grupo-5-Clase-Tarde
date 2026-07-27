use db_jardineria;
go

-- selecciones con where, buscar registros con valores nulos
select nombre_cliente, ciudad, region from cliente
where region is null;

-- empleados que no tiene jefe asignado--

select nombre, apellido1, codigo_jefe from empleado
where codigo_jefe is null;


--pedidos que aun no ha sido entregados--
select codigo_pedido, fecha_pedido, fecha_entrega from pedido
where fecha_entrega is null

--clientes que si tienen limite de credito--
select nombre_cliente, limite_credito from cliente
where limite_credito is not null;

-- oficina que tienen una segunda dirección--
select ciudad, linea_direccion2 from oficina
where linea_direccion2 is not null;

--reemplazar valores null con COALESCE ( Sirve para mostrar otro valor cuando aparece null)--
select nombre_cliente,
coalesce (region,'sin region') as region from cliente;
go

--mostrar "no tiene jefe" cuando el empleado no tenga jefe con COALESCE ( Sirve para mostrar otro valor cuando aparece null)--
select nombre, apellido1, apellido2,
coalesce ( cast (codigo_jefe as varchar), 'no tiene' ) as jefe from empleado;
go
