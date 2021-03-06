USE [master]
GO
/****** Object:  Database [Toboggan]    Script Date: 5/18/2021 8:49:45 PM ******/
CREATE DATABASE [Toboggan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Toboggan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Toboggan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Toboggan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Toboggan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Toboggan] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [Toboggan] SET QUERY_STORE = OFF
GO
USE [Toboggan]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/18/2021 8:49:46 PM ******/
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
/****** Object:  Table [dbo].[FavoriteShop]    Script Date: 5/18/2021 8:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteShop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShopId] [int] NOT NULL,
	[UserId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FavoriteShop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/18/2021 8:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[OrderLineItem]    Script Date: 5/18/2021 8:49:46 PM ******/
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
/****** Object:  Table [dbo].[PaymentType]    Script Date: 5/18/2021 8:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [bigint] NOT NULL,
	[TypeName] [int] NOT NULL,
	[UserId] [varchar](50) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/18/2021 8:49:46 PM ******/
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
	[ProductImage] [varchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 5/18/2021 8:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ShopImage] [varchar](500) NULL,
	[Description] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/18/2021 8:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [varchar](50) NOT NULL,
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

INSERT [dbo].[Category] ([Id], [Name]) VALUES (21, N'Clothing')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (22, N'Home Goods')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (23, N'Sports Equipment')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (24, N'Games')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (25, N'Baked Goods')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (26, N'Books')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (27, N'Garden')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (33, N'Music Related')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (34, N'Other')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (35, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (36, N'Vintage Clothes')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (37, N'Toys')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (38, N'Video Games')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (67, N'Coogi Sweater', N'A notoriously fine knit sweater', 799.0000, 20, 47, 21, CAST(N'2021-05-15T13:18:15.287' AS DateTime), N'https://d2h1pu99sxkfvn.cloudfront.net/b0/3065369/428268998_5R8hCPLtuw/P0.jpg', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (68, N'Grandmas Classic', N'Just like grandma used to make!', 39.9900, 100, 47, 21, CAST(N'2021-05-15T13:20:10.033' AS DateTime), N'https://d2h1pu99sxkfvn.cloudfront.net/b0/7718733/359687276_d3lqi2ROIb/P0.jpg', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (69, N'The Ugly Christmas Sweater', N'The ever-loved and ever-hated ugly Christmas sweater', 19.9900, 100, 47, 21, CAST(N'2021-05-15T13:22:21.820' AS DateTime), N'https://cdn.shopify.com/s/files/1/0646/0969/products/Sweater8_1024x1024.jpg?v=1585179806', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (70, N'Flying Saucer', N'For long distance throws and fun at night!', 25.9900, 40, 49, 23, CAST(N'2021-05-15T13:34:23.597' AS DateTime), N'https://d195l1x11bm72a.cloudfront.net/wp-content/uploads/2019/02/FFD_Feature_00_l.jpg', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (71, N'The Fuse', N'A driver for long distance tosses', 19.9900, 150, 49, 23, CAST(N'2021-05-15T13:39:05.620' AS DateTime), N'https://cdn.ultiworld.com/wordpress/wp-content/uploads/2020/12/Fuse-300x300.jpg', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (72, N'XCaliber Distance Driver', N'The XCaliber is for those who have got to have the biggest and the baddest. Extremely fast with glide and stability. This is the one for confident bombs in windy conditions.', 12.0000, 80, 49, 23, CAST(N'2021-05-15T13:41:46.360' AS DateTime), N'https://www.innovadiscs.com/wp-content/uploads/2015/02/Champion-XCaliber.jpg', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (73, N'Cookies N'' Dreams | 12oz', N'Cookies N'' Dreams is our take on one of the most delicious varieties of ice cream to ever exist. Our fresh, 100% Arabica beans are roasted to a perfect medium and infused with chocolate cookie sandwich & vanilla ice cream flavor. It truly is the stuff of dreams. ', 14.9900, 50, 50, 22, CAST(N'2021-05-15T13:50:16.773' AS DateTime), N'https://cdn.shopify.com/s/files/1/1475/5488/products/CookiesNDreams-Front_1024x1024@2x.jpg?v=1559140524', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (74, N'Treeline Wool + Merlino Toboggan', N'Woven from 100% premium merino wool, and featuring an engraved cork ''leather'' tag, these beanies are unbelievably soft, temperature regulating and sweat wicking, perfect for all seasons!', 34.9900, 25, 50, 21, CAST(N'2021-05-15T13:52:27.430' AS DateTime), N'https://cdn.shopify.com/s/files/1/1483/7298/products/darkgreytreelinebeanie_1000x.png?v=1606273163', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (75, N'Cut And Sew Drawstring Hoodie', N'Drawstring hoodie for all-season comfort!', 44.9900, 20, 50, 21, CAST(N'2021-05-15T13:54:27.623' AS DateTime), N'https://img.ltwebstatic.com/images/pi/201712/97/15129755530792784235_thumbnail_900x.webp', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (76, N'Prince and the Revolution - Purple Rain ', N'Purple Rain is the sixth studio album from Prince, it is his first album to feature billing of his band, The Revolution. Purple Rain became Prince''s first album to reach number one on the Billboard 200.', 29.9900, 10, 51, 33, CAST(N'2021-05-15T14:00:37.100' AS DateTime), N'https://images.squarespace-cdn.com/content/v1/5b0487ff620b85272892562c/1584637138583-MAJSHNGWW4J11O4AMA4P/ke17ZwdGBToddI8pDm48kGdgmLuw-XVKBsPxTKrK9eVZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpymRON7hdkO25mYM03niNeWp3FnFQ0BuRl3GfKK3pwS6FxL4w2ZJo434qktQueZpAY/image-asset.jpeg?format=500w', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (77, N'Michel Jackson – Thriller ', N'Thriller is the best-selling album of all time, with sales of 66 million copies worldwide. Regarding the importance of Thriller, Rolling Stone wrote; "It''s hard to imagine the present-day musical landscape without Thriller, which changed the game both sonically and marketwise."', 34.9900, 25, 51, 33, CAST(N'2021-05-15T14:01:20.017' AS DateTime), N'https://images.squarespace-cdn.com/content/v1/5b0487ff620b85272892562c/1584546580179-8WFX8KO96PQV5PLL4RES/ke17ZwdGBToddI8pDm48kJUlZr2Ql5GtSKWrQpjur5t7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UfNdxJhjhuaNor070w_QAc94zjGLGXCa1tSmDVMXf8RUVhMJRmnnhuU1v2M8fLFyJw/712aTlKjhqL._SL1500_.jpg?format=500w', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (78, N'Billy Joel - Cold Spring Harbor ', N'A must have for any Long Islander and one of my all-time favorites to listen to growing up!  Cold Spring Harbor was named after a hamlet of the same name in the Town of Huntington, New York.  It is located on Long Island Sound near Joel''s hometown. The front  cover was photographed at Harbor Road in Cold Spring Harbor.', 32.9900, 40, 51, 33, CAST(N'2021-05-15T14:02:13.040' AS DateTime), N'https://images.squarespace-cdn.com/content/v1/5b0487ff620b85272892562c/1584546767383-8TDTBL735NVL24YBDQPC/ke17ZwdGBToddI8pDm48kJUlZr2Ql5GtSKWrQpjur5t7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UfNdxJhjhuaNor070w_QAc94zjGLGXCa1tSmDVMXf8RUVhMJRmnnhuU1v2M8fLFyJw/81chUczgsmL._SL1500_.jpg?format=500w', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (79, N'Pink Floyd - The Dark Side of the Moon ', N'The Dark Side of the Moon has sold more than 45 million units worldwide and spent 937 weeks on the Billboard 200 - more time than any other release in modern history. It is hailed by critics as one of the of the greatest albums of all time.', 34.9900, 40, 51, 33, CAST(N'2021-05-15T14:02:55.473' AS DateTime), N'https://images.squarespace-cdn.com/content/v1/5b0487ff620b85272892562c/1584546905809-98VVJ3M8XX8H0KOED4AK/ke17ZwdGBToddI8pDm48kP06O0_IHyRXSOOiqwgWaApZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVEsL0EX72Q6S7TgfQYQBQpkz5xM6Qt8VXd_xJGg_ziCFib8BodarTVrzIWCp72ioWw/Dark_Side_of_the_Moon.png?format=500w', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Price], [Quantity], [ShopId], [CategoryId], [CreatedDate], [ProductImage], [Active]) VALUES (80, N'The Beatles - Abbey Road', N'Abbey Road was the final Beatles album to be recorded (not released). The iconic album cover photo was taken on the zebra crossing near the entrance of Abbey Road Studios.', 29.9900, 35, 51, 33, CAST(N'2021-05-15T14:04:15.380' AS DateTime), N'https://images.squarespace-cdn.com/content/v1/5b0487ff620b85272892562c/1584548157945-M77XOOC2E712XZ2K26VP/ke17ZwdGBToddI8pDm48kPJXHKy2-mnvrsdpGQjlhod7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmihaE5rlzFBImxTetd_yW5btdZx37rH5fuWDtePBPDaHF5LxdCVHkNEqSYPsUQCdT/original_441.jpg?format=500w', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (47, N'SweaterPalooza', N'6I2eoDNOTIbSkPzwy1EXNjfuY4H3', CAST(N'2021-05-15T13:10:22.147' AS DateTime), N'https://www.campingiceland.com/wp-content/uploads/2019/01/lopapeysa-traditional-wool-sweater-shop.jpg', N'A place to fulfill all your wildest sweater dreams')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (49, N'Liz Biz', N'Qyx4FpLlY4VQr2TCdrrqKo2zh3A3', CAST(N'2021-05-15T13:32:31.023' AS DateTime), N'https://lh3.googleusercontent.com/proxy/dLVsztVpcQp1SjxTapdFglWX_JoNTbRIScsFn5Sk4SeKyBLskqmhWCel-SizvWeCdibNe0woqpSPRS2h-Fitggf0T3jTtm2ApvP3sKhcG_Svoo0_Hdl1kfTiJfHTf8AtULjn-0kAf3MlmolAV0LoTxVcu73W1xuNFQplr8ESiHr4ueHeJeIUkcvJW_Ho', N'Liz''s shop for a little bit of everything')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (50, N'Chris'' Corner', N'y9Yw73ytYYdmkagEn4uylVUxS642', CAST(N'2021-05-15T13:44:05.657' AS DateTime), N'https://cdn.hopculture.com/wp-content/uploads/2019/05/GRybus-Tandem-HighRes-1831-0937_1512x.jpg', N'A place for all your hoodies, coffee related items, and toboggan needs.')
INSERT [dbo].[Shop] ([Id], [Name], [UserId], [CreatedDate], [ShopImage], [Description]) VALUES (51, N'Will''s Records', N'oD45MjEHwgQ8leFtSzt54Z1xTns1', CAST(N'2021-05-15T13:57:48.557' AS DateTime), N'https://www.alisonsrecordshop.com/library/site/Digital_DFF_A-3426616_IMG-3377-1.jpgqgC47bintNsSuty3gjckG0s91nMGuZhp', N'For the Vinyl Collecting Aficionados')
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'1', N'Velma', N'Pietroni', N'vpietroni0@latimes.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-07-24T23:49:07.000' AS DateTime), 280.5400)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'10', N'Allsun', N'Lattos', N'alattos9@archive.org', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-07-26T04:51:20.000' AS DateTime), 48.0300)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'11', N'Bengt', N'Widmoor', N'bwidmoora@lycos.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-10-04T19:35:38.000' AS DateTime), 830.4600)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'12', N'Geoff', N'Mauchlen', N'gmauchlenb@shinystat.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2021-01-16T13:24:32.000' AS DateTime), 37.4500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'13', N'Julia', N'O''Giany', N'jogianyc@blog.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-07-06T18:54:12.000' AS DateTime), 732.6500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'14', N'Thomasin', N'Van der Krui', N'tvanderkruid@theglobeandmail.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-04-29T19:40:26.000' AS DateTime), 280.9900)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'15', N'Mable', N'Gotter', N'mgottere@telegraph.co.uk', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2020-07-24T08:59:49.000' AS DateTime), 260.7200)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'16', N'Michael', N'Archdeacon', N'marchdeaconf@zimbio.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-11-03T11:39:25.000' AS DateTime), 317.6600)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'17', N'Christine', N'Oakenford', N'coakenfordg@soundcloud.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2020-04-22T20:02:34.000' AS DateTime), 473.1400)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'18', N'Em', N'Cotta', N'ecottah@usda.gov', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-09-26T04:05:23.000' AS DateTime), 919.5600)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'19', N'Doralyn', N'Conrard', N'dconrardi@comsenz.com', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2021-01-12T02:02:53.000' AS DateTime), 561.7000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'2', N'Gottfried', N'Boddie', N'gboddie1@dailymail.co.uk', N'http://dummyimage.com/250x250.png/cc0000/ffffff', CAST(N'2021-02-13T06:33:22.000' AS DateTime), 584.6300)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'20', N'Hodge', N'Levitt', N'hlevittj@gizmodo.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2021-04-10T04:14:19.000' AS DateTime), 633.1100)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'3', N'Darnell', N'Ramsden', N'dramsden2@myspace.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-05-04T04:15:26.000' AS DateTime), 771.2500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'4', N'Tulley', N'Arnett', N'tarnett3@hostgator.com', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2021-02-15T22:46:51.000' AS DateTime), 778.5200)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'5', N'Randee', N'Dencs', N'rdencs4@europa.eu', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2020-11-01T07:30:51.000' AS DateTime), 914.5500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'6', N'Katee', N'Denge', N'kdenge5@wikia.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-12-16T03:20:58.000' AS DateTime), 635.9000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'6I2eoDNOTIbSkPzwy1EXNjfuY4H3', N'Chris', N'LoJacono', N'clojacono92@gmail.com', NULL, CAST(N'2021-05-03T19:11:02.740' AS DateTime), 0.0000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'7', N'Celesta', N'Crewther', N'ccrewther6@xrea.com', N'http://dummyimage.com/250x250.png/5fa2dd/ffffff', CAST(N'2020-04-26T10:44:44.000' AS DateTime), 73.4500)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'8', N'Mickie', N'Shevelin', N'mshevelin7@issuu.com', N'http://dummyimage.com/250x250.png/dddddd/000000', CAST(N'2021-03-31T21:52:36.000' AS DateTime), 539.6000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'9', N'Malissia', N'Jickells', N'mjickells8@devhub.com', N'http://dummyimage.com/250x250.png/ff4444/ffffff', CAST(N'2020-07-30T00:43:51.000' AS DateTime), 832.5000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'oD45MjEHwgQ8leFtSzt54Z1xTns1', N'Will', N'Kotheimer', N'wkotheimer@gmail.com
', N'', CAST(N'2021-05-15T13:32:20.590' AS DateTime), 0.0000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'Qyx4FpLlY4VQr2TCdrrqKo2zh3A3', N'Liz', N'Barnes', N'embarnes95@gmail.com
', N'', CAST(N'2021-05-15T13:30:03.663' AS DateTime), 0.0000)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [ImageUrl], [CreatedDate], [TotalSales]) VALUES (N'y9Yw73ytYYdmkagEn4uylVUxS642', N'Chris', N'Calhoun', N'ctcalhoun2@gmail.com
', N'', CAST(N'2021-05-15T13:31:36.897' AS DateTime), 0.0000)
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SaleDate]  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Active]  DEFAULT ((1)) FOR [Active]
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
ALTER TABLE [dbo].[PaymentType]  WITH CHECK ADD  CONSTRAINT [FK_PaymentType_PaymentType] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_PaymentType]
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
