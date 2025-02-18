USE [master]
GO
/****** Object:  Database [HanaShop]    Script Date: 1/18/2021 4:26:08 PM ******/
CREATE DATABASE [HanaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HanaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HanaShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HanaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HanaShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HanaShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HanaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HanaShop] SET RECOVERY FULL 
GO
ALTER DATABASE [HanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [HanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HanaShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HanaShop', N'ON'
GO
USE [HanaShop]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[Id] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [nvarchar](50) NULL,
	[Fullname] [nvarchar](max) NULL,
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAccountDetail]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountDetail](
	[AccountId] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NULL,
	[Dob] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblActionHistory]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActionHistory](
	[Fullname] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmotion]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmotion](
	[Emotion] [nvarchar](50) NULL,
	[AccountId] [int] NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrdersID] [nvarchar](50) NOT NULL,
	[AccountId] [int] NULL,
	[Total] [int] NULL,
	[DateOfCreate] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailID] [nvarchar](50) NOT NULL,
	[OrdersId] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Category] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[DateOfCreate] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubProduct]    Script Date: 1/18/2021 4:26:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubProduct](
	[ProductID] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([Id], [Username], [Password], [Role], [Fullname], [AccountId]) VALUES (N'159159159159159159159', N'Admin', N'123', N'ADMIN', N'Dang Quoc Thai', 1)
INSERT [dbo].[tblAccount] ([Id], [Username], [Password], [Role], [Fullname], [AccountId]) VALUES (N'951951951951951951951', N'lethicatim', N'123', N'USER', N'Lê Thị Người Dùng', 2)
INSERT [dbo].[tblAccount] ([Id], [Username], [Password], [Role], [Fullname], [AccountId]) VALUES (N'114892871462552512463', N'', N'', N'USER', N'Lê Thị Người Dùng 2', 10)
INSERT [dbo].[tblAccount] ([Id], [Username], [Password], [Role], [Fullname], [AccountId]) VALUES (N'432676543567', N'lethicana', N'123', N'USER', N'Lê Thị Người Dùng 3', 11)
INSERT [dbo].[tblAccount] ([Id], [Username], [Password], [Role], [Fullname], [AccountId]) VALUES (N'3245678432', N'lethicaphao', N'123', N'USER', N'Lê Thị Người Dùng 4', 12)
INSERT [dbo].[tblAccount] ([Id], [Username], [Password], [Role], [Fullname], [AccountId]) VALUES (N'198615328', N'thethichuoi', N'123', N'USER', N'Lê Thị Người Dùng 5', 13)
INSERT [dbo].[tblAccount] ([Id], [Username], [Password], [Role], [Fullname], [AccountId]) VALUES (N'109333442468551641266', N'', N'', N'USER', N'Thái Đặng', 14)
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
INSERT [dbo].[tblAccountDetail] ([AccountId], [Email], [Address], [Phone], [Dob]) VALUES (1, N'dangquocthai07061998@gmail.com', N'Bến Tre', N'0948848484', N'07-06-1998')
INSERT [dbo].[tblAccountDetail] ([AccountId], [Email], [Address], [Phone], [Dob]) VALUES (2, N'nguoidung@gmail.com', N'ben tre', N'123456789', N'07-06-1998')
INSERT [dbo].[tblAccountDetail] ([AccountId], [Email], [Address], [Phone], [Dob]) VALUES (10, N'dsa', N'ád', N'ád', N'ád')
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:27', 158)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:29', 157)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:30', 155)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Delete', N'12-01-2021', 122)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Delete', N'12-01-2021', 122)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Delete', N'13-01-2021', 136)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Delete', N'13-01-2021', 136)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Update', N'13-01-2021', 142)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Update', N'13-01-2021', 142)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Update', N'13-01-2021 51:22:06', 143)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Update', N'13-01-2021 06:23:40', 143)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'thaidq.dto.AccountDTO@39593132', N'Update', N'14-01-2021 12:02:37', 156)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'thaidq.dto.AccountDTO@39593132', N'Update', N'14-01-2021 12:03:08', 156)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'14-01-2021 19:50:58', 156)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Update', N'15-01-2021 14:54:18', 158)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:31', 154)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:32', 153)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:33', 152)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:35', 151)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:37', 150)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:38', 149)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:40', 148)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:41', 147)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:43', 146)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:46', 145)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:48', 144)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:50', 143)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:51', 142)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:53', 141)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:55', 140)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:57', 135)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:15:59', 133)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:01', 132)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:02', 131)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:04', 130)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:06', 129)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:07', 128)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:09', 124)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:10', 127)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:12', 126)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:13', 125)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 01:16:15', 117)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 15:21:27', 182)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Delete', N'12-01-2021', 123)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Delete', N'12-01-2021', 118)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'ThÃ¡i Äáº·ng Quá»c', N'Delete', N'13-01-2021', 134)
INSERT [dbo].[tblActionHistory] ([Fullname], [Action], [Date], [ProductID]) VALUES (N'Dang Quoc Thai', N'Delete', N'18-01-2021 15:21:30', 181)
INSERT [dbo].[tblEmotion] ([Emotion], [AccountId], [ProductID]) VALUES (N'Like', 2, 157)
INSERT [dbo].[tblEmotion] ([Emotion], [AccountId], [ProductID]) VALUES (N'Like', 2, 130)
INSERT [dbo].[tblEmotion] ([Emotion], [AccountId], [ProductID]) VALUES (N'Dislike', 2, 158)
INSERT [dbo].[tblEmotion] ([Emotion], [AccountId], [ProductID]) VALUES (N'Like', 2, 175)
INSERT [dbo].[tblEmotion] ([Emotion], [AccountId], [ProductID]) VALUES (N'Dislike', 12, 132)
INSERT [dbo].[tblOrder] ([OrdersID], [AccountId], [Total], [DateOfCreate], [Status]) VALUES (N'OD-Lê Thị Người Dùng 2-1', 10, 200, N'18-01-2021 03:09:12', N'waiting')
INSERT [dbo].[tblOrder] ([OrdersID], [AccountId], [Total], [DateOfCreate], [Status]) VALUES (N'OD-Lê Thị Người Dùng-1', 2, 360, N'18-01-2021 02:50:51', N'waiting')
INSERT [dbo].[tblOrder] ([OrdersID], [AccountId], [Total], [DateOfCreate], [Status]) VALUES (N'OD-Lê Thị Người Dùng-2', 2, 200, N'18-01-2021 03:06:47', N'waiting')
INSERT [dbo].[tblOrder] ([OrdersID], [AccountId], [Total], [DateOfCreate], [Status]) VALUES (N'OD-Lê Thị Người Dùng-3', 2, 215, N'18-01-2021 03:22:33', N'waiting')
INSERT [dbo].[tblOrder] ([OrdersID], [AccountId], [Total], [DateOfCreate], [Status]) VALUES (N'OD-Lê Thị Người Dùng-4', 2, 94, N'18-01-2021 03:35:59', N'waiting')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng 2-1-1', N'OD-Lê Thị Người Dùng 2-1', N'1', 179, N'Coffee')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-1-1', N'OD-Lê Thị Người Dùng-1', N'1', 180, N'Wine')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-1-2', N'OD-Lê Thị Người Dùng-1', N'1', 174, N'Parma ham')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-1-3', N'OD-Lê Thị Người Dùng-1', N'1', 175, N'summer roll')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-2-1', N'OD-Lê Thị Người Dùng-2', N'1', 179, N'Coffee')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-3-1', N'OD-Lê Thị Người Dùng-3', N'1', 179, N'Coffee')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-3-2', N'OD-Lê Thị Người Dùng-3', N'1', 180, N'Wine')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-4-1', N'OD-Lê Thị Người Dùng-4', N'1', 179, N'Coffee')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-4-2', N'OD-Lê Thị Người Dùng-4', N'2', 180, N'Wine')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-4-3', N'OD-Lê Thị Người Dùng-4', N'1', 161, N'Buttered popcorn')
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrdersId], [Quantity], [ProductID], [ProductName]) VALUES (N'OD-Lê Thị Người Dùng-4-4', N'OD-Lê Thị Người Dùng-4', N'1', 173, N'Fish ''n'' chips')
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (117, N'Hamberger', N'150', N'Đây là một cái hamberger to bự', N'Food', N'10', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\908160.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (118, N'Pizza', N'25', N'Đây là một cái pizza to bự', N'Food', N'124', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\1074058.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (119, N'Pizza', N'25', N'Đây là một cái pizza to bự', N'Food', N'124', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\1074058.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (120, N'Pizza', N'25', N'Đây là một cái pizza to bự', N'Food', N'124', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\1074058.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (121, N'Pizza', N'25', N'Đây là một cái pizza to bự', N'Food', N'124', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\1074058.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (122, N'Hamberger', N'12', N'Pizza ngon nhất vũ trụ', N'Food', N'12', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\908160.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (123, N'Hamberger', N'15', N'Đây là một cái hamberger to bự', N'Food', N'12', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\908160.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (124, N'Panda', N'12', N'ÄÃ¢y lÃ  má»t con panda
', N'Food', N'12', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\d456d52552149c0ae674b7dfc73af458.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (125, N'okala', N'12', N'okla', N'Drink', N'12', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (126, N'Chuẩn', N'12', N'12', N'Food', N'12', N'12-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136486813_488370995479181_7083688254475501625_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (127, N'Giàu như chó', N'15', N'Đây là một con chó giàu', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136385547_393177625313521_4212138893777656522_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (128, N'Dữ như chó', N'15', N'Đây là một con chó dữ', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136476791_393177558646861_359670051684705099_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (129, N'Ngu như chó', N'15', N'Đây là một con chó ngu =))', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136682230_393177518646865_9161442013586093063_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (130, N'Nhây như chó', N'15', N'Đây là một con chó nhây', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\137315651_393177605313523_7248647465241233239_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (131, N'Khôn như chó', N'15', N'Đây là một con chó khôn', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\137578421_393177581980192_1939709204096340181_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (132, N'Đẹp như chó', N'15', N'Đây là một con chó đẹp', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\138398539_393177501980200_8337997744258363055_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (133, N'Hamberger', N'15', N'Đây là một cái hamberger to bự', N'Food', N'16', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\908160.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (134, N'Hamberger', N'15', N'Đây là một cái hamberger to bự', N'Food', N'16', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\908160.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (135, N'Pizza', N'20', N'Đây là một cái pizza to bự', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\1074058.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (136, N'Pizza', N'20', N'Đây là một cái pizza to bự', N'Food', N'15', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\1074058.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (137, N'test', N'', N'', N'Food', N'', N'14-01-2021', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\407695.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (138, N'a', N'', N'', N'Food', N'', N'13-01-2021', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\409130.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (139, N'ád', N'', N'', N'Food', N'', N'13-01-2021', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\153645.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (140, N'test', N'15', N'', N'Food', N'', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\659097.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (141, N'a', N'12', N'dÃ¡', N'Food', N'', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\409387.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (142, N'Tao', N'1', N'12', N'Food', N'1', N'13-01-2021', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\153645.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (143, N'Bá»¯a sÃ¡ng', N'15', N'Day la mot chiec banh ngon', N'Food', N'10', N'13-01-2021 06:23:40', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\461573.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (144, N'test', N'12', N'', N'Food', N'', N'13-01-2021 22:30:21', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (145, N'test', N'12', N'', N'Food', N'', N'13-01-2021 22:30:26', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (146, N'test', N'12', N'', N'Food', N'', N'13-01-2021 22:30:42', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (147, N'test', N'12', N'', N'Food', N'', N'13-01-2021 22:31:01', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (148, N'test', N'12', N'', N'Food', N'', N'13-01-2021 22:31:05', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (149, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:38:49', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (150, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:38:53', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (151, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:38:55', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (152, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:38:58', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (153, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:39:02', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (154, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:39:04', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (155, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:39:06', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (156, N'test', N'12', N'', N'Food', N'', N'14-01-2021 12:03:08', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (157, N'test', N'12', N'', N'Food', N'', N'13-01-2021 23:39:25', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\136967765_488370965479184_2428974684199854894_n.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (158, N'Tuong', N'14', N'', N'Food', N'145', N'15-01-2021 14:54:18', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\sadako-hrthftuufdg4.gif')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (159, N'test', N'', N'', N'Food', N'', N'16-01-2021 15:34:43', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\398864.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (160, N'test ', N'', N'', N'Food', N'', N'16-01-2021 15:35:55', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\775031.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (161, N'Buttered popcorn', N'45', N'Corn -- the workhorse of the industrial world -- is best when its sweet variety is fried up with lashings of butter till it bursts and then snarfed in greasy fistfuls while watching Netflix late at night.', N'Food', N'19', N'18-01-2021 01:23:50', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\homemade-kettle-corn-popcorn-bag-260nw-288476828.png')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (162, N'Masala dosa ', N'15', N'A crispy, rice-batter crepe encases a spicy mix of mashed potato, which is then dipped in coconut chutney, pickles, tomato-and-lentil-based sauces and other condiments. It''s a fantastic breakfast food that''ll keep you going till lunch, when you''ll probably come back for another.', N'Food', N'1', N'18-01-2021 01:28:36', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-154919144-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (163, N'Potato chips', N'45', N'It''s unclear when and where the potato chip was born -- US legend has it that they were invented in New York in 1853, but the earliest known recipe for "Potatoes Fried in Slices or Shavings" appears in a bestselling 1817 cookbook by Englishman William Kitchiner.', N'Food', N'5', N'18-01-2021 01:29:54', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-1078654678-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (164, N'Seafood paella', N'86', N'The sea is lapping just by your feet, a warm breeze whips the tablecloth around your legs and a steamy pan of paella sits in front of you. Shrimp, lobster, mussels and cuttlefish combine with white rice and various herbs, oil and salt in this Valencian dish to send you immediately into holiday mode. Though if you have it in Spain, you''re probably there already.', N'Food', N'26', N'18-01-2021 01:31:51', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-496834569-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (165, N'Som tam', N'46', N'To prepare Thailand''s most famous salad, pound garlic and chilies with a mortar and pestle. Toss in tamarind juice, fish sauce, peanuts, dried shrimp, tomatoes, lime juice, sugar cane paste, string beans and a handful of grated green papaya. Grab a side of sticky rice. Variations include those made with crab (som tam boo) and fermented fish sauce (som tam plah lah), but none matches the flavor and simple beauty of the original.', N'Food', N'4', N'18-01-2021 01:33:46', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-592264669-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (166, N'Poutine', N'48', N'French fries smothered in cheese curds and brown gravy. Sounds kind of disgusting, looks even worse, but engulfs the mouth in a saucy, cheesy, fried-potato mix that''ll have you fighting over the last dollop. Our Canadian friends insist it''s best enjoyed at 3 a.m. after "several" beers.', N'Food', N'8', N'18-01-2021 01:35:07', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-154959976-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (167, N'Tacos', N'86', N'A fresh, handmade tortilla stuffed with small chunks of grilled beef rubbed in oil and sea salt then covered with guacamole, salsa, onions, cilantro or anything else you want -- perfect for breakfast, lunch or dinner. This is the reason no visitor leaves Mexico weighing less than when they arrived.', N'Food', N'2', N'18-01-2021 01:36:14', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-614313140-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (168, N'Stinky tofu', N'200', N'Nothing really prepares you for the stench of one of the strangest dishes on Earth. Like durian, smelly tofu is one of Southeast Asia''s most iconic foods. The odor of fermenting tofu is so overpowering many aren''t able to shake off the memory for months. So is the legendarily divine taste really worth the effort? Sure it is.', N'Food', N'1', N'18-01-2021 01:39:44', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-637320496-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (169, N'French toast', N'85', N'Unlike its more restrained Sunday brunch counterpart, Hong Kong-style French toast is like a deep-fried hug. Two pieces of toast are slathered with peanut butter or kaya jam, soaked in egg batter, fried in butter and served with still more butter and lots of syrup. A Hong Kong best food, best enjoyed before cholesterol checks.', N'Food', N'7', N'18-01-2021 01:41:00', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-171276439-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (170, N'Hummus', N'35', N'This humble Middle Eastern spread, made with chickpeas, garlic, lemon juice and tahini has become a fridge staple all around the world. This tangy treat tastes good as a dip, with breads, with meats, with vegetables, beans or -- hear us out -- on a Marmite rice cake.', N'Food', N'4', N'18-01-2021 01:42:12', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-1160233750-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (171, N'Chili crab', N'10', N'You can''t visit Singapore without trying its spicy, sloppy, meaty specialty. While there are dozens of ways to prepare crab (with black pepper, salted egg yolk, cheese-baked, et cetera) chili crab remains the local bestseller. Spicy chili-tomato gravy tends to splatter, which is why you need to mop everything up with mini mantou buns.', N'Food', N'60', N'18-01-2021 01:43:42', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-739245337-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (172, N'Maple syrup', N'26', N'Ever tried eating a pancake without maple syrup? It''s like eating a slice of cardboard. Poorly prepared cardboard. In fact, Canada''s gift to parents everywhere -- throw some maple syrup on the kid''s broccoli and see what happens -- makes just about anything worth trying. Pass the cardboard, please.', N'Food', N'35', N'18-01-2021 01:45:55', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-185291414-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (173, N'Fish ''n'' chips', N'3', N'Anything that''s been around since the 1860s can''t be doing much wrong. The staple of the Victorian British working class is a crunchy-outside, soft-inside dish of simple, un-adorned fundamentals.', N'Food', N'7', N'18-01-2021 01:49:30', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-148744285-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (174, N'Parma ham', N'45', N'You see it folded around melon, wrapped around grissini, placed over pizza, heaped over salad. There''s good reason for that: these salty, paper-thin slices of air-dried ham lift the taste of everything they accompany to a higher level.', N'Food', N'37', N'18-01-2021 01:51:18', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-182025119-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (175, N'summer roll', N'300', N'This snack made from pork, shrimp, herbs, rice vermicelli and other ingredients wrapped in rice paper is served at room temperature. It''s "meat light," with the flavors of refreshing herbs erupting in your mouth. Dipped in a slightly sweet Vietnamese sauce laced with ground peanuts, it''s wholesome, easy and the very definition of "moreish."', N'Food', N'6', N'18-01-2021 01:52:33', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-748346263-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (176, N'Pho', N'200', N'This oft-mispronounced national dish ("fuh" is correct) is just broth, fresh rice noodles, a few herbs and usually chicken or beef. But it''s greater than the sum of its parts -- fragrant, tasty and balanced.', N'Food', N'2', N'18-01-2021 01:53:34', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-914644496-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (177, N'LechÃ³n', N'5', N'A Filipino national dish, lechÃ³n is a whole young pig slow-roasted over charcoal for several hours. The process makes for tender meat and crispy skin. It''s prepared on special occasions throughout the year.', N'Food', N'280', N'18-01-2021 01:54:29', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-1157437856-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (178, N'Tea', N'600', N'Tea has been around almost as long as civilizationâit was discovered nearly 5,000 years ago in ancient China. According to legend, Emperor Shen Nung had leaves from a wild tree accidentally get blown into his pot of boiling water.', N'Drink', N'2', N'18-01-2021 01:56:23', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-1130648900-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (179, N'Coffee', N'200', N'Coffee is considered by many to be the most popular hot beverage in the world. Millions of people start off their day with a cup of joe, and itâs not surprising, considering the strong effect it can have on improving productivity and focus.', N'Drink', N'4', N'18-01-2021 01:57:35', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-1139917357-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (180, N'Wine', N'15', N'Wine has accompanied civilizations throughout the ages, serving both the working classes and the elites. Today, itâs just as popular as ever before.', N'Drink', N'32', N'18-01-2021 01:59:02', N'Active', N'D:\LAB\HanaShop\\web\ImageDB\gettyimages-507143336-612x612.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (181, N'test', N'12', N'12', N'Food', N'12', N'18-01-2021 14:45:00', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\134718899_3643611009016059_8471434622366897085_o.jpg')
INSERT [dbo].[tblProduct] ([ProductID], [Name], [Quantity], [Description], [Category], [Price], [DateOfCreate], [Status], [Image]) VALUES (182, N'test', N'12', N'12', N'Food', N'12', N'18-01-2021 14:45:52', N'Inactive', N'D:\LAB\HanaShop\\web\ImageDB\134699052_2401570126655358_3643050747624100_n.jpg')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
INSERT [dbo].[tblSubProduct] ([ProductID]) VALUES (N'180-173-174-')
INSERT [dbo].[tblSubProduct] ([ProductID]) VALUES (N'179-')
INSERT [dbo].[tblSubProduct] ([ProductID]) VALUES (N'179-')
INSERT [dbo].[tblSubProduct] ([ProductID]) VALUES (N'176-179-')
INSERT [dbo].[tblSubProduct] ([ProductID]) VALUES (N'180-174-175-')
INSERT [dbo].[tblSubProduct] ([ProductID]) VALUES (N'179-180-')
INSERT [dbo].[tblSubProduct] ([ProductID]) VALUES (N'179-180-161-173-')
ALTER TABLE [dbo].[tblAccountDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountDetail_tblAccount] FOREIGN KEY([AccountId])
REFERENCES [dbo].[tblAccount] ([AccountId])
GO
ALTER TABLE [dbo].[tblAccountDetail] CHECK CONSTRAINT [FK_tblAccountDetail_tblAccount]
GO
ALTER TABLE [dbo].[tblActionHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblActionHistory_tblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[tblActionHistory] CHECK CONSTRAINT [FK_tblActionHistory_tblProduct]
GO
ALTER TABLE [dbo].[tblEmotion]  WITH CHECK ADD  CONSTRAINT [FK_tblEmotion_tblAccount] FOREIGN KEY([AccountId])
REFERENCES [dbo].[tblAccount] ([AccountId])
GO
ALTER TABLE [dbo].[tblEmotion] CHECK CONSTRAINT [FK_tblEmotion_tblAccount]
GO
ALTER TABLE [dbo].[tblEmotion]  WITH CHECK ADD  CONSTRAINT [FK_tblEmotion_tblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[tblEmotion] CHECK CONSTRAINT [FK_tblEmotion_tblProduct]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblAccount] FOREIGN KEY([AccountId])
REFERENCES [dbo].[tblAccount] ([AccountId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblAccount]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrdersId])
REFERENCES [dbo].[tblOrder] ([OrdersID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
USE [master]
GO
ALTER DATABASE [HanaShop] SET  READ_WRITE 
GO
