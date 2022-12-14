USE [master]
GO
/****** Object:  Database [projectCheckAttend]    Script Date: 11/8/2022 11:48:11 AM ******/
CREATE DATABASE [projectCheckAttend]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectCheckAttend', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\projectCheckAttend.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectCheckAttend_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\projectCheckAttend_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [projectCheckAttend] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectCheckAttend].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectCheckAttend] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectCheckAttend] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectCheckAttend] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectCheckAttend] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectCheckAttend] SET  ENABLE_BROKER 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectCheckAttend] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectCheckAttend] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectCheckAttend] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectCheckAttend] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectCheckAttend] SET RECOVERY FULL 
GO
ALTER DATABASE [projectCheckAttend] SET  MULTI_USER 
GO
ALTER DATABASE [projectCheckAttend] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectCheckAttend] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectCheckAttend] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectCheckAttend] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectCheckAttend] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectCheckAttend] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'projectCheckAttend', N'ON'
GO
ALTER DATABASE [projectCheckAttend] SET QUERY_STORE = OFF
GO
USE [projectCheckAttend]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[role] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Avatar] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDate] [date] NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[ExpireDate] [date] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckAttedance]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckAttedance](
	[CaID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [int] NOT NULL,
	[SID] [int] NOT NULL,
	[CheckAttendance] [bit] NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[Taker] [nvarchar](50) NOT NULL,
	[RecordTime] [datetime] NULL,
 CONSTRAINT [PK_CheckAttedance] PRIMARY KEY CLUSTERED 
(
	[CaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[SID] [int] NOT NULL,
	[GroupID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nchar](10) NOT NULL,
	[SubID] [int] NOT NULL,
	[Term] [nvarchar](50) NOT NULL,
	[Campus] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[IName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[AdminID] [int] NULL,
	[BillID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
	[Discount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomCode] [nvarchar](50) NOT NULL,
	[Campus] [nvarchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Slot] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[Scode] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Gender] [bit] NOT NULL,
	[img] [ntext] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/8/2022 11:48:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubID] [int] IDENTITY(1,1) NOT NULL,
	[SubCode] [nvarchar](50) NOT NULL,
	[SubName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CheckAttedance] ON 

INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (163, 1, 39, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.893' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (164, 1, 10, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.893' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (165, 1, 11, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (166, 1, 58, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (167, 1, 53, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (168, 1, 54, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (169, 1, 55, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (170, 1, 16, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (171, 1, 17, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (172, 1, 18, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (173, 1, 19, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (174, 1, 21, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (175, 1, 42, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (176, 1, 43, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (177, 1, 24, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (178, 1, 25, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (179, 1, 46, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (180, 1, 27, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (181, 1, 48, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (182, 1, 49, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (183, 1, 40, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (184, 1, 41, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (185, 1, 12, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (186, 1, 13, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (187, 1, 14, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (188, 1, 35, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (189, 1, 36, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (190, 1, 37, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (191, 1, 38, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.903' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (192, 1, 15, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.903' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (251, 8, 10, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.453' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (252, 8, 11, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.453' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (253, 8, 58, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.453' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (254, 8, 53, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.453' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (255, 8, 54, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.453' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (256, 8, 55, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.453' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (257, 8, 16, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (258, 8, 17, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (259, 8, 18, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (260, 8, 19, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (261, 8, 21, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (262, 8, 42, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (263, 8, 43, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (264, 8, 24, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (265, 8, 25, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (266, 8, 46, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.457' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (267, 8, 27, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (268, 8, 48, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (269, 8, 49, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (270, 8, 40, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (271, 8, 41, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (272, 8, 12, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (273, 8, 13, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (274, 8, 14, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (275, 8, 35, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (276, 8, 36, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (277, 8, 37, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (278, 8, 38, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (279, 8, 15, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.460' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (280, 8, 10, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (281, 8, 11, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (282, 8, 58, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (283, 8, 53, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (284, 8, 54, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (285, 8, 55, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (286, 8, 16, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (287, 8, 17, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (288, 8, 18, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (289, 8, 19, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (290, 8, 21, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (291, 8, 42, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.463' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (292, 8, 43, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (293, 8, 24, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (294, 8, 25, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (295, 8, 46, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (296, 8, 27, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (297, 8, 48, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (298, 8, 49, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (299, 8, 40, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (300, 8, 41, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (301, 8, 12, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (302, 8, 13, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (303, 8, 14, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.467' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (304, 8, 35, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (305, 8, 36, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (306, 8, 37, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (307, 8, 38, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (308, 8, 15, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (309, 8, 10, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (310, 8, 11, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (311, 8, 58, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (312, 8, 53, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (313, 8, 54, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (314, 8, 55, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (315, 8, 16, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (316, 8, 17, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (317, 8, 18, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (318, 8, 19, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.470' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (319, 8, 21, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
GO
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (320, 8, 42, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (321, 8, 43, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (322, 8, 24, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (323, 8, 25, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (324, 8, 46, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (325, 8, 27, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (326, 8, 48, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (327, 8, 49, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (328, 8, 40, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.473' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (329, 8, 41, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (330, 8, 12, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (331, 8, 13, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (332, 8, 14, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (333, 8, 35, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (334, 8, 36, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (335, 8, 37, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (336, 8, 38, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (337, 8, 15, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (338, 8, 10, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (339, 8, 11, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (340, 8, 58, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (341, 8, 53, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.477' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (342, 8, 54, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (343, 8, 55, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (344, 8, 16, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (345, 8, 17, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (346, 8, 18, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (347, 8, 19, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (348, 8, 21, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (349, 8, 42, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (350, 8, 43, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (351, 8, 24, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (352, 8, 25, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (353, 8, 46, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (354, 8, 27, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (355, 8, 48, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (356, 8, 49, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (357, 8, 40, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.480' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (358, 8, 41, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (359, 8, 12, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (360, 8, 13, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (361, 8, 14, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (362, 8, 35, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (363, 8, 36, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (364, 8, 37, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (365, 8, 38, 0, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (366, 8, 15, 1, N'', N'1', CAST(N'2022-11-08T01:49:17.483' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (487, 4, 9, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.137' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (488, 4, 10, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.140' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (489, 4, 11, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.140' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (490, 4, 58, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.140' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (491, 4, 53, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.140' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (492, 4, 54, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.140' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (493, 4, 55, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.143' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (494, 4, 16, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.143' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (495, 4, 17, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.143' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (496, 4, 18, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.147' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (497, 4, 19, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.147' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (498, 4, 21, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.147' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (499, 4, 42, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.147' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (500, 4, 43, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.147' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (501, 4, 44, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.147' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (502, 4, 45, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.150' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (503, 4, 46, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.150' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (504, 4, 47, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.150' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (505, 4, 48, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.150' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (506, 4, 49, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.150' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (507, 4, 40, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.150' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (508, 4, 41, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.150' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (509, 4, 12, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.153' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (510, 4, 13, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.153' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (511, 4, 14, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.153' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (512, 4, 35, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.153' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (513, 4, 36, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.153' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (514, 4, 37, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.153' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (515, 4, 38, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.153' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (516, 4, 39, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.157' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (517, 4, 9, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.157' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (518, 4, 10, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.157' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (519, 4, 11, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.157' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (520, 4, 58, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.157' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (521, 4, 53, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.160' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (522, 4, 54, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.160' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (523, 4, 55, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.160' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (524, 4, 16, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.160' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (525, 4, 17, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.160' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (526, 4, 18, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.160' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (527, 4, 19, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.160' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (528, 4, 21, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.163' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (529, 4, 42, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.163' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (530, 4, 43, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.163' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (531, 4, 44, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.163' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (532, 4, 45, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.163' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (533, 4, 46, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.167' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (534, 4, 47, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.167' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (535, 4, 48, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.167' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (536, 4, 49, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.167' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (537, 4, 40, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.167' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (538, 4, 41, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.167' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (539, 4, 12, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.170' AS DateTime))
GO
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (540, 4, 13, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.170' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (541, 4, 14, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.170' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (542, 4, 35, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.170' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (543, 4, 36, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.170' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (544, 4, 37, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.170' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (545, 4, 38, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.173' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (546, 4, 39, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.173' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (547, 4, 9, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.173' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (548, 4, 10, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.173' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (549, 4, 11, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.173' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (550, 4, 58, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.173' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (551, 4, 53, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.177' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (552, 4, 54, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.177' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (553, 4, 55, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.177' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (554, 4, 16, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.177' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (555, 4, 17, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.180' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (556, 4, 18, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.180' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (557, 4, 19, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.180' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (558, 4, 21, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.180' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (559, 4, 42, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.180' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (560, 4, 43, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.180' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (561, 4, 44, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.183' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (562, 4, 45, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.183' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (563, 4, 46, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.187' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (564, 4, 47, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.187' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (565, 4, 48, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.187' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (566, 4, 49, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.187' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (567, 4, 40, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.190' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (568, 4, 41, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.190' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (569, 4, 12, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.190' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (570, 4, 13, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.190' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (571, 4, 14, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.193' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (572, 4, 35, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.193' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (573, 4, 36, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.197' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (574, 4, 37, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.197' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (575, 4, 38, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.197' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (576, 4, 39, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.197' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (577, 4, 9, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.200' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (578, 4, 10, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.200' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (579, 4, 11, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.200' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (580, 4, 58, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.200' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (581, 4, 53, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.200' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (582, 4, 54, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.203' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (583, 4, 55, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.203' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (584, 4, 16, 1, N'', N'1', CAST(N'2022-11-08T11:46:49.203' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (585, 4, 17, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.203' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (586, 4, 18, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.207' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (587, 4, 19, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.207' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (588, 4, 21, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.210' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (589, 4, 42, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.210' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (590, 4, 43, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.210' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (591, 4, 44, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.210' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (592, 4, 45, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.213' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (593, 4, 46, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.213' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (594, 4, 47, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.213' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (595, 4, 48, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.213' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (596, 4, 49, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.217' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (597, 4, 40, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.217' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (598, 4, 41, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.217' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (599, 4, 12, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.217' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (600, 4, 13, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.220' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (601, 4, 14, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.220' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (602, 4, 35, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.220' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (603, 4, 36, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.220' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (604, 4, 37, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.220' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (605, 4, 38, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.223' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (606, 4, 39, 0, N'', N'1', CAST(N'2022-11-08T11:46:49.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[CheckAttedance] OFF
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (33, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (34, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (44, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 7)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (20, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 15)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (33, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (34, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (44, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 6)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 13)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (20, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (33, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (34, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (44, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 5)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 10)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (20, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (33, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (34, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 4)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (44, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 12)
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 12)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 10)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 14)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (20, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 13)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 15)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 17)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 17)
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (4, N'SE1647    ', 1, N'Summer2020', N'FU-HL', N'Computing Fundamental', 1)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (5, N'GD1634    ', 2, N'Fall2020', N'FU-HL', N'Graphic Design', 1)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (6, N'JPN1601   ', 3, N'Spring2021', N'FU-HL', N'Japanese', 4)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (7, N'BA1623    ', 5, N'Spring2021', N'FU-HL', N'Business Administration', 1)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (10, N'JPN1602   ', 3, N'Summer2021', N'FU-HL', N'Japanese', 4)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (12, N'SE1616    ', 2, N'Summer2021', N'FU-HL', N'Computing Fundamental', 1)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (13, N'SE1535    ', 8, N'Spring2022', N'FU-HL', N'Computing Fundamental', 1)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (14, N'SE1515    ', 8, N'Spring2022', N'FU-HL', N'Computing Fundamental', 1)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (15, N'SE1234    ', 8, N'Spring2022', N'FU-HL', N'Computing Fundamental', 1)
INSERT [dbo].[Group] ([GroupID], [GroupCode], [SubID], [Term], [Campus], [Department], [InstructorID]) VALUES (17, N'SE1603    ', 3, N'Fall2021', N'FU-HL', N'Internet of Things', 3)
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([InstructorID], [IName], [UserName]) VALUES (1, N'Ngo Tung Son', N'sonnt')
INSERT [dbo].[Instructor] ([InstructorID], [IName], [UserName]) VALUES (3, N'Vuong Minh Tuan', N'tuanvm')
INSERT [dbo].[Instructor] ([InstructorID], [IName], [UserName]) VALUES (4, N'Le Phuong Chi', N'chilp')
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (1, N'DE101', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (2, N'BE101', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (3, N'DE102', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (4, N'DE103', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (5, N'AL104', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (6, N'DE105', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (7, N'AL106', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (8, N'DE107', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (9, N'DE108', N'FU-HL', 30)
INSERT [dbo].[Room] ([RoomID], [RoomCode], [Campus], [Capacity]) VALUES (10, N'BE109', N'FU-HL', 30)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (1, 6, CAST(N'2022-06-20' AS Date), 5, 2, 1)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (2, 6, CAST(N'2022-06-20' AS Date), 4, 2, 0)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (3, 2, CAST(N'2022-06-20' AS Date), 1, 1, 0)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (4, 5, CAST(N'2022-06-21' AS Date), 3, 1, 1)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (5, 2, CAST(N'2022-06-21' AS Date), 2, 3, 0)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (6, 2, CAST(N'2022-06-21' AS Date), 1, 3, 0)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (7, 6, CAST(N'2022-06-22' AS Date), 2, 5, 0)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (8, 7, CAST(N'2022-06-23' AS Date), 1, 6, 1)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (11, 7, CAST(N'2022-06-23' AS Date), 2, 6, 0)
INSERT [dbo].[Slot] ([SlotID], [GroupID], [Date], [Slot], [RoomID], [status]) VALUES (12, 10, CAST(N'2022-06-24' AS Date), 4, 4, 0)
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (9, N'HE153512', N'Dang Viet Anh', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (10, N'HE156812', N'To Quang Huy', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (11, N'HE151241', N'Nguyen Huy Ba', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (12, N'HE155672', N'Trinh Ha Nam', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (13, N'HE142342', N'Nguyen Van An', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (14, N'HE143232', N'Dinh thi An', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (15, N'HE143552', N'Dinh Van Nam', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (16, N'HE157346', N'Tran Anh Duc', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (17, N'HE158462', N'Nguyen Trong Kieu', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (18, N'HE154632', N'Hoang Kim Nam', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (19, N'HE146246', N'Hoang Van An', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (20, N'HE152552', N'Tran Huu Tan', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (21, N'HE158493', N'Pham Van Mach', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (22, N'HE158493', N'Duong Thuy Trang', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (23, N'HE158493', N'Le Van Thang', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (24, N'HE158493', N'Nguyen Luu Ly', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (25, N'HE158493', N'Nguyen Thuc Quyen', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (26, N'HE158493', N'Tran Luong Quyen', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (27, N'HE158493', N'Nguyen Hoai Thuong', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (28, N'HE158493', N'Tran Son Quyen', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (29, N'HE158493', N'Pham Thanh Tuan', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (30, N'HE158493', N'Trinh Ha Duc', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (31, N'HE158493', N'Nguyen Van Cao', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (32, N'HE158493', N'Le Duc Anh', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (33, N'HE158493', N'Tran Bach Tuyet', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (34, N'HE150070', N'Nguyen Huy Hoang', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (35, N'HE150138', N'Nguyen Tuan Truong', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (36, N'HE150224', N'Vu Hoang Tai Toan', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (37, N'HE150333', N'Nguyen Ngoc Huy Hoang', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (38, N'HE150375', N'Do Thi An', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (39, N'HE150385', N'Do Huy An', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (40, N'HE151136', N'Hoang Thi Minh', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (41, N'HE151313', N'Le The An', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (42, N'HE153583', N'Le Viet Anh', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (43, N'HE153716', N'Nguyen Thi Nam', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (44, N'HE160113', N'Dinh Van Cao', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (45, N'HE160124', N'Tran Ngoc Ha', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (46, N'HE160250', N'Nguyen Ngoc Minh', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (47, N'HE160297', N'Bui Tu Anh', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (48, N'HE160384', N'Pham Duc Duong', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (49, N'HE160385', N'Hoang Long', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (50, N'HE160417', N'Phan Hoai Nam', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (51, N'HE160714', N'Pham Hoang Nam', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (52, N'HE160727', N'Nguyen Quoc Dung', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (53, N'HE161270', N'Ha An Thai', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (54, N'HE163452', N'Loc Tuan Hung', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (55, N'HE150085', N'Ngo Hong Quang', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (56, N'HE150176', N'Nguyen Huu Manh', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (57, N'HE150296', N'Nguyen Minh Hieu', 1, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
INSERT [dbo].[Student] ([SID], [Scode], [FullName], [Gender], [img]) VALUES (58, N'HE150321', N'Nguyen Hai Dung', 0, N'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (1, N'WED201c', N'Web Design')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (2, N'2DP49', N'Digital project 2D')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (3, N'JPD113', N'Elementary Japanese 1-A1.1')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (4, N'IOT102', N'Internet of Things')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (5, N'ACC101', N'Principles of Accounting ')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (6, N'SWE201c', N'Introduction to Software Engineering')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (7, N'SWP391', N'Application development project')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (8, N'CSD201', N'Data Structures and Algorithms ')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (9, N'PRE201c', N'Excel Skills for Business ')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (10, N'SWT301', N'Software Testing')
INSERT [dbo].[Subject] ([SubID], [SubCode], [SubName]) VALUES (11, N'JPD123', N'Elementary Japanese 1-A1.2')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
ALTER TABLE [dbo].[CheckAttedance]  WITH CHECK ADD  CONSTRAINT [FK_CheckAttedance_Slot] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[CheckAttedance] CHECK CONSTRAINT [FK_CheckAttedance_Slot]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Group]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Student] FOREIGN KEY([SID])
REFERENCES [dbo].[Student] ([SID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Instructor]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([SubID])
REFERENCES [dbo].[Subject] ([SubID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Room]
GO
USE [master]
GO
ALTER DATABASE [projectCheckAttend] SET  READ_WRITE 
GO
