USE [master]
GO
/****** Object:  Database [test]    Script Date: 2019-01-08 16:43:46 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\test.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\test_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY FULL 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'test', N'ON'
GO
USE [test]
GO
/****** Object:  Table [dbo].[checkWork]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[checkWork](
	[CheckWorkNo] [int] IDENTITY(1,1) NOT NULL,
	[planNo] [int] NOT NULL,
	[studentNo] [varchar](15) NOT NULL,
	[checkWorkTime] [date] NOT NULL,
	[score] [decimal](18, 0) NULL,
	[studentFile] [nchar](50) NULL,
	[teacherFile] [nchar](50) NULL,
 CONSTRAINT [PK_CheckWork] PRIMARY KEY CLUSTERED 
(
	[CheckWorkNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[major]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[major](
	[majorId] [int] IDENTITY(1,1) NOT NULL,
	[major] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[planPublish]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[planPublish](
	[teacherNo] [varchar](15) NOT NULL,
	[planNo] [int] NOT NULL,
	[publishTime] [datetime] NULL,
 CONSTRAINT [PK_PLANPUBLISH] PRIMARY KEY NONCLUSTERED 
(
	[teacherNo] ASC,
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[planType]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[planType](
	[planTypeNo] [int] IDENTITY(1,1) NOT NULL,
	[planTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PLANTYPE] PRIMARY KEY NONCLUSTERED 
(
	[planTypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[punchCard]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[punchCard](
	[punchCardNo] [int] IDENTITY(1,1) NOT NULL,
	[planNo] [int] NOT NULL,
	[studentNo] [varchar](15) NOT NULL,
	[punchCardTime] [date] NOT NULL,
	[timeLength] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_punchCard] PRIMARY KEY CLUSTERED 
(
	[punchCardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 2019-01-08 16:43:47 ******/
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
	[headImage] [varchar](100) NULL,
 CONSTRAINT [PK_STUDENT] PRIMARY KEY NONCLUSTERED 
(
	[studentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studentPlanSelection]    Script Date: 2019-01-08 16:43:47 ******/
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
	[selectionTime] [date] NOT NULL,
 CONSTRAINT [PK_STUDENTPLANSELECTION] PRIMARY KEY NONCLUSTERED 
(
	[planSelectionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studyPlan]    Script Date: 2019-01-08 16:43:47 ******/
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
	[coinNum] [int] NOT NULL,
	[planContext] [varchar](200) NOT NULL,
	[planInfoFile] [varchar](50) NULL,
	[teacherNo] [nchar](20) NULL,
	[startTime] [date] NULL,
	[endTime] [date] NULL,
 CONSTRAINT [PK_STUDYPLAN] PRIMARY KEY NONCLUSTERED 
(
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 2019-01-08 16:43:47 ******/
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
	[headImage] [varchar](100) NULL,
 CONSTRAINT [PK_TEACHER] PRIMARY KEY NONCLUSTERED 
(
	[teacherNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[cardCondition]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cardCondition] as
select punchCard.studentNo,sum(timeLength)as cardNum,studentName,studyPlan.planName,punchCard.planNo
from punchCard,student,studyPlan
where punchCard.studentNo=student.studentNo and punchCard.planNo=studyPlan.planNo
group by punchCard.studentNo,studentName,punchCard.planNo,planName

GO
/****** Object:  View [dbo].[planScore]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[planScore] as
select checkWork.planNo,planName,checkWork.studentNo,studentName,score
from checkWork,studyPlan,student
where checkWork.planNo=studyPlan.planNo and student.studentNo=checkWork.studentNo

GO
/****** Object:  View [dbo].[studyPlanInfo]    Script Date: 2019-01-08 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  view [dbo].[studyPlanInfo] as
select planNo,planName,studyPlan.planTypeNo,planTypeName,planContext,planInfoFile,teacherName,coinNum,startTime,endTime
from studyPlan,planType,teacher
where studyPlan.teacherNo=teacher.teacherNo and studyPlan.planTypeNo=planType.planTypeNo

GO
/****** Object:  Index [planPublish_FK]    Script Date: 2019-01-08 16:43:47 ******/
CREATE NONCLUSTERED INDEX [planPublish_FK] ON [dbo].[planPublish]
(
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [planPublish2_FK]    Script Date: 2019-01-08 16:43:47 ******/
CREATE NONCLUSTERED INDEX [planPublish2_FK] ON [dbo].[planPublish]
(
	[teacherNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [studentPlanSelection_FK]    Script Date: 2019-01-08 16:43:47 ******/
CREATE NONCLUSTERED INDEX [studentPlanSelection_FK] ON [dbo].[studentPlanSelection]
(
	[studentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [studentPlanSelection2_FK]    Script Date: 2019-01-08 16:43:47 ******/
CREATE NONCLUSTERED INDEX [studentPlanSelection2_FK] ON [dbo].[studentPlanSelection]
(
	[planNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [planTypeRelation_FK]    Script Date: 2019-01-08 16:43:47 ******/
CREATE NONCLUSTERED INDEX [planTypeRelation_FK] ON [dbo].[studyPlan]
(
	[planTypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[checkWork]  WITH CHECK ADD  CONSTRAINT [FK_CheckWork_CheckWork] FOREIGN KEY([planNo])
REFERENCES [dbo].[studyPlan] ([planNo])
GO
ALTER TABLE [dbo].[checkWork] CHECK CONSTRAINT [FK_CheckWork_CheckWork]
GO
ALTER TABLE [dbo].[checkWork]  WITH CHECK ADD  CONSTRAINT [FK_CheckWork_student] FOREIGN KEY([studentNo])
REFERENCES [dbo].[student] ([studentNo])
GO
ALTER TABLE [dbo].[checkWork] CHECK CONSTRAINT [FK_CheckWork_student]
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
ALTER TABLE [dbo].[punchCard]  WITH CHECK ADD  CONSTRAINT [FK_punchCard_student] FOREIGN KEY([studentNo])
REFERENCES [dbo].[student] ([studentNo])
GO
ALTER TABLE [dbo].[punchCard] CHECK CONSTRAINT [FK_punchCard_student]
GO
ALTER TABLE [dbo].[punchCard]  WITH CHECK ADD  CONSTRAINT [FK_punchCard_studyPlan] FOREIGN KEY([planNo])
REFERENCES [dbo].[studyPlan] ([planNo])
GO
ALTER TABLE [dbo].[punchCard] CHECK CONSTRAINT [FK_punchCard_studyPlan]
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
ALTER DATABASE [test] SET  READ_WRITE 
GO
