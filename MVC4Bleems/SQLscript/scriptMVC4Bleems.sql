USE [master]
GO
/****** Object:  Database [MVC4Bleems]    Script Date: 7/28/2023 6:04:27 PM ******/
CREATE DATABASE [MVC4Bleems]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC4Bleems', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVC4Bleems.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVC4Bleems_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVC4Bleems_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVC4Bleems] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC4Bleems].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC4Bleems] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC4Bleems] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC4Bleems] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC4Bleems] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC4Bleems] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC4Bleems] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC4Bleems] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC4Bleems] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC4Bleems] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC4Bleems] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC4Bleems] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC4Bleems] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC4Bleems] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC4Bleems] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC4Bleems] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC4Bleems] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC4Bleems] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC4Bleems] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC4Bleems] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC4Bleems] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC4Bleems] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC4Bleems] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC4Bleems] SET RECOVERY FULL 
GO
ALTER DATABASE [MVC4Bleems] SET  MULTI_USER 
GO
ALTER DATABASE [MVC4Bleems] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC4Bleems] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC4Bleems] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC4Bleems] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVC4Bleems] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVC4Bleems] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVC4Bleems', N'ON'
GO
ALTER DATABASE [MVC4Bleems] SET QUERY_STORE = OFF
GO
USE [MVC4Bleems]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/28/2023 6:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/28/2023 6:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Currency] [nchar](10) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Image] [varbinary](max) NULL,
	[CategoryId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Products]    Script Date: 7/28/2023 6:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Products]
AS
SELECT dbo.Products.*, dbo.Categories.Name AS Expr2
FROM     dbo.Categories INNER JOIN
                  dbo.Products ON dbo.Categories.Id = dbo.Products.CategoryId
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Categ 1')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Categ 2')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (1, N'product 1', N'description of the product 1', 10, N'KD', CAST(N'2023-01-01T02:40:36.647' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (4, N'product 2', N'description of the product 2', 12, N'KWD', CAST(N'2023-02-01T13:25:21.763' AS DateTime), NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (5, N'product 3', N'description of the product 3', 14, N'KWD', CAST(N'2023-02-02T13:25:44.673' AS DateTime), NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (6, N'product 4', N'description of the product 4', 15, N'KWD', CAST(N'2023-07-27T13:26:03.177' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (7, N'product 5', N'description of the product 5', 16, N'KWD', CAST(N'2023-07-27T13:26:40.723' AS DateTime), NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (8, N'product 6', N'description of the product 6', 17, N'KWD', CAST(N'2023-07-27T13:26:56.153' AS DateTime), NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (9, N'product 7', N'description of the product 7', 18, N'KWD', CAST(N'2023-07-28T13:27:24.623' AS DateTime), NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Currency], [CreatedAt], [Image], [CategoryId]) VALUES (10, N'product 8', N'description of the product 8', 19, N'KWD', CAST(N'2023-07-28T13:27:43.680' AS DateTime), NULL, 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  StoredProcedure [dbo].[AddEditProduct]    Script Date: 7/28/2023 6:04:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AddEditProduct]
@Id int = null,
@Name nvarchar(50) = null,
@Description NVARCHAR(MAX) = NULL,
@Price INT = NULL,
@Currency nvarchar(10) = NULL,
@Image varbinary(max) = NULL,
@CategoryId int = null,
@Query INT /*declaration of variable */,
@fromdate datetime = null,
@todate datetime = null
as 
begin
if(@Query = 1) /*insert*/
begin
insert into Products(
Name,
Description,
Price,
Currency,
Image,
CategoryId
)
values (
@Name,
@Description,
@Price,
@Currency,
@Image,
@CategoryId
)
select 'Product inserted'
end
if(@Query = 2) /*update*/
begin
UPDATE Products 
set Name = @Name
,Description = @Description  
,Price = @Price  
,Currency = @Currency  
,Image = @Image,
CategoryId = @CategoryId
where Products.Id = @Id
select 'Product updated'
end

if(@Query = 3) /*delete*/
begin
delete from Products where Products.Id = @Id
select 'Product deleted'
end

if(@Query = 4) /*select*/
begin
select * from Products as tb1  left join Categories on tb1.CategoryId = Categories.Id where tb1.CreatedAt >= @fromdate and tb1.CreatedAt < @todate;
end

if(@Query = 5) /*random order select*/
begin
select * from Products as tb1  left join Categories on tb1.CategoryId = Categories.Id order by NEWID();
end

end 
GO
/****** Object:  StoredProcedure [dbo].[GetItemDetails]    Script Date: 7/28/2023 6:04:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetItemDetails]
@Id int = null
as 
begin
select * from Products as tb1  left join Categories on tb1.CategoryId = Categories.Id where tb1.Id = @Id;
end
GO
/****** Object:  StoredProcedure [dbo].[SPCategories]    Script Date: 7/28/2023 6:04:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SPCategories]
@Id int = null,
@Name nvarchar(50) = null,
@Query INT /*declaration of variable */
as 
begin
if(@Query = 1) /*insert*/
begin
insert into Categories(Name)
values (@Name)
select 'Category inserted'
end

if(@Query = 4) /*select all*/
begin
select * from Categories 
end
if(@Query = 5) /*get by id*/
begin 
select * from Categories
where Categories.Id = @Id
end
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Categories"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Products'
GO
USE [master]
GO
ALTER DATABASE [MVC4Bleems] SET  READ_WRITE 
GO
