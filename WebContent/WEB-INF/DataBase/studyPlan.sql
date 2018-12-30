USE [master]
GO
/****** Object:  Database [studyPlan]    Script Date: 2018-12-30 23:51:28 ******/
CREATE DATABASE [studyPlan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'studyPlan', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\studyPlan.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'studyPlan_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\studyPlan_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [studyPlan] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [studyPlan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [studyPlan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [studyPlan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [studyPlan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [studyPlan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [studyPlan] SET ARITHABORT OFF 
GO
ALTER DATABASE [studyPlan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [studyPlan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [studyPlan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [studyPlan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [studyPlan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [studyPlan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [studyPlan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [studyPlan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [studyPlan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [studyPlan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [studyPlan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [studyPlan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [studyPlan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [studyPlan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [studyPlan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [studyPlan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [studyPlan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [studyPlan] SET RECOVERY FULL 
GO
ALTER DATABASE [studyPlan] SET  MULTI_USER 
GO
ALTER DATABASE [studyPlan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [studyPlan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [studyPlan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [studyPlan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [studyPlan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'studyPlan', N'ON'
GO
USE [studyPlan]
GO
/****** Object:  Table [dbo].[entiretyAcceptanceRecord]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entiretyAcceptanceRecord](
	[acceptionNo] [int] IDENTITY(1,1) NOT NULL,
	[acceptionTime] [date] NULL,
	[score] [float] NULL,
	[comment] [nchar](50) NULL,
	[commentFile] [nchar](50) NULL,
	[planSelectionNo] [int] NOT NULL,
 CONSTRAINT [PK_entiretyAcceptanceRecord] PRIMARY KEY CLUSTERED 
(
	[acceptionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[planPublish]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[planPublish](
	[teacherNo] [varchar](15) NOT NULL,
	[planNo] [int] NOT NULL,
	[publishTime] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[planType]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[planType](
	[planTypeNo] [int] IDENTITY(1,1) NOT NULL,
	[planTypeName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stageAcceptanceRecord]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stageAcceptanceRecord](
	[stageCardNo] [int] IDENTITY(1,1) NOT NULL,
	[completionStatus] [nchar](10) NULL,
	[completionTime] [date] NULL,
	[planSelectionNo] [int] NULL,
 CONSTRAINT [PK_stageAcceptanceRecord] PRIMARY KEY CLUSTERED 
(
	[stageCardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[studentNo] [varchar](15) NOT NULL,
	[studentName] [varchar](20) NOT NULL,
	[studentPassword] [nchar](20) NOT NULL,
	[major] [varchar](50) NULL,
	[coin] [decimal](18, 0) NULL,
	[studentSex] [char](2) NULL,
	[headImage] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studentPlanSelection]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studentPlanSelection](
	[planSelectionNo] [int] IDENTITY(1,1) NOT NULL,
	[planNo] [int] NOT NULL,
	[studentNo] [varchar](15) NOT NULL,
	[selectionTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studyPlan]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studyPlan](
	[planNo] [int] IDENTITY(1,1) NOT NULL,
	[planTypeNo] [int] NULL,
	[planName] [varchar](50) NOT NULL,
	[coinNum] [float] NOT NULL,
	[planContext] [varchar](200) NOT NULL,
	[planInfoFile] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 2018-12-30 23:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teacher](
	[teacherNo] [varchar](15) NOT NULL,
	[teacherName] [varchar](20) NOT NULL,
	[teacherPassword] [nchar](20) NOT NULL,
	[teacherSex] [char](2) NULL,
	[title] [varchar](20) NULL,
	[ResearchDirection] [varchar](100) NULL,
	[headImage] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[student] ([studentNo], [studentName], [studentPassword], [major], [coin], [studentSex], [headImage]) VALUES (N'1663710324', N'唐惟阳', N'123456              ', N'计算机科学与技术', CAST(0 AS Decimal(18, 0)), N'男', N'1663710324.jpg')
INSERT [dbo].[student] ([studentNo], [studentName], [studentPassword], [major], [coin], [studentSex], [headImage]) VALUES (N'1605010203', N'刘妮', N'123456              ', N'材控', CAST(0 AS Decimal(18, 0)), N'女', N'1605010203.jpg')
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_PLANPUBLISH]    Script Date: 2018-12-30 23:51:28 ******/
ALTER TABLE [dbo].[planPublish] ADD  CONSTRAINT [PK_PLANPUBLISH] PRIMARY KEY NONCLUSTERED 
(
	[teacherNo] ASC,
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [planPublish_FK]    Script Date: 2018-12-30 23:51:28 ******/
CREATE NONCLUSTERED INDEX [planPublish_FK] ON [dbo].[planPublish]
(
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [planPublish2_FK]    Script Date: 2018-12-30 23:51:28 ******/
CREATE NONCLUSTERED INDEX [planPublish2_FK] ON [dbo].[planPublish]
(
	[teacherNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PLANTYPE]    Script Date: 2018-12-30 23:51:28 ******/
ALTER TABLE [dbo].[planType] ADD  CONSTRAINT [PK_PLANTYPE] PRIMARY KEY NONCLUSTERED 
(
	[planTypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_STUDENT]    Script Date: 2018-12-30 23:51:28 ******/
ALTER TABLE [dbo].[student] ADD  CONSTRAINT [PK_STUDENT] PRIMARY KEY NONCLUSTERED 
(
	[studentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_STUDENTPLANSELECTION]    Script Date: 2018-12-30 23:51:28 ******/
ALTER TABLE [dbo].[studentPlanSelection] ADD  CONSTRAINT [PK_STUDENTPLANSELECTION] PRIMARY KEY NONCLUSTERED 
(
	[planSelectionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [studentPlanSelection_FK]    Script Date: 2018-12-30 23:51:28 ******/
CREATE NONCLUSTERED INDEX [studentPlanSelection_FK] ON [dbo].[studentPlanSelection]
(
	[studentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [studentPlanSelection2_FK]    Script Date: 2018-12-30 23:51:28 ******/
CREATE NONCLUSTERED INDEX [studentPlanSelection2_FK] ON [dbo].[studentPlanSelection]
(
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_STUDYPLAN]    Script Date: 2018-12-30 23:51:28 ******/
ALTER TABLE [dbo].[studyPlan] ADD  CONSTRAINT [PK_STUDYPLAN] PRIMARY KEY NONCLUSTERED 
(
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [planTypeRelation_FK]    Script Date: 2018-12-30 23:51:28 ******/
CREATE NONCLUSTERED INDEX [planTypeRelation_FK] ON [dbo].[studyPlan]
(
	[planTypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_TEACHER]    Script Date: 2018-12-30 23:51:28 ******/
ALTER TABLE [dbo].[teacher] ADD  CONSTRAINT [PK_TEACHER] PRIMARY KEY NONCLUSTERED 
(
	[teacherNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[entiretyAcceptanceRecord]  WITH CHECK ADD  CONSTRAINT [FK_entiretyAcceptanceRecord_entiretyAcceptanceRecord] FOREIGN KEY([acceptionNo])
REFERENCES [dbo].[studentPlanSelection] ([planSelectionNo])
GO
ALTER TABLE [dbo].[entiretyAcceptanceRecord] CHECK CONSTRAINT [FK_entiretyAcceptanceRecord_entiretyAcceptanceRecord]
GO
ALTER TABLE [dbo].[planPublish]  WITH CHECK ADD  CONSTRAINT [FK_PLANPUBL_PLANPUBLI_STUDYPLA] FOREIGN KEY([planNo])
REFERENCES [dbo].[studyPlan] ([planNo])
GO
ALTER TABLE [dbo].[planPublish] CHECK CONSTRAINT [FK_PLANPUBL_PLANPUBLI_STUDYPLA]
GO
ALTER TABLE [dbo].[planPublish]  WITH CHECK ADD  CONSTRAINT [FK_PLANPUBL_PLANPUBLI_TEACHER] FOREIGN KEY([teacherNo])
REFERENCES [dbo].[teacher] ([teacherNo])
GO
ALTER TABLE [dbo].[planPublish] CHECK CONSTRAINT [FK_PLANPUBL_PLANPUBLI_TEACHER]
GO
ALTER TABLE [dbo].[stageAcceptanceRecord]  WITH CHECK ADD  CONSTRAINT [FK_stageAcceptanceRecord_stageAcceptanceRecord] FOREIGN KEY([planSelectionNo])
REFERENCES [dbo].[studentPlanSelection] ([planSelectionNo])
GO
ALTER TABLE [dbo].[stageAcceptanceRecord] CHECK CONSTRAINT [FK_stageAcceptanceRecord_stageAcceptanceRecord]
GO
ALTER TABLE [dbo].[studentPlanSelection]  WITH CHECK ADD  CONSTRAINT [FK_STUDENTP_STUDENTPL_STUDENT] FOREIGN KEY([studentNo])
REFERENCES [dbo].[student] ([studentNo])
GO
ALTER TABLE [dbo].[studentPlanSelection] CHECK CONSTRAINT [FK_STUDENTP_STUDENTPL_STUDENT]
GO
ALTER TABLE [dbo].[studentPlanSelection]  WITH CHECK ADD  CONSTRAINT [FK_STUDENTP_STUDENTPL_STUDYPLA] FOREIGN KEY([planNo])
REFERENCES [dbo].[studyPlan] ([planNo])
GO
ALTER TABLE [dbo].[studentPlanSelection] CHECK CONSTRAINT [FK_STUDENTP_STUDENTPL_STUDYPLA]
GO
ALTER TABLE [dbo].[studyPlan]  WITH CHECK ADD  CONSTRAINT [FK_STUDYPLA_PLANTYPER_PLANTYPE] FOREIGN KEY([planTypeNo])
REFERENCES [dbo].[planType] ([planTypeNo])
GO
ALTER TABLE [dbo].[studyPlan] CHECK CONSTRAINT [FK_STUDYPLA_PLANTYPER_PLANTYPE]
GO
USE [master]
GO
ALTER DATABASE [studyPlan] SET  READ_WRITE 
GO
