USE [master]
GO
/****** Object:  Database [yxDataBase]    Script Date: 2019/3/31 21:23:13 ******/
CREATE DATABASE [yxDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'yxDataBase', FILENAME = N'F:\bishe\code\api\yxApi\yxApi\App_Data\yxDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'yxDataBase_log', FILENAME = N'F:\bishe\code\api\yxApi\yxApi\App_Data\yxDataBase.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [yxDataBase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [yxDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [yxDataBase] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [yxDataBase] SET ANSI_NULLS ON 
GO
ALTER DATABASE [yxDataBase] SET ANSI_PADDING ON 
GO
ALTER DATABASE [yxDataBase] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [yxDataBase] SET ARITHABORT ON 
GO
ALTER DATABASE [yxDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [yxDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [yxDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [yxDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [yxDataBase] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [yxDataBase] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [yxDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [yxDataBase] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [yxDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [yxDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [yxDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [yxDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [yxDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [yxDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [yxDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [yxDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [yxDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [yxDataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [yxDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [yxDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [yxDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [yxDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [yxDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [yxDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [yxDataBase] SET QUERY_STORE = OFF
GO
USE [yxDataBase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [yxDataBase]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2019/3/31 21:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[nickname] [nvarchar](20) NULL,
	[role] [nvarchar](20) NULL,
	[collegeCode] [nvarchar](20) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campus]    Script Date: 2019/3/31 21:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campus](
	[id] [int] NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[address] [nvarchar](80) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[college]    Script Date: 2019/3/31 21:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[college](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_college] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[major]    Script Date: 2019/3/31 21:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[major](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[code] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 2019/3/31 21:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](40) NOT NULL,
	[type] [int] NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[publishTime] [timestamp] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 2019/3/31 21:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[gender] [int] NOT NULL,
	[examineeNo] [nvarchar](40) NULL,
	[idCardNo] [nvarchar](40) NOT NULL,
	[collegeCode] [nvarchar](20) NOT NULL,
	[majorCode] [nvarchar](20) NOT NULL,
	[year] [int] NOT NULL,
	[type] [int] NOT NULL,
	[clothesSize] [int] NULL,
	[shoesSize] [int] NULL,
	[picture] [int] NULL,
	[politicalStatus] [int] NULL,
	[marriage] [int] NULL,
	[nativePlace] [nvarchar](80) NULL,
	[birthPlace] [nvarchar](80) NULL,
	[nation] [int] NULL,
	[phone] [nvarchar](20) NULL,
	[qqNo] [nvarchar](20) NULL,
	[mailingAddress] [nvarchar](80) NULL,
	[parentName] [nvarchar](40) NULL,
	[parentPhone] [nvarchar](20) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_student] FOREIGN KEY([id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_student]
GO
USE [master]
GO
ALTER DATABASE [yxDataBase] SET  READ_WRITE 
GO
