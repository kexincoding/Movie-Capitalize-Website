USE [master]
GO
/****** Object:  Database [movie]    Script Date: 06/22/2016 10:50:13 ******/
CREATE DATABASE [movie] ON  PRIMARY 
( NAME = N'movie', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\movie.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'movie_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\movie_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [movie] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [movie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [movie] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [movie] SET ANSI_NULLS OFF
GO
ALTER DATABASE [movie] SET ANSI_PADDING OFF
GO
ALTER DATABASE [movie] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [movie] SET ARITHABORT OFF
GO
ALTER DATABASE [movie] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [movie] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [movie] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [movie] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [movie] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [movie] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [movie] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [movie] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [movie] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [movie] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [movie] SET  DISABLE_BROKER
GO
ALTER DATABASE [movie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [movie] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [movie] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [movie] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [movie] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [movie] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [movie] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [movie] SET  READ_WRITE
GO
ALTER DATABASE [movie] SET RECOVERY SIMPLE
GO
ALTER DATABASE [movie] SET  MULTI_USER
GO
ALTER DATABASE [movie] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [movie] SET DB_CHAINING OFF
GO
USE [movie]
GO
/****** Object:  User [movieadmin]    Script Date: 06/22/2016 10:50:13 ******/
CREATE USER [movieadmin] FOR LOGIN [movieadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[usertable]    Script Date: 06/22/2016 10:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertable](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](50) NOT NULL,
	[upwd] [nvarchar](50) NOT NULL,
	[uemail] [nvarchar](50) NOT NULL,
	[uvalue] [int] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 06/22/2016 10:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 06/22/2016 10:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[megid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[time] [datetime] NULL,
	[message] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED 
(
	[megid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location]    Script Date: 06/22/2016 10:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[lid] [int] IDENTITY(1,1) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 06/22/2016 10:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adminid] [int] IDENTITY(1,1) NOT NULL,
	[adname] [nvarchar](50) NOT NULL,
	[adpwd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[adminid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actor]    Script Date: 06/22/2016 10:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actor](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[aname] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](1) NOT NULL,
	[abirthday] [date] NULL,
	[alocation] [int] NULL,
	[introduction] [nvarchar](1000) NULL,
 CONSTRAINT [PK_actor] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie]    Script Date: 06/22/2016 10:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[mid] [int] IDENTITY(1,1) NOT NULL,
	[mname] [nvarchar](50) NOT NULL,
	[mtime] [date] NULL,
	[mlong] [int] NOT NULL,
	[mlocation] [int] NOT NULL,
	[director] [nvarchar](20) NULL,
	[introduct] [nvarchar](1000) NULL,
	[score] [float] NULL,
	[number] [int] NULL,
	[click] [int] NULL,
 CONSTRAINT [PK_movie] PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[updatescore]    Script Date: 06/22/2016 10:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updatescore]
	-- Add the parameters for the stored procedure here
	@username nvarchar(20),@score float , @mid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update movie 
    set score=((score*number+@score*(select uid from usertable where uname=@username))/((select uid from usertable where uname=@username)+number)),number=(select uvalue from usertable where uname=@username)+number where mid=@mid;
	
END
GO
/****** Object:  Table [dbo].[score]    Script Date: 06/22/2016 10:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[score](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[mid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_score] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movietype]    Script Date: 06/22/2016 10:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movietype](
	[mtid] [int] IDENTITY(1,1) NOT NULL,
	[mid] [int] NOT NULL,
	[tid] [int] NOT NULL,
 CONSTRAINT [PK_movie_type] PRIMARY KEY CLUSTERED 
(
	[mtid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 06/22/2016 10:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[mid] [int] NOT NULL,
	[ctime] [datetime] NULL,
	[comment] [nvarchar](1000) NOT NULL,
	[title] [nvarchar](50) NULL,
	[good] [int] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[act]    Script Date: 06/22/2016 10:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[act](
	[actid] [int] IDENTITY(1,1) NOT NULL,
	[mid] [int] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_act] PRIMARY KEY CLUSTERED 
(
	[actid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_user_uvalue]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[usertable] ADD  CONSTRAINT [DF_user_uvalue]  DEFAULT ((1)) FOR [uvalue]
GO
/****** Object:  Default [DF_message_time]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[message] ADD  CONSTRAINT [DF_message_time]  DEFAULT (getdate()) FOR [time]
GO
/****** Object:  Default [DF_actor_gender]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[actor] ADD  CONSTRAINT [DF_actor_gender]  DEFAULT (N'男') FOR [gender]
GO
/****** Object:  Default [DF_movie_score]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[movie] ADD  CONSTRAINT [DF_movie_score]  DEFAULT ((0)) FOR [score]
GO
/****** Object:  Default [DF_movie_number]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[movie] ADD  CONSTRAINT [DF_movie_number]  DEFAULT ((0)) FOR [number]
GO
/****** Object:  Default [DF_movie_click]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[movie] ADD  CONSTRAINT [DF_movie_click]  DEFAULT ((0)) FOR [click]
GO
/****** Object:  Default [DF_comment_ctime]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [DF_comment_ctime]  DEFAULT (getdate()) FOR [ctime]
GO
/****** Object:  Default [DF_comment_good]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [DF_comment_good]  DEFAULT ((0)) FOR [good]
GO
/****** Object:  Check [CK_usertable]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[usertable]  WITH CHECK ADD  CONSTRAINT [CK_usertable] CHECK  (([uvalue]>=(0)))
GO
ALTER TABLE [dbo].[usertable] CHECK CONSTRAINT [CK_usertable]
GO
/****** Object:  Check [CK_actor_gender]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[actor]  WITH CHECK ADD  CONSTRAINT [CK_actor_gender] CHECK  (([gender]='女' OR [gender]='男'))
GO
ALTER TABLE [dbo].[actor] CHECK CONSTRAINT [CK_actor_gender]
GO
/****** Object:  Check [CK_movie_number]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[movie]  WITH CHECK ADD  CONSTRAINT [CK_movie_number] CHECK  (([number]>=(0)))
GO
ALTER TABLE [dbo].[movie] CHECK CONSTRAINT [CK_movie_number]
GO
/****** Object:  Check [CK_movie_score]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[movie]  WITH CHECK ADD  CONSTRAINT [CK_movie_score] CHECK  (([score]>=(0)))
GO
ALTER TABLE [dbo].[movie] CHECK CONSTRAINT [CK_movie_score]
GO
/****** Object:  Check [CK_comment]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [CK_comment] CHECK  (([good]>=(0)))
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [CK_comment]
GO
/****** Object:  ForeignKey [FK_actor_l]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[actor]  WITH CHECK ADD  CONSTRAINT [FK_actor_l] FOREIGN KEY([alocation])
REFERENCES [dbo].[location] ([lid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actor] CHECK CONSTRAINT [FK_actor_l]
GO
/****** Object:  ForeignKey [FK_movie_l]    Script Date: 06/22/2016 10:50:15 ******/
ALTER TABLE [dbo].[movie]  WITH CHECK ADD  CONSTRAINT [FK_movie_l] FOREIGN KEY([mlocation])
REFERENCES [dbo].[location] ([lid])
GO
ALTER TABLE [dbo].[movie] CHECK CONSTRAINT [FK_movie_l]
GO
/****** Object:  ForeignKey [FK_score_m]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [FK_score_m] FOREIGN KEY([mid])
REFERENCES [dbo].[movie] ([mid])
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [FK_score_m]
GO
/****** Object:  ForeignKey [FK_score_u]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [FK_score_u] FOREIGN KEY([uid])
REFERENCES [dbo].[usertable] ([uid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [FK_score_u]
GO
/****** Object:  ForeignKey [FK_movie_type_m]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[movietype]  WITH CHECK ADD  CONSTRAINT [FK_movie_type_m] FOREIGN KEY([mid])
REFERENCES [dbo].[movie] ([mid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[movietype] CHECK CONSTRAINT [FK_movie_type_m]
GO
/****** Object:  ForeignKey [FK_movie_type_t]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[movietype]  WITH CHECK ADD  CONSTRAINT [FK_movie_type_t] FOREIGN KEY([tid])
REFERENCES [dbo].[type] ([tid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[movietype] CHECK CONSTRAINT [FK_movie_type_t]
GO
/****** Object:  ForeignKey [FK_comment_m]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_m] FOREIGN KEY([mid])
REFERENCES [dbo].[movie] ([mid])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_m]
GO
/****** Object:  ForeignKey [FK_comment_u]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_u] FOREIGN KEY([uid])
REFERENCES [dbo].[usertable] ([uid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_u]
GO
/****** Object:  ForeignKey [FK_act_actor]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[act]  WITH CHECK ADD  CONSTRAINT [FK_act_actor] FOREIGN KEY([aid])
REFERENCES [dbo].[actor] ([aid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[act] CHECK CONSTRAINT [FK_act_actor]
GO
/****** Object:  ForeignKey [FK_act_m]    Script Date: 06/22/2016 10:50:16 ******/
ALTER TABLE [dbo].[act]  WITH CHECK ADD  CONSTRAINT [FK_act_m] FOREIGN KEY([mid])
REFERENCES [dbo].[movie] ([mid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[act] CHECK CONSTRAINT [FK_act_m]
GO
