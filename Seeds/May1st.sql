USE [master]
GO
/****** Object:  Database [Toboggan]    Script Date: 5/1/2021 10:53:22 AM ******/
CREATE DATABASE [Toboggan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Toboggan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Toboggan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Toboggan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Toboggan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Toboggan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Toboggan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Toboggan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Toboggan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Toboggan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Toboggan] SET ARITHABORT OFF 
GO
ALTER DATABASE [Toboggan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Toboggan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Toboggan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Toboggan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Toboggan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Toboggan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Toboggan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Toboggan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Toboggan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Toboggan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Toboggan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Toboggan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Toboggan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Toboggan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Toboggan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Toboggan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Toboggan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Toboggan] SET RECOVERY FULL 
GO
ALTER DATABASE [Toboggan] SET  MULTI_USER 
GO
ALTER DATABASE [Toboggan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Toboggan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Toboggan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Toboggan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Toboggan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Toboggan', N'ON'
GO
ALTER DATABASE [Toboggan] SET QUERY_STORE = OFF
GO
USE [Toboggan]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteShop]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteShop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShopId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_FavoriteShop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalCost] [money] NOT NULL,
	[PaymentTypeId] [int] NULL,
	[SaleDate] [datetime] NOT NULL,
	[Completed] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLineItem]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLineItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderLineItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [bigint] NOT NULL,
	[TypeName] [int] NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](1000) NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProductImage] [varchar](70) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ShopImage] [varchar](70) NULL,
	[Description] [varchar](300) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/1/2021 10:53:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ImageUrl] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[TotalSales] [money] NULL,
	[FirebaseKey] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Computers')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Tools')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Industrial')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Baby')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Games')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Automotive')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (9, N'Shoes')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (10, N'Computers')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (11, N'Tools')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (12, N'Movies')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (13, N'Home')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (14, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (15, N'Automotive')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (16, N'Toys')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (17, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (18, N'Home')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (19, N'Industrial')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (20, N'Outdoors')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteShop] ON 

INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (1, 3, 12)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (2, 9, 20)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (3, 7, 3)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (4, 26, 9)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (5, 15, 14)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (6, 29, 18)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (7, 27, 18)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (8, 14, 16)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (9, 16, 19)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (10, 7, 16)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (11, 8, 16)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (12, 2, 5)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (13, 26, 12)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (14, 6, 11)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (15, 2, 2)
SET IDENTITY_INSERT [dbo].[FavoriteShop] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (1, 11, 12100.2200, 5, CAST(N'2021-02-27T01:22:34.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (2, 14, 6079.3200, 22, CAST(N'2021-02-24T00:24:19.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (3, 15, 24498.4400, 11, CAST(N'2020-11-01T07:20:09.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (4, 10, 33313.3900, 21, CAST(N'2020-10-22T11:25:15.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (5, 20, 7925.9700, 10, CAST(N'2020-10-30T04:27:55.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (6, 18, 15610.6100, 2, CAST(N'2020-04-29T02:53:41.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (7, 6, 2613.2200, 12, CAST(N'2020-10-08T09:53:20.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (8, 18, 11341.3600, 4, CAST(N'2020-07-26T08:17:03.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (9, 16, 24956.6000, 22, CAST(N'2021-04-18T16:25:55.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (10, 1, 30791.1100, 23, CAST(N'2020-05-06T11:21:36.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (11, 16, 13978.4800, 5, CAST(N'2020-12-20T21:41:36.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (12, 8, 37640.9400, 4, CAST(N'2020-07-13T06:54:45.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (13, 1, 21943.8100, 1, CAST(N'2021-03-07T19:51:34.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (14, 20, 17100.8900, 7, CAST(N'2020-08-18T19:42:43.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (15, 3, 12717.1100, 8, CAST(N'2020-06-08T15:45:23.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (16, 11, 1890.8100, 20, CAST(N'2020-09-16T17:30:22.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (17, 12, 37375.3200, 2, CAST(N'2020-08-12T04:22:40.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (18, 20, 28931.4300, 6, CAST(N'2021-01-06T00:21:25.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (19, 3, 28255.2100, 2, CAST(N'2020-09-17T16:55:50.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (20, 14, 15635.6900, 21, CAST(N'2020-12-07T10:43:54.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (21, 9, 38907.7600, 20, CAST(N'2021-03-24T20:30:58.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (22, 15, 12327.1800, 21, CAST(N'2020-12-18T18:48:48.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (23, 9, 17117.5600, 19, CAST(N'2020-06-23T13:44:48.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (24, 15, 22794.3900, 20, CAST(N'2020-08-02T19:54:12.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (25, 11, 34685.2000, 7, CAST(N'2020-06-27T05:46:20.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (26, 16, 15149.4800, 20, CAST(N'2020-11-02T19:15:14.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (27, 18, 39173.6100, 17, CAST(N'2020-05-19T02:05:11.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (28, 9, 21954.7100, 14, CAST(N'2021-02-04T12:20:08.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (29, 12, 28411.6600, 17, CAST(N'2020-12-03T10:06:35.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (30, 14, 2523.0600, 12, CAST(N'2020-08-30T08:56:48.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (31, 13, 15215.3800, 18, CAST(N'2020-07-13T22:07:39.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (32, 7, 429.8900, 10, CAST(N'2021-03-28T01:18:19.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (33, 16, 409.5600, 7, CAST(N'2021-01-10T19:27:30.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (34, 6, 11175.3100, 15, CAST(N'2020-06-06T16:16:21.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (35, 7, 3604.4100, 24, CAST(N'2021-01-16T01:54:31.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (36, 11, 4776.9900, 22, CAST(N'2021-03-24T20:52:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (37, 13, 19759.7600, 23, CAST(N'2021-04-13T00:10:34.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (38, 3, 30422.9300, 1, CAST(N'2021-04-03T13:03:44.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (39, 15, 38974.7900, 22, CAST(N'2021-01-26T20:44:03.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (40, 15, 11266.1900, 18, CAST(N'2020-12-25T00:48:43.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (41, 13, 881.4100, 23, CAST(N'2021-02-13T01:44:23.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (42, 12, 14298.3800, 24, CAST(N'2020-07-31T01:31:05.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (43, 15, 13385.3900, 4, CAST(N'2020-12-29T03:20:12.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (44, 7, 25689.6600, 13, CAST(N'2020-12-26T19:27:05.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (45, 13, 16602.9200, 20, CAST(N'2021-04-03T07:27:18.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (46, 14, 9964.0800, 19, CAST(N'2020-06-08T07:20:09.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (47, 9, 108.6300, 23, CAST(N'2021-04-04T22:18:09.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (48, 20, 19417.5300, 7, CAST(N'2021-04-10T16:27:36.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (49, 7, 37029.3900, 1, CAST(N'2021-01-18T04:53:36.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [Completed]) VALUES (50, 6, 5122.7300, 14, CAST(N'2021-04-06T21:03:35.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLineItem] ON 

INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (1, 47, 14, 11)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (2, 33, 19, 47)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (3, 43, 21, 27)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (4, 41, 24, 46)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (5, 23, 25, 16)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (6, 8, 21, 22)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (7, 21, 1, 30)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (8, 27, 33, 22)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (9, 29, 18, 9)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (10, 25, 87, 27)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (11, 34, 47, 2)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (12, 38, 24, 3)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (13, 24, 64, 28)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (14, 5, 14, 45)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (15, 30, 5, 15)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (16, 6, 58, 25)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (17, 1, 99, 20)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (18, 12, 12, 4)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (19, 14, 93, 18)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (20, 20, 33, 28)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (21, 8, 26, 48)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (22, 43, 71, 6)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (23, 32, 11, 25)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (24, 47, 77, 11)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (25, 9, 68, 13)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (26, 11, 98, 12)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (27, 25, 12, 43)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (28, 7, 74, 49)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (29, 49, 37, 35)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (30, 38, 14, 16)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (31, 46, 36, 43)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (32, 1, 91, 13)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (33, 43, 90, 4)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (34, 35, 9, 16)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (35, 39, 88, 11)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (36, 28, 79, 37)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (37, 7, 85, 35)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (38, 48, 17, 9)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (39, 16, 76, 43)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (40, 8, 36, 41)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (41, 28, 36, 6)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (42, 26, 12, 28)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (43, 29, 38, 34)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (44, 39, 77, 33)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (45, 26, 35, 38)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (46, 22, 66, 20)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (47, 10, 63, 25)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (48, 15, 62, 22)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (49, 46, 72, 17)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (50, 27, 69, 8)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (51, 19, 55, 14)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (52, 50, 21, 23)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (53, 34, 26, 7)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (54, 32, 87, 49)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (55, 17, 22, 21)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (56, 10, 34, 23)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (57, 3, 63, 43)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (58, 45, 94, 17)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (59, 1, 71, 37)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (60, 37, 11, 38)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (61, 49, 11, 46)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (62, 20, 49, 47)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (63, 32, 39, 46)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (64, 42, 70, 2)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (65, 22, 98, 36)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (66, 44, 99, 28)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (67, 50, 91, 17)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (68, 7, 87, 19)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (69, 26, 86, 20)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (70, 20, 94, 34)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (71, 28, 79, 48)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (72, 10, 5, 21)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (73, 49, 51, 35)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (74, 26, 92, 37)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (75, 16, 50, 39)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (76, 49, 79, 16)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (77, 27, 37, 7)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (78, 29, 45, 36)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (79, 3, 32, 30)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (80, 43, 9, 24)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (81, 49, 11, 26)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (82, 24, 47, 15)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (83, 34, 50, 23)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (84, 16, 33, 10)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (85, 31, 13, 8)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (86, 50, 17, 38)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (87, 26, 14, 16)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (88, 25, 96, 43)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (89, 3, 42, 14)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (90, 40, 65, 45)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (91, 6, 97, 49)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (92, 28, 4, 9)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (93, 11, 48, 44)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (94, 28, 18, 21)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (95, 2, 92, 12)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (96, 16, 66, 33)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (97, 19, 86, 46)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (98, 23, 70, 48)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (99, 20, 35, 25)
GO
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity], [OrderId]) VALUES (100, 10, 3, 44)
SET IDENTITY_INSERT [dbo].[OrderLineItem] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (1, 5108752693355592, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (2, 5108750586273245, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (3, 5108754793392509, 0)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (4, 5048374519225538, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (5, 5108754877425381, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (6, 5108752081771624, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (7, 5108755803824985, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (8, 5048379195608303, 3)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (9, 5048372222022416, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (10, 5048376856932576, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (11, 5048374748771872, 3)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (12, 5108757218906647, 3)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (13, 5048376155961466, 3)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (14, 5108756895692116, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (15, 5048374105561080, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (16, 5048370479189003, 0)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (17, 5108750465468536, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (18, 5048374661055089, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (19, 5108756448666476, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (20, 5108754797099688, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (21, 5108756022241100, 3)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (22, 5048375768609991, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (23, 5048376440417480, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (24, 5048375059786482, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (25, 5108755354279290, 3)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (1, N'Electronics', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 8579.7500, 347, 17, 1, CAST(N'2020-06-23T11:35:54.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (2, N'Jewelery', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 3202.9800, 112, 26, 19, CAST(N'2020-12-16T06:34:13.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (3, N'Games', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 9208.4600, 218, 13, 13, CAST(N'2021-01-30T18:30:12.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (4, N'Industrial', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 64.4100, 164, 4, 5, CAST(N'2020-11-09T16:19:48.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (5, N'Books', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 2324.0800, 385, 19, 6, CAST(N'2020-09-04T22:15:24.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (6, N'Books', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 6207.6100, 446, 19, 2, CAST(N'2021-01-21T17:58:04.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (7, N'Games', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 8273.4400, 119, 7, 11, CAST(N'2021-04-01T09:38:07.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (8, N'Home', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 867.9400, 197, 19, 9, CAST(N'2020-08-23T05:59:30.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (9, N'Books', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 4112.9900, 376, 19, 1, CAST(N'2021-01-06T08:44:20.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (10, N'Baby', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 6354.1100, 152, 23, 10, CAST(N'2020-10-12T15:07:54.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (11, N'Tools', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 9664.6100, 33, 10, 5, CAST(N'2020-07-16T22:25:38.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (12, N'Shoes', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 3852.5700, 276, 11, 12, CAST(N'2020-08-08T08:13:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (13, N'Sports', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1159.4200, 311, 11, 11, CAST(N'2020-10-26T20:51:51.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (14, N'Home', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 2755.7800, 68, 13, 3, CAST(N'2021-03-20T01:36:48.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (15, N'Books', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 3488.5500, 134, 17, 2, CAST(N'2021-01-11T12:00:14.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (16, N'Clothing', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 7766.3000, 27, 26, 17, CAST(N'2020-05-11T13:41:54.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (17, N'Kids', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 6021.5800, 150, 18, 12, CAST(N'2020-05-28T06:11:56.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (18, N'Baby', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 9800.2800, 191, 6, 11, CAST(N'2021-01-11T05:20:37.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (19, N'Outdoors', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 4216.4300, 373, 21, 2, CAST(N'2021-04-11T12:08:08.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (20, N'Clothing', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 9169.4200, 132, 24, 6, CAST(N'2021-01-25T14:24:25.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (21, N'Beauty', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 7761.2000, 114, 14, 1, CAST(N'2021-03-17T14:44:39.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (22, N'Industrial', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 422.0900, 135, 7, 16, CAST(N'2020-05-03T09:07:03.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (23, N'Books', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1102.8600, 415, 1, 18, CAST(N'2020-11-10T17:20:38.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (24, N'Computers', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 6251.5800, 105, 13, 2, CAST(N'2021-03-24T18:19:18.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (25, N'Home', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 8081.1400, 234, 21, 16, CAST(N'2020-11-22T10:37:11.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (26, N'Automotive', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 5677.9300, 271, 1, 17, CAST(N'2021-03-04T00:45:32.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (27, N'Automotive', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 4967.4600, 207, 10, 18, CAST(N'2021-03-22T13:01:30.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (28, N'Clothing', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 2463.2400, 88, 30, 6, CAST(N'2021-02-25T00:42:20.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (29, N'Clothing', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 7101.0200, 474, 27, 17, CAST(N'2020-09-25T05:05:55.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (30, N'Books', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 5981.4600, 324, 28, 12, CAST(N'2021-04-09T08:11:26.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (31, N'Toys', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1928.7700, 407, 24, 16, CAST(N'2020-06-17T09:41:40.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (32, N'Books', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 2675.2300, 457, 4, 10, CAST(N'2020-11-10T03:28:39.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (33, N'Health', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 3230.6500, 166, 6, 6, CAST(N'2020-06-19T20:19:04.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (34, N'Shoes', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 8611.4000, 477, 5, 6, CAST(N'2021-04-05T12:22:57.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (35, N'Health', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 504.8300, 66, 25, 9, CAST(N'2020-05-28T04:16:31.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (36, N'Garden', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 6572.0500, 476, 17, 13, CAST(N'2021-01-30T19:09:28.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (37, N'Clothing', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 3120.5400, 486, 12, 3, CAST(N'2021-03-21T08:08:38.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (38, N'Industrial', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 8577.3200, 77, 19, 19, CAST(N'2020-12-29T21:14:17.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (39, N'Home', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 8444.3800, 173, 29, 10, CAST(N'2020-12-13T20:10:40.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (40, N'Sports', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1195.5000, 157, 25, 2, CAST(N'2020-08-20T16:07:41.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (41, N'Kids', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5319.9300, 106, 27, 14, CAST(N'2021-03-07T01:40:33.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (42, N'Health', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 6984.8300, 399, 13, 11, CAST(N'2020-08-21T15:12:45.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (43, N'Toys', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 4059.8000, 91, 25, 14, CAST(N'2021-04-12T12:18:56.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (44, N'Garden', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 6667.8100, 456, 11, 19, CAST(N'2021-04-16T00:28:15.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (45, N'Home', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 7094.7100, 497, 15, 5, CAST(N'2020-08-07T20:43:41.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (46, N'Books', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 4372.6200, 47, 19, 4, CAST(N'2020-04-22T01:58:22.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (47, N'Outdoors', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 9722.4200, 130, 10, 9, CAST(N'2021-03-10T02:09:38.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (48, N'Home', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 4141.3300, 210, 10, 10, CAST(N'2020-06-05T18:47:09.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (49, N'Automotive', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 967.2800, 178, 8, 4, CAST(N'2020-07-07T00:21:07.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage]) VALUES (50, N'Garden', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 3593.2700, 456, 19, 17, CAST(N'2021-01-18T01:13:47.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (1, N'Voonix', 17, CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Art party artisan cliche swag salvia raw denim paleo neutra fingerstache craft beer taxidermy tbh master cleanse activated charcoal.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (2, N'Meetz', 18, CAST(N'2020-10-07T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Art party artisan cliche swag salvia raw denim paleo neutra fingerstache craft beer taxidermy tbh master cleanse activated charcoal.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (3, N'Flipopia', 18, CAST(N'2020-10-14T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Art party artisan cliche swag salvia raw denim paleo neutra fingerstache craft beer taxidermy tbh master cleanse activated charcoal.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (4, N'Dabtype', 20, CAST(N'2020-12-24T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', N'Migas flexitarian mustache 8-bit dreamcatcher craft beer hoodie listicle, gluten-free pabst fashion axe taiyaki food truck authentic. Enamel pin four dollar toast kogi, literally twee church-key succulents 90s mlkshk af copper mug subway tile selvage.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (5, N'Meevee', 17, CAST(N'2020-07-31T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Migas flexitarian mustache 8-bit dreamcatcher craft beer hoodie listicle, gluten-free pabst fashion axe taiyaki food truck authentic. Enamel pin four dollar toast kogi, literally twee church-key succulents 90s mlkshk af copper mug subway tile selvage.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (6, N'Roombo', 12, CAST(N'2021-03-09T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Migas flexitarian mustache 8-bit dreamcatcher craft beer hoodie listicle, gluten-free pabst fashion axe taiyaki food truck authentic. Enamel pin four dollar toast kogi, literally twee church-key succulents 90s mlkshk af copper mug subway tile selvage.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (7, N'Zoonoodle', 9, CAST(N'2020-05-04T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Migas flexitarian mustache 8-bit dreamcatcher craft beer hoodie listicle, gluten-free pabst fashion axe taiyaki food truck authentic. Enamel pin four dollar toast kogi, literally twee church-key succulents 90s mlkshk af copper mug subway tile selvage.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (8, N'Oyoloo', 10, CAST(N'2020-10-21T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Im baby affogato listicle +1 chia shoreditch food truck fingerstache lo-fi af YOLO. Brooklyn ramps shabby chic air plant forage, fashion axe pour thundercats cred meggings photo booth lumbersexual meditation yr.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (9, N'Midel', 11, CAST(N'2020-09-16T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Im baby affogato listicle +1 chia shoreditch food truck fingerstache lo-fi af YOLO. Brooklyn ramps shabby chic air plant forage, fashion axe pour thundercats cred meggings photo booth lumbersexual meditation yr.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (10, N'Janyx', 15, CAST(N'2020-12-09T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Im baby affogato listicle +1 chia shoreditch food truck fingerstache lo-fi af YOLO. Brooklyn ramps shabby chic air plant forage, fashion axe pour thundercats cred meggings photo booth lumbersexual meditation yr.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (11, N'Skyba', 12, CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Im baby affogato listicle +1 chia shoreditch food truck fingerstache lo-fi af YOLO. Brooklyn ramps shabby chic air plant forage, fashion axe pour thundercats cred meggings photo booth lumbersexual meditation yr.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (12, N'Jaxworks', 14, CAST(N'2021-03-19T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Jianbing tofu tbh helvetica chia wolf. Tilde tofu scenester tumblr, jean shorts four loko blue bottle bicycle rights mlkshk seitan actually health goth lyft.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (13, N'Fivechat', 12, CAST(N'2021-01-26T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', N'Jianbing tofu tbh helvetica chia wolf. Tilde tofu scenester tumblr, jean shorts four loko blue bottle bicycle rights mlkshk seitan actually health goth lyft.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (14, N'Babbleset', 11, CAST(N'2021-04-13T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Jianbing tofu tbh helvetica chia wolf. Tilde tofu scenester tumblr, jean shorts four loko blue bottle bicycle rights mlkshk seitan actually health goth lyft.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (15, N'Oyonder', 20, CAST(N'2021-01-21T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', N'Jianbing tofu tbh helvetica chia wolf. Tilde tofu scenester tumblr, jean shorts four loko blue bottle bicycle rights mlkshk seitan actually health goth lyft.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (16, N'Meembee', 10, CAST(N'2020-04-30T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Jianbing tofu tbh helvetica chia wolf. Tilde tofu scenester tumblr, jean shorts four loko blue bottle bicycle rights mlkshk seitan actually health goth lyft.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (17, N'Flipstorm', 18, CAST(N'2020-06-05T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Jianbing tofu tbh helvetica chia wolf. Tilde tofu scenester tumblr, jean shorts four loko blue bottle bicycle rights mlkshk seitan actually health goth lyft.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (18, N'Podcat', 8, CAST(N'2020-12-04T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Master cleanse truffaut cornhole PBR&B actually. XOXO 8-bit kitsch, biodiesel vaporware knausgaard austin craft beer wolf church-key aesthetic small batch lo-fi. ')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (19, N'Jabbercube', 14, CAST(N'2020-09-04T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', N'Master cleanse truffaut cornhole PBR&B actually. XOXO 8-bit kitsch, biodiesel vaporware knausgaard austin craft beer wolf church-key aesthetic small batch lo-fi. ')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (20, N'Buzzdog', 18, CAST(N'2020-06-06T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Master cleanse truffaut cornhole PBR&B actually. XOXO 8-bit kitsch, biodiesel vaporware knausgaard austin craft beer wolf church-key aesthetic small batch lo-fi. ')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (21, N'Aimbu', 1, CAST(N'2020-04-23T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Master cleanse truffaut cornhole PBR&B actually. XOXO 8-bit kitsch, biodiesel vaporware knausgaard austin craft beer wolf church-key aesthetic small batch lo-fi. ')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (22, N'Divanoodle', 10, CAST(N'2020-12-14T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Master cleanse truffaut cornhole PBR&B actually. XOXO 8-bit kitsch, biodiesel vaporware knausgaard austin craft beer wolf church-key aesthetic small batch lo-fi. ')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (23, N'Skyvu', 14, CAST(N'2021-02-04T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Master cleanse truffaut cornhole PBR&B actually. XOXO 8-bit kitsch, biodiesel vaporware knausgaard austin craft beer wolf church-key aesthetic small batch lo-fi. ')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (24, N'Eamia', 1, CAST(N'2020-04-22T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', N'Thundercats scenester plaid live-edge salvia waistcoat. Hexagon retro chia 90s kinfolk roof party schlitz artisan sriracha sustainable occupy. Scenester chartreuse squid flannel pinterest banh mi.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (25, N'Tambee', 2, CAST(N'2021-01-29T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Thundercats scenester plaid live-edge salvia waistcoat. Hexagon retro chia 90s kinfolk roof party schlitz artisan sriracha sustainable occupy. Scenester chartreuse squid flannel pinterest banh mi.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (26, N'Topicshots', 12, CAST(N'2021-03-25T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Thundercats scenester plaid live-edge salvia waistcoat. Hexagon retro chia 90s kinfolk roof party schlitz artisan sriracha sustainable occupy. Scenester chartreuse squid flannel pinterest banh mi.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (27, N'Centidel', 1, CAST(N'2020-06-11T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Thundercats scenester plaid live-edge salvia waistcoat. Hexagon retro chia 90s kinfolk roof party schlitz artisan sriracha sustainable occupy. Scenester chartreuse squid flannel pinterest banh mi.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (28, N'Flipbug', 3, CAST(N'2021-04-06T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/dddddd/000000', N'Thundercats scenester plaid live-edge salvia waistcoat. Hexagon retro chia 90s kinfolk roof party schlitz artisan sriracha sustainable occupy. Scenester chartreuse squid flannel pinterest banh mi.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (29, N'Topiclounge', 3, CAST(N'2020-10-26T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/ff4444/ffffff', N'Thundercats scenester plaid live-edge salvia waistcoat. Hexagon retro chia 90s kinfolk roof party schlitz artisan sriracha sustainable occupy. Scenester chartreuse squid flannel pinterest banh mi.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (30, N'Podcat', 7, CAST(N'2020-07-25T00:00:00.000' AS DateTime), N'http://dummyimage.com/250x250.png/cc0000/ffffff', N'Thundercats scenester plaid live-edge salvia waistcoat. Hexagon retro chia 90s kinfolk roof party schlitz artisan sriracha sustainable occupy. Scenester chartreuse squid flannel pinterest banh mi.')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (1, N'Velma', N'Pietroni', N'vpietroni0@latimes.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-07-24T23:49:07.000' AS DateTime), 280.5400, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (2, N'Gottfried', N'Boddie', N'gboddie1@dailymail.co.uk', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2021-02-13T06:33:22.000' AS DateTime), 584.6300, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (3, N'Darnell', N'Ramsden', N'dramsden2@myspace.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-05-04T04:15:26.000' AS DateTime), 771.2500, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (4, N'Tulley', N'Arnett', N'tarnett3@hostgator.com', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2021-02-15T22:46:51.000' AS DateTime), 778.5200, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (5, N'Randee', N'Dencs', N'rdencs4@europa.eu', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-11-01T07:30:51.000' AS DateTime), 914.5500, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (6, N'Katee', N'Denge', N'kdenge5@wikia.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-12-16T03:20:58.000' AS DateTime), 635.9000, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (7, N'Celesta', N'Crewther', N'ccrewther6@xrea.com', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2020-04-26T10:44:44.000' AS DateTime), 73.4500, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (8, N'Mickie', N'Shevelin', N'mshevelin7@issuu.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2021-03-31T21:52:36.000' AS DateTime), 539.6000, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (9, N'Malissia', N'Jickells', N'mjickells8@devhub.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-07-30T00:43:51.000' AS DateTime), 832.5000, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (10, N'Allsun', N'Lattos', N'alattos9@archive.org', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-07-26T04:51:20.000' AS DateTime), 48.0300, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (11, N'Bengt', N'Widmoor', N'bwidmoora@lycos.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-10-04T19:35:38.000' AS DateTime), 830.4600, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (12, N'Geoff', N'Mauchlen', N'gmauchlenb@shinystat.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2021-01-16T13:24:32.000' AS DateTime), 37.4500, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (13, N'Julia', N'O''Giany', N'jogianyc@blog.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-07-06T18:54:12.000' AS DateTime), 732.6500, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (14, N'Thomasin', N'Van der Krui', N'tvanderkruid@theglobeandmail.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-04-29T19:40:26.000' AS DateTime), 280.9900, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (15, N'Mable', N'Gotter', N'mgottere@telegraph.co.uk', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2020-07-24T08:59:49.000' AS DateTime), 260.7200, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (16, N'Michael', N'Archdeacon', N'marchdeaconf@zimbio.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-11-03T11:39:25.000' AS DateTime), 317.6600, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (17, N'Christine', N'Oakenford', N'coakenfordg@soundcloud.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-04-22T20:02:34.000' AS DateTime), 473.1400, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (18, N'Em', N'Cotta', N'ecottah@usda.gov', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-09-26T04:05:23.000' AS DateTime), 919.5600, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (19, N'Doralyn', N'Conrard', N'dconrardi@comsenz.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2021-01-12T02:02:53.000' AS DateTime), 561.7000, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales], [FirebaseKey]) VALUES (20, N'Hodge', N'Levitt', N'hlevittj@gizmodo.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2021-04-10T04:14:19.000' AS DateTime), 633.1100, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SaleDate]  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_TotalSales]  DEFAULT ((0)) FOR [TotalSales]
GO
ALTER TABLE [dbo].[FavoriteShop]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteShop_Shop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[FavoriteShop] CHECK CONSTRAINT [FK_FavoriteShop_Shop]
GO
ALTER TABLE [dbo].[FavoriteShop]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteShop_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FavoriteShop] CHECK CONSTRAINT [FK_FavoriteShop_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderLineItem_Order] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [FK_OrderLineItem_Order]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderLineItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [FK_OrderLineItem_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Shop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Shop]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_User]
GO
USE [master]
GO
ALTER DATABASE [Toboggan] SET  READ_WRITE 
GO
