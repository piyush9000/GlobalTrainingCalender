USE [master]
GO
/****** Object:  Database [Calenderdb]    Script Date: 21-10-2021 17:33:13 ******/
CREATE DATABASE [Calenderdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Calenderdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Calenderdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Calenderdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Calenderdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Calenderdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Calenderdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Calenderdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Calenderdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Calenderdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Calenderdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Calenderdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Calenderdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Calenderdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Calenderdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Calenderdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Calenderdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Calenderdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Calenderdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Calenderdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Calenderdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Calenderdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Calenderdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Calenderdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Calenderdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Calenderdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Calenderdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Calenderdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Calenderdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Calenderdb] SET RECOVERY FULL 
GO
ALTER DATABASE [Calenderdb] SET  MULTI_USER 
GO
ALTER DATABASE [Calenderdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Calenderdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Calenderdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Calenderdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Calenderdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Calenderdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Calenderdb', N'ON'
GO
ALTER DATABASE [Calenderdb] SET QUERY_STORE = OFF
GO
USE [Calenderdb]
GO
/****** Object:  Table [dbo].[tblcourses]    Script Date: 21-10-2021 17:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcourses](
	[Course_Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblcourses] PRIMARY KEY CLUSTERED 
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbltranning]    Script Date: 21-10-2021 17:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltranning](
	[Trn_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pre_Requisite] [varchar](max) NOT NULL,
	[Duration] [varchar](50) NOT NULL,
	[Start_Date] [datetime] NOT NULL,
	[End_Date] [datetime] NOT NULL,
	[url_link] [varchar](50) NOT NULL,
	[Course_Id] [int] NOT NULL,
	[trainer_id] [int] NOT NULL,
 CONSTRAINT [PK_tbltranning] PRIMARY KEY CLUSTERED 
(
	[Trn_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblusers]    Script Date: 21-10-2021 17:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblusers](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Username] [varchar](50) NOT NULL,
	[Password_Hash] [varchar](50) NOT NULL,
	[User_Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblusers] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblcourses] ON 

INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (1, N'Azure Devops')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (2, N'Jquery')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (3, N'JS')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (4, N'OOPS')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (5, N'MS')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (6, N'HTML')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (7, N'CSS')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (8, N'SE')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (9, N'Dotnet Core')
INSERT [dbo].[tblcourses] ([Course_Id], [Course_Name]) VALUES (10, N'Angular')
SET IDENTITY_INSERT [dbo].[tblcourses] OFF
GO
SET IDENTITY_INSERT [dbo].[tbltranning] ON 

INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (1, N'Any OOP language,  below Software
  1.  .NET Core latest version
2.  Visual Studio 2019
3. SQL Server Express latest version', N'4Hr', CAST(N'2021-10-07T00:00:00.000' AS DateTime), CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'xyz', 1, 1)
INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (2, N'Javascript and any OO language ,
Visual Studio Code', N'4hr', CAST(N'2021-10-09T18:50:38.107' AS DateTime), CAST(N'2021-10-09T18:50:38.107' AS DateTime), N'abc', 2, 1)
INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (5, N'Knowledge of JavaScript,  OOJS
Node, VSCode to be installed', N'6hr', CAST(N'2021-10-09T18:50:38.107' AS DateTime), CAST(N'2021-10-09T18:50:38.107' AS DateTime), N'aaa', 3, 2)
INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (6, N'Dev/Testing Experience,
AWS free Account to be created', N'3hr', CAST(N'2021-10-09T18:50:38.107' AS DateTime), CAST(N'2021-10-09T18:50:38.107' AS DateTime), N'asas', 4, 3)
INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (7, N'Knowledge any programing language
Node installed', N'3hr', CAST(N'2021-10-09T18:50:38.107' AS DateTime), CAST(N'2021-10-09T18:50:38.107' AS DateTime), N'asas', 5, 2)
INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (8, N'Database Basics	', N'6', CAST(N'2021-10-09T18:50:38.107' AS DateTime), CAST(N'2021-10-09T18:50:38.107' AS DateTime), N'sas', 6, 2)
INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (9, N'sdffsdf', N'4hr', CAST(N'2021-10-12T18:35:44.357' AS DateTime), CAST(N'2021-10-12T18:35:44.357' AS DateTime), N'sdfsf', 1, 2)
INSERT [dbo].[tbltranning] ([Trn_Id], [Pre_Requisite], [Duration], [Start_Date], [End_Date], [url_link], [Course_Id], [trainer_id]) VALUES (1002, N'Cloud Computing', N'3Hrs', CAST(N'2021-10-18T05:41:07.850' AS DateTime), CAST(N'2021-10-18T05:41:07.850' AS DateTime), N'zyz', 2, 3)
SET IDENTITY_INSERT [dbo].[tbltranning] OFF
GO
SET IDENTITY_INSERT [dbo].[tblusers] ON 

INSERT [dbo].[tblusers] ([User_ID], [First_Name], [Last_Name], [Username], [Password_Hash], [User_Type]) VALUES (1, N'Piyush', N'Singh', N'Piyush9220', N'zxcv@123', N'Admin')
INSERT [dbo].[tblusers] ([User_ID], [First_Name], [Last_Name], [Username], [Password_Hash], [User_Type]) VALUES (2, N'Rahul', N'Singh', N'Rahul123', N'zxcv@123', N'Trainer')
INSERT [dbo].[tblusers] ([User_ID], [First_Name], [Last_Name], [Username], [Password_Hash], [User_Type]) VALUES (3, N'Abhishek', N'Mandal', N'Abhi9220', N'123456', N'Trainer')
SET IDENTITY_INSERT [dbo].[tblusers] OFF
GO
ALTER TABLE [dbo].[tbltranning]  WITH CHECK ADD  CONSTRAINT [FK_tbltranning_tblcourses] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[tblcourses] ([Course_Id])
GO
ALTER TABLE [dbo].[tbltranning] CHECK CONSTRAINT [FK_tbltranning_tblcourses]
GO
ALTER TABLE [dbo].[tbltranning]  WITH CHECK ADD  CONSTRAINT [FK_tbltranning_tblusers] FOREIGN KEY([trainer_id])
REFERENCES [dbo].[tblusers] ([User_ID])
GO
ALTER TABLE [dbo].[tbltranning] CHECK CONSTRAINT [FK_tbltranning_tblusers]
GO
USE [master]
GO
ALTER DATABASE [Calenderdb] SET  READ_WRITE 
GO
