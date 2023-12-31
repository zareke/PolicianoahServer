USE [master]
GO
/****** Object:  Database [PolicianoahServer]    Script Date: 8/9/2023 15:49:47 ******/
CREATE DATABASE [PolicianoahServer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PolicianoahServer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PolicianoahServer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PolicianoahServer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PolicianoahServer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PolicianoahServer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PolicianoahServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PolicianoahServer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PolicianoahServer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PolicianoahServer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PolicianoahServer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PolicianoahServer] SET ARITHABORT OFF 
GO
ALTER DATABASE [PolicianoahServer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PolicianoahServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PolicianoahServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PolicianoahServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PolicianoahServer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PolicianoahServer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PolicianoahServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PolicianoahServer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PolicianoahServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PolicianoahServer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PolicianoahServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PolicianoahServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PolicianoahServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PolicianoahServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PolicianoahServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PolicianoahServer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PolicianoahServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PolicianoahServer] SET RECOVERY FULL 
GO
ALTER DATABASE [PolicianoahServer] SET  MULTI_USER 
GO
ALTER DATABASE [PolicianoahServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PolicianoahServer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PolicianoahServer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PolicianoahServer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PolicianoahServer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PolicianoahServer', N'ON'
GO
ALTER DATABASE [PolicianoahServer] SET QUERY_STORE = OFF
GO
USE [PolicianoahServer]
GO
/****** Object:  User [alumno]    Script Date: 8/9/2023 15:49:47 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresas](
	[id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](4000) NOT NULL,
	[fecha_fundacion] [date] NOT NULL,
 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ganadores]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ganadores](
	[id_ganador] [int] IDENTITY(1,1) NOT NULL,
	[id_partida] [int] NOT NULL,
	[id_jugador] [int] NOT NULL,
	[id_premio] [int] NOT NULL,
 CONSTRAINT [PK_Ganadores] PRIMARY KEY CLUSTERED 
(
	[id_ganador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[id_genero] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juegos]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos](
	[id_juego] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](4000) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[id_genero] [int] NOT NULL,
	[fecha_creacion] [date] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[id_empresa] [int] NOT NULL,
 CONSTRAINT [PK_Juegos] PRIMARY KEY CLUSTERED 
(
	[id_juego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[id_jugador] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](4000) NOT NULL,
	[apellido] [varchar](4000) NOT NULL,
	[email] [varchar](4000) NOT NULL,
	[direccion] [varchar](4000) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[id_zodiaco] [int] NOT NULL,
	[id_personaje] [int] NOT NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[id_jugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidas]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidas](
	[id_partida] [int] IDENTITY(1,1) NOT NULL,
	[id_juego] [int] NOT NULL,
	[id_jugador_1] [int] NOT NULL,
	[id_jugador_2] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[id_puntaje1] [int] NOT NULL,
	[id_puntaje2] [int] NOT NULL,
	[id_ganador] [int] NOT NULL,
 CONSTRAINT [PK_Partidas] PRIMARY KEY CLUSTERED 
(
	[id_partida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personajes]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personajes](
	[id_personaje] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_Personajes] PRIMARY KEY CLUSTERED 
(
	[id_personaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Premios]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Premios](
	[id_premio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](4000) NOT NULL,
	[descripcion] [varchar](4000) NOT NULL,
	[valor] [money] NOT NULL,
 CONSTRAINT [PK_Premios] PRIMARY KEY CLUSTERED 
(
	[id_premio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puntajes]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntajes](
	[id_puntaje] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_jugador] [int] NOT NULL,
 CONSTRAINT [PK_Puntajes] PRIMARY KEY CLUSTERED 
(
	[id_puntaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zodiacos]    Script Date: 8/9/2023 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zodiacos](
	[id_zodiaco] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_Zodiacos] PRIMARY KEY CLUSTERED 
(
	[id_zodiaco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Empresas] ON 

INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (1, N'Nintendo', CAST(N'1889-09-23' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (2, N'Sega', CAST(N'1960-06-03' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (3, N'Atari', CAST(N'1972-06-27' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (4, N'Ubisoft', CAST(N'1986-03-28' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (5, N'Electronic Arts (EA)', CAST(N'1982-05-28' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (6, N'Square Enix', CAST(N'1986-09-22' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (7, N'Capcom', CAST(N'1979-06-11' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (8, N'Blizzard Entertainment', CAST(N'1991-02-08' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (9, N'Konami', CAST(N'1969-03-21' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (10, N'Bethesda Game Studios', CAST(N'1986-06-28' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (11, N'Rockstar Games', CAST(N'1998-12-01' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (12, N'Valve Corporation', CAST(N'1996-08-24' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (13, N'Activision', CAST(N'1979-10-01' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (14, N'Epic Games', CAST(N'1991-01-01' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (15, N'CD Projekt Red', CAST(N'1994-03-30' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (16, N'Bandai Namco Entertainment', CAST(N'1955-06-01' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (17, N'Sony Interactive Entertainment', CAST(N'1993-11-16' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (18, N'THQ Nordic', CAST(N'2011-08-01' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (19, N'Gearbox Software', CAST(N'1999-02-16' AS Date))
INSERT [dbo].[Empresas] ([id_empresa], [nombre], [fecha_fundacion]) VALUES (20, N'2K Games', CAST(N'2005-01-25' AS Date))
SET IDENTITY_INSERT [dbo].[Empresas] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (1, N'Acción')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (2, N'Aventura')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (3, N'RPG (Rol-Playing Game)')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (4, N'Disparos (Shooter)')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (5, N'Estrategia')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (6, N'Simulación')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (7, N'Deportes')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (8, N'Carreras')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (9, N'Puzzle')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (10, N'Plataformas')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (11, N'Survival Horror')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (12, N'Mundo Abierto (Open World)')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (13, N'Música y Ritmo')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (14, N'Juegos de Cartas')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (15, N'Lucha (Fighting)')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (16, N'Sigilo (Stealth)')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (17, N'Battle Royale')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (18, N'MMORPG (Multijugador Masivo en Línea)')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (19, N'Ciencia Ficción')
INSERT [dbo].[Generos] ([id_genero], [nombre]) VALUES (20, N'Fantasía')
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
SET IDENTITY_INSERT [dbo].[Juegos] ON 

INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (1, N'Únete a la batalla en este emocionante juego de disparos multijugador.', N'Battle Royale Xtreme', 4, CAST(N'2023-08-10' AS Date), CAST(N'2023-08-15' AS Date), CAST(N'2023-12-31' AS Date), 1)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (2, N'Explora un mundo de fantasía y derrota a los dragones en esta aventura épica.', N'Dragonslayer', 2, CAST(N'2023-07-05' AS Date), CAST(N'2023-07-10' AS Date), CAST(N'2023-11-30' AS Date), 2)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (3, N'Construye y gestiona tu propia granja en este simulador agrícola.', N'Granja en Marcha', 6, CAST(N'2023-06-01' AS Date), CAST(N'2023-06-05' AS Date), CAST(N'2023-10-15' AS Date), 3)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (4, N'Demuestra tus habilidades en las pistas de carreras más emocionantes.', N'Racing Masters', 8, CAST(N'2023-05-20' AS Date), CAST(N'2023-05-25' AS Date), CAST(N'2023-09-30' AS Date), 4)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (5, N'Entra en una guerra futurista y lucha contra alienígenas en este shooter.', N'Alien Warzone', 4, CAST(N'2023-04-15' AS Date), CAST(N'2023-04-20' AS Date), CAST(N'2023-08-31' AS Date), 5)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (6, N'Resuelve enigmas y descubre misterios en esta aventura de detectives.', N'Misterios de la Ciudad', 2, CAST(N'2023-03-10' AS Date), CAST(N'2023-03-15' AS Date), CAST(N'2023-07-31' AS Date), 6)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (7, N'Sobrevive a un apocalipsis zombi en este juego de supervivencia.', N'Survival Zombie', 10, CAST(N'2023-02-05' AS Date), CAST(N'2023-02-10' AS Date), CAST(N'2023-06-30' AS Date), 7)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (8, N'Domina el arte de la magia en este juego de rol y hechicería.', N'Magia Elemental', 3, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-05' AS Date), CAST(N'2023-05-31' AS Date), 8)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (9, N'Participa en carreras ilegales y escapa de la policía en este juego de carreras.', N'Street Racers', 8, CAST(N'2022-12-15' AS Date), CAST(N'2022-12-20' AS Date), CAST(N'2023-04-30' AS Date), 9)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (10, N'Enfréntate a monstruos y dragones en este juego de aventuras de fantasía.', N'Cazadores de Bestias', 2, CAST(N'2022-11-10' AS Date), CAST(N'2022-11-15' AS Date), CAST(N'2023-03-31' AS Date), 10)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (11, N'Explora un mundo de ciencia ficción y completa misiones en este RPG espacial.', N'Galaxy Quest', 3, CAST(N'2022-10-05' AS Date), CAST(N'2022-10-10' AS Date), CAST(N'2023-02-28' AS Date), 11)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (12, N'Construye tu propia ciudad y gestiona su crecimiento en este juego de simulación.', N'Ciudad Magna', 6, CAST(N'2022-09-01' AS Date), CAST(N'2022-09-05' AS Date), CAST(N'2023-01-31' AS Date), 12)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (13, N'Sé el héroe de un mundo de plataformas y rescata a la princesa en apuros.', N'El Rescate Real', 1, CAST(N'2022-08-15' AS Date), CAST(N'2022-08-20' AS Date), CAST(N'2023-01-15' AS Date), 13)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (14, N'Pon a prueba tu ingenio en este juego de rompecabezas desafiante.', N'Enigmas Mentales', 8, CAST(N'2022-07-10' AS Date), CAST(N'2022-07-15' AS Date), CAST(N'2022-12-31' AS Date), 14)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (15, N'Lucha contra monstruos gigantes en este juego de acción y aventuras.', N'Titanes del Caos', 4, CAST(N'2022-06-05' AS Date), CAST(N'2022-06-10' AS Date), CAST(N'2022-11-30' AS Date), 15)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (16, N'Participa en batallas callejeras y reclama el territorio en este juego de acción.', N'Gang Wars', 4, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-05' AS Date), CAST(N'2022-10-15' AS Date), 16)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (17, N'Explora planetas lejanos y combate a la amenaza alienígena en este juego de disparos.', N'Alien Odyssey', 4, CAST(N'2022-04-15' AS Date), CAST(N'2022-04-20' AS Date), CAST(N'2022-09-30' AS Date), 17)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (18, N'Cuida de tus animales y cultiva tu tierra en este juego de simulación agrícola.', N'Granja Feliz', 6, CAST(N'2022-03-10' AS Date), CAST(N'2022-03-15' AS Date), CAST(N'2022-08-31' AS Date), 18)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (19, N'Surca los mares en busca de tesoros y descubre islas secretas en este juego de aventuras.', N'Maravillas Marinas', 2, CAST(N'2022-02-05' AS Date), CAST(N'2022-02-10' AS Date), CAST(N'2022-07-31' AS Date), 19)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (20, N'Forma un equipo de héroes legendarios y derrota a los villanos en este RPG épico.', N'Leyendas del Destino', 3, CAST(N'2022-01-01' AS Date), CAST(N'2022-01-05' AS Date), CAST(N'2022-06-30' AS Date), 20)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (21, N'Lucha contra monstruos y dragones en este juego de fantasía épica.', N'La Saga del Héroe', 2, CAST(N'2021-12-15' AS Date), CAST(N'2021-12-20' AS Date), CAST(N'2022-05-31' AS Date), 1)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (22, N'Desarrolla tu carrera como detective en este juego de aventuras y resuelve crímenes misteriosos.', N'Detective en Acción', 2, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-15' AS Date), CAST(N'2022-04-30' AS Date), 2)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (23, N'Sobrevive a un apocalipsis zombi en este juego de supervivencia en un mundo abierto.', N'Zombie Survival: Amanecer', 10, CAST(N'2021-10-05' AS Date), CAST(N'2021-10-10' AS Date), CAST(N'2022-03-31' AS Date), 3)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (24, N'Lucha contra enemigos en un mundo de ciencia ficción en este shooter futurista.', N'Guerra Cósmica', 4, CAST(N'2021-09-01' AS Date), CAST(N'2021-09-05' AS Date), CAST(N'2022-02-28' AS Date), 4)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (25, N'Sé un piloto de combate y protege tu nación en este simulador de vuelo.', N'Cazadores del Cielo', 5, CAST(N'2021-08-15' AS Date), CAST(N'2021-08-20' AS Date), CAST(N'2022-01-31' AS Date), 5)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (26, N'Explora mundos alienígenas y descubre civilizaciones perdidas en este juego de exploración espacial.', N'Expedición Galáctica', 3, CAST(N'2021-07-10' AS Date), CAST(N'2021-07-15' AS Date), CAST(N'2021-12-31' AS Date), 6)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (27, N'Construye y gestiona un parque de atracciones en este juego de simulación.', N'Parque de Diversión', 6, CAST(N'2021-06-05' AS Date), CAST(N'2021-06-10' AS Date), CAST(N'2021-11-30' AS Date), 7)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (28, N'Viaja atrás en el tiempo y cambia la historia en este juego de aventuras temporales.', N'Máquina del Tiempo', 2, CAST(N'2021-05-01' AS Date), CAST(N'2021-05-05' AS Date), CAST(N'2021-10-15' AS Date), 8)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (29, N'Sé el comandante de una flota espacial y defiende la galaxia en este juego de estrategia.', N'Dominación Galáctica', 3, CAST(N'2021-04-15' AS Date), CAST(N'2021-04-20' AS Date), CAST(N'2021-09-30' AS Date), 9)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (30, N'Embárcate en una expedición en busca de tesoros en un mundo misterioso.', N'Buscadores de Tesoros', 2, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-15' AS Date), CAST(N'2021-08-31' AS Date), 10)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (31, N'Pon a prueba tus habilidades de sigilo en misiones secretas en este juego de espías.', N'Operación Encubierta', 11, CAST(N'2021-02-05' AS Date), CAST(N'2021-02-10' AS Date), CAST(N'2021-07-31' AS Date), 11)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (32, N'Explora un mundo submarino y descubre criaturas marinas en este juego de aventuras acuáticas.', N'Aventuras Submarinas', 2, CAST(N'2021-01-01' AS Date), CAST(N'2021-01-05' AS Date), CAST(N'2021-06-30' AS Date), 12)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (33, N'Lucha contra pandillas rivales y reclama el control de la ciudad en este juego de acción.', N'Gangsters en la Sombra', 4, CAST(N'2020-12-15' AS Date), CAST(N'2020-12-20' AS Date), CAST(N'2021-05-31' AS Date), 13)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (34, N'Construye un imperio comercial en este juego de estrategia económica.', N'Imperio Comercial', 6, CAST(N'2020-11-10' AS Date), CAST(N'2020-11-15' AS Date), CAST(N'2021-04-30' AS Date), 14)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (35, N'Sé el héroe que el mundo necesita y lucha contra el crimen en esta aventura de superhéroes.', N'Héroes en Acción', 3, CAST(N'2020-10-05' AS Date), CAST(N'2020-10-10' AS Date), CAST(N'2021-03-31' AS Date), 15)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (36, N'Embárcate en una expedición arqueológica y descubre tesoros antiguos en este juego de aventuras.', N'Arqueólogos Intrépidos', 2, CAST(N'2020-09-01' AS Date), CAST(N'2020-09-05' AS Date), CAST(N'2021-02-28' AS Date), 16)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (37, N'Lucha por la justicia y protege la ciudad en este juego de acción de superhéroes.', N'Defensores de la Ciudad', 3, CAST(N'2020-08-15' AS Date), CAST(N'2020-08-20' AS Date), CAST(N'2021-01-31' AS Date), 17)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (38, N'Domina la magia y enfrenta a poderosos enemigos en este juego de rol mágico.', N'Hechiceros Legendarios', 3, CAST(N'2020-07-10' AS Date), CAST(N'2020-07-15' AS Date), CAST(N'2020-12-31' AS Date), 18)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (39, N'Construye tu propio mundo en este juego de construcción y gestión de ciudades.', N'Ciudad Creativa', 6, CAST(N'2020-06-05' AS Date), CAST(N'2020-06-10' AS Date), CAST(N'2020-11-30' AS Date), 19)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (40, N'Sobrevive a una invasión alienígena en este juego de supervivencia de ciencia ficción.', N'Invasión Extraterrestre', 4, CAST(N'2020-05-01' AS Date), CAST(N'2020-05-05' AS Date), CAST(N'2020-10-15' AS Date), 20)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (41, N'Forma un equipo de héroes y derrota a los monstruos en este juego de rol épico.', N'Héroes Legendarios', 3, CAST(N'2020-04-10' AS Date), CAST(N'2020-04-15' AS Date), CAST(N'2020-09-30' AS Date), 1)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (42, N'Construye y gestiona tu propio parque de atracciones en este juego de simulación.', N'Parque de Diversión Xtreme', 6, CAST(N'2020-03-05' AS Date), CAST(N'2020-03-10' AS Date), CAST(N'2020-08-31' AS Date), 2)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (43, N'Pon a prueba tus habilidades de sigilo y espionaje en misiones secretas.', N'Agente Encubierto', 11, CAST(N'2020-02-01' AS Date), CAST(N'2020-02-05' AS Date), CAST(N'2020-07-31' AS Date), 3)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (44, N'Explora un mundo postapocalíptico y lucha por la supervivencia en este juego de acción.', N'Survivor: Desolación', 10, CAST(N'2020-01-15' AS Date), CAST(N'2020-01-20' AS Date), CAST(N'2020-06-30' AS Date), 4)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (45, N'Demuestra tus habilidades de tiro en este juego de disparos en primera persona.', N'Shooter Maestro', 4, CAST(N'2019-12-10' AS Date), CAST(N'2019-12-15' AS Date), CAST(N'2020-05-31' AS Date), 5)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (46, N'Construye tu propio imperio comercial y domina el mercado en este juego de estrategia económica.', N'Magnate Empresarial', 6, CAST(N'2019-11-05' AS Date), CAST(N'2019-11-10' AS Date), CAST(N'2020-04-30' AS Date), 6)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (47, N'Enfréntate a desafíos sobrenaturales en este juego de aventuras de terror.', N'Pesadillas Nocturnas', 7, CAST(N'2019-10-01' AS Date), CAST(N'2019-10-05' AS Date), CAST(N'2020-03-31' AS Date), 7)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (48, N'Embárcate en una búsqueda épica en busca de tesoros perdidos en este juego de aventuras.', N'Buscadores de Tesoros Legendarios', 2, CAST(N'2019-09-15' AS Date), CAST(N'2019-09-20' AS Date), CAST(N'2020-02-29' AS Date), 8)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (49, N'Lucha contra dragones y criaturas míticas en este juego de rol de fantasía.', N'Héroes de la Fantasía', 3, CAST(N'2019-08-10' AS Date), CAST(N'2019-08-15' AS Date), CAST(N'2020-01-31' AS Date), 9)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (50, N'Explora el espacio y coloniza planetas en este juego de estrategia espacial.', N'Colonizadores del Espacio', 12, CAST(N'2019-07-05' AS Date), CAST(N'2019-07-10' AS Date), CAST(N'2019-12-31' AS Date), 10)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (51, N'Construye tu propia ciudad medieval en este juego de construcción y gestión.', N'Ciudad Medieval', 6, CAST(N'2019-06-01' AS Date), CAST(N'2019-06-05' AS Date), CAST(N'2019-11-30' AS Date), 11)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (52, N'Sé el líder de un equipo de héroes y defiende la tierra en este juego de defensa épica.', N'Defensores de la Tierra', 3, CAST(N'2019-05-20' AS Date), CAST(N'2019-05-25' AS Date), CAST(N'2019-10-15' AS Date), 12)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (53, N'Domina las artes marciales y compite en torneos en este juego de lucha.', N'Campeonato de Artes Marciales', 14, CAST(N'2019-04-15' AS Date), CAST(N'2019-04-20' AS Date), CAST(N'2019-09-30' AS Date), 13)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (54, N'Explora un mundo mágico lleno de criaturas asombrosas en este juego de aventuras.', N'Mundo Mágico', 2, CAST(N'2019-03-10' AS Date), CAST(N'2019-03-15' AS Date), CAST(N'2019-08-31' AS Date), 14)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (55, N'Entra en un mundo de realidad virtual y vive aventuras emocionantes en este juego de VR.', N'Aventuras en VR', 1, CAST(N'2019-02-05' AS Date), CAST(N'2019-02-10' AS Date), CAST(N'2019-07-31' AS Date), 15)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (56, N'Sobrevive en un mundo apocalíptico lleno de zombies y lucha por tu vida.', N'Zombie Apocalypse: Supervivencia', 10, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-05' AS Date), CAST(N'2019-06-30' AS Date), 16)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (57, N'Conviértete en un pirata legendario y saquea los mares en este juego de aventuras náuticas.', N'Piratas del Mar', 2, CAST(N'2018-12-15' AS Date), CAST(N'2018-12-20' AS Date), CAST(N'2019-05-31' AS Date), 17)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (58, N'Embárcate en una búsqueda épica para derrotar al dragón en este juego de rol de fantasía.', N'La Batalla del Dragón', 3, CAST(N'2018-11-10' AS Date), CAST(N'2018-11-15' AS Date), CAST(N'2019-04-30' AS Date), 18)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (59, N'Lucha contra hordas de monstruos en este juego de acción y defiende el reino.', N'Defensores del Reino', 4, CAST(N'2018-10-05' AS Date), CAST(N'2018-10-10' AS Date), CAST(N'2019-03-31' AS Date), 19)
INSERT [dbo].[Juegos] ([id_juego], [descripcion], [nombre], [id_genero], [fecha_creacion], [fecha_inicio], [fecha_fin], [id_empresa]) VALUES (60, N'Explora un mundo de ciencia ficción y completa misiones en este juego de exploración espacial.', N'Exploradores del Espacio', 3, CAST(N'2018-09-01' AS Date), CAST(N'2018-09-05' AS Date), CAST(N'2019-02-28' AS Date), 20)
SET IDENTITY_INSERT [dbo].[Juegos] OFF
GO
SET IDENTITY_INSERT [dbo].[Jugadores] ON 

INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (1, N'John', N'Smith', N'john.smith@example.com', N'123 Main St', CAST(N'1990-03-15' AS Date), 2, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (2, N'Emily', N'Johnson', N'emily.johnson@example.com', N'456 Elm St', CAST(N'1985-07-22' AS Date), 5, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (3, N'Daniel', N'Williams', N'daniel.williams@example.com', N'789 Oak St', CAST(N'1995-01-10' AS Date), 9, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (4, N'Olivia', N'Jones', N'olivia.jones@example.com', N'321 Maple Ave', CAST(N'1992-09-05' AS Date), 1, 7)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (5, N'William', N'Brown', N'william.brown@example.com', N'654 Cedar Rd', CAST(N'1988-11-18' AS Date), 12, 9)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (6, N'Ava', N'Davis', N'ava.davis@example.com', N'987 Pine Ln', CAST(N'1987-06-30' AS Date), 3, 11)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (7, N'James', N'Miller', N'james.miller@example.com', N'741 Birch Blvd', CAST(N'1993-04-03' AS Date), 8, 13)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (8, N'Sophia', N'Wilson', N'sophia.wilson@example.com', N'852 Redwood Dr', CAST(N'1991-02-20' AS Date), 6, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (9, N'Benjamin', N'Moore', N'benjamin.moore@example.com', N'369 Spruce St', CAST(N'1989-12-12' AS Date), 4, 2)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (10, N'Emma', N'Taylor', N'emma.taylor@example.com', N'159 Cedar Rd', CAST(N'1986-08-25' AS Date), 11, 4)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (11, N'Henry', N'Anderson', N'henry.anderson@example.com', N'753 Elm St', CAST(N'1996-10-07' AS Date), 7, 6)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (12, N'Mia', N'Wilson', N'mia.wilson@example.com', N'852 Birch Blvd', CAST(N'1994-03-09' AS Date), 10, 8)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (13, N'Liam', N'Garcia', N'liam.garcia@example.com', N'456 Oak St', CAST(N'1997-05-29' AS Date), 9, 10)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (14, N'Charlotte', N'Thomas', N'charlotte.thomas@example.com', N'654 Pine Ln', CAST(N'1990-01-14' AS Date), 2, 12)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (15, N'Ethan', N'Hall', N'ethan.hall@example.com', N'987 Maple Ave', CAST(N'1985-11-02' AS Date), 5, 14)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (16, N'Olivia', N'Clark', N'olivia.clark@example.com', N'123 Cedar Rd', CAST(N'1992-07-21' AS Date), 1, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (17, N'Noah', N'Martinez', N'noah.martinez@example.com', N'369 Elm St', CAST(N'1987-09-19' AS Date), 12, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (18, N'Amelia', N'Rodriguez', N'amelia.rodriguez@example.com', N'741 Oak St', CAST(N'1995-03-04' AS Date), 8, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (19, N'Mason', N'Gonzalez', N'mason.gonzalez@example.com', N'456 Pine Ln', CAST(N'1991-06-16' AS Date), 6, 7)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (20, N'Harper', N'Lopez', N'harper.lopez@example.com', N'852 Elm St', CAST(N'1994-12-01' AS Date), 4, 9)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (21, N'Elijah', N'Hernandez', N'elijah.hernandez@example.com', N'987 Cedar Rd', CAST(N'1993-08-12' AS Date), 3, 11)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (22, N'Evelyn', N'Perez', N'evelyn.perez@example.com', N'123 Maple Ave', CAST(N'1996-02-28' AS Date), 10, 13)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (23, N'Logan', N'Gonzalez', N'logan.gonzalez@example.com', N'369 Cedar Rd', CAST(N'1992-10-11' AS Date), 7, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (24, N'Abigail', N'Turner', N'abigail.turner@example.com', N'654 Oak St', CAST(N'1990-04-03' AS Date), 9, 2)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (25, N'Michael', N'Reed', N'michael.reed@example.com', N'741 Pine Ln', CAST(N'1991-07-25' AS Date), 11, 4)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (26, N'Ava', N'Baker', N'ava.baker@example.com', N'852 Elm St', CAST(N'1988-11-18' AS Date), 1, 6)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (27, N'William', N'King', N'william.king@example.com', N'987 Oak St', CAST(N'1986-03-15' AS Date), 5, 8)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (28, N'Sofia', N'Hall', N'sofia.hall@example.com', N'123 Maple Ave', CAST(N'1994-09-07' AS Date), 2, 10)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (29, N'Mia', N'Scott', N'mia.scott@example.com', N'741 Birch Blvd', CAST(N'1989-01-30' AS Date), 8, 12)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (30, N'Alexander', N'Turner', N'alexander.turner@example.com', N'369 Cedar Rd', CAST(N'1997-05-14' AS Date), 10, 14)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (31, N'Eleanor', N'Adams', N'eleanor.adams@example.com', N'987 Pine Ln', CAST(N'1996-06-23' AS Date), 4, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (32, N'Liam', N'Mitchell', N'liam.mitchell@example.com', N'852 Elm St', CAST(N'1987-10-09' AS Date), 7, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (33, N'Grace', N'Collins', N'grace.collins@example.com', N'123 Oak St', CAST(N'1991-04-17' AS Date), 3, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (34, N'Lucas', N'Harris', N'lucas.harris@example.com', N'654 Cedar Rd', CAST(N'1990-08-20' AS Date), 12, 7)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (35, N'Chloe', N'Martin', N'chloe.martin@example.com', N'741 Elm St', CAST(N'1995-11-29' AS Date), 6, 9)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (36, N'Oliver', N'Phillips', N'oliver.phillips@example.com', N'369 Pine Ln', CAST(N'1993-02-12' AS Date), 1, 11)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (37, N'Emma', N'Long', N'emma.long@example.com', N'987 Maple Ave', CAST(N'1988-12-03' AS Date), 9, 13)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (38, N'Mason', N'Morris', N'mason.morris@example.com', N'852 Oak St', CAST(N'1994-07-06' AS Date), 5, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (39, N'Avery', N'Parker', N'avery.parker@example.com', N'369 Elm St', CAST(N'1996-01-27' AS Date), 2, 2)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (40, N'Charlotte', N'Hernandez', N'charlotte.hernandez@example.com', N'741 Pine Ln', CAST(N'1992-03-14' AS Date), 8, 4)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (41, N'Liam', N'Young', N'liam.young@example.com', N'123 Cedar Rd', CAST(N'1990-09-01' AS Date), 11, 6)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (42, N'Harper', N'Garcia', N'harper.garcia@example.com', N'654 Elm St', CAST(N'1997-12-23' AS Date), 7, 8)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (43, N'Ella', N'Gonzalez', N'ella.gonzalez@example.com', N'852 Cedar Rd', CAST(N'1995-10-18' AS Date), 4, 10)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (44, N'Carter', N'Adams', N'carter.adams@example.com', N'369 Pine Ln', CAST(N'1986-05-06' AS Date), 10, 12)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (45, N'Aria', N'Scott', N'aria.scott@example.com', N'741 Oak St', CAST(N'1993-08-14' AS Date), 3, 14)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (46, N'Lucas', N'Reed', N'lucas.reed@example.com', N'123 Birch Blvd', CAST(N'1991-01-05' AS Date), 6, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (47, N'Amelia', N'Wright', N'amelia.wright@example.com', N'369 Elm St', CAST(N'1998-02-28' AS Date), 12, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (48, N'Jackson', N'Mitchell', N'jackson.mitchell@example.com', N'741 Pine Ln', CAST(N'1994-06-17' AS Date), 9, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (49, N'Abigail', N'Lewis', N'abigail.lewis@example.com', N'852 Cedar Rd', CAST(N'1990-11-10' AS Date), 7, 7)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (50, N'Owen', N'Hill', N'owen.hill@example.com', N'123 Pine Ln', CAST(N'1988-04-09' AS Date), 2, 9)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (51, N'Scarlett', N'Foster', N'scarlett.foster@example.com', N'654 Maple Ave', CAST(N'1996-03-01' AS Date), 5, 11)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (52, N'Evelyn', N'Gray', N'evelyn.gray@example.com', N'987 Cedar Rd', CAST(N'1992-09-12' AS Date), 1, 13)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (53, N'Henry', N'Kelly', N'henry.kelly@example.com', N'741 Elm St', CAST(N'1987-07-25' AS Date), 8, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (54, N'Sophia', N'Carter', N'sophia.carter@example.com', N'369 Oak St', CAST(N'1995-02-18' AS Date), 6, 2)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (55, N'Elijah', N'Brooks', N'elijah.brooks@example.com', N'852 Cedar Rd', CAST(N'1993-06-30' AS Date), 10, 4)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (56, N'Amelia', N'Scott', N'amelia.scott@example.com', N'123 Elm St', CAST(N'1989-12-15' AS Date), 4, 6)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (57, N'Oliver', N'Johnson', N'oliver.johnson@example.com', N'987 Pine Ln', CAST(N'1991-04-20' AS Date), 9, 8)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (58, N'Lucy', N'Ramirez', N'lucy.ramirez@example.com', N'741 Birch Blvd', CAST(N'1997-09-11' AS Date), 5, 10)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (59, N'Logan', N'Murphy', N'logan.murphy@example.com', N'369 Oak St', CAST(N'1992-01-08' AS Date), 7, 12)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (60, N'Aria', N'Parker', N'aria.parker@example.com', N'852 Elm St', CAST(N'1990-11-25' AS Date), 2, 14)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (61, N'Noah', N'Adams', N'noah.adams@example.com', N'123 Pine Ln', CAST(N'1986-10-12' AS Date), 1, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (62, N'Mia', N'Martin', N'mia.martin@example.com', N'741 Oak St', CAST(N'1996-08-05' AS Date), 11, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (63, N'Ethan', N'Clark', N'ethan.clark@example.com', N'987 Cedar Rd', CAST(N'1994-02-28' AS Date), 6, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (64, N'Ella', N'Perez', N'ella.perez@example.com', N'369 Maple Ave', CAST(N'1993-07-14' AS Date), 4, 7)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (65, N'Jackson', N'Turner', N'jackson.turner@example.com', N'852 Elm St', CAST(N'1991-03-09' AS Date), 10, 9)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (66, N'Evelyn', N'Wright', N'evelyn.wright@example.com', N'123 Oak St', CAST(N'1987-05-21' AS Date), 7, 11)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (67, N'Carter', N'Harris', N'carter.harris@example.com', N'741 Pine Ln', CAST(N'1990-02-16' AS Date), 5, 13)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (68, N'Oliver', N'Martin', N'oliver.martin@example.com', N'369 Cedar Rd', CAST(N'1994-06-09' AS Date), 3, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (69, N'Lucas', N'Anderson', N'lucas.anderson@example.com', N'987 Elm St', CAST(N'1998-09-12' AS Date), 12, 2)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (70, N'Sofia', N'Roberts', N'sofia.roberts@example.com', N'741 Pine Ln', CAST(N'1995-03-28' AS Date), 8, 4)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (71, N'Avery', N'White', N'avery.white@example.com', N'369 Oak St', CAST(N'1992-01-01' AS Date), 1, 6)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (72, N'Harper', N'Garcia', N'harper.garcia@example.com', N'852 Cedar Rd', CAST(N'1997-04-10' AS Date), 7, 8)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (73, N'Ella', N'Clark', N'ella.clark@example.com', N'123 Pine Ln', CAST(N'1988-08-25' AS Date), 11, 10)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (74, N'Alexander', N'Rodriguez', N'alexander.rodriguez@example.com', N'741 Elm St', CAST(N'1990-07-19' AS Date), 9, 12)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (75, N'Grace', N'Hall', N'grace.hall@example.com', N'987 Oak St', CAST(N'1993-12-30' AS Date), 6, 14)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (76, N'Mia', N'Taylor', N'mia.taylor@example.com', N'369 Birch Blvd', CAST(N'1991-09-14' AS Date), 4, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (77, N'Ethan', N'Foster', N'ethan.foster@example.com', N'852 Cedar Rd', CAST(N'1996-11-02' AS Date), 3, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (78, N'Liam', N'Gonzalez', N'liam.gonzalez@example.com', N'123 Elm St', CAST(N'1998-04-15' AS Date), 5, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (79, N'Harper', N'Hill', N'harper.hill@example.com', N'741 Pine Ln', CAST(N'1991-11-18' AS Date), 3, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (80, N'Aiden', N'Lewis', N'aiden.lewis@example.com', N'987 Cedar Rd', CAST(N'1988-09-10' AS Date), 8, 2)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (81, N'Chloe', N'Anderson', N'chloe.anderson@example.com', N'369 Maple Ave', CAST(N'1997-03-04' AS Date), 4, 4)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (82, N'Mason', N'Brown', N'mason.brown@example.com', N'852 Elm St', CAST(N'1992-02-28' AS Date), 10, 6)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (83, N'Ella', N'Clark', N'ella.clark@example.com', N'123 Pine Ln', CAST(N'1987-06-25' AS Date), 1, 8)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (84, N'Liam', N'Garcia', N'liam.garcia@example.com', N'741 Elm St', CAST(N'1990-10-12' AS Date), 5, 10)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (85, N'Grace', N'Wright', N'grace.wright@example.com', N'987 Oak St', CAST(N'1995-12-25' AS Date), 7, 12)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (86, N'Lucas', N'Taylor', N'lucas.taylor@example.com', N'369 Birch Blvd', CAST(N'1993-03-18' AS Date), 3, 14)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (87, N'Amelia', N'Roberts', N'amelia.roberts@example.com', N'852 Cedar Rd', CAST(N'1998-05-01' AS Date), 11, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (88, N'Evelyn', N'King', N'evelyn.king@example.com', N'123 Elm St', CAST(N'1991-08-14' AS Date), 6, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (89, N'Jackson', N'Harris', N'jackson.harris@example.com', N'741 Pine Ln', CAST(N'1996-09-02' AS Date), 12, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (90, N'Oliver', N'Adams', N'oliver.adams@example.com', N'369 Oak St', CAST(N'1994-04-10' AS Date), 9, 7)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (91, N'Chloe', N'Parker', N'chloe.parker@example.com', N'852 Cedar Rd', CAST(N'1988-01-05' AS Date), 4, 9)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (92, N'Ethan', N'Gonzalez', N'ethan.gonzalez@example.com', N'123 Pine Ln', CAST(N'1990-07-28' AS Date), 8, 11)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (93, N'Lucy', N'Mitchell', N'lucy.mitchell@example.com', N'741 Elm St', CAST(N'1993-06-12' AS Date), 1, 13)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (94, N'Logan', N'Hernandez', N'logan.hernandez@example.com', N'987 Oak St', CAST(N'1995-11-04' AS Date), 5, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (95, N'Ava', N'Wright', N'ava.wright@example.com', N'369 Cedar Rd', CAST(N'1992-03-18' AS Date), 7, 2)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (96, N'Mason', N'Ramirez', N'mason.ramirez@example.com', N'852 Elm St', CAST(N'1997-08-29' AS Date), 11, 4)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (97, N'Liam', N'Perez', N'liam.perez@example.com', N'123 Elm St', CAST(N'1989-10-12' AS Date), 6, 6)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (98, N'Ella', N'Garcia', N'ella.garcia@example.com', N'741 Cedar Rd', CAST(N'1990-12-25' AS Date), 3, 8)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (99, N'Olivia', N'Gonzalez', N'olivia.gonzalez@example.com', N'987 Maple Ave', CAST(N'1994-05-04' AS Date), 9, 10)
GO
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (100, N'Aiden', N'White', N'aiden.white@example.com', N'369 Pine Ln', CAST(N'1993-02-18' AS Date), 2, 12)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (101, N'Lucas', N'Hall', N'lucas.hall@example.com', N'852 Oak St', CAST(N'1991-06-10' AS Date), 5, 14)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (102, N'Sofia', N'Roberts', N'sofia.roberts@example.com', N'123 Pine Ln', CAST(N'1996-09-25' AS Date), 10, 1)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (103, N'Henry', N'Lewis', N'henry.lewis@example.com', N'741 Oak St', CAST(N'1992-04-30' AS Date), 1, 3)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (104, N'Aria', N'Foster', N'aria.foster@example.com', N'987 Cedar Rd', CAST(N'1990-08-03' AS Date), 3, 5)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (105, N'Evelyn', N'Hill', N'evelyn.hill@example.com', N'369 Elm St', CAST(N'1987-11-10' AS Date), 12, 7)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (106, N'Mia', N'Taylor', N'mia.taylor@example.com', N'852 Pine Ln', CAST(N'1994-05-05' AS Date), 7, 9)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (107, N'Carter', N'Garcia', N'carter.garcia@example.com', N'123 Oak St', CAST(N'1989-10-15' AS Date), 5, 11)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (108, N'Oliver', N'Adams', N'oliver.adams@example.com', N'741 Elm St', CAST(N'1991-03-20' AS Date), 8, 13)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (109, N'Ella', N'Clark', N'ella.clark@example.com', N'987 Pine Ln', CAST(N'1996-09-21' AS Date), 10, 15)
INSERT [dbo].[Jugadores] ([id_jugador], [nombre], [apellido], [email], [direccion], [fecha_nacimiento], [id_zodiaco], [id_personaje]) VALUES (110, N'Jackson', N'Anderson', N'jackson.anderson@example.com', N'369 Cedar Rd', CAST(N'1993-02-28' AS Date), 4, 2)
SET IDENTITY_INSERT [dbo].[Jugadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Personajes] ON 

INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (1, N'Lorenzo')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (2, N'Isabella')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (3, N'Maximus')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (4, N'Aurora')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (5, N'Felix')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (6, N'Seraphina')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (7, N'Oliver')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (8, N'Sophia')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (9, N'Leo')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (10, N'Amelia')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (11, N'Ezra')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (12, N'Evelyn')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (13, N'Milo')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (14, N'Zara')
INSERT [dbo].[Personajes] ([id_personaje], [nombre]) VALUES (15, N'Sebastian')
SET IDENTITY_INSERT [dbo].[Personajes] OFF
GO
SET IDENTITY_INSERT [dbo].[Premios] ON 

INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (1, N'Chocolate', N'dulce :D', 10000.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (2, N'Pase VIP a la Fiesta de la Risa', N'Acceso exclusivo a la fiesta más divertida del año.', 100.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (3, N'Membresía Dorada en la Galería de Bromas', N'Disfruta de las mejores bromas de la historia con esta membresía exclusiva.', 50.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (4, N'Tour por el Museo de Comedia', N'Un viaje hilarante a través de la historia de la comedia.', 200.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (5, N'Noche de Película y Palomitas', N'Una noche de risas garantizadas con películas cómicas y deliciosas palomitas.', 75.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (6, N'Clase de Improvisación de Stand-up', N'Aprende los secretos del stand-up comedy de la mano de un profesional.', 120.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (7, N'Pase para el Parque de Atracciones Risueñas', N'Un día lleno de diversión en el parque temático más alegre.', 80.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (8, N'Comedy Club VIP', N'Acceso exclusivo a los mejores shows de comedia de la ciudad.', 150.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (9, N'Cena en el Restaurante de la Comedia', N'Una experiencia gastronómica única con un toque cómico.', 90.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (10, N'Entrada al Espectáculo de Magia Cómica', N'Un espectáculo de magia lleno de trucos y risas.', 60.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (11, N'Tour por el Museo de Payasos', N'Descubre la historia de los payasos y su impacto en la comedia.', 175.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (12, N'Visita al Zoológico de Animales Divertidos', N'Un día entre animales que te harán reír a carcajadas.', 95.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (13, N'Pase para el Parque de la Risa', N'Un parque de diversiones diseñado para hacerte reír sin parar.', 110.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (14, N'Noche de Comedia en Vivo', N'Una noche de risas en un club de comedia con talento en vivo.', 70.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (15, N'Tour por el Museo de Bromas Antiguas', N'Explora bromas históricas y sus efectos cómicos.', 130.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (16, N'Noche de Karaoke Cómico', N'Canta tus canciones favoritas con un giro cómico en el karaoke.', 40.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (17, N'Taller de Chistes y Anécdotas', N'Aprende a contar chistes y anécdotas de manera efectiva.', 85.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (18, N'Cena con un Comediante Famoso', N'Comparte una cena y risas con una estrella de la comedia.', 105.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (19, N'Espectáculo de Malabares Divertidos', N'Un espectáculo de malabares que te hará reír sin parar.', 55.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (20, N'Clase de Comedia de Situación', N'Domina el arte de la comedia de situación con esta clase especializada.', 125.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (21, N'Noche de Comedia en el Teatro', N'Disfruta de una noche de comedia en un teatro histórico.', 150.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (22, N'Tour por el Museo de Payasos Clásicos', N'Revive la historia de los payasos más queridos.', 70.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (23, N'Noche de Comedia Musical', N'Risas y música se unen en una noche espectacular.', 120.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (24, N'Paseo en Globo Aerostático Divertido', N'Un viaje en globo con un toque cómico.', 90.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (25, N'Noche de Comedia Improvisada', N'Risas espontáneas en un espectáculo de improvisación.', 80.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (26, N'Taller de Maquillaje de Payaso', N'Aprende a maquillarte como un auténtico payaso.', 65.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (27, N'Espectáculo de Magia Cómica', N'Trucos de magia con un toque de humor.', 115.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (28, N'Cena en el Restaurante de Bromas', N'Una cena temática llena de sorpresas cómicas.', 100.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (29, N'Noche de Comedia en el Crucero', N'Una travesía divertida con entretenimiento en vivo.', 45.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (30, N'Espectáculo de Humor de Improvisación', N'Risas garantizadas en un show de improvisación.', 140.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (31, N'Tour por el Museo de la Carcajada', N'Explora la historia de la risa y sus manifestaciones.', 75.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (32, N'Pase VIP a la Fiesta de la Risa', N'Acceso exclusivo a la fiesta más divertida del año.', 110.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (33, N'Membresía Dorada en la Galería de Bromas', N'Disfruta de las mejores bromas de la historia con esta membresía exclusiva.', 60.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (34, N'Tour por el Museo de Comedia', N'Un viaje hilarante a través de la historia de la comedia.', 170.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (35, N'Noche de Película y Palomitas', N'Una noche de risas garantizadas con películas cómicas y deliciosas palomitas.', 95.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (36, N'Clase de Improvisación de Stand-up', N'Aprende los secretos del stand-up comedy de la mano de un profesional.', 50.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (37, N'Pase para el Parque de Atracciones Risueñas', N'Un día lleno de diversión en el parque temático más alegre.', 135.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (38, N'Comedy Club VIP', N'Acceso exclusivo a los mejores shows de comedia de la ciudad.', 130.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (39, N'Cena en el Restaurante de la Comedia', N'Una experiencia gastronómica única con un toque cómico.', 85.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (40, N'Entrada al Espectáculo de Magia Cómica', N'Un espectáculo de magia lleno de trucos y risas.', 125.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (41, N'Tour por el Museo de Payasos', N'Descubre la historia de los payasos y su impacto en la comedia.', 70.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (42, N'Visita al Zoológico de Animales Divertidos', N'Un día entre animales que te harán reír a carcajadas.', 160.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (43, N'Pase para el Parque de la Risa', N'Un parque de diversiones diseñado para hacerte reír sin parar.', 105.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (44, N'Noche de Comedia en Vivo', N'Una noche de risas en un club de comedia con talento en vivo.', 55.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (45, N'Tour por el Museo de Bromas Antiguas', N'Explora bromas históricas y sus efectos cómicos.', 145.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (46, N'Noche de Karaoke Cómico', N'Canta tus canciones favoritas con un giro cómico en el karaoke.', 115.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (47, N'Taller de Chistes y Anécdotas', N'Aprende a contar chistes y anécdotas de manera efectiva.', 75.0000)
INSERT [dbo].[Premios] ([id_premio], [nombre], [descripcion], [valor]) VALUES (48, N'Cena con un Comediante Famoso', N'Comparte una cena y risas con una estrella de la comedia.', 90.0000)
SET IDENTITY_INSERT [dbo].[Premios] OFF
GO
SET IDENTITY_INSERT [dbo].[Puntajes] ON 

INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (1, 50, 1)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (2, 50, 2)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (3, 20, 3)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (4, 20, 4)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (5, 30, 5)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (6, 20, 6)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (7, 80, 7)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (8, 50, 8)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (9, 90, 9)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (10, 420, 10)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (11, 630, 11)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (12, 780, 12)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (13, 890, 13)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (14, 540, 14)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (15, 940, 15)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (16, 460, 16)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (17, 720, 17)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (18, 860, 18)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (19, 580, 19)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (20, 970, 20)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (21, 410, 21)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (22, 670, 22)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (23, 920, 23)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (24, 490, 24)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (25, 820, 25)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (26, 910, 26)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (27, 550, 27)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (28, 980, 28)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (29, 420, 29)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (30, 720, 30)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (31, 890, 31)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (32, 480, 32)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (33, 940, 33)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (34, 510, 34)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (35, 850, 35)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (36, 590, 36)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (37, 970, 37)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (38, 430, 38)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (39, 720, 39)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (40, 900, 40)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (41, 570, 41)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (42, 940, 42)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (43, 540, 43)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (44, 860, 44)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (45, 640, 45)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (46, 910, 46)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (47, 420, 47)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (48, 780, 48)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (49, 880, 49)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (50, 450, 50)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (51, 720, 51)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (52, 830, 52)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (53, 570, 53)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (54, 960, 54)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (55, 430, 55)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (56, 720, 56)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (57, 910, 57)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (58, 480, 58)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (59, 890, 59)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (60, 540, 60)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (61, 780, 61)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (62, 880, 62)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (63, 450, 63)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (64, 720, 64)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (65, 840, 65)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (66, 560, 66)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (67, 950, 67)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (68, 440, 68)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (69, 720, 69)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (70, 900, 70)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (71, 580, 71)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (72, 930, 72)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (73, 510, 73)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (74, 850, 74)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (75, 640, 75)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (76, 890, 76)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (77, 430, 77)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (78, 720, 78)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (79, 880, 79)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (80, 550, 80)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (81, 720, 81)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (82, 860, 82)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (83, 580, 83)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (84, 970, 84)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (85, 420, 85)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (86, 670, 86)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (87, 920, 87)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (88, 490, 88)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (89, 820, 89)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (90, 910, 90)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (91, 550, 91)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (92, 980, 92)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (93, 420, 93)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (94, 720, 94)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (95, 890, 95)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (96, 480, 96)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (97, 940, 97)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (98, 510, 98)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (99, 850, 99)
GO
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (100, 590, 100)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (101, 970, 101)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (102, 430, 102)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (103, 720, 103)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (104, 900, 104)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (105, 570, 105)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (106, 940, 106)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (107, 540, 107)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (108, 860, 108)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (109, 640, 109)
INSERT [dbo].[Puntajes] ([id_puntaje], [cantidad], [id_jugador]) VALUES (110, 910, 110)
SET IDENTITY_INSERT [dbo].[Puntajes] OFF
GO
SET IDENTITY_INSERT [dbo].[Zodiacos] ON 

INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (1, N'Aries')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (2, N'Tauro')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (3, N'Géminis')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (4, N'Cáncer')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (5, N'Leo')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (6, N'Virgo')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (7, N'Libra')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (8, N'Escorpio')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (9, N'Sagitario')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (10, N'Capricornio')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (11, N'Acuario')
INSERT [dbo].[Zodiacos] ([id_zodiaco], [nombre]) VALUES (12, N'Piscis')
SET IDENTITY_INSERT [dbo].[Zodiacos] OFF
GO
ALTER TABLE [dbo].[Ganadores]  WITH CHECK ADD  CONSTRAINT [FK_Ganadores_Jugadores] FOREIGN KEY([id_jugador])
REFERENCES [dbo].[Jugadores] ([id_jugador])
GO
ALTER TABLE [dbo].[Ganadores] CHECK CONSTRAINT [FK_Ganadores_Jugadores]
GO
ALTER TABLE [dbo].[Ganadores]  WITH CHECK ADD  CONSTRAINT [FK_Ganadores_Premios] FOREIGN KEY([id_premio])
REFERENCES [dbo].[Premios] ([id_premio])
GO
ALTER TABLE [dbo].[Ganadores] CHECK CONSTRAINT [FK_Ganadores_Premios]
GO
ALTER TABLE [dbo].[Juegos]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Empresas] FOREIGN KEY([id_empresa])
REFERENCES [dbo].[Empresas] ([id_empresa])
GO
ALTER TABLE [dbo].[Juegos] CHECK CONSTRAINT [FK_Juegos_Empresas]
GO
ALTER TABLE [dbo].[Juegos]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Generos] FOREIGN KEY([id_genero])
REFERENCES [dbo].[Generos] ([id_genero])
GO
ALTER TABLE [dbo].[Juegos] CHECK CONSTRAINT [FK_Juegos_Generos]
GO
ALTER TABLE [dbo].[Jugadores]  WITH CHECK ADD  CONSTRAINT [FK_Jugadores_Personajes] FOREIGN KEY([id_personaje])
REFERENCES [dbo].[Personajes] ([id_personaje])
GO
ALTER TABLE [dbo].[Jugadores] CHECK CONSTRAINT [FK_Jugadores_Personajes]
GO
ALTER TABLE [dbo].[Jugadores]  WITH CHECK ADD  CONSTRAINT [FK_Jugadores_Zodiacos] FOREIGN KEY([id_zodiaco])
REFERENCES [dbo].[Zodiacos] ([id_zodiaco])
GO
ALTER TABLE [dbo].[Jugadores] CHECK CONSTRAINT [FK_Jugadores_Zodiacos]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Ganadores] FOREIGN KEY([id_puntaje1])
REFERENCES [dbo].[Ganadores] ([id_ganador])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Ganadores]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Ganadores1] FOREIGN KEY([id_ganador])
REFERENCES [dbo].[Ganadores] ([id_ganador])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Ganadores1]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Juegos] FOREIGN KEY([id_juego])
REFERENCES [dbo].[Juegos] ([id_juego])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Juegos]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Jugadores] FOREIGN KEY([id_jugador_1])
REFERENCES [dbo].[Jugadores] ([id_jugador])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Jugadores]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Jugadores1] FOREIGN KEY([id_jugador_2])
REFERENCES [dbo].[Jugadores] ([id_jugador])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Jugadores1]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Puntajes] FOREIGN KEY([id_puntaje1])
REFERENCES [dbo].[Puntajes] ([id_puntaje])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Puntajes]
GO
ALTER TABLE [dbo].[Partidas]  WITH CHECK ADD  CONSTRAINT [FK_Partidas_Puntajes1] FOREIGN KEY([id_puntaje2])
REFERENCES [dbo].[Puntajes] ([id_puntaje])
GO
ALTER TABLE [dbo].[Partidas] CHECK CONSTRAINT [FK_Partidas_Puntajes1]
GO
USE [master]
GO
ALTER DATABASE [PolicianoahServer] SET  READ_WRITE 
GO
