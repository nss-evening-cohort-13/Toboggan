USE [master]
GO
/****** Object:  Database [Toboggan]    Script Date: 4/13/2021 9:17:37 PM ******/
CREATE DATABASE [Toboggan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Toboggan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Toboggan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Toboggan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Toboggan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Category]    Script Date: 4/13/2021 9:17:37 PM ******/
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
/****** Object:  Table [dbo].[FavoriteShop]    Script Date: 4/13/2021 9:17:37 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 4/13/2021 9:17:37 PM ******/
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
	[OrderLineItemId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLineItem]    Script Date: 4/13/2021 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLineItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderLineItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 4/13/2021 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [int] NOT NULL,
	[TypeName] [int] NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/13/2021 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[Shop]    Script Date: 4/13/2021 9:17:37 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/13/2021 9:17:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ImageUrl] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[TotalSales] [money] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Sports')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Books')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Quilts')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Bikes')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Roller Blades')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Clothing')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteShop] ON 

INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (1, 3, 3)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (3, 7, 7)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (4, 4, 8)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (5, 6, 8)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (6, 4, 9)
INSERT [dbo].[FavoriteShop] ([Id], [ShopId], [UserId]) VALUES (7, 8, 9)
SET IDENTITY_INSERT [dbo].[FavoriteShop] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [OrderLineItemId]) VALUES (2, 7, 50.0000, 3, CAST(N'2020-03-13T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [OrderLineItemId]) VALUES (3, 8, 50.0000, 3, CAST(N'2020-03-13T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [OrderLineItemId]) VALUES (4, 3, 50.0000, 3, CAST(N'2020-03-13T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [OrderLineItemId]) VALUES (5, 8, 50.0000, 6, CAST(N'2020-03-13T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Order] ([Id], [UserId], [TotalCost], [PaymentTypeId], [SaleDate], [OrderLineItemId]) VALUES (6, 8, 50.0000, 7, CAST(N'2020-03-13T00:00:00.000' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLineItem] ON 

INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity]) VALUES (2, 2, 10)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity]) VALUES (3, 3, 11)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity]) VALUES (4, 4, 1)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity]) VALUES (5, 5, 5)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity]) VALUES (6, 6, 17)
INSERT [dbo].[OrderLineItem] ([Id], [ProductId], [Quantity]) VALUES (7, 7, 33)
SET IDENTITY_INSERT [dbo].[OrderLineItem] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (2, 400000, 1)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (3, 5454333, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (4, 5454444, 2)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (5, 335534, 3)
INSERT [dbo].[PaymentType] ([Id], [AccountNumber], [TypeName]) VALUES (6, 99993399, 4)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (2, N'The Zoomer 5000', N'Amazing Frisbee Discs', 10.0000, 100, 5, 1, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (3, N'Huffy Bicycle', N'The perfect bike for any kid', 150.0000, 20, 4, 4, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (4, N'Hitchhikers Guide to the Galaxy', N'A great book about space', 10.0000, 100, 7, 2, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (5, N'Vertabrae Replacements', N'Literally bones for your back', 1000.0000, 10, 6, 1, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (6, N'Coogi Sweater', N'A Classic Sweater', 900.0000, 100, 3, 6, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate]) VALUES (7, N'Grandmas classic', N'A quilt your grandma would be proud of', 900.0000, 100, 8, 3, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (3, N'SweaterPalooza', 3, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (4, N'Garys Bicycles', 3, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (5, N'Slippin Discs', 7, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (6, N'Flippin Discs', 8, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (7, N'Universe Books', 9, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (8, N'Susans Quilts', 9, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate]) VALUES (9, N'Susans Quilts', 9, CAST(N'2020-03-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (3, N'Chris', N'LoJacono', N'clojacono92@gmail.com', N'testerImG', CAST(N'2020-03-31T00:00:00.000' AS DateTime), 2000.0000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (7, N'Chris', N'Calhoun', N'chrisCalhoun@gmail.com', N'testerImG', CAST(N'2020-03-31T00:00:00.000' AS DateTime), 2000.0000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (8, N'Liz', N'Barnes', N'chrisCalhoun@gmail.com', N'testerImG', CAST(N'2020-03-31T00:00:00.000' AS DateTime), 50000.0000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (9, N'Will', N'Kotheimer', N'wKotheimer@gmail.com', N'testerImG', CAST(N'2020-03-31T00:00:00.000' AS DateTime), 200000.0000)
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentType] FOREIGN KEY([OrderLineItemId])
REFERENCES [dbo].[OrderLineItem] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
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
