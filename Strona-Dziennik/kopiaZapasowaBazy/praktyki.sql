USE [master]
GO
/****** Object:  Database [praktyki]    Script Date: 22.06.2023 15:17:14 ******/
CREATE DATABASE [praktyki]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'praktyki', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\praktyki.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'praktyki_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\praktyki_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [praktyki] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [praktyki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [praktyki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [praktyki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [praktyki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [praktyki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [praktyki] SET ARITHABORT OFF 
GO
ALTER DATABASE [praktyki] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [praktyki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [praktyki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [praktyki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [praktyki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [praktyki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [praktyki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [praktyki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [praktyki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [praktyki] SET  DISABLE_BROKER 
GO
ALTER DATABASE [praktyki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [praktyki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [praktyki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [praktyki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [praktyki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [praktyki] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [praktyki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [praktyki] SET RECOVERY FULL 
GO
ALTER DATABASE [praktyki] SET  MULTI_USER 
GO
ALTER DATABASE [praktyki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [praktyki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [praktyki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [praktyki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [praktyki] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [praktyki] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'praktyki', N'ON'
GO
ALTER DATABASE [praktyki] SET QUERY_STORE = OFF
GO
USE [praktyki]
GO
/****** Object:  User [test]    Script Date: 22.06.2023 15:17:14 ******/
CREATE USER [test] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
/****** Object:  Table [dbo].[Oceny]    Script Date: 22.06.2023 15:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oceny](
	[idOceny] [int] IDENTITY(1,1) NOT NULL,
	[indeks] [int] NOT NULL,
	[idPrzedmiotu] [int] NOT NULL,
	[ocena] [int] NOT NULL,
 CONSTRAINT [PK_Oceny] PRIMARY KEY CLUSTERED 
(
	[idOceny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przedmioty]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przedmioty](
	[idPrzedmiotu] [int] IDENTITY(1,1) NOT NULL,
	[Przedmiot] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Przedmioty] PRIMARY KEY CLUSTERED 
(
	[idPrzedmiotu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studenci]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studenci](
	[Indeks] [int] IDENTITY(123100,1) NOT NULL,
	[imie] [varchar](30) NOT NULL,
	[nazwisko] [varchar](30) NOT NULL,
	[idSzkoly] [int] NOT NULL,
	[idUzytkownika] [int] NULL,
	[klasa] [int] NULL,
 CONSTRAINT [PK_Studenci] PRIMARY KEY CLUSTERED 
(
	[Indeks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[studenciIIchOceny]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[studenciIIchOceny]
AS
SELECT dbo.Oceny.idOceny, dbo.Oceny.ocena, dbo.Przedmioty.Przedmiot, dbo.Studenci.Indeks, dbo.Studenci.imie, dbo.Studenci.nazwisko, dbo.Studenci.stopienStudiow, dbo.Studenci.rokStudiow, dbo.Studenci.idSzkoly, 
                  dbo.Przedmioty.idPrzedmiotu
FROM     dbo.Oceny INNER JOIN
                  dbo.Studenci ON dbo.Oceny.indeks = dbo.Studenci.Indeks INNER JOIN
                  dbo.Przedmioty ON dbo.Oceny.idPrzedmiotu = dbo.Przedmioty.idPrzedmiotu
GO
/****** Object:  Table [dbo].[uzytkownicy]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uzytkownicy](
	[idUzytkownika] [int] IDENTITY(1,1) NOT NULL,
	[haslo] [varchar](50) NOT NULL,
	[login] [varchar](30) NULL,
	[idTypuUzytkownika] [int] NULL,
 CONSTRAINT [PK_uzytkownicy] PRIMARY KEY CLUSTERED 
(
	[idUzytkownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[szkoly]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[szkoly](
	[idSzkoly] [int] IDENTITY(1,1) NOT NULL,
	[typSzkoly] [int] NOT NULL,
	[nazwa] [varchar](50) NOT NULL,
	[miejscowosc] [varchar](50) NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[idDyrektora] [int] NOT NULL,
 CONSTRAINT [PK_szkoly] PRIMARY KEY CLUSTERED 
(
	[idSzkoly] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[szkolyIIchStudenci]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[szkolyIIchStudenci]
AS
SELECT dbo.Studenci.Indeks, dbo.Studenci.imie, dbo.Studenci.nazwisko, dbo.Studenci.stopienStudiow, dbo.Studenci.rokStudiow, dbo.szkoly.idSzkoly, dbo.szkoly.typSzkoly, dbo.szkoly.nazwa, dbo.szkoly.miejscowosc, dbo.szkoly.ulica, 
                  dbo.uzytkownicy.idUzytkownika, dbo.uzytkownicy.haslo
FROM     dbo.Studenci INNER JOIN
                  dbo.szkoly ON dbo.Studenci.idSzkoly = dbo.szkoly.idSzkoly INNER JOIN
                  dbo.uzytkownicy ON dbo.Studenci.idUzytkownika = dbo.uzytkownicy.idUzytkownika
GO
/****** Object:  UserDefinedFunction [dbo].[wyswietlWszystkichStudentow]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[wyswietlWszystkichStudentow]
()
RETURNS TABLE 
AS
RETURN 
(
	SELECT DISTINCT n.Indeks, n.imie, n.nazwisko, n.idSzkoly, n.rokStudiow, n.stopienStudiow From dbo.szkolyIIchStudenci AS n
)
GO
/****** Object:  Table [dbo].[tytuly]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tytuly](
	[idTytulu] [int] IDENTITY(1,1) NOT NULL,
	[tytul] [varchar](30) NOT NULL,
	[skrot] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tytuly] PRIMARY KEY CLUSTERED 
(
	[idTytulu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zatrudnienieNauczycieli]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zatrudnienieNauczycieli](
	[idZatrudnienia] [int] IDENTITY(1,1) NOT NULL,
	[idNauczyciela] [int] NOT NULL,
	[idSzkoly] [int] NOT NULL,
 CONSTRAINT [PK_zatrudnienieNauczycieli] PRIMARY KEY CLUSTERED 
(
	[idZatrudnienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SzkolyIIchNauczyciele]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SzkolyIIchNauczyciele]
AS
SELECT dbo.szkoly.idSzkoly, dbo.szkoly.typSzkoly, dbo.szkoly.nazwa, dbo.szkoly.miejscowosc, dbo.szkoly.ulica, dbo.zatrudnienieNauczycieli.idZatrudnienia, dbo.nauczycieleOpiekunowiePraktyk.idNaucz, dbo.nauczycieleOpiekunowiePraktyk.imie, 
                  dbo.nauczycieleOpiekunowiePraktyk.nazwisko, dbo.nauczycieleOpiekunowiePraktyk.stopienAwansu, dbo.tytuly.idTytulu, dbo.tytuly.tytul, dbo.tytuly.skrot, dbo.uzytkownicy.idUzytkownika, dbo.uzytkownicy.haslo
FROM     dbo.szkoly INNER JOIN
                  dbo.zatrudnienieNauczycieli ON dbo.szkoly.idSzkoly = dbo.zatrudnienieNauczycieli.idSzkoly INNER JOIN
                  dbo.nauczycieleOpiekunowiePraktyk ON dbo.zatrudnienieNauczycieli.idNauczyciela = dbo.nauczycieleOpiekunowiePraktyk.idNaucz INNER JOIN
                  dbo.tytuly ON dbo.nauczycieleOpiekunowiePraktyk.idTytul = dbo.tytuly.idTytulu INNER JOIN
                  dbo.uzytkownicy ON dbo.nauczycieleOpiekunowiePraktyk.idUzytkownika = dbo.uzytkownicy.idUzytkownika
GO
/****** Object:  UserDefinedFunction [dbo].[wyswietlWszystkichNauczycieli]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[wyswietlWszystkichNauczycieli]
()
RETURNS TABLE 
AS
RETURN 
(
	SELECT n.idNaucz, n.skrot, n.imie, n.nazwisko, z.idSzkoly From dbo.szkolyIIchNauczyciele AS n
	JOIN zatrudnienieNauczycieli AS z ON z.idZatrudnienia = n.idZatrudnienia
)
GO
/****** Object:  Table [dbo].[dyrektorzy]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dyrektorzy](
	[idDyrektora] [int] IDENTITY(1,1) NOT NULL,
	[imie] [varchar](20) NOT NULL,
	[nazwisko] [varchar](20) NOT NULL,
	[idUzytkownika] [int] NULL,
	[idTytulu] [int] NULL,
 CONSTRAINT [PK_dyrektorzy] PRIMARY KEY CLUSTERED 
(
	[idDyrektora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[szkolyIIchDyrektorzy]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[szkolyIIchDyrektorzy]
AS
SELECT dbo.dyrektorzy.idDyrektora, dbo.dyrektorzy.imie, dbo.dyrektorzy.nazwisko, dbo.tytuly.idTytulu, dbo.tytuly.tytul, dbo.tytuly.skrot, dbo.szkoly.idSzkoly, dbo.szkoly.typSzkoly, dbo.szkoly.nazwa, dbo.szkoly.miejscowosc, dbo.szkoly.ulica, 
                  dbo.uzytkownicy.idUzytkownika, dbo.uzytkownicy.haslo
FROM     dbo.dyrektorzy INNER JOIN
                  dbo.szkoly ON dbo.dyrektorzy.idDyrektora = dbo.szkoly.idDyrektora INNER JOIN
                  dbo.tytuly ON dbo.dyrektorzy.idWyksztalcenia = dbo.tytuly.idTytulu INNER JOIN
                  dbo.uzytkownicy ON dbo.dyrektorzy.idUzytkownika = dbo.uzytkownicy.idUzytkownika
GO
/****** Object:  UserDefinedFunction [dbo].[wyswietlWszystkichDyrektorow]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[wyswietlWszystkichDyrektorow]
()
RETURNS TABLE 
AS
RETURN 
(
	SELECT DISTINCT n.idDyrektora, n.skrot, n.imie, n.nazwisko From dbo.szkolyIIchDyrektorzy AS n
)
GO
/****** Object:  UserDefinedFunction [dbo].[wyswietlHasloUzytkownika]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[wyswietlHasloUzytkownika]
(	
	@login varchar(30)	
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM uzytkownicy WHERE [login] = @login 
)
GO
/****** Object:  UserDefinedFunction [dbo].[wyswietlDanegoDyrektora]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[wyswietlDanegoDyrektora]
(	
	@id int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM dbo.szkolyIIchDyrektorzy AS n
	WHERE n.idDyrektora = @id
)
GO
/****** Object:  UserDefinedFunction [dbo].[wyswietlDanegoNauczyciela]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[wyswietlDanegoNauczyciela]
(	
	@id int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM dbo.szkolyIIchNauczyciele AS n
	WHERE n.idNaucz = @id
)
GO
/****** Object:  UserDefinedFunction [dbo].[wyswietlDanegoStudenta]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[wyswietlDanegoStudenta]
(	
	@id int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM dbo.szkolyIIchStudenci AS n
	WHERE n.Indeks = @id
)
GO
/****** Object:  UserDefinedFunction [dbo].[ocenyDanegoStudenta]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[ocenyDanegoStudenta]
(	
	@id int 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM dbo.studenciIIchoceny WHERE Indeks = @id
)
GO
/****** Object:  Table [dbo].[typyPraktyk]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typyPraktyk](
	[IdTypuPraktyk] [varchar](5) NOT NULL,
	[nazwaTypuPraktyk] [varchar](50) NOT NULL,
 CONSTRAINT [PK_typyPraktyk] PRIMARY KEY CLUSTERED 
(
	[IdTypuPraktyk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historiaaPraktyk]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historiaaPraktyk](
	[idPraktyk] [int] IDENTITY(1,1) NOT NULL,
	[idUcznia] [int] NOT NULL,
	[IdTypuPraktyki] [varchar](5) NOT NULL,
	[Id_zatrudn_naucz] [int] NOT NULL,
	[rokPraktyk] [int] NOT NULL,
	[ocenaKoncowa] [int] NULL,
 CONSTRAINT [PK_historiaaPraktyk] PRIMARY KEY CLUSTERED 
(
	[idPraktyk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[studenciIIchPraktyki]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[studenciIIchPraktyki]
AS
SELECT dbo.Studenci.Indeks, dbo.Studenci.imie, dbo.Studenci.nazwisko, dbo.Studenci.stopienStudiow, dbo.Studenci.rokStudiow, dbo.Studenci.idSzkoly, dbo.Studenci.idUzytkownika, dbo.historiaaPraktyk.idPraktyk, 
                  dbo.historiaaPraktyk.Id_zatrudn_naucz, dbo.historiaaPraktyk.rokPraktyk, dbo.historiaaPraktyk.ocenaKoncowa, dbo.typyPraktyk.IdTypuPraktyk, dbo.typyPraktyk.nazwaTypuPraktyk, dbo.historiaaPraktyk.idFirmy, 
                  dbo.historiaaPraktyk.idOpiekuna
FROM     dbo.Studenci INNER JOIN
                  dbo.historiaaPraktyk ON dbo.Studenci.Indeks = dbo.historiaaPraktyk.idUcznia INNER JOIN
                  dbo.typyPraktyk ON dbo.historiaaPraktyk.IdTypuPraktyki = dbo.typyPraktyk.IdTypuPraktyk
GO
/****** Object:  UserDefinedFunction [dbo].[pokazDanaPraktyke]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[pokazDanaPraktyke]
(	
	@id int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM dbo.studenciIIchPraktyki WHERE Indeks = @id AND rokPraktyk = YEAR(getdate())
)
GO
/****** Object:  View [dbo].[opiekuniIIchWyksztalcenie]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[opiekuniIIchWyksztalcenie]
AS
SELECT dbo.opiekuniPraktyk.idOpiekuna, dbo.opiekuniPraktyk.imie, dbo.opiekuniPraktyk.nazwisko, dbo.tytuly.idTytulu, dbo.tytuly.tytul, dbo.tytuly.skrot
FROM     dbo.opiekuniPraktyk INNER JOIN
                  dbo.tytuly ON dbo.opiekuniPraktyk.idTytulu = dbo.tytuly.idTytulu
GO
/****** Object:  View [dbo].[szkolyIIchPracownicy]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[szkolyIIchPracownicy]
AS
SELECT dbo.Studenci.Indeks, dbo.Studenci.imie, dbo.Studenci.nazwisko, dbo.Studenci.stopienStudiow, dbo.Studenci.rokStudiow, dbo.szkoly.idSzkoly, dbo.szkoly.typSzkoly, dbo.szkoly.nazwa, dbo.szkoly.miejscowosc, dbo.szkoly.ulica, 
                  dbo.dyrektorzy.idDyrektora, dbo.dyrektorzy.imie AS imieD, dbo.dyrektorzy.nazwisko AS nazwD, dbo.nauczycieleOpiekunowiePraktyk.idNaucz, dbo.nauczycieleOpiekunowiePraktyk.imie AS imieN, 
                  dbo.nauczycieleOpiekunowiePraktyk.nazwisko AS nazwN, dbo.tytuly.tytul, dbo.tytuly.skrot
FROM     dbo.szkoly INNER JOIN
                  dbo.Studenci ON dbo.szkoly.idSzkoly = dbo.Studenci.idSzkoly INNER JOIN
                  dbo.zatrudnienieNauczycieli ON dbo.szkoly.idSzkoly = dbo.zatrudnienieNauczycieli.idSzkoly INNER JOIN
                  dbo.nauczycieleOpiekunowiePraktyk ON dbo.zatrudnienieNauczycieli.idNauczyciela = dbo.nauczycieleOpiekunowiePraktyk.idNaucz INNER JOIN
                  dbo.dyrektorzy ON dbo.szkoly.idDyrektora = dbo.dyrektorzy.idDyrektora INNER JOIN
                  dbo.tytuly ON dbo.nauczycieleOpiekunowiePraktyk.idTytul = dbo.tytuly.idTytulu AND dbo.dyrektorzy.idWyksztalcenia = dbo.tytuly.idTytulu
GO
/****** Object:  View [dbo].[firmyIIchSpecjalizacje]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[firmyIIchSpecjalizacje]
AS
SELECT dbo.Firmy.idFirmy, dbo.Firmy.nazwa, dbo.Firmy.limitPraktykantow, dbo.specjalizacje.idSpecjalizacji, dbo.specjalizacje.nazwaSpecjalizacji
FROM     dbo.Firmy INNER JOIN
                  dbo.specjalizacje ON dbo.Firmy.idSpecjalizacji = dbo.specjalizacje.idSpecjalizacji
GO
/****** Object:  Table [dbo].[nauczyciele]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nauczyciele](
	[idNaucz] [int] IDENTITY(1,1) NOT NULL,
	[imie] [varchar](20) NOT NULL,
	[nazwisko] [varchar](20) NOT NULL,
	[idTytul] [int] NOT NULL,
	[stopienAwansu] [varchar](50) NOT NULL,
	[idUzytkownika] [int] NOT NULL,
	[idTytulu] [int] NULL,
 CONSTRAINT [PK_nauczycieleOpiekunowiePraktyk] PRIMARY KEY CLUSTERED 
(
	[idNaucz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typySzkoly]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typySzkoly](
	[idTypuSzkoly] [int] NOT NULL,
	[typSzkoly] [varchar](30) NOT NULL,
 CONSTRAINT [PK_typSzkoly] PRIMARY KEY CLUSTERED 
(
	[idTypuSzkoly] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typyUzytkownika]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typyUzytkownika](
	[idTypuUzytkownika] [int] NOT NULL,
	[typUzytkownika] [varchar](30) NOT NULL,
 CONSTRAINT [PK_typyUzytkownika] PRIMARY KEY CLUSTERED 
(
	[idTypuUzytkownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_historiaaPraktyk]    Script Date: 22.06.2023 15:17:15 ******/
CREATE NONCLUSTERED INDEX [IX_historiaaPraktyk] ON [dbo].[historiaaPraktyk]
(
	[IdTypuPraktyki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_historiaaPraktyk_1]    Script Date: 22.06.2023 15:17:15 ******/
CREATE NONCLUSTERED INDEX [IX_historiaaPraktyk_1] ON [dbo].[historiaaPraktyk]
(
	[idUcznia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dyrektorzy]  WITH CHECK ADD  CONSTRAINT [FK_dyrektorzy_tytuly] FOREIGN KEY([idUzytkownika])
REFERENCES [dbo].[tytuly] ([idTytulu])
GO
ALTER TABLE [dbo].[dyrektorzy] CHECK CONSTRAINT [FK_dyrektorzy_tytuly]
GO
ALTER TABLE [dbo].[dyrektorzy]  WITH CHECK ADD  CONSTRAINT [FK_dyrektorzy_uzytkownicy] FOREIGN KEY([idUzytkownika])
REFERENCES [dbo].[uzytkownicy] ([idUzytkownika])
GO
ALTER TABLE [dbo].[dyrektorzy] CHECK CONSTRAINT [FK_dyrektorzy_uzytkownicy]
GO
ALTER TABLE [dbo].[historiaaPraktyk]  WITH CHECK ADD  CONSTRAINT [FK_historiaaPraktyk_Studenci] FOREIGN KEY([idPraktyk])
REFERENCES [dbo].[Studenci] ([Indeks])
GO
ALTER TABLE [dbo].[historiaaPraktyk] CHECK CONSTRAINT [FK_historiaaPraktyk_Studenci]
GO
ALTER TABLE [dbo].[historiaaPraktyk]  WITH CHECK ADD  CONSTRAINT [FK_historiaaPraktyk_typyPraktyk] FOREIGN KEY([IdTypuPraktyki])
REFERENCES [dbo].[typyPraktyk] ([IdTypuPraktyk])
GO
ALTER TABLE [dbo].[historiaaPraktyk] CHECK CONSTRAINT [FK_historiaaPraktyk_typyPraktyk]
GO
ALTER TABLE [dbo].[historiaaPraktyk]  WITH CHECK ADD  CONSTRAINT [FK_historiaaPraktyk_zatrudnienieNauczycieli] FOREIGN KEY([Id_zatrudn_naucz])
REFERENCES [dbo].[zatrudnienieNauczycieli] ([idZatrudnienia])
GO
ALTER TABLE [dbo].[historiaaPraktyk] CHECK CONSTRAINT [FK_historiaaPraktyk_zatrudnienieNauczycieli]
GO
ALTER TABLE [dbo].[nauczyciele]  WITH CHECK ADD  CONSTRAINT [FK_nauczyciele_tytuly] FOREIGN KEY([idTytulu])
REFERENCES [dbo].[tytuly] ([idTytulu])
GO
ALTER TABLE [dbo].[nauczyciele] CHECK CONSTRAINT [FK_nauczyciele_tytuly]
GO
ALTER TABLE [dbo].[nauczyciele]  WITH CHECK ADD  CONSTRAINT [FK_nauczyciele_uzytkownicy] FOREIGN KEY([idUzytkownika])
REFERENCES [dbo].[uzytkownicy] ([idUzytkownika])
GO
ALTER TABLE [dbo].[nauczyciele] CHECK CONSTRAINT [FK_nauczyciele_uzytkownicy]
GO
ALTER TABLE [dbo].[Oceny]  WITH CHECK ADD  CONSTRAINT [FK_Oceny_Przedmioty] FOREIGN KEY([idPrzedmiotu])
REFERENCES [dbo].[Przedmioty] ([idPrzedmiotu])
GO
ALTER TABLE [dbo].[Oceny] CHECK CONSTRAINT [FK_Oceny_Przedmioty]
GO
ALTER TABLE [dbo].[Oceny]  WITH CHECK ADD  CONSTRAINT [FK_Oceny_Studenci] FOREIGN KEY([indeks])
REFERENCES [dbo].[Studenci] ([Indeks])
GO
ALTER TABLE [dbo].[Oceny] CHECK CONSTRAINT [FK_Oceny_Studenci]
GO
ALTER TABLE [dbo].[Studenci]  WITH CHECK ADD  CONSTRAINT [FK_Studenci_szkoly] FOREIGN KEY([idSzkoly])
REFERENCES [dbo].[szkoly] ([idSzkoly])
GO
ALTER TABLE [dbo].[Studenci] CHECK CONSTRAINT [FK_Studenci_szkoly]
GO
ALTER TABLE [dbo].[Studenci]  WITH CHECK ADD  CONSTRAINT [FK_Studenci_uzytkownicy] FOREIGN KEY([idUzytkownika])
REFERENCES [dbo].[uzytkownicy] ([idUzytkownika])
GO
ALTER TABLE [dbo].[Studenci] CHECK CONSTRAINT [FK_Studenci_uzytkownicy]
GO
ALTER TABLE [dbo].[szkoly]  WITH CHECK ADD  CONSTRAINT [FK_szkoly_dyrektorzy] FOREIGN KEY([idDyrektora])
REFERENCES [dbo].[dyrektorzy] ([idDyrektora])
GO
ALTER TABLE [dbo].[szkoly] CHECK CONSTRAINT [FK_szkoly_dyrektorzy]
GO
ALTER TABLE [dbo].[szkoly]  WITH CHECK ADD  CONSTRAINT [FK_szkoly_typySzkoly] FOREIGN KEY([typSzkoly])
REFERENCES [dbo].[typySzkoly] ([idTypuSzkoly])
GO
ALTER TABLE [dbo].[szkoly] CHECK CONSTRAINT [FK_szkoly_typySzkoly]
GO
ALTER TABLE [dbo].[uzytkownicy]  WITH CHECK ADD  CONSTRAINT [FK_uzytkownicy_typyUzytkownika] FOREIGN KEY([idTypuUzytkownika])
REFERENCES [dbo].[typyUzytkownika] ([idTypuUzytkownika])
GO
ALTER TABLE [dbo].[uzytkownicy] CHECK CONSTRAINT [FK_uzytkownicy_typyUzytkownika]
GO
ALTER TABLE [dbo].[zatrudnienieNauczycieli]  WITH CHECK ADD  CONSTRAINT [FK_zatrudnienieNauczycieli_nauczyciele] FOREIGN KEY([idNauczyciela])
REFERENCES [dbo].[nauczyciele] ([idNaucz])
GO
ALTER TABLE [dbo].[zatrudnienieNauczycieli] CHECK CONSTRAINT [FK_zatrudnienieNauczycieli_nauczyciele]
GO
ALTER TABLE [dbo].[zatrudnienieNauczycieli]  WITH CHECK ADD  CONSTRAINT [FK_zatrudnienieNauczycieli_szkoly] FOREIGN KEY([idSzkoly])
REFERENCES [dbo].[szkoly] ([idSzkoly])
GO
ALTER TABLE [dbo].[zatrudnienieNauczycieli] CHECK CONSTRAINT [FK_zatrudnienieNauczycieli_szkoly]
GO
/****** Object:  StoredProcedure [dbo].[dodajNauczyciela]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dodajNauczyciela]
	@idSzkoly int,
	@imie varchar(20),
	@nazwisko varchar(20),
	@wyksztalcenie int,
	@haslo varchar(50)
AS
BEGIN
	
	EXEC dbo.dodajUzytkownika @haslo = @haslo;

	INSERT INTO nauczycieleOpiekunowiePraktyk (imie, nazwisko, idTytul, stopienAwansu, idUzytkownika) 
	VALUES (@imie, @nazwisko, @wyksztalcenie, 'Praktykant', (SELECT TOP(1) idUzytkownika FROM uzytkownicy ORDER BY idUzytkownika DESC));

	INSERT INTO zatrudnienieNauczycieli (idNauczyciela, idSzkoly) 
	VALUES ((SELECT TOP(1) idNaucz FROM nauczycieleOpiekunowiePraktyk ORDER BY idNaucz DESC), @idSzkoly);

END
GO
/****** Object:  StoredProcedure [dbo].[dodajOcene]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dodajOcene]
	@indeks int,
	@przedmiot int,
	@ocena int
AS
BEGIN
	INSERT INTO Oceny (indeks, idPrzedmiotu, ocena) VALUES (@indeks, @przedmiot, @ocena);
END
GO
/****** Object:  StoredProcedure [dbo].[dodajStudenta]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dodajStudenta]
	@idSzkoly int,
	@imie varchar(20),
	@nazwisko varchar(20),
	@stopienSt int,
	@rokSt int,
	@idTypu varchar(5),
	@idNaucz int,
	@idFirmy int,
	@idOpiekuna int,
	@rok int,
	@haslo varchar(50)
AS
BEGIN
	
	EXEC dbo.dodajUzytkownika @haslo = @haslo;

	INSERT INTO Studenci(imie, nazwisko, stopienStudiow, rokStudiow, idSzkoly, idUzytkownika) 
	VALUES (@imie, @nazwisko, @stopienSt, @rokSt, @idSzkoly, (SELECT TOP(1) idUzytkownika FROM uzytkownicy ORDER BY idUzytkownika DESC));

	INSERT INTO historiaaPraktyk (idUcznia, IdTypuPraktyki, Id_zatrudn_naucz, idFirmy, idOpiekuna, rokPraktyk) 
	VALUES ((SELECT TOP(1) Indeks FROM Studenci ORDER BY Indeks DESC), @idTypu, @idNaucz, @idFirmy, @idOpiekuna, @rok);

END
GO
/****** Object:  StoredProcedure [dbo].[dodajUzytkownika]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dodajUzytkownika]
	@haslo varchar(50)
AS
BEGIN
	INSERT INTO uzytkownicy (haslo) VALUES (@haslo);
END
GO
/****** Object:  StoredProcedure [dbo].[usunStudenta]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usunStudenta]
	@idS int
AS
BEGIN

	DECLARE @idU int;

	SELECT @idU = uzytkownicy.idUzytkownika FROM uzytkownicy 
	JOIN Studenci ON Studenci.idUzytkownika = uzytkownicy.idUzytkownika
	WHERE Studenci.Indeks = @idS;
	
	EXEC dbo.usunUzytkownika @id = idU;

	DELETE FROM Studenci WHERE Indeks = @idS;

	DELETE FROM historiaaPraktyk WHERE idUcznia = @idS;

	DELETE FROM Oceny WHERE indeks = @idS;

END
GO
/****** Object:  StoredProcedure [dbo].[usunUzytkownika]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usunUzytkownika]
	@id int
AS
BEGIN
	DELETE FROM uzytkownicy WHERE idUzytkownika = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[zmienDyrektora]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[zmienDyrektora]
	@idD int,
	@imie varchar(20),
	@nazwisko varchar(20),
	@wyksztalcenie int,
	@haslo varchar(50)
AS
BEGIN
	DECLARE @idU AS int;

	SELECT @idU = uzytkownicy.idUzytkownika FROM uzytkownicy 
	JOIN dyrektorzy ON dyrektorzy.idUzytkownika = uzytkownicy.idUzytkownika
	WHERE dyrektorzy.idDyrektora = @idD;


	EXEC dbo.usunUzytkownika @id = idU;
	EXEC dbo.dodajUzytkownika @haslo = @haslo;

	UPDATE dyrektorzy SET 
	imie = @imie,
	nazwisko = @nazwisko,
	idWyksztalcenia = @wyksztalcenie,
	idUzytkownika = (SELECT TOP (1) idUzytkownika FROM uzytkownicy ORDER BY idUzytkownika DESC)
	WHERE idDyrektora = @idD;

END
GO
/****** Object:  StoredProcedure [dbo].[zmienLoginiHasloUzytkownika]    Script Date: 22.06.2023 15:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[zmienLoginiHasloUzytkownika] 
	@id int,
	@login varchar(30),
	@haslo varchar(50)
AS
BEGIN
	UPDATE dbo.uzytkownicy SET [login] = @login, [haslo] = @haslo WHERE [idUzytkownika] = @id
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -32
      End
      Begin Tables = 
         Begin Table = "Firmy"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "specjalizacje"
            Begin Extent = 
               Top = 157
               Left = 292
               Bottom = 276
               Right = 511
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'firmyIIchSpecjalizacje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'firmyIIchSpecjalizacje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "opiekuniPraktyk"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 194
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tytuly"
            Begin Extent = 
               Top = 4
               Left = 271
               Bottom = 145
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'opiekuniIIchWyksztalcenie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'opiekuniIIchWyksztalcenie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Oceny"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Studenci"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Przedmioty"
            Begin Extent = 
               Top = 7
               Left = 536
               Bottom = 126
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studenciIIchOceny'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studenciIIchOceny'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -258
      End
      Begin Tables = 
         Begin Table = "Studenci"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 234
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "historiaaPraktyk"
            Begin Extent = 
               Top = 54
               Left = 275
               Bottom = 306
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "typyPraktyk"
            Begin Extent = 
               Top = 10
               Left = 513
               Bottom = 129
               Right = 729
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studenciIIchPraktyki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studenciIIchPraktyki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "dyrektorzy"
            Begin Extent = 
               Top = 123
               Left = 521
               Bottom = 286
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "szkoly"
            Begin Extent = 
               Top = 7
               Left = 297
               Bottom = 170
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tytuly"
            Begin Extent = 
               Top = 0
               Left = 752
               Bottom = 141
               Right = 946
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "uzytkownicy"
            Begin Extent = 
               Top = 176
               Left = 297
               Bottom = 295
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'szkolyIIchDyrektorzy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'szkolyIIchDyrektorzy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -258
      End
      Begin Tables = 
         Begin Table = "szkoly"
            Begin Extent = 
               Top = 53
               Left = 267
               Bottom = 260
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "zatrudnienieNauczycieli"
            Begin Extent = 
               Top = 9
               Left = 532
               Bottom = 150
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nauczycieleOpiekunowiePraktyk"
            Begin Extent = 
               Top = 0
               Left = 755
               Bottom = 184
               Right = 950
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tytuly"
            Begin Extent = 
               Top = 161
               Left = 531
               Bottom = 302
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "uzytkownicy"
            Begin Extent = 
               Top = 176
               Left = 979
               Bottom = 295
               Right = 1173
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SzkolyIIchNauczyciele'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SzkolyIIchNauczyciele'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SzkolyIIchNauczyciele'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -142
         Left = 0
      End
      Begin Tables = 
         Begin Table = "szkoly"
            Begin Extent = 
               Top = 55
               Left = 704
               Bottom = 263
               Right = 898
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Studenci"
            Begin Extent = 
               Top = 0
               Left = 928
               Bottom = 208
               Right = 1126
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "zatrudnienieNauczycieli"
            Begin Extent = 
               Top = 11
               Left = 401
               Bottom = 157
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nauczycieleOpiekunowiePraktyk"
            Begin Extent = 
               Top = 89
               Left = 176
               Bottom = 252
               Right = 371
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dyrektorzy"
            Begin Extent = 
               Top = 219
               Left = 474
               Bottom = 382
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tytuly"
            Begin Extent = 
               Top = 236
               Left = 965
               Bottom = 377
               Right = 1159
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'szkolyIIchPracownicy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N's = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'szkolyIIchPracownicy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'szkolyIIchPracownicy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Studenci"
            Begin Extent = 
               Top = 66
               Left = 501
               Bottom = 294
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "szkoly"
            Begin Extent = 
               Top = 8
               Left = 277
               Bottom = 215
               Right = 471
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "uzytkownicy"
            Begin Extent = 
               Top = 22
               Left = 728
               Bottom = 141
               Right = 922
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'szkolyIIchStudenci'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'szkolyIIchStudenci'
GO
USE [master]
GO
ALTER DATABASE [praktyki] SET  READ_WRITE 
GO
