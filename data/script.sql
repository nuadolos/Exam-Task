USE [master]
GO
CREATE DATABASE [Trade]
GO
USE [Trade]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[OrderCreateDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPointId] [int] NOT NULL,
	[OrderUserName] [nvarchar](150) NULL,
	[OrderCode] [int] NULL,
 CONSTRAINT [PK__Order__C3905BAF4DECF1CC] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderId] [int] NOT NULL,
	[ProductArticle] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticle] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[ProductManufacturerId] [int] NOT NULL,
	[ProductSupplierId] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [int] NULL,
	[ProductUnit] [nvarchar](50) NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductPhoto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD5FF080FFF] PRIMARY KEY CLUSTERED 
(
	[ProductArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30.06.2022 14:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (1, N'Aroma')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (2, N'Cube Color')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (3, N'Esteban')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (4, N'Gallery')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (5, N'Home Philosophy')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (6, N'Kersten')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (7, N'Miksdo')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (8, N'True Scents')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (9, N'Umbra')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (10, N'Valley')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (11, N'Весна')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (1, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-07T00:00:00.000' AS DateTime), 2, N'Архипова Оливия Дмитриевна', 111)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (2, 1, CAST(N'2022-05-02T00:00:00.000' AS DateTime), CAST(N'2022-05-08T00:00:00.000' AS DateTime), 8, NULL, 112)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (3, 1, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-09T00:00:00.000' AS DateTime), 10, NULL, 113)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (4, 2, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 12, NULL, 114)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (5, 1, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 15, NULL, 115)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (6, 1, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 18, N'Никонова Татьяна Захаровна', 116)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (7, 2, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 20, NULL, 117)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (8, 1, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 25, NULL, 118)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (9, 2, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 30, NULL, 119)
INSERT [dbo].[Order] ([OrderId], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserName], [OrderCode]) VALUES (10, 1, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 36, N'Рябова Диана Павловна', 120)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (1, N'F933T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (1, N'K478R4')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (2, N'D034T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (2, N'S563T4')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (3, N'D826T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (3, N'K083T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (4, N'B037T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (4, N'D832R2')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (5, N'D044T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (5, N'R922T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (6, N'F933T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (6, N'V783T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (7, N'H937R3')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (7, N'S039T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (8, N'F903T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (8, N'F937R4')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (9, N'D826T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (9, N'R836R5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (10, N'D044T5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticle]) VALUES (10, N'D832R2')
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (1, N'Новый ')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (1, N'344288, г. Ковров, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (2, N'614164, г.Ковров,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (3, N'394242, г. Ковров, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (4, N'660540, г. Ковров, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (5, N'125837, г. Ковров, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (6, N'125703, г. Ковров, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (7, N'625283, г. Ковров, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (8, N'614611, г. Ковров, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (9, N'454311, г.Ковров, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (10, N'660007, г.Ковров, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (11, N'603036, г. Ковров, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (12, N'450983, г.Ковров, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (13, N'394782, г. Ковров, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (14, N'603002, г. Ковров, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (15, N'450558, г. Ковров, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (16, N'394060, г.Ковров, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (17, N'410661, г. Ковров, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (18, N'625590, г. Ковров, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (19, N'625683, г. Ковров, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (20, N'400562, г. Ковров, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (21, N'614510, г. Ковров, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (22, N'410542, г. Ковров, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (23, N'620839, г. Ковров, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (24, N'443890, г. Ковров, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (25, N'603379, г. Ковров, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (26, N'603721, г. Ковров, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (27, N'410172, г. Ковров, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (28, N'420151, г. Ковров, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (29, N'125061, г. Ковров, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (30, N'630370, г. Ковров, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (31, N'614753, г. Ковров, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (32, N'426030, г. Ковров, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (33, N'450375, г. Ковров ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (34, N'625560, г. Ковров, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (35, N'630201, г. Ковров, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([Id], [Address]) VALUES (36, N'190949, г. Ковров, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'B025Y5', N'Блюдо', N'Блюдо декоративное flower 35 см Home Philosophy', 8, 5, 1, CAST(1890.0000 AS Decimal(19, 4)), 5, N'шт.', 8, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'B037T5', N'Блюдо', N'Блюдо декоративное Flower 35 см', 8, 5, 1, CAST(690.0000 AS Decimal(19, 4)), 5, N'шт.', 14, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'D034T5', N'Диффузор', N'Диффузор Mikado intense Апельсин с корицей', 1, 7, 2, CAST(800.0000 AS Decimal(19, 4)), 20, N'шт.', 15, N'D034T5.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'D044T5', N'Декор настенный', N'Декор настенный Фантазия 45х45х1 см', 8, 5, 1, CAST(1790.0000 AS Decimal(19, 4)), 5, N'шт.', 7, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'D826T5', N'Диффузор', N'Диффузор True Scents 45 мл манго', 1, 8, 2, CAST(600.0000 AS Decimal(19, 4)), 5, N'шт.', 13, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'D832R2', N'Растение', N'Декоративное растение 102 см', 8, 5, 1, CAST(1000.0000 AS Decimal(19, 4)), 10, N'шт.', 15, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'D947R5', N'Диффузор', N'Диффузор Aroma Harmony Lavender', 1, 1, 2, CAST(500.0000 AS Decimal(19, 4)), 5, N'шт.', 6, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'F837T5', N'Фоторамка', N'Шкатулка для украшений из дерева Stowit', 6, 4, 2, CAST(999.0000 AS Decimal(19, 4)), 5, N'шт.', 15, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'F903T5', N'Фоторамка', N'Фоторамка Gallery 20х30 см', 6, 4, 2, CAST(600.0000 AS Decimal(19, 4)), 15, N'шт.', 3, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'F928T5', N'Фоторамка', N'Фоторамка Prisma 10х10 см', 6, 9, 1, CAST(1590.0000 AS Decimal(19, 4)), 25, N'шт.', 13, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'F933T5', N'Кашпо', N'Настольное кашпо с автополивом Cube Color', 4, 2, 2, CAST(1400.0000 AS Decimal(19, 4)), 20, N'шт.', 23, N'F933T5.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'F937R4', N'Фоторамка', N'Фоторамка 10х15 см Gallery серый с патиной/золотой', 6, 4, 2, CAST(359.0000 AS Decimal(19, 4)), 15, N'шт.', 17, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'H023R8', N'Часы', N'Часы настенные Ribbon 30,5 см', 5, 9, 1, CAST(5600.0000 AS Decimal(19, 4)), 15, N'шт.', 6, N'H023R8.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'H937R3', N'Часы', N'Часы настенные 6500 30,2 см', 5, 9, 2, CAST(999.0000 AS Decimal(19, 4)), 10, N'шт.', 4, N'H937R3.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'K083T5', N'Аромат', N'Сменный аромат Figue noire 250 мл', 1, 3, 1, CAST(2790.0000 AS Decimal(19, 4)), 20, N'шт.', 6, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'K478R4', N'Аромат', N'Аромат для декобукета Esteban', 1, 3, 1, CAST(3500.0000 AS Decimal(19, 4)), 30, N'шт.', 4, N'K478R4.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'K937T4', N'Аромат', N'Деко-букет Кедр 250 мл', 1, 3, 1, CAST(7900.0000 AS Decimal(19, 4)), 25, N'шт.', 17, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'P846R4', N'Подставка', N'Подставка для цветочных горшков 55x25x35 см Valley', 4, 10, 1, CAST(1400.0000 AS Decimal(19, 4)), 15, N'шт.', 12, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'P927R2', N'Подставка', N'Подставка для цветочных горшков Valley', 4, 10, 1, CAST(4000.0000 AS Decimal(19, 4)), 15, N'шт.', 4, N'P927R2.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'P936E4', N'Подставка', N'Подставка для газет и журналов Zina', 4, 9, 1, CAST(3590.0000 AS Decimal(19, 4)), 15, N'шт.', 9, N'P936E4.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'R836R5', N'Шкатулка', N'Шкатулка для украшений из дерева Stowit', 7, 9, 1, CAST(8000.0000 AS Decimal(19, 4)), 30, N'шт.', 3, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'R922T5', N'Шкатулка', N'Шкатулка из керамики Lana 6х7 см', 7, 5, 1, CAST(690.0000 AS Decimal(19, 4)), 10, N'шт.', 4, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'S039T5', N'Свеча', N'Свеча True Moods Feel happy', 3, 8, 2, CAST(250.0000 AS Decimal(19, 4)), 10, N'шт.', 18, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'S563T4', N'Свеча', N'Свеча в стакане True Scents', 3, 8, 2, CAST(1000.0000 AS Decimal(19, 4)), 20, N'шт.', 12, N'S563T4.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'S936Y5', N'Свеча', N'Свеча в стакане True Scents', 1, 8, 2, CAST(299.0000 AS Decimal(19, 4)), 15, N'шт.', 4, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'S937T5', N'Подсвечник', N'Подсвечник 37 см', 1, 6, 1, CAST(2600.0000 AS Decimal(19, 4)), 10, N'шт.', 23, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'V432R6', N'Ваза', N'Ваза из фаянса 28,00 x 9,50 x 9,50 см', 2, 6, 1, CAST(1990.0000 AS Decimal(19, 4)), 10, N'шт.', 30, N'')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'V483R7', N'Ваза', N'Ваза «Весна» 18 см стекло, цвет прозрачный', 2, 11, 2, CAST(100.0000 AS Decimal(19, 4)), 15, N'шт.', 7, N'V483R7.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'V783T5', N'Ваза', N'Ваза из керамики Betty', 2, 5, 1, CAST(1300.0000 AS Decimal(19, 4)), 25, N'шт.', 13, N'V783T5.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductDescription], [ProductCategoryId], [ProductManufacturerId], [ProductSupplierId], [ProductCost], [ProductDiscountAmount], [ProductUnit], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'V937E4', N'Ваза', N'Ваза 18H2535S 30,5 см', 2, 6, 2, CAST(1999.0000 AS Decimal(19, 4)), 15, N'шт.', 21, N'')
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (1, N'Ароматы для дома')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (2, N'Вазы')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (3, N'Свечи')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (4, N'Горшки и подставки')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (5, N'Часы')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (6, N'Картины и фоторамки')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (7, N'Шкатулки и подставки')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (8, N'Интерьерные аксессуары')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'Стокманн')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'Hoff')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (1, N'Алексеев', N'Владислав', N'Аркадьевич', N'loginDEbct2018', N'Qg3gff', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (2, N'Савельева', N'Евфросиния', N'Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (3, N'Никонов', N'Мэлс', N'Лукьевич', N'loginDEuro2018', N'a1MIcO', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (4, N'Горшкова', N'Агафья', N'Онисимовна', N'loginDEpst2018', N'0CyGnX', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (5, N'Горбачёв', N'Пантелеймон', N'Германович', N'loginDEpsu2018', N'Vx9cQ{', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (6, N'Ершова', N'Иванна', N'Максимовна', N'loginDEzqs2018', N'qM9p7i', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (7, N'Туров', N'Денис', N'Геласьевич', N'loginDEioe2018', N'yMPu&2', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (8, N'Носова', N'Наина', N'Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (9, N'Куликов', N'Андрей', N'Святославович', N'loginDEfsp2018', N'&dtlI+', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (10, N'Нестеров', N'Агафон', N'Георгьевич', N'loginDExcd2018', N'SZXZNL', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (11, N'Козлов', N'Геласий', N'Христофорович', N'loginDEvlf2018', N'O5mXc2', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (12, N'Борисова', N'Анжелика', N'Анатольевна', N'loginDEanv2018', N'Xiq}M3', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (13, N'Суханов', N'Станислав', N'Фролович', N'loginDEzde2018', N'tlO3x&', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (14, N'Тетерина', N'Феврония', N'Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (15, N'Муравьёва', N'Александра', N'Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (16, N'Новикова', N'Лукия', N'Ярославовна', N'loginDEwjv2018', N'ZfseKA', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (17, N'Агафонова', N'Лариса', N'Михаиловна', N'loginDEiry2018', N'5zu7+}', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (18, N'Сергеева', N'Агата', N'Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (19, N'Колобова', N'Елена', N'Евгеньевна', N'loginDExxv2018', N'+daE|T', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (20, N'Ситников', N'Николай', N'Филатович', N'loginDEbto2018', N'b1iYMI', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (21, N'Белов', N'Роман', N'Иринеевич', N'loginDEfbs2018', N'v90Rep', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (22, N'Волкова', N'Алла', N'Лукьевна', N'loginDEple2018', N'WlW+l8', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (23, N'Кудрявцева', N'Таисия', N'Игоревна', N'loginDEhhx2018', N'hmCHeQ', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (24, N'Семёнова', N'Октябрина', N'Христофоровна', N'loginDEayn2018', N'Ka2Fok', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (25, N'Смирнов', N'Сергей', N'Яковович', N'loginDEwld2018', N'y9HStF', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (26, N'Брагина', N'Алина', N'Валерьевна', N'loginDEhuu2018', N'X31OEf', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (27, N'Евсеев', N'Игорь', N'Донатович', N'loginDEmjb2018', N'5mm{ch', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (28, N'Суворов', N'Илья', N'Евсеевич', N'loginDEdgp2018', N'1WfJjo', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (29, N'Котов', N'Денис', N'Мартынович', N'loginDEgyi2018', N'|7nYPc', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (30, N'Бобылёва', N'Юлия', N'Егоровна', N'loginDEmvn2018', N'Mrr9e0', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (31, N'Брагин', N'Бронислав', N'Георгьевич', N'loginDEfoj2018', N'nhGc+D', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (32, N'Александров', N'Владимир', N'Дамирович', N'loginDEuuo2018', N'42XmH1', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (33, N'Фокин', N'Ириней', N'Ростиславович', N'loginDEhsj2018', N's+jrMW', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (34, N'Воронов', N'Митрофан', N'Антонович', N'loginDEvht2018', N'zMyS8Z', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (35, N'Маслов', N'Мстислав', N'Антонинович', N'loginDEeqo2018', N'l5CBqA', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (36, N'Щербаков', N'Георгий', N'Богданович', N'loginDExrf2018', N'mhpRIT', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (37, N'Кириллова', N'Эмилия', N'Федосеевна', N'loginDEfku2018', N'a1m+8c', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (38, N'Васильев', N'Серапион', N'Макарович', N'loginDExix2018', N'hzxtnn', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (39, N'Галкина', N'Олимпиада', N'Владленовна', N'loginDEqrf2018', N'mI8n58', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (40, N'Яковлева', N'Ксения', N'Онисимовна', N'loginDEhlk2018', N'g0jSed', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (41, N'Калашникова', N'Александра', N'Владимировна', N'loginDEwoe2018', N'yOtw2F', 2)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (42, N'Медведьева', N'Таисия', N'Тихоновна', N'loginDExyu2018', N'7Fg}9p', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (43, N'Карпова', N'Ольга', N'Лукьевна', N'loginDEcor2018', N'2cIrC8', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (44, N'Герасимов', N'Мстислав', N'Дамирович', N'loginDEqon2018', N'YeFbh6', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (45, N'Тимофеева', N'Ксения', N'Валерьевна', N'loginDEyfd2018', N'8aKdb0', 1)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (46, N'Горбунов', N'Вячеслав', N'Станиславович', N'loginDEtto2018', N'qXYDuu', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (47, N'Кошелева', N'Кира', N'Владиславовна', N'loginDEdal2018', N'cJWXL0', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (48, N'Панфилова', N'Марина', N'Борисовна', N'loginDEbjs2018', N'Xap2ct', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (49, N'Кудрявцев', N'Матвей', N'Игоревич', N'loginDEdof2018', N'kD|LRU', 3)
INSERT [dbo].[User] ([UserId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (50, N'Зуев', N'Эдуард', N'Пантелеймонович', N'loginDEsnh2018', N't82ksa1', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPointId])
REFERENCES [dbo].[PickupPoint] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticle])
REFERENCES [dbo].[Product] ([ProductArticle])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturerId])
REFERENCES [dbo].[Manufacturer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([ProductSupplierId])
REFERENCES [dbo].[Supplier] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[Role] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
