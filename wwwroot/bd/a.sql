USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 3/8/2023 13:57:46 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 3/8/2023 13:57:46 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 3/8/2023 13:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 3/8/2023 13:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 3/8/2023 13:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 3/8/2023 13:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuestas] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](max) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuestas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Deportes', N'https://cdn-icons-png.flaticon.com/256/5351/5351486.png')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Arte', N'https://images.vexels.com/media/users/3/282190/isolated/lists/45356315effaecf97353b50d8da2063b-arte-griego-escultura-personas.png')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Historia', N'https://i.pinimg.com/1200x/43/d5/22/43d52257b59117a6019c9cfbfb7182d9.jpg')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Geografia', N'https://laclac.es/wp-content/uploads/2022/06/la-clac-historia.png')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (7, N'Ciencias', N'https://cdn-icons-png.flaticon.com/256/1046/1046269.png')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Facil ')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (1, 3, 1, N'¿En qué año se firmó la Declaración de Independencia de los Estados Unidos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (2, 3, 1, N'¿Quién fue el líder de la Revolución Rusa en 1917?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (3, 3, 1, N'¿Cuál fue el evento que marcó el inicio de la Segunda Guerra Mundial en Europa?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (4, 3, 2, N'¿Cuál fue el primer presidente de los Estados Unidos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (5, 3, 2, N'¿Qué líder político fue conocido como el "Caudillo" en España durante el siglo XX?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (6, 3, 2, N'¿Cuál fue el nombre del programa espacial de la Unión Soviética que envió al primer hombre al espacio?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (7, 3, 3, N'¿Qué tratado puso fin a la Primera Guerra Mundial?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (8, 3, 3, N'¿Quién fue el líder del movimiento de independencia de la India conocido como Mahatma Gandhi?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (9, 3, 3, N'¿Cuál fue el año de la Revolución Mexicana?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (10, 1, 1, N'¿En qué deporte se utiliza una pelota de golf?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (11, 1, 1, N'¿Cuál es el deporte más popular en Estados Unidos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (12, 1, 1, N'¿Cuántos jugadores hay en un equipo de baloncesto?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (13, 1, 2, N'¿En qué año se celebró el primer Mundial de fútbol?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (14, 1, 2, N'¿Cuál es el deporte nacional de Canadá?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (15, 1, 2, N'¿Cuántos Grand Slam ha ganado Rafael Nadal en su carrera?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (16, 1, 3, N'¿Cuál es el récord de más puntos anotados en un solo partido de la NBA?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (17, 1, 3, N'¿Cuántos títulos de Grand Slam ha ganado Serena Williams en su carrera hasta 2021?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (18, 1, 3, N'¿Quién es el máximo goleador en la historia de la selección brasileña de fútbol?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (19, 2, 1, N'¿Quién pintó la Mona Lisa?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (20, 2, 2, N'¿Cuál de los siguientes artistas es conocido por su técnica de "puntillismo"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (21, 2, 3, N'¿Cuál es la escultura más famosa de Auguste Rodin?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (22, 2, 1, N'¿Quién pintó "La noche estrellada"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (23, 2, 2, N'¿Cuál de las siguientes obras es una escultura de Miguel Ángel?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (24, 2, 3, N'¿Cuál de las siguientes obras es un fresco de Leonardo da Vinci?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (25, 2, 1, N'¿Quién es conocido por ser el padre del cubismo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (26, 2, 2, N'¿Cuál de las siguientes obras es un autorretrato de Frida Kahlo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (27, 2, 3, N'¿Cuál de los siguientes artistas es conocido por sus "listones de colores"?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (28, 4, 1, N'¿Cuál es la capital de Francia?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (29, 4, 1, N'¿Cuál es el río más largo del mundo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (30, 4, 1, N'¿En qué país se encuentra la Gran Muralla China?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (31, 4, 2, N'¿Cuál es el país más grande del mundo en términos de territorio?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (32, 4, 2, N'¿Cuál es la montaña más alta del mundo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (33, 4, 2, N'¿Cuál es el país más poblado del mundo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (34, 4, 3, N'¿Cuál es el punto más bajo de la Tierra?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (35, 4, 3, N'¿Cuál es el país con la mayor densidad de población?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (36, 4, 3, N'¿Cuál es el país con más islas en el mundo?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (37, 7, 1, N'¿Qué es la fotosíntesis?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (38, 7, 1, N'¿Cuál es el elemento más abundante en la atmósfera terrestre?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (39, 7, 1, N'¿Qué es el ADN y qué función cumple en los seres vivos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (40, 7, 2, N'¿Qué es la teoría de la evolución de Darwin y en qué se basa?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (41, 7, 2, N'¿Cuál es la diferencia entre un átomo y una molécula?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (42, 7, 2, N'¿Qué es una célula y cuál es su función en los seres vivos?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (43, 7, 3, N'¿Qué son los agujeros negros y cómo se forman?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (44, 7, 3, N'¿Qué es la teoría de la relatividad de Einstein y en qué se basa?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (45, 7, 3, N'¿Qué es la teoría del Big Bang y cuál es su importancia en la comprensión del universo?')




SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (1, 1, 1, N'1776', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (2, 1, 2, N'1789', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (3, 1, 3, N'1804', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (4, 2, 1, N'Joseph Stalin', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (5, 2, 2, N'Vladimir Lenin', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (6, 2, 3, N'Leon Trotsky', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (7, 4, 3, N'George Washington', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (8, 4, 2, N'Thomas Jefferson', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (9, 4, 1, N'John Adams', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (10, 5, 2, N'Francisco Franco', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (11, 5, 1, N'Benito Mussolini', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (12, 5, 3, N'Adolf Hitler', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (13, 6, 3, N'Vostok', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (14, 6, 1, N'Apollo', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (15, 6, 2, N'Soyuz', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (16, 7, 1, N'Tratado de Versalles', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (17, 7, 2, N'Tratado de Tordesillas', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (18, 7, 3, N'Tratado de Brest-Litovsk', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (19, 8, 1, N'Jawaharlal Nehru', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (20, 8, 3, N'Subhas Chandra Bose', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (21, 8, 2, N'Mohandas Karamchand Gandhi', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (22, 9, 1, N'1910', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (23, 9, 2, N'1810', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (24, 9, 3, N'1920', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (25, 3, 2, N'La invasión de Polonia', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (26, 3, 1, N'El bombardeo de Pearl Harbor', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (27, 3, 3, N'El ataque a la Unión Soviética', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (28, 10, 1, N'Fútbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (29, 10, 2, N'Tenis', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (30, 10, 3, N'Golf', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (31, 11, 1, N'Fútbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (32, 11, 2, N'Baloncesto', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (33, 11, 3, N'Fútbol americano', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (34, 12, 1, N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (35, 12, 2, N'10', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (36, 12, 3, N'12', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (37, 13, 1, N'1926', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (38, 13, 2, N'1930', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (39, 13, 3, N'1940', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (40, 14, 1, N'Hockey sobre hielo', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (41, 14, 2, N'Béisbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (42, 14, 3, N'Rugby', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (43, 15, 1, N'18', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (44, 15, 2, N'20', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (45, 15, 3, N'22', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (46, 16, 1, N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (47, 16, 2, N'7', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (48, 16, 3, N'9', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (49, 17, 1, N'Neymar', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (50, 17, 2, N'Messi', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (51, 17, 3, N'Ronaldo', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (52, 18, 1, N'Estados Unidos', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (53, 18, 2, N'Brasil', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (54, 18, 3, N'Alemania', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (56, 19, 2, N'Michelangelo', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (57, 19, 3, N'Rafael', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (58, 19, 2, N'Donatello', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (59, 20, 1, N'Vincent van Gogh', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (60, 20, 2, N'Pablo Picasso', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (61, 20, 3, N'Georges Seurat', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (62, 21, 1, N'El Pensador', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (63, 21, 2, N'La Venus de Milo', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (64, 21, 3, N'La Piedad', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (65, 22, 1, N'Vincent van Gogh', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (66, 22, 2, N'Pablo Picasso', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (68, 22, 3, N'Frida Kahlo', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (69, 23, 1, N'La Piedad', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (70, 23, 2, N'El Pensador', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (71, 23, 3, N'La Mona Lisa', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (72, 24, 1, N'La Última Cena', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (73, 24, 2, N'La Gioconda', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (74, 24, 3, N'El Grito', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (75, 25, 1, N'Frida Kahlo', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (76, 25, 2, N'Salvador Dalí', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (77, 25, 3, N'Pablo Picasso', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (78, 26, 1, N'La Noche Estrellada', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (79, 26, 2, N'El Jardín de las Delicias', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (80, 26, 3, N'Guernica', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (81, 27, 1, N'Leonardo da Vinci', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (82, 27, 2, N'Michelangelo', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (83, 27, 3, N'Rafael', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (84, 28, 1, N'París', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (85, 28, 2, N'Madrid', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (86, 28, 3, N'Berlín', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (87, 29, 1, N'Amazonas', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (88, 29, 2, N'Nilo', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (89, 29, 3, N'Misisipi', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (90, 30, 1, N'China', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (91, 30, 2, N'Japón', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (92, 30, 3, N'India', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (93, 31, 1, N'Rusia', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (94, 31, 2, N'China', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (95, 31, 3, N'Canadá', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (96, 32, 1, N'Everest', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (97, 32, 2, N'K2', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (98, 32, 3, N'Kilimanjaro', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (99, 33, 1, N'China', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (100, 33, 2, N'India', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (101, 33, 3, N'Estados Unidos', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (102, 34, 1, N'Mar Muerto', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (103, 34, 2, N'Valle de la Muerte', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (104, 34, 3, N'Lago Assal', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (105, 35, 1, N'Mónaco', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (106, 35, 2, N'Singapur', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (107, 35, 3, N'Bangladés', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (108, 36, 1, N'Indonesia', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (109, 36, 2, N'Filipinas', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (110, 36, 3, N'Suecia', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (111, 37, 1, N'La fotosíntesis es el proceso mediante el cual las plantas, algas y algunas bacterias convierten la energía de la luz solar en energía química almacenada en moléculas de glucosa y oxígeno.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (112, 37, 2, N'La fotosíntesis es el proceso mediante el cual las plantas, algas y algunas bacterias convierten la energía química almacenada en moléculas de glucosa y oxígeno en energía de la luz solar.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (113, 37, 3, N'La fotosíntesis es el proceso mediante el cual las plantas, algas y algunas bacterias convierten la energía térmica en energía química almacenada en moléculas de glucosa y oxígeno.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (114, 38, 1, N'Nitrógeno', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (115, 38, 2, N'Oxígeno', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (116, 38, 3, N'Carbono', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (117, 39, 1, N'El ADN (ácido desoxirribonucleico) es una molécula presente en todos los seres vivos que contiene la información genética que determina las características de cada individuo.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (118, 39, 2, N'El ADN es una proteína presente en todos los seres vivos que tiene la función de catalizar reacciones químicas en el organismo.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (119, 39, 3, N'El ADN es una célula presente en todos los seres vivos que tiene la función de transportar oxígeno a las células del cuerpo.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (120, 40, 1, N'La teoría de la evolución de Darwin es una explicación científica que postula que todas las especies de seres vivos evolucionaron a partir de un ancestro común a lo largo de millones de años, y que la selección natural es el mecanismo que impulsa este proceso de cambio.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (121, 40, 2, N'La teoría de la evolución de Darwin es una explicación científica que postula que todas las especies de seres vivos fueron creadas por un ser divino en un momento determinado.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (122, 40, 3, N'La teoría de la evolución de Darwin es una explicación científica que postula que todas las especies de seres vivos evolucionaron al mismo tiempo y en el mismo lugar.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido],[Correcta]) VALUES (123, 41, 1, N'Un átomo es la unidad básica de la materia, compuesta por un núcleo central de protones y neutrones, rodeado por electrones que orbitan alrededor del núcleo. Una molécula es un conjunto de dos o más átomos unidos por enlaces químicos.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (124, 41, 2, N'Un átomo es una molécula compuesta por dos o más elementos químicos diferentes, mientras que una molécula es la unidad básica de la materia.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (125, 41, 3, N'Un átomo es una molécula compuesta por un solo elemento químico, mientras que una molécula es una combinación de dos o más átomos diferentes.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (126, 42, 1, N'Una célula es la unidad básica de la vida, constituida por una membrana que delimita su interior y que contiene una serie de estructuras especializadas llamadas orgánulos que realizan diferentes funciones en el organismo, como la producción de energía, la síntesis de proteínas o el almacenamiento y procesamiento de información genética.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (127, 42, 2, N'Una célula es una estructura inerte presente en los seres vivos que no tiene ninguna función específica.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (128, 42, 3, N'Una célula es una estructura presente solo en los organismos unicelulares, mientras que los organismos multicelulares no tienen células.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (129, 43, 1, N'Un agujero negro es una región del espacio en la que la gravedad es tan intensa que nada, ni siquiera la luz, puede escapar de su atracción. Se forman a partir del colapso de una estrella muy masiva al final de su vida.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (130, 43, 2, N'Un agujero negro es una región del espacio donde hay una gran cantidad de materia concentrada en un punto, lo que produce una gran atracción gravitatoria.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (131, 43, 3, N'Un agujero negro es una estrella que ha explotado en una supernova y que emite radiación electromagnética intensa.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (132, 44, 1, N'La teoría de la relatividad de Einstein es una teoría física que describe cómo funciona el universo a nivel macroscópico, es decir, a escalas mayores que las del átomo. Se basa en la idea de que el espacio y el tiempo están intrínsecamente ligados, y que la gravedad es una curvatura del espacio-tiempo producida por la presencia de masa y energía.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (133, 44, 2, N'La teoría de la relatividad de Einstein es una teoría biológica que explica cómo evolucionan las especies a lo largo del tiempo.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (134, 44, 3, N'La teoría de la relatividad de Einstein es una teoría psicológica que describe cómo se forman y mantienen las relaciones humanas.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (135, 45, 1, N'La tabla periódica es una herramienta fundamental en la química que muestra todos los elementos químicos conocidos organizados por sus propiedades físicas y químicas. Los elementos están dispuestos en filas horizontales llamadas períodos y en columnas verticales llamadas grupos. La tabla periódica es útil para predecir las propiedades de los elementos y para entender cómo se combinan para formar compuestos químicos.', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (136, 45, 2, N'La tabla periódica es una herramienta matemática que se utiliza para resolver ecuaciones diferenciales y otros problemas matemáticos complejos.', 0)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (137, 45, 3, N'La tabla periódica es una herramienta literaria que se utiliza para analizar la estructura y los temas de las obras literarias.', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
