USE [master]
GO
/****** Object:  Database [SportStore]    Script Date: 01.11.2023 19:55:29 ******/
CREATE DATABASE [SportStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportStore', FILENAME = N'C:\Users\Admin\SportStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportStore_log', FILENAME = N'C:\Users\Admin\SportStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SportStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SportStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportStore] SET  MULTI_USER 
GO
ALTER DATABASE [SportStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SportStore] SET QUERY_STORE = OFF
GO
USE [SportStore]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01.11.2023 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderList] [nvarchar](max) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveryDate] [date] NOT NULL,
	[PickupPointId] [int] NOT NULL,
	[Client] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 01.11.2023 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 01.11.2023 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberPoint] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[NumberStreet] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01.11.2023 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleNumber] [nvarchar](100) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Unit] [nvarchar](max) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[MaxDiscount] [tinyint] NULL,
	[Manufacturer] [nvarchar](max) NOT NULL,
	[Supplier] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[DiscountAmount] [tinyint] NULL,
	[QuantityInStock] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Photo] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01.11.2023 19:55:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01.11.2023 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (1, N'A112T4, 2, G598Y6, 2', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 18, N'Поляков Степан Егорович', N'401', N'Новый')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (2, N'F75444, 3, D74DG, 3', CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, N'Леонова Алиса Кирилловна', N'402', N'Новый')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (3, N'D6548D, 10, FERER45, 10', CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 20, N'Яковлев Платон Константинович', N'403', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (4, N'F47748942, 1, E475782, 1', CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 22, N'Ковалева Ева Яковлевна', N'404', N'Новый')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (5, N'N547DSFG, 2, FDHFU32, 2', CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 22, N'', N'405', N'Новый')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (6, N'V48773, 1, FJHDHG45, 1', CAST(N'2022-05-20' AS Date), CAST(N'2022-05-26' AS Date), 16, N'', N'406', N'Новый')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (7, N'G648343, 3, R475743, 3', CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 16, N'', N'407', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (8, N'D09438, 1, FUSDFh, 1', CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 18, N'', N'408', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (9, N'DSDSFGYF4, 1, FGYDF43675, 1', CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 24, N'', N'409', N'Новый')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (10, N'FHDBH331, 5, YTFDY54, 5', CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 24, N'', N'410', N'Завершен')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (1, N'344288', N'г. Дубна', N'ул. Чехова', N'1')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (2, N'614164', N'г. Дубна', N'ул. Степная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (3, N'394242', N'г. Дубна', N' ул. Коммунистическая', N'43')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (4, N'660540', N'г. Дубна', N'ул. Солнечная', N'25')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (5, N'125837', N'г. Дубна', N'ул. Шоссейная', N'40')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (6, N'125703', N'г. Дубна', N'ул. Партизанская', N'49')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (7, N'625283', N'г. Дубна', N'ул. Победы', N'46')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (8, N'614611', N'г. Дубна', N'ул. Молодежная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (9, N'454311', N'г. Дубна', N'ул. Новая', N'19')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (10, N'660007', N'г. Дубна', N'ул. Октябрьская', N'19')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (11, N'603036', N'г. Дубна', N'ул. Садовая', N'4')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (12, N'450983', N'г. Дубна', N'ул. Комсомольская', N'26')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (13, N'394782', N'г. Дубна', N'ул. Чехова', N'3')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (14, N'603002', N'г. Дубна', N'ул. Дзержинского', N'28')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (15, N'450558', N'г. Дубна', N'ул. Набережная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (16, N'394060', N'г. Дубна', N'ул. Фрунзе', N'43')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (17, N'410661', N'г. Дубна', N'ул. Школьная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (18, N'625590', N'г. Дубна', N'ул. Коммунистическая', N'20')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (19, N'625683', N'г. Дубна', N'ул. 8 Марта', N'')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (20, N'400562', N'г. Дубна', N'ул. зеленая', N'32')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (21, N'614510', N'г. Дубна', N'ул. Маяковского', N'47')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo]) VALUES (1, N'A112T4', N'Боксерская груша', N'шт.', CAST(778.0000 AS Decimal(19, 4)), 30, N'X-Match', N'Спортмастер', N'Спортивный инвентарь', 5, 6, N'Боксерская груша X-match, черная', N'A34356.jpg')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [MaxDiscount], [Manufacturer], [Supplier], [Category], [DiscountAmount], [QuantityInStock], [Description], [Photo]) VALUES (2, N'G598Y6', N'Спортивный мат', N'шт.', CAST(2390.0000 AS Decimal(19, 4)), 15, N'Perfetto Sport', N'Декаталон', N'Спортивный инвентарь', 2, 16, N'Спортивный мат 100х100х10 см', N'Gry6743.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (66, N'Пахомова', N'Аиша', N'Анатольевна', N'm43523231fd@gmail.com', N'2LDISf4823', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (67, N'Жуков', N'Роман', N'Богданович', N'd4t67278rgy@gmail.com', N'Fuisddiksf', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (68, N'Киселева', N'Анастасия', N'Максимовна', N'hdsgf348i2hg4ro@gmail.com', N'DUSayftg631', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (69, N'Григорьевна', N'Арина', N'Арсентьевна', N'dsgujihgsgie@gmail.com', N'FHSHYGAFU7', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (70, N'Иванов', N'Лев', N'Михайлович', N'sjafhi93e80912@gmail.com', N'FHUSGAFHYU2', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (71, N'Григорьев', N'Лев', N'Давидович', N'fshgtuie4u2892h@gmail.com', N'njguDUJIKGD9', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (72, N'Поляков', N'Степан', N'Егорович', N'fjdsghori8993048@gmail.com', N'dgjndjgf54', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (73, N'Леонова', N'Алиса', N'Кирилловна', N'gfkdogfo90r384@gmail.com', N'gdjisoe94', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (74, N'Яковлев', N'Платнон', N'Константинович', N'fjhdwsifijew@gmail.com', N'gnfujgnfksd35', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (75, N'Ковалева', N'Ева', N'Яковалевна', N'dgsogiedopwo@gmail.com', N'dgusjighnd111', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tmp_ms_x__3C991142A2597DE5]    Script Date: 01.11.2023 19:55:30 ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[ArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD FOREIGN KEY([PickupPointId])
REFERENCES [dbo].[PickupPoint] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SportStore] SET  READ_WRITE 
GO
