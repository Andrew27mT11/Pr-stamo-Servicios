USE [master]
GO
/****** Object:  Database [ProyectoADM_BD]    Script Date: 16/8/2023 09:07:11 ******/
CREATE DATABASE [ProyectoADM_BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoADM_BD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoADM_BD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoADM_BD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoADM_BD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProyectoADM_BD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoADM_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoADM_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoADM_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoADM_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoADM_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoADM_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoADM_BD] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoADM_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoADM_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoADM_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoADM_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoADM_BD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoADM_BD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoADM_BD', N'ON'
GO
ALTER DATABASE [ProyectoADM_BD] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProyectoADM_BD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProyectoADM_BD]
GO
/****** Object:  User [UserOferente]    Script Date: 16/8/2023 09:07:12 ******/
CREATE USER [UserOferente] FOR LOGIN [UserOferente] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UserGenerico]    Script Date: 16/8/2023 09:07:12 ******/
CREATE USER [UserGenerico] FOR LOGIN [UserGenerico] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UserEmpleado]    Script Date: 16/8/2023 09:07:12 ******/
CREATE USER [UserEmpleado] FOR LOGIN [UserEmpleado] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UserCliente]    Script Date: 16/8/2023 09:07:12 ******/
CREATE USER [UserCliente] FOR LOGIN [UserCliente] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdminG]    Script Date: 16/8/2023 09:07:12 ******/
CREATE USER [AdminG] FOR LOGIN [AdminG] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UserOferente]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UserGenerico]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UserEmpleado]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UserCliente]
GO
ALTER ROLE [db_owner] ADD MEMBER [AdminG]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[Cedula_Adm] [char](13) NOT NULL,
	[Nombre_Adm] [varchar](50) NOT NULL,
	[PApellido_Adm] [varchar](50) NOT NULL,
	[SApellido_Adm] [varchar](50) NULL,
	[Correo_Adm] [varchar](50) NOT NULL,
	[Telefono_Adm] [int] NOT NULL,
	[FechaNacAdm] [date] NULL,
 CONSTRAINT [PK_Administradores] PRIMARY KEY CLUSTERED 
(
	[Cedula_Adm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificaciones_Cli]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones_Cli](
	[idCalificaciones_Cli] [int] IDENTITY(1,1) NOT NULL,
	[Cedula_Cli] [char](13) NOT NULL,
	[FK_ IDMensaje_Cli] [int] NULL,
	[Calificaciones] [int] NULL,
 CONSTRAINT [PK_Calificaciones_Cli] PRIMARY KEY CLUSTERED 
(
	[idCalificaciones_Cli] ASC,
	[Cedula_Cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificaciones_Of]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones_Of](
	[idCalificaciones_Of] [int] IDENTITY(1,1) NOT NULL,
	[Cedula_Of] [char](13) NOT NULL,
	[FK_ IDMensaje_Of] [int] NULL,
	[Calificaciones] [int] NULL,
 CONSTRAINT [PK_Calificaciones_Of] PRIMARY KEY CLUSTERED 
(
	[idCalificaciones_Of] ASC,
	[Cedula_Of] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Cedula_Cli] [char](13) NOT NULL,
	[Nombre_Cli] [varchar](50) NOT NULL,
	[PApellido_Cli] [varchar](50) NOT NULL,
	[SApellido_Cli] [varchar](50) NULL,
	[Correo_Cli] [varchar](50) NOT NULL,
	[Telefono_Cli] [int] NOT NULL,
	[Estado] [bit] NULL,
	[PromedioCli] [decimal](18, 0) NULL,
	[FechaNac] [date] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Cedula_Cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas_Suspendidas]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas_Suspendidas](
	[IDCuentaSuspendida] [int] IDENTITY(1,1) NOT NULL,
	[NUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cuentas_Suspendidas] PRIMARY KEY CLUSTERED 
(
	[IDCuentaSuspendida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensaje_Cli]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensaje_Cli](
	[idMensaje_Cli] [int] IDENTITY(1,1) NOT NULL,
	[Mensaje_Cli] [varchar](300) NOT NULL,
	[Estado_Cli] [bit] NULL,
	[FechaSolicitud_Cli] [date] NOT NULL,
	[Cedula_Cli] [char](13) NOT NULL,
	[CedulaOf] [char](13) NOT NULL,
 CONSTRAINT [PK_Mensaje_Cli] PRIMARY KEY CLUSTERED 
(
	[idMensaje_Cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensaje_Of]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensaje_Of](
	[IdMensaje_Of] [int] IDENTITY(1,1) NOT NULL,
	[Mensaje] [varchar](300) NOT NULL,
	[Estado] [bit] NULL,
	[FechaSolicitud] [date] NOT NULL,
	[Cedula_Of] [char](13) NOT NULL,
	[FK_IDServicios] [int] NOT NULL,
	[Cedula_Cli] [char](13) NOT NULL,
 CONSTRAINT [PK_Mensaje_Of] PRIMARY KEY CLUSTERED 
(
	[IdMensaje_Of] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oferentes]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferentes](
	[Cedula_Of] [char](13) NOT NULL,
	[NombreCompleto] [varchar](50) NOT NULL,
	[PApellido_Of] [varchar](50) NOT NULL,
	[SApellido_Of] [varchar](50) NULL,
	[Correo_Of] [varchar](50) NOT NULL,
	[Telefonos_Of] [int] NOT NULL,
	[Provincia] [char](10) NOT NULL,
	[Estado] [bit] NULL,
	[FK_IDServicio] [int] NOT NULL,
	[PromedioOf] [decimal](18, 0) NULL,
	[FechaNacOf] [date] NULL,
 CONSTRAINT [PK_Tabla_Oferentes] PRIMARY KEY CLUSTERED 
(
	[Cedula_Of] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[idServicios] [int] IDENTITY(1,1) NOT NULL,
	[NombreServicio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[idServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[FK_CedulaOfrecietes] [char](13) NULL,
	[FK_CedulaClientes] [char](13) NULL,
	[FK_CedulaAdmin] [char](13) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Administradores] ([Cedula_Adm], [Nombre_Adm], [PApellido_Adm], [SApellido_Adm], [Correo_Adm], [Telefono_Adm], [FechaNacAdm]) VALUES (N'123234452    ', N'Saby', N'Gutierres', N'Fernadez', N'Saby@gmail.com', 76542017, CAST(N'2000-12-20' AS Date))
INSERT [dbo].[Administradores] ([Cedula_Adm], [Nombre_Adm], [PApellido_Adm], [SApellido_Adm], [Correo_Adm], [Telefono_Adm], [FechaNacAdm]) VALUES (N'555553532    ', N'Roberto', N'Salazar', N'Obando', N'Roberto@gmail.com', 12344321, CAST(N'1990-06-05' AS Date))
INSERT [dbo].[Administradores] ([Cedula_Adm], [Nombre_Adm], [PApellido_Adm], [SApellido_Adm], [Correo_Adm], [Telefono_Adm], [FechaNacAdm]) VALUES (N'555555555    ', N'Fabian', N'Gonzales', N'Samora', N'FabianG@gmail.com', 55554421, CAST(N'2005-07-05' AS Date))
INSERT [dbo].[Administradores] ([Cedula_Adm], [Nombre_Adm], [PApellido_Adm], [SApellido_Adm], [Correo_Adm], [Telefono_Adm], [FechaNacAdm]) VALUES (N'676767676    ', N'Jennifer', N'Escobar', N'Jimenez', N'Jennifer@gmail.com', 33329714, CAST(N'2003-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Calificaciones_Cli] ON 

INSERT [dbo].[Calificaciones_Cli] ([idCalificaciones_Cli], [Cedula_Cli], [FK_ IDMensaje_Cli], [Calificaciones]) VALUES (1, N'777777777    ', 1, 5)
INSERT [dbo].[Calificaciones_Cli] ([idCalificaciones_Cli], [Cedula_Cli], [FK_ IDMensaje_Cli], [Calificaciones]) VALUES (2, N'777777777    ', 2, 5)
INSERT [dbo].[Calificaciones_Cli] ([idCalificaciones_Cli], [Cedula_Cli], [FK_ IDMensaje_Cli], [Calificaciones]) VALUES (3, N'987654321    ', 3, 5)
INSERT [dbo].[Calificaciones_Cli] ([idCalificaciones_Cli], [Cedula_Cli], [FK_ IDMensaje_Cli], [Calificaciones]) VALUES (4, N'212121212    ', 4, 5)
INSERT [dbo].[Calificaciones_Cli] ([idCalificaciones_Cli], [Cedula_Cli], [FK_ IDMensaje_Cli], [Calificaciones]) VALUES (5, N'777777777    ', 5, 3)
INSERT [dbo].[Calificaciones_Cli] ([idCalificaciones_Cli], [Cedula_Cli], [FK_ IDMensaje_Cli], [Calificaciones]) VALUES (6, N'123456789    ', 6, 4)
SET IDENTITY_INSERT [dbo].[Calificaciones_Cli] OFF
GO
SET IDENTITY_INSERT [dbo].[Calificaciones_Of] ON 

INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (1, N'11111111     ', 11, 5)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (2, N'11111111     ', 13, 4)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (3, N'898989898    ', 14, 5)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (4, N'222222222    ', 15, 4)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (5, N'11111111     ', 17, 5)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (7, N'987654321    ', 18, 4)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (8, N'333333333    ', 19, 5)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (9, N'898989898    ', 20, 4)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (10, N'854835888    ', 21, 4)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (11, N'11111111     ', 24, 5)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (12, N'987654321    ', 2, 2)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (13, N'987654321    ', 3, 2)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (14, N'898989898    ', 4, 3)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (15, N'987654321    ', 7, 4)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (16, N'11111111     ', 8, 5)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (17, N'987654321    ', 9, 2)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (18, N'11111111     ', 25, 3)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (19, N'88888888     ', 27, 2)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (20, N'333333333    ', 31, 4)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (21, N'11111111     ', 32, 5)
INSERT [dbo].[Calificaciones_Of] ([idCalificaciones_Of], [Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones]) VALUES (22, N'88888888     ', 33, 3)
SET IDENTITY_INSERT [dbo].[Calificaciones_Of] OFF
GO
INSERT [dbo].[Clientes] ([Cedula_Cli], [Nombre_Cli], [PApellido_Cli], [SApellido_Cli], [Correo_Cli], [Telefono_Cli], [Estado], [PromedioCli], [FechaNac]) VALUES (N'123456789    ', N'Esteban', N'Guzman', N'Araya', N'esteban123@gmail.com', 25258547, 0, CAST(4 AS Decimal(18, 0)), CAST(N'2005-07-05' AS Date))
INSERT [dbo].[Clientes] ([Cedula_Cli], [Nombre_Cli], [PApellido_Cli], [SApellido_Cli], [Correo_Cli], [Telefono_Cli], [Estado], [PromedioCli], [FechaNac]) VALUES (N'212121212    ', N'Dylan', N'Ortiz', N'Piedra', N'sebastian@gmail.com', 78423993, 0, CAST(5 AS Decimal(18, 0)), CAST(N'2000-06-09' AS Date))
INSERT [dbo].[Clientes] ([Cedula_Cli], [Nombre_Cli], [PApellido_Cli], [SApellido_Cli], [Correo_Cli], [Telefono_Cli], [Estado], [PromedioCli], [FechaNac]) VALUES (N'2323232323   ', N'Karla', N'Calvo', N'Araya', N'Karla@gmail.com', 23232123, 0, NULL, CAST(N'2002-03-02' AS Date))
INSERT [dbo].[Clientes] ([Cedula_Cli], [Nombre_Cli], [PApellido_Cli], [SApellido_Cli], [Correo_Cli], [Telefono_Cli], [Estado], [PromedioCli], [FechaNac]) VALUES (N'777777777    ', N'Alonso', N'Garro', N'Ruiz', N'Alonso@gmail.com', 77777777, 0, CAST(4 AS Decimal(18, 0)), CAST(N'1997-02-06' AS Date))
INSERT [dbo].[Clientes] ([Cedula_Cli], [Nombre_Cli], [PApellido_Cli], [SApellido_Cli], [Correo_Cli], [Telefono_Cli], [Estado], [PromedioCli], [FechaNac]) VALUES (N'987654321    ', N'Angelica', N'Brenes', N'Bonilla', N'Angelica@gmail.com', 12345678, 0, CAST(5 AS Decimal(18, 0)), CAST(N'1998-05-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Cuentas_Suspendidas] ON 

INSERT [dbo].[Cuentas_Suspendidas] ([IDCuentaSuspendida], [NUsuario]) VALUES (1, N'Angelica1')
INSERT [dbo].[Cuentas_Suspendidas] ([IDCuentaSuspendida], [NUsuario]) VALUES (2, N'Angelica')
SET IDENTITY_INSERT [dbo].[Cuentas_Suspendidas] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensaje_Cli] ON 

INSERT [dbo].[Mensaje_Cli] ([idMensaje_Cli], [Mensaje_Cli], [Estado_Cli], [FechaSolicitud_Cli], [Cedula_Cli], [CedulaOf]) VALUES (1, N'Gracias por el servicio', NULL, CAST(N'2023-06-24' AS Date), N'777777777    ', N'987654321    ')
INSERT [dbo].[Mensaje_Cli] ([idMensaje_Cli], [Mensaje_Cli], [Estado_Cli], [FechaSolicitud_Cli], [Cedula_Cli], [CedulaOf]) VALUES (2, N'Gracias por el servicio de ninera', NULL, CAST(N'2023-06-24' AS Date), N'777777777    ', N'333333333    ')
INSERT [dbo].[Mensaje_Cli] ([idMensaje_Cli], [Mensaje_Cli], [Estado_Cli], [FechaSolicitud_Cli], [Cedula_Cli], [CedulaOf]) VALUES (3, N'Gracias por el servicio de Empleada', NULL, CAST(N'2023-06-24' AS Date), N'987654321    ', N'898989898    ')
INSERT [dbo].[Mensaje_Cli] ([idMensaje_Cli], [Mensaje_Cli], [Estado_Cli], [FechaSolicitud_Cli], [Cedula_Cli], [CedulaOf]) VALUES (4, N'Gracias por el servicio', NULL, CAST(N'2023-06-24' AS Date), N'212121212    ', N'854835888    ')
INSERT [dbo].[Mensaje_Cli] ([idMensaje_Cli], [Mensaje_Cli], [Estado_Cli], [FechaSolicitud_Cli], [Cedula_Cli], [CedulaOf]) VALUES (5, N'Gracias por el servicio', NULL, CAST(N'2023-06-24' AS Date), N'777777777    ', N'11111111     ')
INSERT [dbo].[Mensaje_Cli] ([idMensaje_Cli], [Mensaje_Cli], [Estado_Cli], [FechaSolicitud_Cli], [Cedula_Cli], [CedulaOf]) VALUES (6, N'Gracias por el servicio', NULL, CAST(N'2023-08-11' AS Date), N'123456789    ', N'88888888     ')
SET IDENTITY_INSERT [dbo].[Mensaje_Cli] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensaje_Of] ON 

INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (1, N'Solicitar Servicio Fontanero ', 0, CAST(N'2023-06-23' AS Date), N'222222222    ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (2, N'Solicitar Servicio Pintor', 0, CAST(N'2023-06-23' AS Date), N'11111111     ', 3, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (3, N'Solicitar Servicio Fontanero ', 1, CAST(N'2023-06-23' AS Date), N'987654321    ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (4, N'Solicitar Servicio Empleada', 1, CAST(N'2023-06-23' AS Date), N'898989898    ', 4, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (5, N'Solicitar Servicio Niñera', 0, CAST(N'2023-06-23' AS Date), N'333333333    ', 2, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (6, N'Solicitar Servicio Fontanero ', 0, CAST(N'2023-06-23' AS Date), N'11111111     ', 3, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (7, N'Solicitar Servicio Empleada', 1, CAST(N'2023-06-23' AS Date), N'987654321    ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (8, N'Solicitar Servicio Fontanero ', 1, CAST(N'2023-06-23' AS Date), N'11111111     ', 3, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (9, N'Solicitud de Fontaneria', 1, CAST(N'2023-06-24' AS Date), N'987654321    ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (10, N'Solicitud de Fontaneria 1', 0, CAST(N'2023-06-24' AS Date), N'88888888     ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (11, N'Solicitud de Pintor Cartago', 1, CAST(N'2023-06-24' AS Date), N'11111111     ', 3, N'987654321    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (12, N'Solicitud de fontanero', 0, CAST(N'2023-06-24' AS Date), N'88888888     ', 1, N'987654321    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (13, N'Solicitud de Pintor Cartago', 1, CAST(N'2023-06-24' AS Date), N'11111111     ', 3, N'987654321    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (14, N'Solicitud Empleada Domestica', 1, CAST(N'2023-06-24' AS Date), N'898989898    ', 4, N'987654321    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (15, N'Solicitud de Fontaneria', 1, CAST(N'2023-06-24' AS Date), N'222222222    ', 1, N'987654321    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (17, N'Solicitud de Pintor Cartago', 1, CAST(N'2023-06-24' AS Date), N'11111111     ', 3, N'777777777    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (18, N'Fontanero', 1, CAST(N'2023-06-24' AS Date), N'987654321    ', 1, N'777777777    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (19, N'Solicitud de ninera', 1, CAST(N'2023-06-24' AS Date), N'333333333    ', 2, N'777777777    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (20, N'Solicitud de Empleada', 1, CAST(N'2023-06-24' AS Date), N'898989898    ', 4, N'987654321    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (21, N'Solicitud de Pintor Heredia', 1, CAST(N'2023-06-24' AS Date), N'854835888    ', 3, N'212121212    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (22, N'Solicitud de Fontaneria', 0, CAST(N'2023-06-24' AS Date), N'222222222    ', 1, N'212121212    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (23, N'Solicitud de Fontaneria', 1, CAST(N'2023-06-24' AS Date), N'222222222    ', 1, N'77777777     ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (24, N'Solicitud de Fontaneria', 1, CAST(N'2023-06-24' AS Date), N'11111111     ', 1, N'777777777    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (25, N'F', 1, CAST(N'2023-07-22' AS Date), N'11111111     ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (27, N'Fon Cartago', 1, CAST(N'2023-07-22' AS Date), N'88888888     ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (30, N'Niñera', 0, CAST(N'2023-07-22' AS Date), N'333333333    ', 2, N'             ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (31, N'Niñera2', 1, CAST(N'2023-07-22' AS Date), N'333333333    ', 2, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (32, N'Fon Esteban', 1, CAST(N'2023-07-22' AS Date), N'11111111     ', 1, N'123456789    ')
INSERT [dbo].[Mensaje_Of] ([IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]) VALUES (33, N'Servicio de Fontanero federico', 1, CAST(N'2023-08-11' AS Date), N'88888888     ', 1, N'123456789    ')
SET IDENTITY_INSERT [dbo].[Mensaje_Of] OFF
GO
INSERT [dbo].[Oferentes] ([Cedula_Of], [NombreCompleto], [PApellido_Of], [SApellido_Of], [Correo_Of], [Telefonos_Of], [Provincia], [Estado], [FK_IDServicio], [PromedioOf], [FechaNacOf]) VALUES (N'11111111     ', N'Hector', N'Figueres', N'Solano', N'Hector@gmail.com', 11111111, N'Heredia   ', 0, 1, CAST(4 AS Decimal(18, 0)), CAST(N'2000-07-04' AS Date))
INSERT [dbo].[Oferentes] ([Cedula_Of], [NombreCompleto], [PApellido_Of], [SApellido_Of], [Correo_Of], [Telefonos_Of], [Provincia], [Estado], [FK_IDServicio], [PromedioOf], [FechaNacOf]) VALUES (N'222222222    ', N'Daniel', N'Castillo', N'Calderon', N'Daniel@gmail.com', 22222222, N'San Jose  ', 0, 1, CAST(4 AS Decimal(18, 0)), CAST(N'2001-07-04' AS Date))
INSERT [dbo].[Oferentes] ([Cedula_Of], [NombreCompleto], [PApellido_Of], [SApellido_Of], [Correo_Of], [Telefonos_Of], [Provincia], [Estado], [FK_IDServicio], [PromedioOf], [FechaNacOf]) VALUES (N'333333333    ', N'Maria', N'Alvares', N'Araya', N'Maria@gmail.com', 33333333, N'Heredia   ', 0, 2, CAST(4 AS Decimal(18, 0)), CAST(N'2003-07-04' AS Date))
INSERT [dbo].[Oferentes] ([Cedula_Of], [NombreCompleto], [PApellido_Of], [SApellido_Of], [Correo_Of], [Telefonos_Of], [Provincia], [Estado], [FK_IDServicio], [PromedioOf], [FechaNacOf]) VALUES (N'854835888    ', N'Pedro', N'Jimenez', N'Cordero', N'Pedro@gmail.com', 32222222, N'Heredia   ', 0, 1, CAST(4 AS Decimal(18, 0)), CAST(N'2004-07-04' AS Date))
INSERT [dbo].[Oferentes] ([Cedula_Of], [NombreCompleto], [PApellido_Of], [SApellido_Of], [Correo_Of], [Telefonos_Of], [Provincia], [Estado], [FK_IDServicio], [PromedioOf], [FechaNacOf]) VALUES (N'88888888     ', N'Federico', N'Sanchez', N'Hernandez', N'Federico@gmail.com', 88888875, N'Cartago   ', 0, 1, CAST(2 AS Decimal(18, 0)), CAST(N'2005-07-04' AS Date))
INSERT [dbo].[Oferentes] ([Cedula_Of], [NombreCompleto], [PApellido_Of], [SApellido_Of], [Correo_Of], [Telefonos_Of], [Provincia], [Estado], [FK_IDServicio], [PromedioOf], [FechaNacOf]) VALUES (N'898989898    ', N'Yesenia', N'Calvo', N'Rodriguez', N'Yesenia@gmail.com', 24536423, N'Limon     ', 0, 4, CAST(4 AS Decimal(18, 0)), CAST(N'1991-07-04' AS Date))
INSERT [dbo].[Oferentes] ([Cedula_Of], [NombreCompleto], [PApellido_Of], [SApellido_Of], [Correo_Of], [Telefonos_Of], [Provincia], [Estado], [FK_IDServicio], [PromedioOf], [FechaNacOf]) VALUES (N'987654321    ', N'Julian', N'Solano', N'Viques', N'julian123@gmail.com', 25258548, N'Cartago   ', 0, 1, CAST(2 AS Decimal(18, 0)), CAST(N'1992-07-04' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([idServicios], [NombreServicio]) VALUES (1, N'Fontanero')
INSERT [dbo].[Servicios] ([idServicios], [NombreServicio]) VALUES (2, N'Niñera')
INSERT [dbo].[Servicios] ([idServicios], [NombreServicio]) VALUES (3, N'Pintor')
INSERT [dbo].[Servicios] ([idServicios], [NombreServicio]) VALUES (4, N'Empleada Domestica')
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (2, N'Hector', N'1234', N'11111111     ', NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (3, N'Daniel', N'12345', N'222222222    ', NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (4, N'Maria', N'12345', N'333333333    ', NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (5, N'Yesenia', N'1234', N'898989898    ', NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (6, N'Federico', N'8888', N'88888888     ', NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (7, N'esteban11', N'1234', NULL, N'123456789    ', NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (8, N'julian23', N'1234', N'987654321    ', NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (9, N'Alonso', N'12345', NULL, N'777777777    ', NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (11, N'Carlos', N'1234', NULL, NULL, N'555555555    ')
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (12, N'Dylan', N'1234', NULL, N'212121212    ', NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (13, N'Pedro', N'12345', N'854835888    ', NULL, NULL)
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (14, N'Esteban', N'123', NULL, NULL, N'676767676    ')
INSERT [dbo].[Usuarios] ([idUsuario], [NombreUsuario], [Clave], [FK_CedulaOfrecietes], [FK_CedulaClientes], [FK_CedulaAdmin]) VALUES (16, N'Karla', N'123', NULL, N'2323232323   ', NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Calificaciones_Cli]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Cli_Clientes] FOREIGN KEY([Cedula_Cli])
REFERENCES [dbo].[Clientes] ([Cedula_Cli])
GO
ALTER TABLE [dbo].[Calificaciones_Cli] CHECK CONSTRAINT [FK_Calificaciones_Cli_Clientes]
GO
ALTER TABLE [dbo].[Calificaciones_Cli]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Cli_Mensaje_Cli] FOREIGN KEY([FK_ IDMensaje_Cli])
REFERENCES [dbo].[Mensaje_Cli] ([idMensaje_Cli])
GO
ALTER TABLE [dbo].[Calificaciones_Cli] CHECK CONSTRAINT [FK_Calificaciones_Cli_Mensaje_Cli]
GO
ALTER TABLE [dbo].[Calificaciones_Of]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Of_Mensaje_Of] FOREIGN KEY([FK_ IDMensaje_Of])
REFERENCES [dbo].[Mensaje_Of] ([IdMensaje_Of])
GO
ALTER TABLE [dbo].[Calificaciones_Of] CHECK CONSTRAINT [FK_Calificaciones_Of_Mensaje_Of]
GO
ALTER TABLE [dbo].[Calificaciones_Of]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Of_Oferentes] FOREIGN KEY([Cedula_Of])
REFERENCES [dbo].[Oferentes] ([Cedula_Of])
GO
ALTER TABLE [dbo].[Calificaciones_Of] CHECK CONSTRAINT [FK_Calificaciones_Of_Oferentes]
GO
ALTER TABLE [dbo].[Mensaje_Cli]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Cli_Clientes] FOREIGN KEY([Cedula_Cli])
REFERENCES [dbo].[Clientes] ([Cedula_Cli])
GO
ALTER TABLE [dbo].[Mensaje_Cli] CHECK CONSTRAINT [FK_Mensaje_Cli_Clientes]
GO
ALTER TABLE [dbo].[Mensaje_Of]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Of_Oferentes] FOREIGN KEY([Cedula_Of])
REFERENCES [dbo].[Oferentes] ([Cedula_Of])
GO
ALTER TABLE [dbo].[Mensaje_Of] CHECK CONSTRAINT [FK_Mensaje_Of_Oferentes]
GO
ALTER TABLE [dbo].[Mensaje_Of]  WITH CHECK ADD  CONSTRAINT [FK_Mensaje_Of_Servicios] FOREIGN KEY([FK_IDServicios])
REFERENCES [dbo].[Servicios] ([idServicios])
GO
ALTER TABLE [dbo].[Mensaje_Of] CHECK CONSTRAINT [FK_Mensaje_Of_Servicios]
GO
ALTER TABLE [dbo].[Oferentes]  WITH CHECK ADD  CONSTRAINT [FK_Oferentes_Servicios] FOREIGN KEY([FK_IDServicio])
REFERENCES [dbo].[Servicios] ([idServicios])
GO
ALTER TABLE [dbo].[Oferentes] CHECK CONSTRAINT [FK_Oferentes_Servicios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Administradores] FOREIGN KEY([FK_CedulaAdmin])
REFERENCES [dbo].[Administradores] ([Cedula_Adm])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Administradores]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Clientes] FOREIGN KEY([FK_CedulaClientes])
REFERENCES [dbo].[Clientes] ([Cedula_Cli])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Clientes]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Oferentes] FOREIGN KEY([FK_CedulaOfrecietes])
REFERENCES [dbo].[Oferentes] ([Cedula_Of])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Oferentes]
GO
/****** Object:  StoredProcedure [dbo].[GenerarReporteInscripciones]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GenerarReporteInscripciones]
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @FechaActual DATETIME = GETDATE();
    DECLARE @Periodo VARCHAR(20);
    SELECT @Periodo = CONVERT(VARCHAR(2), DAY(@FechaActual)) + '/' +
                      CONVERT(VARCHAR(2), MONTH(@FechaActual)) + '/' +
                      CONVERT(VARCHAR(4), YEAR(@FechaActual));
    SELECT
        @Periodo as Periodo,
        'Total Clientes' AS Tipo,
        COUNT(DISTINCT Cedula_Cli) AS Cantidad
    FROM
        Clientes
    UNION
    SELECT
        @Periodo as Periodo,
        s.NombreServicio AS Tipo,
        COUNT(DISTINCT o.Cedula_Of) AS Cantidad
    FROM
        Servicios s
    LEFT JOIN
        Oferentes o ON s.idServicios = o.FK_IDServicio
    GROUP BY
        s.NombreServicio
    ORDER BY
        Tipo
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarCalificacionCli]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarCalificacionCli]
    @Cedula_Cli CHAR(13),
    @FK_IDMensaje_Cli INT,
    @Calificaciones INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Calificaciones_Cli(Cedula_Cli, [FK_ IDMensaje_Cli], [Calificaciones])
    VALUES (@Cedula_Cli, @FK_IDMensaje_Cli, @Calificaciones)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarCalificacionOf]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarCalificacionOf]
    @Cedula_Of CHAR(13),
    @FK_IDMensaje_Of INT,
    @Calificaciones INT
AS
BEGIN
    SET NOCOUNT ON;

 

    INSERT INTO [dbo].[Calificaciones_Of] ([Cedula_Of], [FK_ IDMensaje_Of], [Calificaciones])
    VALUES (@Cedula_Of, @FK_IDMensaje_Of, @Calificaciones)
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosPorCedula]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerDatosPorCedula]
    @Cedula varchar(13)
AS
BEGIN
    SELECT *
    FROM (
        SELECT 'Cliente' AS Tipo, Cedula_Cli AS Cedula, Nombre_Cli AS Nombre, PApellido_Cli AS PrimerApellido, SApellido_Cli AS SegundoApellido, Correo_Cli AS Correo, Telefono_Cli AS Telefono, Estado
        FROM Clientes
        UNION ALL
        SELECT 'Oferente' AS Tipo, Cedula_Of AS Cedula, NombreCompleto, PApellido_Of AS PrimerApellido, SApellido_Of AS SegundoApellido, Correo_Of AS Correo, Telefonos_Of AS Telefono, Estado
        FROM Oferentes
    ) AS Datos
    WHERE Cedula = @Cedula
END 
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMensajesPorCedulaCli]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMensajesPorCedulaCli]
    @Cedula_Cli CHAR(13)
AS
BEGIN
    SET NOCOUNT ON;

 

    SELECT [IdMensaje_Of], [Mensaje], [Estado], [FechaSolicitud], [Cedula_Of], [FK_IDServicios], [Cedula_Cli]
    FROM [dbo].[Mensaje_Of] m
    WHERE [Cedula_Cli] = @Cedula_Cli
        AND NOT EXISTS (
            SELECT 1
            FROM [dbo].[Calificaciones_Of] c
            WHERE c.[FK_ IDMensaje_Of] = m.[IdMensaje_Of]
        ) and estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMensajesPorCedulaOf]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMensajesPorCedulaOf]
    @Cedula_Of CHAR(13)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT idMensaje_Cli as ID, Mensaje_Cli AS Mensaje, Estado_Cli as Estado, FechaSolicitud_Cli as Fecha, 
			Cedula_Cli as Cedula_Cliente,CedulaOf as Cedula_Oferente
    FROM Mensaje_Cli m
    WHERE @Cedula_Of = @Cedula_Of
        AND NOT EXISTS (
            SELECT 1
            FROM [dbo].[Calificaciones_Cli] c
            WHERE c.[FK_ IDMensaje_Cli] = m.[idMensaje_Cli]
        ) 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarEstadoMensaje]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ActualizarEstadoMensaje]
    @IdMensaje_Of int,
    @Estado bit
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Mensaje_Of
    SET Estado = @Estado
    WHERE IdMensaje_Of = @IdMensaje_Of
END

GO
/****** Object:  StoredProcedure [dbo].[SP_AdministrarMensaje]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AdministrarMensaje]

    @CedulaOf char(13)
AS
BEGIN
    SET NOCOUNT ON;

    
        -- Mostrar mensajes 
        SELECT
            IdMensaje_Of as Numero_Mensaje,
            Mensaje,
            Estado,
            FechaSolicitud,
            Cedula_Of as Cedula,
            Cedula_Cli as Cedula_Cliente
        FROM dbo.Mensaje_Of
		where estado is null and Cedula_Of = @CedulaOf
    
   
END

GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarAdm]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BuscarAdm]
	@Cedula CHAR(13),
	@OP int
AS
begin
	if @OP = 1
	BEGIN 
	SELECT * FROM Administradores
	Where Cedula_Adm = @Cedula
	END

	ELSE IF @OP = 2
	BEGIN 
	SELECT * FROM Clientes
	Where Cedula_Cli = @Cedula
	END

	ELSE IF @OP = 3
	BEGIN 
	SELECT * FROM Oferentes
	Where Cedula_Of = @Cedula
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_CalculaPromedioCalificacionesClientes]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CalculaPromedioCalificacionesClientes]
AS
BEGIN
    -- Actualizar el promedio de calificaciones para cada cliente
    UPDATE c
    SET c.PromedioCli = CASE
        WHEN a.AvgCalificaciones <= 5 THEN ISNULL(a.AvgCalificaciones, 0)
        ELSE 5 -- Si el promedio supera 5, se establece como máximo 5
    END
    FROM Clientes AS c
    INNER JOIN (
        SELECT Cedula_Cli, AVG(Calificaciones) AS AvgCalificaciones
        FROM dbo.Calificaciones_Cli
        GROUP BY Cedula_Cli
    ) AS a ON c.Cedula_Cli = a.Cedula_Cli;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CalculaPromedioCalificacionesOferente]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CalculaPromedioCalificacionesOferente]
AS
BEGIN
    -- Actualizar el promedio de calificaciones para cada cliente
    UPDATE c
    SET c.PromedioOf = CASE
        WHEN a.AvgCalificaciones <= 5 THEN ISNULL(a.AvgCalificaciones, 0)
        ELSE 5 -- Si el promedio supera 5, se establece como máximo 5
    END
    FROM Oferentes AS c
    INNER JOIN (
        SELECT Cedula_Of, AVG(Calificaciones) AS AvgCalificaciones
        FROM dbo.Calificaciones_Of
        GROUP BY Cedula_Of
    ) AS a ON c.Cedula_Of = a.Cedula_Of
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarDatosInicio]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CargarDatosInicio]
@Servicio VARCHAR(50) = NULL
AS
BEGIN
    SELECT
        O.NombreCompleto AS Nombre,
        O.PApellido_Of + ' ' + ISNULL(O.SApellido_Of, '') AS Apellidos,
        S.NombreServicio AS Servicio
    FROM
        Oferentes O
    INNER JOIN
        Servicios S ON O.FK_IDServicio = S.idServicios
    WHERE
        (@Servicio IS NULL OR S.NombreServicio = @Servicio)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_filtrarDatos]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_filtrarDatos]
    @Servicio VARCHAR(50) = NULL,
    @Provincia CHAR(10) = NULL
AS
BEGIN
    SELECT
        O.Cedula_Of as Cedula,
        O.NombreCompleto AS Nombre,
        O.PApellido_Of + ' ' + ISNULL(O.SApellido_Of, '') AS Apellidos,
        O.Correo_Of as Correo,
        O.Telefonos_Of as Telefono,
        O.Provincia,
        S.NombreServicio AS Servicio,
        O.PromedioOf AS Calificación
    FROM
        Oferentes O
    INNER JOIN
        Servicios S ON O.FK_IDServicio = S.idServicios
    WHERE
        (@Servicio IS NULL OR S.NombreServicio = @Servicio)
        AND (@Provincia IS NULL OR O.Provincia = @Provincia)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarMensajeCli]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarMensajeCli]
    @Cedula_Of CHAR(13),
	@Cedula_Cli CHAR(13),
    @Mensaje VARCHAR(300)
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener la fecha actual del sistema
    DECLARE @FechaSolicitud DATE = GETDATE();

    -- Insertar los datos en la tabla Mensaje_Of
    INSERT INTO Mensaje_Cli(Mensaje_Cli, Estado_Cli,FechaSolicitud_Cli,CedulaOf,Cedula_Cli)
    VALUES  (@Mensaje, null,@FechaSolicitud, @Cedula_Of, @Cedula_Cli)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarMensajeOf]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertarMensajeOf]
    @Cedula_Cli CHAR(13),
	@Cedula_Of CHAR(13),
    @Mensaje VARCHAR(300)
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener la fecha actual del sistema
    DECLARE @FechaSolicitud DATE = GETDATE();

    -- Buscar el ID del servicio para la cédula del oferente
    DECLARE @FK_IDServicios INT
    SELECT @FK_IDServicios = FK_IDServicio 
	from Oferentes 
	where Cedula_Of = @Cedula_Of

    -- Insertar los datos en la tabla Mensaje_Of
    INSERT INTO dbo.Mensaje_Of (Mensaje, Estado, FechaSolicitud, Cedula_Of, FK_IDServicios, Cedula_Cli)
    VALUES (@Mensaje, null, @FechaSolicitud, @Cedula_Of, @FK_IDServicios, @Cedula_Cli)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------
CREATE PROCEDURE [dbo].[SP_Login]
    @nomUser VARCHAR(50),
    @contrasena VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Usuarios U
        WHERE U.NombreUsuario = @nomUser
            AND U.Clave = @contrasena
            AND NOT EXISTS (
                SELECT 1
                FROM Cuentas_Suspendidas CS
                WHERE CS.NUsuario = U.NombreUsuario
            )
    )
    BEGIN
        -- Inicio de sesión exitoso
        SELECT 'Login successful' AS Result, U.FK_CedulaOfrecietes As CedOf, U.FK_CedulaClientes As CedCli, U.FK_CedulaAdmin As CedAdm
        FROM Usuarios As U
        WHERE @nomUser = U.NombreUsuario AND @contrasena = U.Clave
    END
    ELSE
    BEGIN
        -- Inicio de sesión fallido
        SELECT 'Login failed' AS Result
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientoAdmin]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientoAdmin]
	@CedulaAdm char(13),
	@NombreAdm varchar(50),
	@1ApellidoAdm varchar(50),
	@2ApellidoAdm varchar(50),
	@CorreoAdm varchar(50),
	@TelefonoAdm int,
	@FechaNacAdm date,
	@OperacionAdm int
AS
Begin
DECLARE @mayoriaE int
    SET @mayoriaE = 18

	DECLARE @fechaMayorE date
	SET @fechaMayorE = DATEADD(YEAR, -@mayoriaE, GETDATE())

	if @OperacionAdm = 1
 IF EXISTS (SELECT 1 FROM Clientes WHERE Cedula_Cli = @CedulaAdm or Correo_Cli=@CorreoAdm)
    BEGIN
        RAISERROR('Los datos ya existen en la Base de datos(Clientes).', 16, 1)
        RETURN;
    END
	    ELSE IF EXISTS (SELECT 1 FROM Oferentes WHERE Cedula_Of = @CedulaAdm or Correo_Of=@CorreoAdm)
    BEGIN
        RAISERROR('Los datos ya existen en la Base de datos(OFERENTES).', 16, 2)
        RETURN;
    END
	  ELSE IF EXISTS (SELECT 1 FROM Administradores WHERE Cedula_Adm = @CedulaAdm or Correo_Adm=@CorreoAdm)
    BEGIN
        RAISERROR('Los datos ya existen en la Base de datos(Administrador).', 16, 3)
        RETURN;
    END
	ELSE
	BEGIN
			IF @FechaNacAdm > @fechaMayorE
			BEGIN
				RAISERROR('El Administrador debe ser mayor de edad para ser registrado.', 16, 4)
				RETURN;
			END
		insert into Administradores(Cedula_Adm,Nombre_Adm,PApellido_Adm,SApellido_Adm,Correo_Adm,Telefono_Adm,FechaNacAdm)
		values(@CedulaAdm,@NombreAdm,@1ApellidoAdm,@2ApellidoAdm,@CorreoAdm,@TelefonoAdm,@FechaNacAdm)
		-- Mensaje de éxito
			PRINT 'El Administrador se ha insertado correctamente.'
	End

	else if @OperacionAdm = 2
	 BEGIN
	 	IF @FechaNacAdm > @fechaMayorE
			BEGIN
				RAISERROR('El Administrador debe ser mayor de edad para ser actualizado.', 16, 5)
				RETURN;
			END
	     UPDATE Administradores
			SET
				Nombre_Adm = @NombreAdm,
				PApellido_Adm= @1ApellidoAdm,
				SApellido_Adm = @2ApellidoAdm,
				Correo_Adm = @CorreoAdm,
				Telefono_Adm = @TelefonoAdm,
				FechaNacAdm = @FechaNacAdm

			WHERE
				@CedulaAdm = Cedula_Adm
				-- Condición para la actualización (puedes ajustar la fecha o utilizar otro criterio)
				PRINT 'El Administrador se ha actualizado correctamente.';
	END
	 ELSE IF @OperacionAdm = 3
	 BEGIN
		Delete from Administradores
		where Cedula_Adm = @CedulaAdm
	END
	ELSE IF @OperacionAdm = 4
	 BEGIN
		Select Nombre_Adm as Nombre,PApellido_Adm as Primer_Apellido,SApellido_Adm as Segundo_Apellido,Correo_Adm as Correo,
		Telefono_Adm as Telefono, FechaNacAdm as Fecha
		from Administradores
		where Cedula_Adm = @CedulaAdm
	END
	ELSE
	BEGIN
		print('opcion invalida')
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientoClientes]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientoClientes]
	@CedulaCli char(13),
	@NombreCli varchar(50),
	@1ApellidoCli varchar(50),
	@2ApellidoCli varchar(50),
	@CorreoCli varchar(50),
	@TelefonoCli int,
	@EstadoCli bit,
	@FechaNac date,
	@operacionCli int
AS
BEGIN
	IF @operacionCli = 1
	BEGIN
		-- Verificar si la cédula ya existe en la tabla
		IF EXISTS (SELECT 1 FROM Clientes WHERE Cedula_Cli = @CedulaCli OR Correo_Cli = @CorreoCli)
		BEGIN
			RAISERROR('Los datos ya existen en la Base de datos.', 16, 1)
			RETURN;
		END
		ELSE IF EXISTS (SELECT 1 FROM Oferentes WHERE Cedula_Of = @CedulaCli OR Correo_Of = @CorreoCli)
		BEGIN
			RAISERROR('Los datos ya existen en la Base de datos(OFERENTES).', 16, 2)
			RETURN;
		END
		ELSE IF EXISTS (SELECT 1 FROM Administradores WHERE Cedula_Adm = @CedulaCli OR Correo_Adm = @CorreoCli)
		BEGIN
			RAISERROR('Los datos ya existen en la Base de datos(Administrador).', 16, 3)
			RETURN;
		END
		ELSE
		BEGIN
			-- Validar edad del cliente
			DECLARE @mayoriaEdad int
			SET @mayoriaEdad = 18

			DECLARE @fechaMayorEdad date
			SET @fechaMayorEdad = DATEADD(YEAR, -@mayoriaEdad, GETDATE())

			IF @FechaNac > @fechaMayorEdad
			BEGIN
				RAISERROR('El cliente debe ser mayor de edad para ser registrado.', 16, 4)
				RETURN;
			END

			-- Insertar el nuevo cliente
			INSERT INTO Clientes (Cedula_Cli, Nombre_Cli, PApellido_Cli, SApellido_Cli, Correo_Cli, Telefono_Cli, Estado,FechaNac)
			VALUES (@CedulaCli, @NombreCli, @1ApellidoCli, @2ApellidoCli, @CorreoCli, @TelefonoCli, @EstadoCli,@FechaNac);

			-- Mensaje de éxito
			PRINT 'El cliente se ha insertado correctamente.';
		END
	END
	ELSE IF @operacionCli = 2
	BEGIN
	-- Validar edad del cliente
			DECLARE @mayoriaE int
			SET @mayoriaE = 18

			DECLARE @fechaMayorE date
			SET @fechaMayorE = DATEADD(YEAR, -@mayoriaE, GETDATE())

			IF @FechaNac > @fechaMayorE
			BEGIN
				RAISERROR('El cliente debe ser mayor de edad para ser actualizado.', 16, 5)
				RETURN;
			END
				UPDATE Clientes
				SET
					Nombre_Cli = @NombreCli,
					PApellido_Cli = @1ApellidoCli,
					SApellido_Cli = @2ApellidoCli,
					Correo_Cli = @CorreoCli,
					Telefono_Cli = @TelefonoCli,
					Estado = @EstadoCli,
					FechaNac = @FechaNac

				WHERE
					Cedula_Cli = @CedulaCli;
					PRINT 'El cliente se ha actualizado correctamente.';
	END
	ELSE IF @operacionCli = 3
	BEGIN
		DELETE FROM Clientes
		WHERE Cedula_Cli = @CedulaCli;
	END
	ELSE IF @operacionCli = 4
	BEGIN
		SELECT Nombre_Cli AS Nombre, PApellido_Cli AS Primer_Apellido, SApellido_Cli AS Segundo_Apellido,
		Correo_Cli AS Correo, FechaNac As Fecha,Telefono_Cli AS Telefono, Estado
		FROM Clientes
		WHERE Cedula_Cli = @CedulaCli;
	END
	ELSE
	BEGIN
		PRINT('Opción inválida');
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientoOferentes]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientoOferentes]
	@CedulaOf char(13),
	@NombreOf varchar(50),
	@1ApellidoOf varchar(50),
	@2ApellidoOf varchar(50),
	@CorreoOf varchar(50),
	@TelefonoOf int,
	@Provincia char(10),
	@EstadoOf bit,
	@Servicio int,
	@FechaNacOf date,
	@operacionOf int
AS
Begin
	DECLARE @mayoriaE int
    SET @mayoriaE = 18

	DECLARE @fechaMayorE date
	SET @fechaMayorE = DATEADD(YEAR, -@mayoriaE, GETDATE())

	if @operacionOf = 1
   IF EXISTS (SELECT 1 FROM Clientes WHERE Cedula_Cli = @CedulaOf or Correo_Cli=@CorreoOf)
    BEGIN
        RAISERROR('Los datos ya existen en la Base de datos(Clientes).', 16, 1)
        RETURN;
    END
	    ELSE IF EXISTS (SELECT 1 FROM Oferentes WHERE Cedula_Of = @CedulaOf or Correo_Of=@CorreoOf)
    BEGIN
        RAISERROR('Los datos ya existen en la Base de datos(OFERENTES).', 16, 2)
        RETURN;
    END
	  ELSE IF EXISTS (SELECT 1 FROM Administradores WHERE Cedula_Adm = @CedulaOf or Correo_Adm=@CorreoOf)
    BEGIN
        RAISERROR('Los datos ya existen en la Base de datos(Administrador).', 16, 3)
        RETURN;
    END
	ELSE
	BEGIN
	IF @FechaNacOf > @fechaMayorE
			BEGIN
				RAISERROR('El OFERENTE debe ser mayor de edad para ser registrado.', 16, 4)
				RETURN;
			END
		insert into Oferentes(Cedula_Of,NombreCompleto,PApellido_Of,SApellido_Of,Correo_Of,Telefonos_Of,Provincia,Estado,FK_IDServicio,FechaNacOf)
		values(@CedulaOf,@NombreOf,@1ApellidoOf,@2ApellidoOf,@CorreoOf,@TelefonoOf,@Provincia,@EstadoOf,@Servicio,@FechaNacOf)
	-- Mensaje de éxito
			PRINT 'El Oferente se ha insertado correctamente.'
	END
	ELSE IF @operacionOf = 2
	 BEGIN
	 	IF @FechaNacOf > @fechaMayorE
			BEGIN
				RAISERROR('El OFERENTE debe ser mayor de edad para ser actualizado.', 16, 5)
				RETURN;
			END
	     UPDATE Oferentes
			SET
				NombreCompleto = @NombreOf,
				PApellido_Of= @1ApellidoOf,
				SApellido_Of = @2ApellidoOf,
				Correo_Of = @CorreoOf,
				Telefonos_Of = @TelefonoOf,
				Provincia = @Provincia,
				Estado = @EstadoOf,
				FK_IDServicio = @Servicio,
				FechaNacOf = @FechaNacOf

			WHERE
				Cedula_Of = @CedulaOf
				-- Condición para la actualización (puedes ajustar la fecha o utilizar otro criterio)
				PRINT 'El OFERENTE se ha actualizado correctamente.';
	END
	 ELSE IF @operacionOf = 3
	 BEGIN
		Delete from Oferentes
		where Cedula_Of = @CedulaOf
	END
	ELSE IF @operacionOf = 4
	 BEGIN
		Select NombreCompleto as Nombre,PApellido_Of as Primer_Apellido,
		SApellido_Of as Segundo_Apellido,Correo_Of as Correo,FechaNacOf as Fecha,Telefonos_Of as Telefono,
		Provincia,S.NombreServicio as Servicio,Estado
		from Oferentes
		Join Servicios s on S.idServicios=Oferentes.FK_IDServicio
		where Cedula_Of = @CedulaOf
	END
	ELSE
	BEGIN
		print('opcion invalida')
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MantenimientoUsuario]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_MantenimientoUsuario]
	@NombreUsuario varchar(50),
	@Clave varchar(50),
	@Oferente char(13),
	@Cliente char(13),
	@Administrador char(13),
	@operacionUs int
AS
BEGIN 

	IF @operacionUs = 1
	BEGIN 
	IF EXISTS (SELECT 1 FROM Cuentas_Suspendidas WHERE @NombreUsuario = NUsuario )
		BEGIN
			RAISERROR('Este usuario esta suspendido.', 16, 1)
			RETURN;
		END
		ELSE
		BEGIN
		insert into Usuarios(NombreUsuario,Clave,FK_CedulaOfrecietes,FK_CedulaClientes,FK_CedulaAdmin)
		values(@NombreUsuario,@Clave,@Oferente,@Cliente,@Administrador)
		PRINT 'El Usuario se ha insertado correctamente.';
		END
	END
	ELSE IF @operacionUs = 2
	BEGIN 
		UPDATE Usuarios
		SET
		NombreUsuario =@NombreUsuario,
		Clave = @Clave
		where
		FK_CedulaOfrecietes = @Oferente or
		FK_CedulaClientes = @Cliente or 
		FK_CedulaAdmin = @Administrador
	END
	ELSE IF @operacionUs = 3
	BEGIN
		Delete from Usuarios
		where FK_CedulaOfrecietes = @Oferente or FK_CedulaClientes = @Cliente or 
			  FK_CedulaAdmin = @Administrador
	END
	ELSE IF @operacionUs = 4
	BEGIN
		Select * from Usuarios
		where FK_CedulaOfrecietes = @Oferente or FK_CedulaClientes = @Cliente or 
			  FK_CedulaAdmin = @Administrador
	END
	ELSE
	BEGIN
		print('opcion invalida')
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MateniminetoUSAdm]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SP_MateniminetoUSAdm]
	@NUsuario varchar(50),
	@Clave varchar(50),
	@Administrador char(13)
as
begin
		insert into Usuarios(NombreUsuario,Clave,FK_CedulaAdmin)
		values(@NUsuario,@Clave,@Administrador)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerCedula]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ObtenerCedula]
    @NombreUsuario VARCHAR(50),
    @Cedula VARCHAR(13) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT @Cedula = 
        CASE
            WHEN FK_CedulaClientes IS NOT NULL THEN FK_CedulaClientes
            WHEN FK_CedulaAdmin IS NOT NULL THEN FK_CedulaAdmin
            WHEN FK_CedulaOfrecietes IS NOT NULL THEN FK_CedulaOfrecietes
            ELSE ''
        END
    FROM Usuarios
    WHERE NombreUsuario = @NombreUsuario;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerReporteServiciosPorCliente]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_ObtenerReporteServiciosPorCliente]
    @CedulaCliente CHAR(13)
AS
BEGIN
    -- Consulta para obtener el reporte de servicios por tipo solicitados por la cédula del cliente
     SELECT
        GETDATE() AS [Fecha de Generación],
        o.[Provincia] AS [Provincia],
        SUM(CASE WHEN s.NombreServicio = 'Fontanero' THEN 1 ELSE 0 END) AS [Fontaneria],
        SUM(CASE WHEN s.NombreServicio = 'Pintor' THEN 1 ELSE 0 END) AS [Pintor],
        SUM(CASE WHEN s.NombreServicio = 'Niñera' THEN 1 ELSE 0 END) AS [Niñera],
        SUM(CASE WHEN s.NombreServicio = 'Empleada Domestica' THEN 1 ELSE 0 END) AS [Empleada Doméstico]
    FROM
        [ProyectoADM_BD].[dbo].[Mensaje_Of] mo
    INNER JOIN
        [ProyectoADM_BD].[dbo].[Oferentes] o ON mo.[Cedula_Of] = o.[Cedula_Of]
    INNER JOIN 
        Servicios s ON s.idServicios = mo.FK_IDServicios
    WHERE
        mo.Cedula_Cli = @CedulaCliente
    GROUP BY
        o.[Provincia];
END;
GO
/****** Object:  Trigger [dbo].[TR_UsuarioEliminado]    Script Date: 16/8/2023 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_UsuarioEliminado]
ON [dbo].[Usuarios]
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar usuarios eliminados en Cuentas_Suspendidas
    INSERT INTO Cuentas_Suspendidas (NUsuario)
    SELECT d.[NombreUsuario]
    FROM deleted d;

END
GO
ALTER TABLE [dbo].[Usuarios] ENABLE TRIGGER [TR_UsuarioEliminado]
GO
USE [master]
GO
ALTER DATABASE [ProyectoADM_BD] SET  READ_WRITE 
GO
