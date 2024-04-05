create database herotech
use herotech
--Tabla cliente--

create table cliente(
   dni char(8) constraint pk_cliente primary key check (dni like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), --llave primaria--
   ApPaterno nvarchar(30),
   ApMaterno nvarchar(30),
   Nombre nvarchar(30),
   FechaNacimiento date,
   Genero nvarchar(10),
   celular varchar(20), check (celular like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR celular LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
   
 )

   --Tabla direccion--
create table direccion(
    Calle nvarchar(30),
    Distrito nvarchar(30),
    Urbanizacion nvarchar(30),
	dni char(8) foreign key references cliente(dni) NOT NULL,
   )

   --Tabla video--
create table video(
	 --ID_Video int constraint pk_video primary key,
	 Fecha_de_grabacion datetime2,
	 Fecha_de_subida datetime2,
	 dni char(8) foreign key references cliente(dni) NOT NULL
	 )
	 
ALTER TABLE video
ADD ID_VIDEO int identity(1,1) constraint pk_video primary key;

--Tabla usuario--
create table usuario(
	username nvarchar(30) constraint pk_usuario primary key,
	contraseña nvarchar(15),
	Fecha_de_registro datetime2,
	Estado nvarchar(40),
	dni char(8) foreign key references cliente(dni) NOT NULL
	)

   --Tabla dispositivo--
   create table dispositivo(
   IMEI int constraint pk_dispositivo primary key,
   Garantia nvarchar(30),
   Tipo_de_dispositivo nvarchar(30),
   Marca nvarchar(20),
   Modelo nvarchar(20),
   Problema nvarchar(100),
   dni char(8) foreign key references cliente(dni) NOT NULL
   )
  
     --Tabla cargo-- 
   create table cargo(
   cod_cargo int constraint pk_cargo primary key,
   sueldo int,
   nombre_cargo nvarchar(30),
 )

      --Tabla colaborador-- 
   create table colaborador(
   cod_colaborador int constraint pk_colaborador primary key,
   cod_cargo int foreign key references cargo(cod_cargo) ,
   ApPaterno NVARCHAR(30),
   ApMaterno NVARCHAR(30),
   Nombre NVARCHAR(30),
   correo varchar(50) check(correo like '%@%'),
   celular int,
)



   --Tabla envio-- 
   create table envio(
   cod_envio int constraint pk_envio primary key,
   tiempo_recorrido int,
   cod_colaborador int foreign key references colaborador(cod_colaborador) NOT NULL,
   IMEI int foreign key references dispositivo(IMEI) NOT NULL
)

   --Tabla recojo--
   create table recojo(
   cod_recojo int constraint pk_recojo primary key,
   tiempo_recorrido int,
   cod_colaborador int foreign key references colaborador(cod_colaborador) NOT NULL,
   IMEI int foreign key references dispositivo(IMEI) NOT NULL
)

   --Tabla diagnostico-- 
   create table diagnostico(
   cod_diagnostico int constraint pk_diagnostico primary key,
   diagnostico nvarchar(120),
   solucion nvarchar(120),
   cod_colaborador int foreign key references colaborador(cod_colaborador) NOT NULL,
   IMEI int foreign key references dispositivo(IMEI) NOT NULL
)





    --Tabla proforma factura--
   create table proformafactura(
   codproforma int constraint pk_proforma primary key,
   descripcion nvarchar(60),
   Estado_de_pago nvarchar(60),
   Tipo_de_servicio nvarchar(45),
   cod_colaborador int foreign key references colaborador(cod_colaborador) NOT NULL,
   IMEI int foreign key references dispositivo(IMEI) NOT NULL
   )

   --tabla pedidos--
   create table pedidos(
   codpedido int constraint pk_pedidos primary key,
   Fecha_de_pedido nvarchar(30),
   Hora_del_pedido nvarchar(30),
   cod_proforma int foreign key references proformafactura(codproforma) NOT NULL,
   cod_diagnostico int foreign key references diagnostico(cod_diagnostico) NOT NULL,
   cod_envio int foreign key references envio(cod_envio) NOT NULL,
   cod_recojo int foreign key references recojo(cod_recojo) NOT NULL
   )

 select * from cliente
 select * from direccion
 select * from video
 select * from usuario
 select * from dispositivo
 select * from colaborador
 select * from cargo
 select * from diagnostico
 select * from envio
 select * from recojo
 select * from proformafactura
 select * from pedidos
 
 drop table cliente
 drop table direccion
 drop table video
 drop table usuario
 drop table dispositivo
 drop table colaborador
 drop table cargo
 drop table diagnostico
 drop table envio
 drop table recojo
 drop table proformafactura
 drop table pedidos

 

 insert cliente values (70442445, 'Ampuero', 'Aldoradin', 'Diego', '19990204', 'masculino', '930745799')
 insert cliente values (10002020, 'Alfaro', 'Alca', 'Jared', '19990204', 'masculino', '930745788')
 insert cliente values (70002121, 'Santoyo', 'Blanca', 'Rosa', '19980204', 'masculino', '930745111')
 insert cliente values (10002222, 'Moran', 'Creek', 'Benjamin', '19970204', 'masculino', '930745222')


 insert direccion values ('otto muller 164', 'san borja', 'las magnolias', 70442445)
 insert direccion values ('bethoveen 222', 'san borja', 'las magnolias', 10002020)
 insert direccion values ('san bartolo 323', 'la molina', 'etapa 3', 70002121)
 insert direccion values ('dali 234', 'san isidro', 'inkas', 10002222)

 insert video values('20221027', '20221028', 70442445)
 insert video values('20221026', '20221027', 10002020)
 insert video values('20221025', '20221026', 70002121)
 insert video values('20221024', '20221025', 10002222)

 --select * from usuario

 insert usuario values('2019015474@gmail.com','cazalmaz008', '20221026', 'OK', 70442445)


 insert dispositivo values(154090234, 'ok','celular','huawei','lite20','bateria no carga', 70442445)
 insert dispositivo values(254091235, 'ok','celular','samsung','galaxyS20','pantalla rota', 10002020)
 insert dispositivo values(364939567, 'no','tablet','xiaomi','opo','camara no funciona', 70002121)
 insert dispositivo values(456899999, 'ok','laptop','hp','omen15','ruido del cooler', 10002222)

 
 --select * from cargo

 insert cargo values(1, 2600, 'tecnico')
 insert cargo values(2, 1600, 'contador')
 insert cargo values(3, 1800, 'driver')
 
 --select * from colaborador


 insert colaborador values(111,1,'huaman','navalles', 'jhonatan', '2017043622@unfv.edu.pe', '963519229')
 insert colaborador values(222,2,'taylor','del valle', 'isaac', '2017043882@unfv.edu.pe', '955519229')
 insert colaborador values(310,3,'bautista','rojas', 'rodrigo', '2017043655@unfv.edu.pe', '944519229')
 insert colaborador values(320,3,'velasco','ortega', 'david', '2017043342@unfv.edu.pe', '941519229')

  select * from recojo 

 insert recojo values(211, 10, 310, 154090234)
 insert recojo values(212, 14, 320, 254091235)
 insert recojo values(213, 32, 320, 364939567)
 insert recojo values(214, 13, 310, 456899999)


 select * from envio

 insert envio values(111, 23, 320, 154090234)
 insert envio values(112, 10, 320, 254091235)
 insert envio values(113, 40, 310, 364939567)



 select * from proformafactura

 select * from proformafactura

 insert proformafactura values(11, 'cambio de bateria', 'cancelado', 'reparacion', 111, 154090234)
 insert proformafactura values(12, 'cambio de pantalla', 'pendiente', 'reparacion', 111, 254091235)
 insert proformafactura values(13, 'cambio de camara', 'pendiente', 'reparacion', 111, 364939567)
 insert proformafactura values(14, 'mantenimiento', 'cancelado', 'mantemiento', 111, 456899999)


 select * from diagnostico

 insert diagnostico values(1001, 'bateria sin celdas', 'nueva bateria', 111, 154090234)
 insert diagnostico values(1002, 'pantalla rota', 'nueva pantalla',  111, 254091235)
 insert diagnostico values(1003, 'camara con agua', 'nueva camara',  111, 364939567)


 select * from pedidos

 insert pedidos values(0001, '20221027', '16:00',  11, 1001, 111, 211)
 insert pedidos values(0002, '20221027', '12:00',  12, 1002, 112, 212)
 insert pedidos values(0003, '20220910', '09:00',  13, 1003, 113, 213)


 --VISTA ACTUALIZABLE
create view vista_dirrecion
as
	select * from direccion 


update	vista_dirrecion set Urbanizacion ='prueba' , calle ='prueba' , distrito= 'prueba' where dni = 70442445

select * from direccion

select * from vista_dirrecion


--STORE PROCEDURE CON PARAMETRO
create proc primer_sp
@dni char(8)
as

	select CL.ApPaterno + ' ' + CL.ApMaterno + ' ' + CL.Nombre as Nombres_apellidos, DI.Urbanizacion, DI.calle, DI.distrito from 
	Cliente as CL inner join Direccion as DI on CL.dni= DI.dni
	where CL.dni = @dni

execute primer_sp @dni = '70442445'



create table cliente(
   dni char(8) constraint pk_cliente primary key check (dni like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), --llave primaria--
   ApPaterno nvarchar(30),
   ApMaterno nvarchar(30),
   Nombre nvarchar(30),
   FechaNacimiento date,
   Genero nvarchar(10),
   celular varchar(20), check (celular like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR celular LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
   
 )

 create table historial(
 fecha date,
 dni char(8),
 celular char(9),
 estado varchar(30),
 usuario varchar(30)
 )

 drop table historial



create trigger update_cliente
on cliente for update
as
declare @dni char(8)
declare @celular char(8)

	select @dni = dni from inserted
	select @celular = celular from inserted
	insert into Historial values(GETDATE(), @dni, @celular, 'Registro Actualizado', SYSTEM_USER)

select * from Historial
select * from cliente

UPDATE Cliente set celular = 9900056 where dni = '70442445'



/*
create trigger delete_cliente
on cliente for delete
as
declare @dni char(8)
declare @celular char(8)

	select @dni = dni from deleted
	select @celular = celular from deleted
	insert into Historial values(GETDATE(), @dni, @celular, 'Registro eliminado', SYSTEM_USER)

delete from direccion where dni = 70442445
delete from cliente where dni = 70442445
*/


 select * from cliente
 select * from direccion
 select * from video
 select * from usuario
 select * from dispositivo
 select * from colaborador
 select * from cargo
 select * from diagnostico
 select * from envio
 select * from recojo
 select * from proformafactura
 select * from pedidos
 

 create proc clientesXmes
 @mes int
 as
	select CL.ApPaterno + ' ' + CL.ApMaterno + ' ' + CL.Nombre as Nombre_Apellidos from
	pedidos as PE inner join proformafactura as PF on PE.cod_proforma = PF.codproforma 
	inner join dispositivo as DI on PF.IMEI = DI.IMEI
	inner join cliente as CL on DI.dni = CL.dni
	where  month(PE.Fecha_de_pedido) = @mes

execute clientesXmes @mes = 10


create view vista_colaborador_datos
as
	select CO.ApPaterno + ' ' + CO.ApMaterno + ' ' + CO.Nombre as Nombre_Apellidos from colaborador as CO

select * from vista_colaborador_datos


--parametro default
alter proc suelo_colaborador
@sueldo money = 2000
as
	Select CO.ApPaterno + ' ' + CO.ApMaterno + ' ' + CO.Nombre as Nombre_Apellidos from 
	colaborador as CO inner join cargo as CA on CO.cod_cargo = CA.cod_cargo
	where CA.sueldo > @sueldo


execute suelo_colaborador @sueldo = 2000

execute suelo_colaborador 




--indices
--cursores
--cascada








