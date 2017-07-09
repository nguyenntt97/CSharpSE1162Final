USE [master]
GO
/****** Object:  Database [OnlineLibrary]    Script Date: 07/08/2017 9:47:59 PM ******/
CREATE DATABASE [OnlineLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGUYENNTT\MSSQL\DATA\OnlineLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGUYENNTT\MSSQL\DATA\OnlineLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineLibrary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineLibrary] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OnlineLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineLibrary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineLibrary] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineLibrary]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ID] [char](8) NOT NULL,
	[LastName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Sex] [char](1) NULL,
	[DOB] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [char](11) NULL,
	[Address] [nvarchar](100) NULL,
	[RID] [char](3) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Activity_History]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activity_History](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[MID] [char](8) NULL,
	[BID] [varchar](10) NULL,
	[BorrowDate] [date] NULL,
	[ReturnDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Book]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](10) NULL,
	[Title] [int] NULL,
	[ImportDate] [date] NOT NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Book_Category_Detail]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Category_Detail](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book_Status]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book_Status](
	[StatusID] [int] NOT NULL,
	[StatusName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite_List]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite_List](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NULL,
	[MID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fine_History]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine_History](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ASEQ] [int] NULL,
	[FineTypeID] [int] NULL,
	[FineAmount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fine_Type]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fine_Type](
	[FineTypeID] [int] NOT NULL,
	[FineTypeName] [varchar](50) NULL,
	[Amount] [float] NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[FineTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Return_Type]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return_Type](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[NoOfDay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [char](3) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Title]    Script Date: 07/08/2017 9:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Title](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Publisher] [nvarchar](50) NULL,
	[PublishYear] [int] NULL,
	[ISBN] [char](13) NULL,
	[AvailableQuan] [int] NULL,
	[Illu] [varchar](250) NULL,
	[Description] [varchar](8000) NULL,
	[Author] [nvarchar](50) NULL,
	[Views] [int] NULL,
	[Rating] [float] NULL,
	[ReturnType] [int] NULL,
 CONSTRAINT [PK__Title__CA1938C06A3FA632] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (1, N'E00001  ', N'Tuấn', N'Đào', N'12345', N'M', CAST(N'1997-01-02' AS Date), N'tuand@fpt.edu.vn', N'090x       ', NULL, N'EMP', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (2, N'E00003  ', N'Bảo', N'Lu Kim', N'123', N'M', CAST(N'1997-03-02' AS Date), N'baolk@fpt.edu', N'093x       ', NULL, N'EMP', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (3, N'M0001   ', N'Nguyên', N'Nguyễn Trí Tùng', N'123', N'M', CAST(N'1997-08-17' AS Date), N'nguyenntt@fpt.edu', N'099x       ', NULL, N'MEM', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (4, N'M0002   ', N'Anh', N'Nguyễn Hoàng', N'123456', N'F', CAST(N'1997-08-08' AS Date), N'anhnh@fpt.edu', N'093x       ', NULL, N'MEM', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (5, N'E00004  ', N'Cường', N'Mai Vũ', N'123456', N'F', CAST(N'1997-12-11' AS Date), N'cuongmv@fpt.edu', N'090x       ', NULL, N'EMP', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (6, N'E00002  ', N'Nghĩa', N'Trần Trọng', N'123', N'M', CAST(N'1996-01-22' AS Date), N'nghiatt@fpt.edu', N'012x       ', NULL, N'EMP', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (7, N'E00005  ', N'Khuê', N'Thái Lý Anh', N'123456789', N'M', CAST(N'1996-11-12' AS Date), N'khuetla@fpt.edu', N'012x       ', NULL, N'EMP', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (8, N'M0003   ', N'Duy', N' Đàm Phước Đức', N'123456', N'M', CAST(N'1997-04-28' AS Date), N'duydpd@fpt.edu', N'093x       ', NULL, N'MEM', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (9, N'M0004   ', N'Hoàng', N'Nguyễn Huy', N'123', N'M', CAST(N'1997-05-15' AS Date), N'hoangnh@fpt.edu', N'090x       ', NULL, N'MEM', NULL)
INSERT [dbo].[Account] ([SEQ], [ID], [LastName], [FirstName], [Password], [Sex], [DOB], [Email], [Phone], [Address], [RID], [Status]) VALUES (10, N'M0005   ', N'Hiệp', N'Trần Bửu', N'123456', N'M', CAST(N'1997-02-28' AS Date), N'hieptb@fpt.edu', N'012x       ', NULL, N'PRE', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Activity_History] ON 

INSERT [dbo].[Activity_History] ([SEQ], [MID], [BID], [BorrowDate], [ReturnDate]) VALUES (3, N'E00001  ', N'B0001', CAST(N'2017-08-02' AS Date), NULL)
INSERT [dbo].[Activity_History] ([SEQ], [MID], [BID], [BorrowDate], [ReturnDate]) VALUES (4, N'E00002  ', N'B0002', CAST(N'2017-08-03' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Activity_History] OFF
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([SEQ], [ID], [Title], [ImportDate], [StatusID]) VALUES (4, N'B0001', 1, CAST(N'2017-08-04' AS Date), 1)
INSERT [dbo].[Book] ([SEQ], [ID], [Title], [ImportDate], [StatusID]) VALUES (5, N'B0002', 2, CAST(N'2017-08-05' AS Date), -1)
INSERT [dbo].[Book] ([SEQ], [ID], [Title], [ImportDate], [StatusID]) VALUES (7, N'B0003', 1, CAST(N'2017-08-06' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[Book_Status] ([StatusID], [StatusName]) VALUES (-3, N'Archieved')
INSERT [dbo].[Book_Status] ([StatusID], [StatusName]) VALUES (-2, N'Damaged')
INSERT [dbo].[Book_Status] ([StatusID], [StatusName]) VALUES (-1, N'Lost')
INSERT [dbo].[Book_Status] ([StatusID], [StatusName]) VALUES (0, N'Missing')
INSERT [dbo].[Book_Status] ([StatusID], [StatusName]) VALUES (1, N'Available')
INSERT [dbo].[Book_Status] ([StatusID], [StatusName]) VALUES (2, N'Lib use only')
INSERT [dbo].[Book_Status] ([StatusID], [StatusName]) VALUES (3, N'Borrowed')
INSERT [dbo].[Fine_Type] ([FineTypeID], [FineTypeName], [Amount], [Description]) VALUES (1, N'Lost', 20, N'20 dollars fine and equivalence value of the book')
INSERT [dbo].[Fine_Type] ([FineTypeID], [FineTypeName], [Amount], [Description]) VALUES (2, N'Damaged', 15, N'15 dollars per page (Seen as ''Lost'' if more than 20 pages)')
INSERT [dbo].[Fine_Type] ([FineTypeID], [FineTypeName], [Amount], [Description]) VALUES (3, N'Late', 2, N'2 dollars per day')
SET IDENTITY_INSERT [dbo].[Return_Type] ON 

INSERT [dbo].[Return_Type] ([SEQ], [NoOfDay]) VALUES (1, 7)
INSERT [dbo].[Return_Type] ([SEQ], [NoOfDay]) VALUES (2, 14)
INSERT [dbo].[Return_Type] ([SEQ], [NoOfDay]) VALUES (3, 30)
SET IDENTITY_INSERT [dbo].[Return_Type] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EMP', N'Employee')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'MEM', N'Member')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRE', N'Premium Member')
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (1, N'Head First Java', N'O''Reilly', 2009, N'9780596009205', 3, N'headfirst.jpg', N'Learning a complex new language is no easy task especially when it s an object-oriented computer programming language like Java. You might think the problem is your brain. It seems to have a mind of its own, a mind that doesn''t always want to take in the dry, technical stuff you''re forced to study.

The fact is your brain craves novelty. It''s constantly searching, scanning, waiting for something unusual to happen. After all, that''s the way it was built to help you stay alive. It takes all the routine, ordinary, dull stuff and filters it to the background so it won''t interfere with your brain''s real work--recording things that matter. How does your brain know what matters? It''s like the creators of the Head First approach say, suppose you''re out for a hike and a tiger jumps in front of you, what happens in your brain? Neurons fire. Emotions crank up. Chemicals surge. That''s how your brain knows.

And that''s how your brain will learn Java. Head First Java combines puzzles, strong visuals, mysteries, and soul-searching interviews with famous Java objects to engage you in many different ways. It''s fast, it''s fun, and it''s effective. And, despite its playful appearance, Head First Java is serious stuff: a complete introduction to object-oriented programming and Java. You''ll learn everything from the fundamentals to advanced topics, including threads, network sockets, and distributed programming with RMI. And the new. second edition focuses on Java 5.0, the latest version of the Java language and development platform. Because Java 5.0 is a major update to the platform, with deep, code-level changes, even more careful study and implementation is required. So learning the Head First way is more important than ever.

If you''ve read a Head First book, you know what to expect--a visually rich format designed for the way your brain works. If you haven''t, you''re in for a treat. You''ll see why people say it''s unlike any other Java book you''ve ever read.

By exploiting how your brain works, Head First Java compresses the time it takes to learn and retain--complex information. Its unique approach not only shows you what you need to know about Java syntax, it teaches you to think like a Java programmer. If you want to be bored, buy some other book. But if you want to understand Java, this book''s for you.', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (2, N'Java: The Complete Reference, Ninth Edition 9th Edition', N'Oracle Press', 2011, N'9780071808552', 5, N'compref9th.jpg', N'Fully updated for Java SE 8, Java: The Complete Reference, Ninth Edition explains how to develop, compile, debug, and run Java programs. Bestselling programming author Herb Schildt covers the entire Java language, including its syntax, keywords, and fundamental programming principles, as well as significant portions of the Java API library. JavaBeans, servlets, applets, and Swing are examined and real-world examples demonstrate Java in action. New Java SE 8 features such as lambda expressions, the stream library, and the default interface method are discussed in detail. This Oracle Press resource also offers a solid introduction to JavaFX.', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (3, N'Code Complete', N'Steve McConnell', 1993, N'9780735619678', 2, N'Code_Complete_1st_edition.jpg', N'Code Complete is a software development book, written by Steve McConnell and published in 1993 by Microsoft Press, encouraging developers to continue past code-and-fix programming and the big design up front & waterfall models. It is also a compendium of software construction techniques, which include techniques from naming variables to deciding when to write a subroutine.', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (4, N'Sofware Quality Engineering', N'Jeff Tian', 2005, N'9780471713456', 3, N'SQE.jpg', N'The one resource needed to create reliable software

This text offers a comprehensive and integrated approach to software quality engineering. By following the author''s clear guidance, readers learn how to master the techniques to produce high-quality, reliable software, regardless of the software system''s level of complexity.
', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (5, N'Requirements Engineering: From System Goals to UML Models to Software Specifications', N'Axel van Lamsweerde', 2009, N'9780470012703', 3, N'RE.jpg', N'The book presents both the current state of the art in requirements engineering and a systematic method for engineering high-quality requirements, broken down into four parts.  The first part introduces fundamental concepts and principles including the aim and scope of requirements engineering, the products and processes involved, requirements qualities to aim at and flaws to avoid, and the critical role of requirements engineering in system and software engineering. ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (6, N'
Rapid Development: Taming Wild Software Schedules 1st Edition
', N'Steve McConnell', 1996, N'9781556159008', 1, N'RD.jpg', N'Corporate and commercial software-development teams all want solutions for one important problem—how to get their high-pressure development schedules under control. In RAPID DEVELOPMENT, author Steve McConnell addresses that concern head-on with overall strategies, specific best practices, and valuable tips that help shrink and control development schedules and keep projects moving', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (7, N'The Design of Everyday Things', N'Don Norman', 1988, N'9780465067107', 4, N'TDET.jpg', N'The Design of Everyday Things is a best-selling[1] book by cognitive scientist and usability engineer Donald Norman about how design serves as the communication between object and user, and how to optimize that conduit of communication in order to make the experience of using the object pleasurable. One of the main premises of the book is that although people are often keen to blame themselves when objects appear to malfunction, it is not the fault of the user but rather the lack of intuitive guidance that should be present in the design.', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (8, N'GUI Bloopers: Don''ts and Do''s for Software Developers and Web Designers ', N'Jeff Johnson', 2000, N'9781558605824', 1, N'GUI.jpg', N'GUI Bloopers looks at user interface design bloopers from commercial software, Web sites, and information appliances, explaining how intelligent, well-intentioned professionals made these dreadful mistakes--and how you can avoid them. While equipping you with all the theory needed to learn from these examples, GUI expert Jeff Johnson also presents the reality of interface design in an entertaining, anecdotal, and instructive way', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (9, N'Programming Pearls (2nd Edition)', N'Jon Bentley', 1999, N'9780201657883', 3, N'PP.jpg', N'Just as natural pearls grow from grains of sand that irritate oysters, programming pearls have grown from real problems that have irritated real programmers. With origins beyond solid engineering, in the realm of insight and creativity, Bentley''s pearls offer unique and clever solutions to those nagging problems. Illustrated by programs designed as much for fun as for instruction, the book is filled with lucid and witty descriptions of practical programming techniques and fundamental design principles. It is not at all surprising that Programming Pearls has been so highly valued by programmers at every level of experience. In this revision, the first in 14 years, Bentley has substantially updated his essays to reflect', NULL, NULL, NULL, NULL)
INSERT [dbo].[Title] ([SEQ], [Name], [Publisher], [PublishYear], [ISBN], [AvailableQuan], [Illu], [Description], [Author], [Views], [Rating], [ReturnType]) VALUES (10, N'Mastering Regular Expressions, 3rd Edition ', N' O''Reilly Media', 2009, N'9780596002893', 1, N'MRE.jpg', N'Regular expressions are an extremely powerful tool for manipulating text and data. They are now standard features in a wide range of languages and popular tools, including Perl, Python, Ruby, Java, VB.NET and C# (and any language using the .NET Framework), PHP, and MySQL.

If you don''t use regular expressions yet, you will discover in this book a whole new world of mastery over your data. If you already use them, you''ll appreciate this book''s unprecedented detail and breadth of coverage. If you think you know all you need to know about regular expressions, this book is a stunning eye-opener.', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Title] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__3214EC2618A340B4]    Script Date: 07/08/2017 9:47:59 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__3214EC267549EB93]    Script Date: 07/08/2017 9:47:59 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Book__3214EC26185C239B]    Script Date: 07/08/2017 9:47:59 PM ******/
ALTER TABLE [dbo].[Book] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Book__3214EC265D8B80DC]    Script Date: 07/08/2017 9:47:59 PM ******/
ALTER TABLE [dbo].[Book] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Fine_His__4DF639F168905D18]    Script Date: 07/08/2017 9:47:59 PM ******/
ALTER TABLE [dbo].[Fine_History] ADD UNIQUE NONCLUSTERED 
(
	[ASEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Fine_His__4DF639F196DD5AEC]    Script Date: 07/08/2017 9:47:59 PM ******/
ALTER TABLE [dbo].[Fine_History] ADD UNIQUE NONCLUSTERED 
(
	[ASEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_M_R] FOREIGN KEY([RID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_M_R]
GO
ALTER TABLE [dbo].[Activity_History]  WITH CHECK ADD  CONSTRAINT [FK_AH_B] FOREIGN KEY([BID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[Activity_History] CHECK CONSTRAINT [FK_AH_B]
GO
ALTER TABLE [dbo].[Activity_History]  WITH CHECK ADD  CONSTRAINT [FK_AH_M] FOREIGN KEY([MID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Activity_History] CHECK CONSTRAINT [FK_AH_M]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_B_BST] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Book_Status] ([StatusID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_B_BST]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_B_T] FOREIGN KEY([Title])
REFERENCES [dbo].[Title] ([SEQ])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_B_T]
GO
ALTER TABLE [dbo].[Book_Category_Detail]  WITH CHECK ADD  CONSTRAINT [FK_BCD_B] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([SEQ])
GO
ALTER TABLE [dbo].[Book_Category_Detail] CHECK CONSTRAINT [FK_BCD_B]
GO
ALTER TABLE [dbo].[Book_Category_Detail]  WITH CHECK ADD  CONSTRAINT [TK_C_B] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([SEQ])
GO
ALTER TABLE [dbo].[Book_Category_Detail] CHECK CONSTRAINT [TK_C_B]
GO
ALTER TABLE [dbo].[Favorite_List]  WITH CHECK ADD  CONSTRAINT [FK_FL_B] FOREIGN KEY([BID])
REFERENCES [dbo].[Book] ([SEQ])
GO
ALTER TABLE [dbo].[Favorite_List] CHECK CONSTRAINT [FK_FL_B]
GO
ALTER TABLE [dbo].[Favorite_List]  WITH CHECK ADD  CONSTRAINT [FK_FL_M] FOREIGN KEY([MID])
REFERENCES [dbo].[Account] ([SEQ])
GO
ALTER TABLE [dbo].[Favorite_List] CHECK CONSTRAINT [FK_FL_M]
GO
ALTER TABLE [dbo].[Fine_History]  WITH CHECK ADD  CONSTRAINT [FK_FH_FT] FOREIGN KEY([FineTypeID])
REFERENCES [dbo].[Fine_Type] ([FineTypeID])
GO
ALTER TABLE [dbo].[Fine_History] CHECK CONSTRAINT [FK_FH_FT]
GO
ALTER TABLE [dbo].[Fine_History]  WITH CHECK ADD  CONSTRAINT [FK_LR_AH] FOREIGN KEY([ASEQ])
REFERENCES [dbo].[Activity_History] ([SEQ])
GO
ALTER TABLE [dbo].[Fine_History] CHECK CONSTRAINT [FK_LR_AH]
GO
ALTER TABLE [dbo].[Title]  WITH CHECK ADD  CONSTRAINT [FK_Title_Return_Type] FOREIGN KEY([ReturnType])
REFERENCES [dbo].[Return_Type] ([SEQ])
GO
ALTER TABLE [dbo].[Title] CHECK CONSTRAINT [FK_Title_Return_Type]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD CHECK  (([Sex]='F' OR [Sex]='M' OR [Sex]='T' OR [Sex]='B' OR [Sex]='G' OR [Sex]='L'))
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD CHECK  (([Sex]='F' OR [Sex]='M' OR [Sex]='T' OR [Sex]='B' OR [Sex]='G' OR [Sex]='L'))
GO
USE [master]
GO
ALTER DATABASE [OnlineLibrary] SET  READ_WRITE 
GO
