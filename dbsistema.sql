USE [dbsistema]
GO
/****** Object:  UserDefinedTableType [dbo].[type_detalle_venta]    Script Date: 09/07/2021 17:14:57 ******/
CREATE TYPE [dbo].[type_detalle_venta] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[stock] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[descuento] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[types_detalle_ingreso]    Script Date: 09/07/2021 17:14:57 ******/
CREATE TYPE [dbo].[types_detalle_ingreso] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[imagen] [varchar](20) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_ingreso]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[idHistorial] [int] IDENTITY(1,1) NOT NULL,
	[idPac] [int] NOT NULL,
	[dtmFechaRegistro] [datetime] NULL,
	[ValorInicial] [decimal](18, 0) NULL,
	[ValorFinal] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_TblGVUAsesoresporAlianzas] PRIMARY KEY CLUSTERED 
(
	[idHistorial] ASC,
	[idPac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pac]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pac](
	[idPac] [int] IDENTITY(1,1) NOT NULL,
	[NIT] [int] NOT NULL,
	[strNombre] [varchar](20) NOT NULL,
	[strDiscripcion] [varchar](50) NULL,
	[Telefono] [varchar](15) NOT NULL,
	[NombreContacto] [varchar](50) NOT NULL,
	[TelContacto] [varchar](15) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[strNombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroComision]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroComision](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPac] [int] NULL,
	[idTransaccion] [int] NULL,
	[Fecha] [datetime] NOT NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaccion](
	[idTransaccion] [int] NOT NULL,
	[idPac] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Valor] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Transaccion] PRIMARY KEY CLUSTERED 
(
	[idTransaccion] ASC,
	[idPac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[id] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Valor] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Transac] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[clave] [varbinary](max) NOT NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idingreso])
REFERENCES [dbo].[ingreso] ([idingreso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Historial]  WITH CHECK ADD FOREIGN KEY([idPac])
REFERENCES [dbo].[pac] ([idPac])
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD FOREIGN KEY([idPac])
REFERENCES [dbo].[pac] ([idPac])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
/****** Object:  StoredProcedure [dbo].[articulo_activar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Activar
create proc [dbo].[articulo_activar]
@idarticulo integer
as
update articulo set estado=1
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_actualizar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Actualizar
create proc [dbo].[articulo_actualizar]
@idarticulo integer,
@idcategoria integer,
@codigo varchar(50),
@nombre varchar(50),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20)
as
update articulo set idcategoria=@idcategoria,codigo=@codigo,
nombre=@nombre,precio_venta=@precio_venta,stock=@stock,
descripcion=@descripcion,imagen=@imagen
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Buscar
create proc [dbo].[articulo_buscar]
@valor varchar(50)
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
where a.nombre like '%' +@valor + '%' Or a.descripcion like '%' +@valor + '%'
order by a.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar_codigo]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[articulo_buscar_codigo]
@valor VARCHAR(50)
AS
SELECT idarticulo,codigo,nombre,precio_venta,stock FROM dbo.articulo
WHERE codigo=@valor
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar_codigo_venta]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[articulo_buscar_codigo_venta]
@valor varchar(50)
as
select idarticulo,codigo,nombre,precio_venta,stock
from articulo
where codigo=@valor and stock>0
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar_venta]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[articulo_buscar_venta]
@valor varchar(50)
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
where (a.nombre like '%' +@valor + '%' Or a.descripcion like '%' +@valor + '%')
and a.stock>0
order by a.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[articulo_desactivar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Desactivar
create proc [dbo].[articulo_desactivar]
@idarticulo integer
as
update articulo set estado=0
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_eliminar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Eliminar
create proc [dbo].[articulo_eliminar]
@idarticulo integer
as
delete from articulo
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_existe]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento existe
create proc [dbo].[articulo_existe]
@valor varchar(100),
@existe bit output
as
if exists (select nombre from articulo where nombre = ltrim(rtrim(@valor)))
	begin
		set @existe=1
	end
else
	begin
		set @existe=0
	end
GO
/****** Object:  StoredProcedure [dbo].[articulo_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
create proc [dbo].[articulo_insertar]
@idcategoria integer,
@codigo varchar(50),
@nombre varchar(100),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20)
as
insert into articulo (idcategoria,codigo,nombre,precio_venta,stock,descripcion,imagen)
values (@idcategoria,@codigo,@nombre,@precio_venta,@stock,@descripcion,@imagen)
GO
/****** Object:  StoredProcedure [dbo].[articulo_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
create proc [dbo].[articulo_listar]
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
order by a.idarticulo desc
GO
/****** Object:  StoredProcedure [dbo].[categoria_activar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Activar
create proc [dbo].[categoria_activar]
@idcategoria int
as
update categoria set estado=1
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_actualizar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Actualizar
create proc [dbo].[categoria_actualizar]
@idcategoria int,
@nombre varchar(50),
@descripcion varchar(255)
as
update categoria set nombre=@nombre,descripcion=@descripcion
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_buscar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Buscar
create proc [dbo].[categoria_buscar]
@valor varchar(50)
as
select idcategoria as ID,nombre as Nombre,descripcion as Descripcion,estado as Estado
from categoria
where nombre like '%' + @valor + '%' Or descripcion like '%' + @valor + '%'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[categoria_desactivar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Desactivar
create proc [dbo].[categoria_desactivar]
@idcategoria int
as
update categoria set estado=0
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_eliminar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Eliminar
create proc [dbo].[categoria_eliminar]
@idcategoria int
as
delete from categoria
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_existe]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[categoria_existe]
@valor varchar(100),
@existe bit output
as
	if exists (select nombre from categoria where nombre = ltrim(rtrim(@valor)))
		begin
		 set @existe=1
		end
	else
		begin
		 set @existe=0
		end
GO
/****** Object:  StoredProcedure [dbo].[categoria_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
create proc [dbo].[categoria_insertar]
@nombre varchar(50),
@descripcion varchar(255)
as
insert into categoria (nombre,descripcion) values (@nombre,@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[categoria_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
create proc [dbo].[categoria_listar]
as
select idcategoria as ID,nombre as Nombre,descripcion as Descripcion,estado as Estado
from categoria
order by idcategoria desc
GO
/****** Object:  StoredProcedure [dbo].[categoria_seleccionar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[categoria_seleccionar]
as
select idcategoria,nombre from categoria
where estado=1
GO
/****** Object:  StoredProcedure [dbo].[comisiones_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
create proc [dbo].[comisiones_insertar]
@idPac INT,
@idTransaccion INT,
@cantidad int
as
insert into RegistroComision (idPac,idTransaccion,Fecha,Cantidad) values (@idPac,@idTransaccion,GETDATE(),@cantidad)
GO
/****** Object:  StoredProcedure [dbo].[ingreso_anular]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ingreso_anular]
@idingreso int
as
update ingreso set estado='Anulado'
where idingreso=@idingreso;
update articulo 
set stock=stock-d.cantidad
from articulo a
inner join
(select idarticulo,cantidad from detalle_ingreso where idingreso=@idingreso) as d
on a.idarticulo=d.idarticulo;
GO
/****** Object:  StoredProcedure [dbo].[ingreso_buscar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ingreso_buscar]
@valor varchar(50)
as
select i.idingreso as ID, i.idusuario,u.nombre as Usuario,p.nombre as Proveedor,
i.tipo_comprobante as Tipo_Comprobante,i.serie_comprobante as Serie,
i.num_comprobante as Numero,i.fecha as Fecha,i.impuesto as Impuesto,
i.total as Total,i.estado as Estado
from ingreso i inner join usuario u on i.idusuario=u.idusuario
inner join persona p on i.idproveedor=p.idpersona
where i.num_comprobante like '%' +@valor + '%' Or p.nombre like '%' +@valor + '%' 
order by i.fecha asc
GO
/****** Object:  StoredProcedure [dbo].[ingreso_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ingreso_insertar]
@idusuario int,
@idproveedor int,
@tipo_comprobante varchar(20),
@serie_comprobante varchar(7),
@num_comprobante varchar(10),
@impuesto decimal(4,2),
@total decimal(11,2),
@detalle  types_detalle_ingreso READONLY
as
begin
	--Insertamos en la cabecera
	insert into ingreso (idproveedor,idusuario,tipo_comprobante,serie_comprobante,
	num_comprobante,fecha,impuesto,total,estado)
	values(@idproveedor,@idusuario,@tipo_comprobante,@serie_comprobante,
	@num_comprobante,getdate(),@impuesto,@total,'Aceptado');
	--Insertar los detalles
	insert detalle_ingreso (idingreso,idarticulo,cantidad,precio)
	select @@IDENTITY,d.idarticulo,d.cantidad,d.precio
	from @detalle d;
end
GO
/****** Object:  StoredProcedure [dbo].[ingreso_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ingreso_listar]
as
select i.idingreso as ID, i.idusuario,u.nombre as Usuario,p.nombre as Proveedor,
i.tipo_comprobante as Tipo_Comprobante,i.serie_comprobante as Serie,
i.num_comprobante as Numero,i.fecha as Fecha,i.impuesto as Impuesto,
i.total as Total,i.estado as Estado
from ingreso i inner join usuario u on i.idusuario=u.idusuario
inner join persona p on i.idproveedor=p.idpersona
order by i.idingreso desc
GO
/****** Object:  StoredProcedure [dbo].[ingreso_listar_detalle]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ingreso_listar_detalle]
@idingreso int
as
select d.idarticulo as ID,a.codigo as CODIGO,a.nombre as ARTICULO,
d.cantidad as CANTIDAD,d.precio as PRECIO,(d.precio*d.cantidad) as IMPORTE
from detalle_ingreso d inner join articulo a on d.idarticulo=a.idarticulo
where d.idingreso=@idingreso
GO
/****** Object:  StoredProcedure [dbo].[inventario_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
CREATE proc [dbo].[inventario_insertar]
@descripcion VARCHAR(250)
as
INSERT INTO dbo.inventario VALUES (@descripcion,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[inventario_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
create proc [dbo].[inventario_listar]
as
SELECT [Descripcion]
      ,[Fecha]
  FROM [dbsistema].[dbo].[inventario]
order by Fecha desc
GO
/****** Object:  StoredProcedure [dbo].[pac_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
CREATE proc [dbo].[pac_listar]
as
SELECT idPac,strNombre FROM pac
order by idPac asc
GO
/****** Object:  StoredProcedure [dbo].[persona_actualizar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_actualizar]
@idpersona integer,
@tipo_persona varchar(20),
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50)
as
update persona set tipo_persona=@tipo_persona,nombre=@nombre,
tipo_documento=@tipo_documento,num_documento=@num_documento,direccion=@direccion,
telefono=@telefono,email=@email
where idpersona=@idpersona
GO
/****** Object:  StoredProcedure [dbo].[persona_buscar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_buscar]
@valor varchar(50)
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where nombre like '%' +@valor + '%' Or email like '%' +@valor + '%'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[persona_buscar_clientes]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_buscar_clientes]
@valor varchar(50)
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where (nombre like '%' +@valor + '%' Or email like '%' +@valor + '%')
and tipo_persona='Cliente'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[persona_buscar_proveedores]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_buscar_proveedores]
@valor varchar(50)
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where (nombre like '%' +@valor + '%' Or email like '%' +@valor + '%')
and tipo_persona='Proveedor'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[persona_eliminar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_eliminar]
@idpersona integer
as
delete from persona
where idpersona=@idpersona
GO
/****** Object:  StoredProcedure [dbo].[persona_existe]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_existe]
@valor varchar(100),
@existe bit output
as
if exists (select nombre from persona where nombre = ltrim(rtrim(@valor)))
	begin
		set @existe=1
	end
else
	begin
		set @existe=0
	end
GO
/****** Object:  StoredProcedure [dbo].[persona_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_insertar]
@tipo_persona varchar(20),
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50)
as
insert into persona (tipo_persona,nombre,tipo_documento,num_documento,direccion,telefono,email)
values (@tipo_persona,@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email)
GO
/****** Object:  StoredProcedure [dbo].[persona_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_listar]
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
order by idpersona desc
GO
/****** Object:  StoredProcedure [dbo].[persona_listar_clientes]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_listar_clientes]
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where tipo_persona='Cliente'
order by idpersona desc
GO
/****** Object:  StoredProcedure [dbo].[persona_listar_proveedores]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[persona_listar_proveedores]
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where tipo_persona='Proveedor'
order by idpersona desc
GO
/****** Object:  StoredProcedure [dbo].[rol_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[rol_listar]
AS
SELECT idrol,nombre FROM dbo.rol
WHERE estado=1
GO
/****** Object:  StoredProcedure [dbo].[Trnsac_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
create proc [dbo].[Trnsac_listar]
as
SELECT id,Descripcion FROM Transacciones
order by id asc
GO
/****** Object:  StoredProcedure [dbo].[usuario_activar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_activar]
@idusuario integer
as
update usuario set estado=1
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_actualizar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_actualizar]
@idusuario integer,
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
if @clave<>''
update usuario set idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email,clave=HASHBYTES('SHA2_256', @clave)
where idusuario=@idusuario;
else
update usuario set idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email
where idusuario=@idusuario;
GO
/****** Object:  StoredProcedure [dbo].[usuario_buscar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_buscar]
@valor varchar(50)
as
select u.idusuario as ID,u.idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.idrol=r.idrol
 where u.nombre like '%' +@valor + '%' Or u.email like '%' +@valor + '%'
 order by u.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[usuario_desactivar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_desactivar]
@idusuario integer
as
update usuario set estado=0
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_eliminar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_eliminar]
@idusuario integer
as
delete from usuario
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_existe]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_existe]
@valor varchar(100),
@existe bit output
as
	if exists (select email from usuario where email = ltrim(rtrim(@valor)))
		begin
		 set @existe=1
		end
	else
		begin
		 set @existe=0
		end
GO
/****** Object:  StoredProcedure [dbo].[usuario_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_insertar]
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
insert into usuario (idrol,nombre,tipo_documento,num_documento,direccion,telefono,email,clave)
values (@idrol,@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email,HASHBYTES('SHA2_256',@clave))
GO
/****** Object:  StoredProcedure [dbo].[usuario_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_listar]
as
select u.idusuario as ID,u.idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.idrol=r.idrol
 order by u.idusuario desc
GO
/****** Object:  StoredProcedure [dbo].[usuario_login]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuario_login]
@email VARCHAR(50),
@clave VARCHAR(50)
AS
SELECT u.idusuario,u.idrol,r.nombre AS rol,u.nombre,u.estado
FROM dbo.usuario u INNER JOIN dbo.rol r ON u.idrol=r.idrol
WHERE u.email=@email AND u.clave=HASHBYTES('SHA2_256',@clave)
GO
/****** Object:  StoredProcedure [dbo].[venta_anular]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[venta_anular]
@idventa int
as
update venta set estado='Anulado'
where idventa=@idventa;
update articulo
set stock=stock+d.cantidad
from articulo a
inner join
(select idarticulo,cantidad from detalle_venta where idventa=@idventa) as d
on a.idarticulo=d.idarticulo;
GO
/****** Object:  StoredProcedure [dbo].[venta_buscar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[venta_buscar]
@valor varchar(50)
as
select v.idventa as ID,v.idusuario,u.nombre as Usuario,p.nombre as Cliente,
v.tipo_comprobante as Tipo_Comprobante,v.serie_comprobante as Serie,
v.num_comprobante as Numero,v.fecha as Fecha,v.impuesto as Impuesto,
v.total as Total,v.estado as Estado
from venta v inner join usuario u on v.idusuario=u.idusuario
inner join persona p on v.idcliente=p.idpersona
where v.num_comprobante like '%' + @valor + '%' Or p.nombre like '%' + @valor + '%'
Order by v.fecha asc
GO
/****** Object:  StoredProcedure [dbo].[venta_insertar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[venta_insertar]
@idusuario int,
@idcliente int,
@tipo_comprobante varchar(20),
@serie_comprobante varchar(7),
@num_comprobante varchar(10),
@impuesto decimal(4,2),
@total decimal(11,2),
@detalle type_detalle_venta READONLY
as
begin
	insert into venta (idusuario,idcliente,tipo_comprobante,serie_comprobante,
	num_comprobante,fecha,impuesto,total,estado)
	values (@idusuario,@idcliente,@tipo_comprobante,@serie_comprobante,
	@num_comprobante,getdate(),@impuesto,@total,'Aceptado');
	
	insert detalle_venta (idventa,idarticulo,cantidad,precio,descuento)
	select @@IDENTITY,d.idarticulo,d.cantidad,d.precio,d.descuento
	from @detalle d;
end
GO
/****** Object:  StoredProcedure [dbo].[venta_listar]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[venta_listar]
as
select v.idventa as ID,v.idusuario,u.nombre as Usuario,p.nombre as Cliente,
v.tipo_comprobante as Tipo_Comprobante,v.serie_comprobante as Serie,
v.num_comprobante as Numero,v.fecha as Fecha,v.impuesto as Impuesto,
v.total as Total,v.estado as Estado
from venta v inner join usuario u on v.idusuario=u.idusuario
inner join persona p on v.idcliente=p.idpersona
Order by v.idventa desc
GO
/****** Object:  StoredProcedure [dbo].[venta_listar_detalle]    Script Date: 09/07/2021 17:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[venta_listar_detalle]
@idventa int
as
select d.idarticulo as ID,a.codigo as CODIGO, a.nombre as ARTICULO,
d.cantidad as CANTIDAD,d.precio as PRECIO,d.descuento as DESCUENTO,
((d.cantidad*d.precio)-d.descuento) as IMPORTE
from detalle_venta d inner join articulo a on d.idarticulo=a.idarticulo
where d.idventa=@idventa
GO
