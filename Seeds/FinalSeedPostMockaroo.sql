USE [master]
GO
/****** Object:  Database [Toboggan]    Script Date: 4/20/2021 6:49:46 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 4/20/2021 6:49:47 PM ******/
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
/****** Object:  Table [dbo].[FavoriteShop]    Script Date: 4/20/2021 6:49:47 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 4/20/2021 6:49:47 PM ******/
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
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLineItem]    Script Date: 4/20/2021 6:49:47 PM ******/
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
/****** Object:  Table [dbo].[PaymentType]    Script Date: 4/20/2021 6:49:47 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 4/20/2021 6:49:47 PM ******/
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 4/20/2021 6:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/20/2021 6:49:47 PM ******/
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

INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (1, 11, 12100.2200, 5, CAST(N'2021-02-27T01:22:34.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (2, 14, 6079.3200, 22, CAST(N'2021-02-24T00:24:19.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (3, 15, 24498.4400, 11, CAST(N'2020-11-01T07:20:09.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (4, 10, 33313.3900, 21, CAST(N'2020-10-22T11:25:15.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (5, 20, 7925.9700, 10, CAST(N'2020-10-30T04:27:55.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (6, 18, 15610.6100, 2, CAST(N'2020-04-29T02:53:41.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (7, 6, 2613.2200, 12, CAST(N'2020-10-08T09:53:20.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (8, 18, 11341.3600, 4, CAST(N'2020-07-26T08:17:03.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (9, 16, 24956.6000, 22, CAST(N'2021-04-18T16:25:55.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (10, 1, 30791.1100, 23, CAST(N'2020-05-06T11:21:36.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (11, 16, 13978.4800, 5, CAST(N'2020-12-20T21:41:36.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (12, 8, 37640.9400, 4, CAST(N'2020-07-13T06:54:45.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (13, 1, 21943.8100, 1, CAST(N'2021-03-07T19:51:34.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (14, 20, 17100.8900, 7, CAST(N'2020-08-18T19:42:43.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (15, 3, 12717.1100, 8, CAST(N'2020-06-08T15:45:23.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (16, 11, 1890.8100, 20, CAST(N'2020-09-16T17:30:22.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (17, 12, 37375.3200, 2, CAST(N'2020-08-12T04:22:40.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (18, 20, 28931.4300, 6, CAST(N'2021-01-06T00:21:25.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (19, 3, 28255.2100, 2, CAST(N'2020-09-17T16:55:50.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (20, 14, 15635.6900, 21, CAST(N'2020-12-07T10:43:54.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (21, 9, 38907.7600, 20, CAST(N'2021-03-24T20:30:58.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (22, 15, 12327.1800, 21, CAST(N'2020-12-18T18:48:48.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (23, 9, 17117.5600, 19, CAST(N'2020-06-23T13:44:48.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (24, 15, 22794.3900, 20, CAST(N'2020-08-02T19:54:12.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (25, 11, 34685.2000, 7, CAST(N'2020-06-27T05:46:20.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (26, 16, 15149.4800, 20, CAST(N'2020-11-02T19:15:14.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (27, 18, 39173.6100, 17, CAST(N'2020-05-19T02:05:11.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (28, 9, 21954.7100, 14, CAST(N'2021-02-04T12:20:08.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (29, 12, 28411.6600, 17, CAST(N'2020-12-03T10:06:35.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (30, 14, 2523.0600, 12, CAST(N'2020-08-30T08:56:48.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (31, 13, 15215.3800, 18, CAST(N'2020-07-13T22:07:39.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (32, 7, 429.8900, 10, CAST(N'2021-03-28T01:18:19.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (33, 16, 409.5600, 7, CAST(N'2021-01-10T19:27:30.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (34, 6, 11175.3100, 15, CAST(N'2020-06-06T16:16:21.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (35, 7, 3604.4100, 24, CAST(N'2021-01-16T01:54:31.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (36, 11, 4776.9900, 22, CAST(N'2021-03-24T20:52:00.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (37, 13, 19759.7600, 23, CAST(N'2021-04-13T00:10:34.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (38, 3, 30422.9300, 1, CAST(N'2021-04-03T13:03:44.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (39, 15, 38974.7900, 22, CAST(N'2021-01-26T20:44:03.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (40, 15, 11266.1900, 18, CAST(N'2020-12-25T00:48:43.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (41, 13, 881.4100, 23, CAST(N'2021-02-13T01:44:23.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (42, 12, 14298.3800, 24, CAST(N'2020-07-31T01:31:05.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (43, 15, 13385.3900, 4, CAST(N'2020-12-29T03:20:12.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (44, 7, 25689.6600, 13, CAST(N'2020-12-26T19:27:05.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (45, 13, 16602.9200, 20, CAST(N'2021-04-03T07:27:18.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (46, 14, 9964.0800, 19, CAST(N'2020-06-08T07:20:09.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (47, 9, 108.6300, 23, CAST(N'2021-04-04T22:18:09.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (48, 20, 19417.5300, 7, CAST(N'2021-04-10T16:27:36.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (49, 7, 37029.3900, 1, CAST(N'2021-01-18T04:53:36.000' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate]) VALUES (50, 6, 5122.7300, 14, CAST(N'2021-04-06T21:03:35.000' AS DateTime))
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

INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (1, N'Tools', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 5460.1800, 459, 25, 19, CAST(N'2020-11-02T22:40:31.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (2, N'Health', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 2068.3100, 202, 16, 4, CAST(N'2020-06-22T00:59:05.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (3, N'Home', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1295.7800, 434, 14, 4, CAST(N'2021-03-27T00:03:10.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (4, N'Shoes', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 787.4800, 7, 5, 3, CAST(N'2020-07-30T10:58:42.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (5, N'Garden', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 9729.5000, 495, 12, 9, CAST(N'2020-07-10T08:09:44.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (6, N'Music', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1344.9400, 359, 17, 2, CAST(N'2021-04-16T03:44:04.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (7, N'Movies', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 5626.7200, 219, 28, 6, CAST(N'2020-04-21T13:15:26.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (8, N'Sports', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 7554.4300, 233, 1, 6, CAST(N'2020-10-17T00:45:05.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (9, N'Automotive', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 75.9300, 316, 3, 20, CAST(N'2020-10-26T22:35:30.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (10, N'Industrial', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 701.8900, 244, 21, 10, CAST(N'2020-11-10T07:39:02.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (11, N'Toys', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 5207.4700, 256, 30, 19, CAST(N'2020-12-23T21:41:22.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (12, N'Toys', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 8332.2300, 419, 25, 1, CAST(N'2020-06-14T21:29:50.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (13, N'Shoes', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 4532.5300, 278, 8, 14, CAST(N'2020-10-08T23:29:58.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (14, N'Grocery', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 587.8100, 461, 15, 17, CAST(N'2020-10-16T06:59:29.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (15, N'Outdoors', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 5050.7000, 182, 2, 18, CAST(N'2021-04-14T23:15:47.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (16, N'Books', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 4601.5700, 110, 30, 15, CAST(N'2021-04-12T15:22:20.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (17, N'Books', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 7210.1300, 162, 28, 20, CAST(N'2020-10-20T21:48:22.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (18, N'Beauty', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 7850.0800, 227, 16, 18, CAST(N'2020-05-10T06:16:47.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (19, N'Jewelery', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 4557.7300, 393, 12, 4, CAST(N'2021-02-26T20:38:09.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (20, N'Sports', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 3296.9600, 268, 7, 1, CAST(N'2020-06-06T05:11:58.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (21, N'Electronics', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 2824.3200, 208, 20, 14, CAST(N'2020-07-23T11:27:53.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (22, N'Automotive', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1628.5800, 468, 30, 5, CAST(N'2020-07-07T12:26:32.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (23, N'Shoes', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2036.4300, 489, 9, 11, CAST(N'2020-07-14T15:17:04.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (24, N'Music', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 5006.9900, 308, 10, 11, CAST(N'2021-03-19T00:38:23.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (25, N'Kids', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 5.5900, 184, 12, 19, CAST(N'2021-02-17T05:02:12.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (26, N'Shoes', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 5627.2500, 188, 9, 8, CAST(N'2021-04-14T21:49:56.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (27, N'Computers', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 8880.1800, 455, 15, 19, CAST(N'2020-11-24T07:54:27.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (28, N'Garden', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 5363.5600, 52, 2, 17, CAST(N'2020-08-21T06:20:37.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (29, N'Electronics', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 8685.2000, 76, 29, 2, CAST(N'2020-05-06T09:25:55.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (30, N'Health', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4311.1300, 412, 8, 13, CAST(N'2020-11-06T20:35:07.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (31, N'Games', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 9619.7000, 46, 3, 17, CAST(N'2020-12-08T19:08:06.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (32, N'Grocery', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 8879.2000, 486, 21, 19, CAST(N'2020-11-08T14:56:14.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (33, N'Beauty', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 6731.4400, 170, 15, 12, CAST(N'2021-03-01T14:42:29.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (34, N'Jewelery', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 4923.0900, 116, 25, 5, CAST(N'2021-01-13T06:50:09.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (35, N'Toys', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 8639.4500, 137, 13, 14, CAST(N'2021-01-25T12:44:59.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (36, N'Kids', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 3165.4900, 392, 7, 3, CAST(N'2020-05-28T20:33:17.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (37, N'Beauty', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 3809.6800, 461, 14, 10, CAST(N'2021-01-04T08:26:35.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (38, N'Shoes', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1285.5300, 482, 2, 20, CAST(N'2021-03-08T06:38:49.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (39, N'Outdoors', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1130.7800, 452, 18, 2, CAST(N'2020-07-07T17:50:28.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (40, N'Jewelery', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 321.5000, 282, 20, 16, CAST(N'2020-05-14T02:09:57.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (41, N'Electronics', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 9234.2900, 171, 5, 11, CAST(N'2020-06-01T00:15:52.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (42, N'Automotive', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 2248.7900, 34, 23, 13, CAST(N'2020-10-17T23:46:59.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (43, N'Kids', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 5619.8500, 266, 17, 4, CAST(N'2020-10-17T13:07:08.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (44, N'Computers', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 806.8600, 301, 5, 6, CAST(N'2021-03-08T23:29:20.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (45, N'Clothing', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 9956.4200, 412, 20, 17, CAST(N'2020-11-09T22:44:26.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (46, N'Outdoors', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 3834.5200, 419, 28, 10, CAST(N'2020-06-13T07:34:37.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (47, N'Jewelery', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 7394.3100, 447, 23, 15, CAST(N'2020-07-06T10:00:18.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (48, N'Music', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 7492.4300, 355, 19, 9, CAST(N'2020-07-26T20:02:50.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (49, N'Clothing', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 258.1400, 346, 12, 15, CAST(N'2020-05-14T11:47:48.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (50, N'Computers', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1297.3100, 89, 4, 2, CAST(N'2020-11-08T13:32:31.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (1, N'Tagopia', 19, CAST(N'2020-06-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (2, N'Thoughtblab', 8, CAST(N'2020-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (3, N'Riffwire', 17, CAST(N'2020-10-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (4, N'Eabox', 14, CAST(N'2021-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (5, N'Riffwire', 6, CAST(N'2020-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (6, N'Yakijo', 3, CAST(N'2020-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (7, N'Mynte', 4, CAST(N'2020-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (8, N'Yamia', 2, CAST(N'2020-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (9, N'Dynabox', 7, CAST(N'2020-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (10, N'Skajo', 4, CAST(N'2020-06-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (11, N'Flashspan', 19, CAST(N'2020-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (12, N'Fliptune', 18, CAST(N'2020-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (13, N'Tagopia', 6, CAST(N'2020-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (14, N'Realfire', 20, CAST(N'2021-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (15, N'Brightbean', 17, CAST(N'2020-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (16, N'Realfire', 17, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (17, N'Kwimbee', 7, CAST(N'2020-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (18, N'Yoveo', 17, CAST(N'2021-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (19, N'Yadel', 3, CAST(N'2021-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (20, N'Ailane', 13, CAST(N'2020-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (21, N'Gigabox', 3, CAST(N'2020-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (22, N'Digitube', 10, CAST(N'2020-08-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (23, N'Yacero', 18, CAST(N'2021-03-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (24, N'Midel', 8, CAST(N'2020-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (25, N'Gigabox', 13, CAST(N'2020-05-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (26, N'Jabberstorm', 7, CAST(N'2020-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (27, N'Fadeo', 8, CAST(N'2020-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (28, N'Zoomcast', 13, CAST(N'2021-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (29, N'Latz', 2, CAST(N'2020-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (30, N'Katz', 6, CAST(N'2020-07-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (1, N'Velma', N'Pietroni', N'vpietroni0@latimes.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-07-24T23:49:07.000' AS DateTime), 280.5400)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (2, N'Gottfried', N'Boddie', N'gboddie1@dailymail.co.uk', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2021-02-13T06:33:22.000' AS DateTime), 584.6300)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (3, N'Darnell', N'Ramsden', N'dramsden2@myspace.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-05-04T04:15:26.000' AS DateTime), 771.2500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (4, N'Tulley', N'Arnett', N'tarnett3@hostgator.com', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2021-02-15T22:46:51.000' AS DateTime), 778.5200)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (5, N'Randee', N'Dencs', N'rdencs4@europa.eu', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-11-01T07:30:51.000' AS DateTime), 914.5500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (6, N'Katee', N'Denge', N'kdenge5@wikia.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-12-16T03:20:58.000' AS DateTime), 635.9000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (7, N'Celesta', N'Crewther', N'ccrewther6@xrea.com', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2020-04-26T10:44:44.000' AS DateTime), 73.4500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (8, N'Mickie', N'Shevelin', N'mshevelin7@issuu.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2021-03-31T21:52:36.000' AS DateTime), 539.6000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (9, N'Malissia', N'Jickells', N'mjickells8@devhub.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-07-30T00:43:51.000' AS DateTime), 832.5000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (10, N'Allsun', N'Lattos', N'alattos9@archive.org', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-07-26T04:51:20.000' AS DateTime), 48.0300)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (11, N'Bengt', N'Widmoor', N'bwidmoora@lycos.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-10-04T19:35:38.000' AS DateTime), 830.4600)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (12, N'Geoff', N'Mauchlen', N'gmauchlenb@shinystat.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2021-01-16T13:24:32.000' AS DateTime), 37.4500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (13, N'Julia', N'O''Giany', N'jogianyc@blog.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-07-06T18:54:12.000' AS DateTime), 732.6500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (14, N'Thomasin', N'Van der Krui', N'tvanderkruid@theglobeandmail.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-04-29T19:40:26.000' AS DateTime), 280.9900)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (15, N'Mable', N'Gotter', N'mgottere@telegraph.co.uk', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2020-07-24T08:59:49.000' AS DateTime), 260.7200)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (16, N'Michael', N'Archdeacon', N'marchdeaconf@zimbio.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-11-03T11:39:25.000' AS DateTime), 317.6600)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (17, N'Christine', N'Oakenford', N'coakenfordg@soundcloud.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-04-22T20:02:34.000' AS DateTime), 473.1400)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (18, N'Em', N'Cotta', N'ecottah@usda.gov', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-09-26T04:05:23.000' AS DateTime), 919.5600)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (19, N'Doralyn', N'Conrard', N'dconrardi@comsenz.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2021-01-12T02:02:53.000' AS DateTime), 561.7000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (20, N'Hodge', N'Levitt', N'hlevittj@gizmodo.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2021-04-10T04:14:19.000' AS DateTime), 633.1100)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SaleDate]  DEFAULT (getdate()) FOR [SaleDate]
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
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderLineItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
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
