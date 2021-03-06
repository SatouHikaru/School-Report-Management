USE [master]
GO
/****** Object:  Database [QuanLyHocBa]    Script Date: 2018-09-05 7:55:46 PM ******/
CREATE DATABASE [QuanLyHocBa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyHocBa', FILENAME = N'E:\Microsoft SQL Server 2014\MSSQL12.HIKARU\MSSQL\DATA\QuanLyHocBa.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyHocBa_log', FILENAME = N'E:\Microsoft SQL Server 2014\MSSQL12.HIKARU\MSSQL\DATA\QuanLyHocBa_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyHocBa] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyHocBa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyHocBa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyHocBa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyHocBa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyHocBa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyHocBa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyHocBa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyHocBa] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyHocBa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyHocBa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyHocBa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyHocBa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyHocBa] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyHocBa]
GO
/****** Object:  UserDefinedFunction [dbo].[HocSinh_GenerateNewID]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[HocSinh_GenerateNewID]
(
	@pre varchar(2)
) RETURNS VARCHAR(10)
AS
BEGIN

    DECLARE @Prefix VARCHAR(5) = @pre + '000'
	declare @index int = 0
	declare @So int
    DECLARE @ID VARCHAR(20)
    SET @ID = (SELECT TOP 1 MaHS FROM HocSinh ORDER BY MaHS DESC)
	set @So = SUBSTRING(@ID, 3, len(@ID)) + 1
	
	if(@So > 10 and @so < 100)
		set @index = 1
	if(@So > 100 and @So < 999)
		set @index = 2
	if(@So > 999)
		set @index = 3
	set @Prefix = LEFT(@Prefix, len(@Prefix) - @index)
	
    SET @ID = @Prefix + CAST((CAST(REPLACE(@SO,@Prefix,'') AS INT)) AS VARCHAR(20))

    RETURN @ID
END




GO
/****** Object:  UserDefinedFunction [dbo].[splitstring]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[splitstring] (@stringToSplit VARCHAR(MAX), @character varchar(10) )
RETURNS
 @returnList TABLE ([Name] [nvarchar] (500))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(@character, @stringToSplit) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(@character, @stringToSplit)  
  SELECT @name = SUBSTRING(@stringToSplit, 1, @pos-1)

  INSERT INTO @returnList 
  SELECT @name

  SELECT @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
 END

 INSERT INTO @returnList
 SELECT @stringToSplit

 RETURN
END




GO
/****** Object:  Table [dbo].[ChiTietHocBa]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietHocBa](
	[MaHS] [varchar](30) NOT NULL,
	[MaNH] [bigint] NOT NULL,
	[MaLop] [bigint] NOT NULL,
	[MaHK] [int] NOT NULL,
	[HocLuc] [nvarchar](50) NOT NULL,
	[HanhKiem] [nvarchar](50) NOT NULL,
	[SoNgayNghi] [int] NOT NULL,
	[NhanXet] [nvarchar](250) NOT NULL,
	[NgayCapNhat] [date] NOT NULL,
	[DiemCaNam] [float] NULL,
 CONSTRAINT [PK_ChiTietHocBa] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[MaNH] ASC,
	[MaLop] ASC,
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChuyenMon]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenMon](
	[MaGV] [bigint] NOT NULL,
	[MaMH] [bigint] NOT NULL,
 CONSTRAINT [PK_ChuyenMon] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Diem]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diem](
	[MaHS] [varchar](30) NOT NULL,
	[MaMH] [bigint] NOT NULL,
	[MaHK] [int] NOT NULL,
	[MaNH] [bigint] NOT NULL,
	[MaLop] [bigint] NULL,
	[MaGV] [bigint] NULL,
	[DiemMieng] [varchar](50) NULL,
	[Diem15Phut] [varchar](50) NULL,
	[Diem1Tiet] [varchar](50) NULL,
	[DiemThi] [float] NULL,
	[DiemTK] [float] NULL,
 CONSTRAINT [PK_Diem_1] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[MaMH] ASC,
	[MaHK] ASC,
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiangDay]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangDay](
	[MaGV] [bigint] NOT NULL,
	[MaMH] [bigint] NOT NULL,
	[MaLop] [bigint] NOT NULL,
	[MaHK] [int] NOT NULL,
	[MaNH] [bigint] NOT NULL,
 CONSTRAINT [PK_GiangDay] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC,
	[MaMH] ASC,
	[MaLop] ASC,
	[MaHK] ASC,
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[MaGV] [bigint] IDENTITY(1,1) NOT NULL,
	[TenGV] [nvarchar](60) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DienThoai] [varchar](20) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[TaiKhoan] [varchar](30) NOT NULL,
 CONSTRAINT [PK_GiaoVien_1] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoatDongLienLac]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoatDongLienLac](
	[MaTN] [bigint] IDENTITY(1,1) NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[HinhThucGui] [nvarchar](50) NOT NULL,
	[NgayGui] [date] NOT NULL,
	[MaPH] [bigint] NOT NULL,
 CONSTRAINT [PK_HoatDongLienLac] PRIMARY KEY CLUSTERED 
(
	[MaTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[MaHK] [int] NOT NULL,
	[TenHK] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HocKy] PRIMARY KEY CLUSTERED 
(
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHS] [varchar](30) NOT NULL,
	[TenHS] [nvarchar](60) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DienThoai] [varchar](14) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[MaPH] [bigint] NULL,
	[DaXoa] [bit] NULL,
 CONSTRAINT [PK_HocSinh_1] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocSinhLop]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocSinhLop](
	[MaHS] [varchar](30) NOT NULL,
	[MaLop] [bigint] NOT NULL,
	[MaNH] [bigint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [bigint] NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[SiSo] [int] NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopNamHoc]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopNamHoc](
	[MaLop] [bigint] NOT NULL,
	[MaNH] [bigint] NOT NULL,
	[MaGV] [bigint] NULL,
 CONSTRAINT [PK_LopNamHoc] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC,
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [bigint] IDENTITY(1,1) NOT NULL,
	[TenMH] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamHoc]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NamHoc](
	[MaNH] [bigint] NOT NULL,
	[TenNH] [varchar](50) NOT NULL,
	[NamDangHoc] [bit] NULL,
 CONSTRAINT [PK_NamHoc] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NamHocHocKy]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamHocHocKy](
	[MaNH] [bigint] NOT NULL,
	[MaHK] [int] NOT NULL,
 CONSTRAINT [PK_NamHocHocKy] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC,
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamHocNienKhoa]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamHocNienKhoa](
	[MaNH] [bigint] NOT NULL,
	[MaNK] [bigint] NOT NULL,
 CONSTRAINT [PK_NamHocNienKhoa] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC,
	[MaNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NienKhoa]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NienKhoa](
	[MaNK] [bigint] IDENTITY(1,1) NOT NULL,
	[NienKhoa] [varchar](50) NULL,
 CONSTRAINT [PK_NienKhoa] PRIMARY KEY CLUSTERED 
(
	[MaNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[IdPH] [bigint] NOT NULL,
	[TieuDe] [nvarchar](500) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[Email] [varchar](30) NULL,
	[DienThoai] [varchar](20) NULL,
	[NguoiPhanHoi] [nvarchar](60) NOT NULL,
	[NgayGui] [date] NOT NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[IdPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[TenDangNhap] [varchar](255) NOT NULL,
	[MaVT] [bigint] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC,
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhuHuynh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhuHuynh](
	[MaPH] [bigint] IDENTITY(1,1) NOT NULL,
	[TenPH] [nvarchar](60) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DienThoai] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[TaiKhoan] [varchar](30) NOT NULL,
 CONSTRAINT [PK_PhuHuynh] PRIMARY KEY CLUSTERED 
(
	[MaPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [varchar](255) NOT NULL,
	[MatKhau] [nvarchar](150) NOT NULL,
	[DaKhoa] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVT] [bigint] IDENTITY(1,1) NOT NULL,
	[TenVT] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHocBa] ([MaHS], [MaNH], [MaLop], [MaHK], [HocLuc], [HanhKiem], [SoNgayNghi], [NhanXet], [NgayCapNhat], [DiemCaNam]) VALUES (N'HS0001', 1, 10, 1, N'Kém', N'Trung bình', 1, N'  kém quá', CAST(N'2018-08-22' AS Date), 0)
INSERT [dbo].[ChiTietHocBa] ([MaHS], [MaNH], [MaLop], [MaHK], [HocLuc], [HanhKiem], [SoNgayNghi], [NhanXet], [NgayCapNhat], [DiemCaNam]) VALUES (N'HS0001', 1, 10, 2, N'Kém', N'Trung bình', 2, N'  kém vler', CAST(N'2018-08-22' AS Date), 0)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (1, 1)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (1, 2)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (2, 6)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (3, 5)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (4, 11)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (5, 4)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (6, 8)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (7, 5)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (8, 6)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (9, 12)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (10, 9)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (17, 10)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (20, 2)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (20, 8)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (21, 1)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (21, 2)
INSERT [dbo].[ChuyenMon] ([MaGV], [MaMH]) VALUES (21, 3)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0001', 1, 1, 1, 1, 1, N'9.75', N'6', N'8', 9.75, 8.8000001907348633)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0001', 2, 1, 1, 1, 1, N'9', N'9.5', N'9.75', 9.75, 9.6000003814697266)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0001', 3, 1, 1, 1, 1, N'8', N'8', N'9', 9, 8.6999998092651367)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0001', 4, 1, 1, 1, 1, N'0', N'', N'', 0, 0)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0002', 1, 1, 1, 1, 1, N'10', N'9.5', N'9', 9.75, 9.6000003814697266)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0002', 4, 1, 1, 1, 1, N'10', N'10', N'10', 10, 10)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0003', 1, 1, 1, 6, 1, N'10', N'8', N'8', 9, 8.8000001907348633)
INSERT [dbo].[Diem] ([MaHS], [MaMH], [MaHK], [MaNH], [MaLop], [MaGV], [DiemMieng], [Diem15Phut], [Diem1Tiet], [DiemThi], [DiemTK]) VALUES (N'HS0004', 1, 1, 1, 6, 1, N'9', N'9', N'8', 8.75, 8.6999998092651367)
INSERT [dbo].[GiangDay] ([MaGV], [MaMH], [MaLop], [MaHK], [MaNH]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[GiangDay] ([MaGV], [MaMH], [MaLop], [MaHK], [MaNH]) VALUES (1, 1, 1, 1, 2)
INSERT [dbo].[GiangDay] ([MaGV], [MaMH], [MaLop], [MaHK], [MaNH]) VALUES (1, 1, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[GiaoVien] ON 

INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (1, N'Trần Hoàng Anh', 1, CAST(N'1986-04-03' AS Date), N'09231843258', N'anhth@gmail.com', N'Quảng Nam', N'anhth')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (2, N'Nguyễn Thị An', 0, CAST(N'1991-01-01' AS Date), N'09325084325', N'annt@gmail.com', N'Đà Nẵng', N'annt')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (3, N'Nguyễn Thị Lam', 0, CAST(N'1984-07-10' AS Date), N'0928457438', N'lamnt@gmail.com', N'12 - Trần Thủ Độ', N'lamnt')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (4, N'Trần Anh Hiếu', 1, CAST(N'1992-01-01' AS Date), N'02123243545', N'hieuta@gmail.com', N'Huế', N'hieuta')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (5, N'Trần Thị Hòa', 0, CAST(N'1990-07-03' AS Date), N'00125352432', N'hoatt@gmail.com', N'Huế', N'hoatt')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (6, N'Phạm Anh Khoa', 1, CAST(N'1990-02-12' AS Date), N'01764735635', N'khoapa@gmail.com', N'Quảng Nam', N'khoapa')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (7, N'Hoàng Trung Thanh', 1, CAST(N'1987-03-06' AS Date), N'02984395834', N'thanhht@gmail.com', N'Quảng Trị', N'thanhht')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (8, N'Nguyễn Thành Trung', 1, CAST(N'1989-02-05' AS Date), N'01924849355', N'trungnt@gmail.com', N'Đà Nẵng', N'trungnt')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (9, N'Hoàng Văn Anh', 1, CAST(N'1990-01-01' AS Date), N'02183768712', N'anhhv@gmail.com', N'sdfdsfdsf', N'anhhv')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (10, N'Mai Thuỳ Trang', 0, CAST(N'1990-01-01' AS Date), N'021348778324', N'trangmt@gmail.com', N'sdfsdfdf', N'trangmt')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (17, N'Hoàng Văn Anh', 1, CAST(N'1990-01-01' AS Date), N'012456546332', N'anhhv1@gmail.com', N'Hue', N'anhhv1')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (20, N'Hoàng Văn Anh', 1, CAST(N'1985-08-17' AS Date), N'012345677892', N'anhhv2@gmail.com', N'Hanoi', N'anhhv2')
INSERT [dbo].[GiaoVien] ([MaGV], [TenGV], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (21, N'Demo', 1, CAST(N'1990-08-28' AS Date), N'01652130546', N'demo@gmail.com', N'472 Núi Thành, P.Hòa Cường Nam, Q.Hải Châu, TP.Đà Nẵng', N'demo')
SET IDENTITY_INSERT [dbo].[GiaoVien] OFF
INSERT [dbo].[HocKy] ([MaHK], [TenHK]) VALUES (1, N'Học kỳ 1')
INSERT [dbo].[HocKy] ([MaHK], [TenHK]) VALUES (2, N'Học kỳ 2')
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0001', N'Nguyễn Trọng Đạt', 1, CAST(N'1997-06-03' AS Date), N'01223912510', N'65 Vạn Bảo', 3, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0002', N'Tham', 1, CAST(N'2002-03-08' AS Date), N'01236547789', N'1194 Đường Láng', 5, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0003', N'Quang', 1, CAST(N'2000-03-01' AS Date), N'01397842274', N'75 Nguyễn Trãi', 2, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0004', N'Mai', 0, CAST(N'2003-05-07' AS Date), N'09874542451', N'114 Hai Bà Trưng', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0005', N'Lý', 1, CAST(N'2001-08-02' AS Date), N'09874531452', N'523 Kim Mã', 5, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0006', N'Linh', 0, CAST(N'2003-04-06' AS Date), N'09354873454', N'601 Quang Trung', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0007', N'Hải', 1, CAST(N'2001-03-07' AS Date), N'09831457523', N'12 Bà Triệu', 9, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0008', N'Thanh', 0, CAST(N'2003-05-04' AS Date), N'09874531254', N'175 Trần Duy Hưng', 5, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0009', N'Uyên', 0, CAST(N'2001-06-07' AS Date), N'09784237852', N'1 Giang Văn Minh', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0010', N'Minh', 1, CAST(N'2002-09-02' AS Date), N'02145786321', N'5 Phạm Ngũ Lão', 9, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0011', N'Davies', 1, CAST(N'2002-09-09' AS Date), N'02321654654', N'5 Núi Thành', 2, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0012', N'Lê Thị Bé', 0, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 10, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0013', N'Yok', 1, CAST(N'2003-12-12' AS Date), N'234234', N'De Toak', 9, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0014', N'Phe Lisc', 0, CAST(N'2003-12-12' AS Date), N'234234', N'De Dot', 5, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0015', N'Huan', 1, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0016', N'Bem', 0, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 9, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0017', N'Đào', 1, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 3, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0018', N'Tùng', 0, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 2, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0019', N'Sơn', 1, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0020', N'Tùng Núi', 0, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0021', N'Sơn Tùng', 1, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0022', N'James', 0, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0023', N'Tom Davies', 1, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 6, 0)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaPH], [DaXoa]) VALUES (N'HS0024', N'Hoàng', 0, CAST(N'2003-12-12' AS Date), N'234234', N'fsdfsdfsdf', 6, 0)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0001', 1, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0001', 5, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0001', 9, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0002', 1, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0002', 5, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0002', 9, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0003', 2, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0003', 6, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0003', 10, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0004', 2, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0004', 6, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0004', 10, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0005', 3, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0005', 7, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0006', 11, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0006', 3, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0007', 7, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0007', 11, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0008', 1, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0008', 5, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0009', 9, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0010', 1, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0011', 5, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0012', 9, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0013', 3, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0013', 7, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0013', 11, 4)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0014', 3, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0014', 7, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0014', 11, 4)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0015', 2, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0015', 6, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0015', 10, 4)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0016', 2, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0016', 6, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0016', 10, 4)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0017', 2, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0017', 6, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0018', 10, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0018', 4, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0019', 8, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0019', 12, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0020', 4, 2)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0020', 8, 3)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0021', 12, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0022', 4, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0023', 8, 1)
INSERT [dbo].[HocSinhLop] ([MaHS], [MaLop], [MaNH]) VALUES (N'HS0024', 12, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (1, N'10A1', 30)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (2, N'10A2', 46)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (3, N'10B1', 45)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (4, N'10B2', 40)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (5, N'11A1', 50)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (6, N'11A2', 45)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (7, N'11B1', 42)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (8, N'11B2', 43)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (9, N'12A1', 45)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (10, N'12A2', 40)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (11, N'12B1', 44)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [SiSo]) VALUES (12, N'12B2', 47)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (1, 1, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (1, 2, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (1, 3, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (1, 4, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (2, 1, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (2, 2, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (2, 3, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (2, 4, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (3, 1, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (3, 2, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (3, 3, NULL)
INSERT [dbo].[LopNamHoc] ([MaLop], [MaNH], [MaGV]) VALUES (3, 4, NULL)
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (1, N'Toán')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (2, N'Lý')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (3, N'Hoá')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (4, N'Sinh')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (5, N'Tin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (6, N'Anh')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (7, N'Văn')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (8, N'Địa')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (9, N'Sử')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (10, N'Giáo dục công dân')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (11, N'Công nghệ')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH]) VALUES (12, N'Thể dục')
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
INSERT [dbo].[NamHoc] ([MaNH], [TenNH], [NamDangHoc]) VALUES (1, N'2017-2018', 0)
INSERT [dbo].[NamHoc] ([MaNH], [TenNH], [NamDangHoc]) VALUES (2, N'2018-2019', 1)
INSERT [dbo].[NamHoc] ([MaNH], [TenNH], [NamDangHoc]) VALUES (3, N'2019-2020', 0)
INSERT [dbo].[NamHoc] ([MaNH], [TenNH], [NamDangHoc]) VALUES (4, N'2020-2021', 0)
INSERT [dbo].[NamHocHocKy] ([MaNH], [MaHK]) VALUES (1, 1)
INSERT [dbo].[NamHocHocKy] ([MaNH], [MaHK]) VALUES (1, 2)
INSERT [dbo].[NamHocHocKy] ([MaNH], [MaHK]) VALUES (2, 1)
INSERT [dbo].[NamHocHocKy] ([MaNH], [MaHK]) VALUES (2, 2)
INSERT [dbo].[NamHocNienKhoa] ([MaNH], [MaNK]) VALUES (1, 1)
INSERT [dbo].[NamHocNienKhoa] ([MaNH], [MaNK]) VALUES (2, 1)
SET IDENTITY_INSERT [dbo].[NienKhoa] ON 

INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (1, N'2010-2013')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (2, N'2011-2014')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (3, N'2012-2015')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (4, N'2013-2016')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (5, N'2014-2017')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (6, N'2015-2018')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (7, N'2016-2019')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (8, N'2017-2020')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (9, N'2018-2021')
INSERT [dbo].[NienKhoa] ([MaNK], [NienKhoa]) VALUES (10, N'2019-2022')
SET IDENTITY_INSERT [dbo].[NienKhoa] OFF
INSERT [dbo].[PhanQuyen] ([TenDangNhap], [MaVT]) VALUES (N'Admin', 1)
INSERT [dbo].[PhanQuyen] ([TenDangNhap], [MaVT]) VALUES (N'annt', 2)
INSERT [dbo].[PhanQuyen] ([TenDangNhap], [MaVT]) VALUES (N'HS0001', 3)
INSERT [dbo].[PhanQuyen] ([TenDangNhap], [MaVT]) VALUES (N'lamnt', 4)
SET IDENTITY_INSERT [dbo].[PhuHuynh] ON 

INSERT [dbo].[PhuHuynh] ([MaPH], [TenPH], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (2, N'Trần Trung Nam', 1, CAST(N'1986-02-01' AS Date), N'0192173745', N'namtt@gmail.com', N'48-Trần Cung', N'namtt')
INSERT [dbo].[PhuHuynh] ([MaPH], [TenPH], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (3, N'Nguyễn Thị Lam', 0, CAST(N'1984-07-10' AS Date), N'0928457438', N'lamnt@gmail.com', N'12 - Trần Thủ Độ', N'lamnt')
INSERT [dbo].[PhuHuynh] ([MaPH], [TenPH], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (5, N'Kiều Đình Bình', 1, CAST(N'1986-12-20' AS Date), N'0126734595', N'binhkd@gmail.com', N'126- Trần Đại Nghĩa', N'binhkd')
INSERT [dbo].[PhuHuynh] ([MaPH], [TenPH], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (6, N'Lê Thị Na', 0, CAST(N'1988-01-07' AS Date), N'0123654797', N'nalt@gmail.com', N'178- Lê Duẩn', N'nalt')
INSERT [dbo].[PhuHuynh] ([MaPH], [TenPH], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (9, N'Kiều Nhật Anh', 1, CAST(N'1989-02-09' AS Date), N'0934873485', N'anhkh@gmail.com', N'177-Trần Hưng', N'anhnk')
INSERT [dbo].[PhuHuynh] ([MaPH], [TenPH], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (10, N'Nguyễn Văn Anh', 1, CAST(N'1994-12-12' AS Date), N'34235', N'anhnv@gmail.com', N'sdsdsfsdf', N'anhnv')
INSERT [dbo].[PhuHuynh] ([MaPH], [TenPH], [GioiTinh], [NgaySinh], [DienThoai], [Email], [DiaChi], [TaiKhoan]) VALUES (13, N'John Davies', 1, CAST(N'1990-12-12' AS Date), N'0123456789', N'daviesj@gmail.com', N'123 Abc', N'daviesj')
SET IDENTITY_INSERT [dbo].[PhuHuynh] OFF
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [DaKhoa]) VALUES (N'Admin', N'admin', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [DaKhoa]) VALUES (N'annt', N'annt', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [DaKhoa]) VALUES (N'HS0001', N'HS0001', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [DaKhoa]) VALUES (N'lamnt', N'lamnt', NULL)
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (1, N'Admin')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (2, N'Giáo viên')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (3, N'Học sinh')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (4, N'Phụ huynh')
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [GiaoVien_TaiKhoan]    Script Date: 2018-09-05 7:55:46 PM ******/
ALTER TABLE [dbo].[GiaoVien] ADD  CONSTRAINT [GiaoVien_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NienKhoa]    Script Date: 2018-09-05 7:55:46 PM ******/
ALTER TABLE [dbo].[NienKhoa] ADD  CONSTRAINT [IX_NienKhoa] UNIQUE NONCLUSTERED 
(
	[MaNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietHocBa]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHocBa_HocSinh] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHocBa] CHECK CONSTRAINT [FK_ChiTietHocBa_HocSinh]
GO
ALTER TABLE [dbo].[ChuyenMon]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenMon_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuyenMon] CHECK CONSTRAINT [FK_ChuyenMon_GiaoVien]
GO
ALTER TABLE [dbo].[ChuyenMon]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenMon_MonHoc] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuyenMon] CHECK CONSTRAINT [FK_ChuyenMon_MonHoc]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_GiaoVien]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_HocKy] FOREIGN KEY([MaHK])
REFERENCES [dbo].[HocKy] ([MaHK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_HocKy]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_HocSinh] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_HocSinh]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_MonHoc] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_MonHoc]
GO
ALTER TABLE [dbo].[GiangDay]  WITH CHECK ADD  CONSTRAINT [FK_GiangDay_ChuyenMon] FOREIGN KEY([MaGV], [MaMH])
REFERENCES [dbo].[ChuyenMon] ([MaGV], [MaMH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GiangDay] CHECK CONSTRAINT [FK_GiangDay_ChuyenMon]
GO
ALTER TABLE [dbo].[GiangDay]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienMonHoc_HocKy] FOREIGN KEY([MaHK])
REFERENCES [dbo].[HocKy] ([MaHK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GiangDay] CHECK CONSTRAINT [FK_GiaoVienMonHoc_HocKy]
GO
ALTER TABLE [dbo].[GiangDay]  WITH CHECK ADD  CONSTRAINT [FK_GiaoVienMonHoc_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GiangDay] CHECK CONSTRAINT [FK_GiaoVienMonHoc_Lop]
GO
ALTER TABLE [dbo].[HoatDongLienLac]  WITH CHECK ADD  CONSTRAINT [FK_HoatDongLienLac_PhuHuynh] FOREIGN KEY([MaPH])
REFERENCES [dbo].[PhuHuynh] ([MaPH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoatDongLienLac] CHECK CONSTRAINT [FK_HoatDongLienLac_PhuHuynh]
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_PhuHuynh] FOREIGN KEY([MaPH])
REFERENCES [dbo].[PhuHuynh] ([MaPH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocSinh] CHECK CONSTRAINT [FK_HocSinh_PhuHuynh]
GO
ALTER TABLE [dbo].[HocSinhLop]  WITH CHECK ADD  CONSTRAINT [FK_HocSinhLop_HocSinh] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocSinhLop] CHECK CONSTRAINT [FK_HocSinhLop_HocSinh]
GO
ALTER TABLE [dbo].[HocSinhLop]  WITH CHECK ADD  CONSTRAINT [FK_HocSinhLop_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocSinhLop] CHECK CONSTRAINT [FK_HocSinhLop_Lop]
GO
ALTER TABLE [dbo].[HocSinhLop]  WITH CHECK ADD  CONSTRAINT [FK_HocSinhLop_NamHoc] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NamHoc] ([MaNH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocSinhLop] CHECK CONSTRAINT [FK_HocSinhLop_NamHoc]
GO
ALTER TABLE [dbo].[LopNamHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopNamHoc_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LopNamHoc] CHECK CONSTRAINT [FK_LopNamHoc_GiaoVien]
GO
ALTER TABLE [dbo].[LopNamHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopNamHoc_Lop1] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LopNamHoc] CHECK CONSTRAINT [FK_LopNamHoc_Lop1]
GO
ALTER TABLE [dbo].[LopNamHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopNamHoc_NamHoc] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NamHoc] ([MaNH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LopNamHoc] CHECK CONSTRAINT [FK_LopNamHoc_NamHoc]
GO
ALTER TABLE [dbo].[NamHocHocKy]  WITH CHECK ADD  CONSTRAINT [FK_NamHocHocKy_HocKy] FOREIGN KEY([MaHK])
REFERENCES [dbo].[HocKy] ([MaHK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NamHocHocKy] CHECK CONSTRAINT [FK_NamHocHocKy_HocKy]
GO
ALTER TABLE [dbo].[NamHocHocKy]  WITH CHECK ADD  CONSTRAINT [FK_NamHocHocKy_NamHoc] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NamHoc] ([MaNH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NamHocHocKy] CHECK CONSTRAINT [FK_NamHocHocKy_NamHoc]
GO
ALTER TABLE [dbo].[NamHocNienKhoa]  WITH CHECK ADD  CONSTRAINT [FK_NamHocNienKhoa_NamHoc] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NamHoc] ([MaNH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NamHocNienKhoa] CHECK CONSTRAINT [FK_NamHocNienKhoa_NamHoc]
GO
ALTER TABLE [dbo].[NamHocNienKhoa]  WITH CHECK ADD  CONSTRAINT [FK_NamHocNienKhoa_NienKhoa] FOREIGN KEY([MaNK])
REFERENCES [dbo].[NienKhoa] ([MaNK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NamHocNienKhoa] CHECK CONSTRAINT [FK_NamHocNienKhoa_NienKhoa]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TaiKhoan] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TaiKhoan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_VaiTro] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_VaiTro]
GO
/****** Object:  StoredProcedure [dbo].[sp_PhuHuynh_ByLop]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_PhuHuynh_ByLop]
(
	@Term nvarchar(max),
	@MaLop bigint
)
as
begin

	if(@MaLop != 0)
	begin
		select distinct PhuHuynh.* from Lop
		join HocSinhLop on Lop.MaLop = HocSinhLop.MaLop
		join HocSinh on HocSinh.MaHS = HocSinhLop.MaHS
		join PhuHuynh on HocSinh.MaPH = PhuHuynh.MaPH

		where Lop.MaLop = @MaLop 
		and (TenPH like N'%' + @Term + '%' or TenHS like N'%' + @Term + '%' or PhuHuynh.DienThoai like @Term
		or PhuHuynh.Email like N'%' + @Term + '%')
	end
	else
	begin
		select distinct PhuHuynh.* from Lop
		join HocSinhLop on Lop.MaLop = HocSinhLop.MaLop
		join HocSinh on HocSinh.MaHS = HocSinhLop.MaHS
		join PhuHuynh on HocSinh.MaPH = PhuHuynh.MaPH

		where TenPH like N'%' + @Term + '%' or TenHS like N'%' + @Term + '%' or PhuHuynh.DienThoai like @Term
		or PhuHuynh.Email like N'%' + @Term + '%'
	end

end

--[sp_PhuHuynh_ByLop] '', 10




GO
/****** Object:  StoredProcedure [dbo].[spChangePassword]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spChangePassword]
	@Username varchar(30),
	@Password nvarchar(30)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE TaiKhoan
		SET MatKhau = @Password
		WHERE TenDangNhap = @Username
	END

GO
/****** Object:  StoredProcedure [dbo].[spChiTietHocBa_Get]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spChiTietHocBa_Get]
(
	@MaHS varchar(30),
	@MaLop int,
	@MaNH int
)
AS
	BEGIN
		SET NOCOUNT ON
		SELECT *
		FROM ChiTietHocBa
		WHERE MaHS = @MaHS AND MaLop = @MaLop AND MaNH = @MaNH
	END

	--[spChiTietHocBa_Get] 'HS0001', 10, 1











GO
/****** Object:  StoredProcedure [dbo].[spChuyenMon_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spChuyenMon_Add]
	@MaGV bigint,
	@MaMH bigint
AS
	BEGIN
		SET NOCOUNT ON
		--select * from ChuyenMon where MaGV = @MaGV and MaMH != @MaMH
		
		delete from ChuyenMon where MaGV = @MaGV and MaMH = @MaMH
		
		INSERT ChuyenMon VALUES (@MaGV, @MaMH)

		select * from ChuyenMon
	END
	--execute [spChuyenMon_Add] 21,2 execute [spChuyenMon_Add] 21,1









GO
/****** Object:  StoredProcedure [dbo].[spChuyenMon_DeleteByMaGV]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spChuyenMon_DeleteByMaGV]
	@MaGV bigint
AS
	BEGIN
		SET NOCOUNT ON
		delete from ChuyenMon where MaGV = @MaGV 
	END




GO
/****** Object:  StoredProcedure [dbo].[spChuyenMon_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spChuyenMon_Edit]
	@MaGV bigint,
	@GiaTri varchar(max)
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM ChuyenMon WHERE MaGV = @MaGV;
		execute('INSERT INTO ChuyenMon VALUES ' + @GiaTri);
		
	END
	--execute [spChuyenMon_Edit] 21,'(21,1), (21,2)'




GO
/****** Object:  StoredProcedure [dbo].[spDiem_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spDiem_Add]
	@MaHS varchar(255),
	@MaMH bigint,
	@MaHK bigint,
	@MaGV bigint,
	@DiemTK float
AS
	BEGIN
		SET NOCOUNT ON
		INSERT Diem (MaHS, MaMH, MaHK, MaGV, DiemTK)
		VALUES (@MaHS, @MaMH, @MaHK, @MaGV, @DiemTK)
	END











GO
/****** Object:  StoredProcedure [dbo].[spDiem_CapNhat]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spDiem_CapNhat]
	(
		@MaHS varchar(50),
		@MaMH bigint,
		@MaHK int,
		@MaGV bigint,
		@DiemMieng varchar(50),
		@Diem15Phut varchar(50),
		@Diem1Tiet varchar(50),
		@DiemThi float,
		@DiemTK float,
		@MaLop bigint,
		@MaNH bigint
	)
	as
	begin
		declare @Count int = (select count(MaHS) from Diem 
		where MaHS = @MaHS and MaMH = @MaMH 
				and MaHK = @MaHK and MaNH = @MaNH and MaLop = @MaLop)

		if(@Count > 0)
		begin
			update Diem
			set DiemMieng = @DiemMieng,
				Diem15Phut = @Diem15Phut,
				Diem1Tiet = @Diem1Tiet,
				DiemThi = @DiemThi,
				DiemTK = @DiemTK 

				where MaHS = @MaHS and MaMH = @MaMH 
				and MaHK = @MaHK and MaNH = @MaNH and MaLop = @MaLop
		end
		else
		begin
			insert into Diem values(@MaHS, @MaMH, @MaHK, @MaNH, @MaLop, 
			@MaGV, @DiemMieng, @Diem15Phut, @Diem1Tiet, @DiemThi, @DiemTK)
		end
	end




GO
/****** Object:  StoredProcedure [dbo].[spDiem_DanhSachLopCuaGiaoVien]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[spDiem_DanhSachLopCuaGiaoVien]
	(
		@MaGV bigint,
		@MaHK int,
		@MaNH bigint 
	)
	as
	begin
		select distinct Lop.MaLop, TenLop, NamHoc.MaNH, TenNH from GiaoVien
		join GiangDay on GiaoVien.MaGV = GiangDay.MaGV
		join Lop on GiangDay.MaLop = Lop.MaLop
		join LopNamHoc on LopNamHoc.MaLop = Lop.MaLop
		join NamHoc on NamHoc.MaNH = GiangDay.MaNH
		where GiaoVien.MaGV = @MaGV 
		and GiangDay.MaHK = @MaHK 
		and GiangDay.MaNH  = @MaNH
	end

	--[spDiem_DanhSachLopCuaGiaoVien] 1,1,1




GO
/****** Object:  StoredProcedure [dbo].[spDiem_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spDiem_Edit]
	(
		@MaHS varchar(50),
		@MaMH bigint,
		@MaHK int,
		@MaGV bigint,
		@DiemMieng varchar(50),
		@Diem15Phut varchar(50),
		@Diem1Tiet varchar(50),
		@DiemThi float,
		@DiemTK float,
		@MaLop bigint,
		@MaNH bigint
	)
	as
	begin
		declare @Count int = (select count(MaHS) from Diem 
		where MaHS = @MaHS and MaMH = @MaMH 
				and MaHK = @MaHK and MaNH = @MaNH and MaLop = @MaLop)

		if(@Count > 0)
		begin
			update Diem
			set DiemMieng = @DiemMieng,
				Diem15Phut = @Diem15Phut,
				Diem1Tiet = @Diem1Tiet,
				DiemThi = @DiemThi,
				DiemTK = @DiemTK 

				where MaHS = @MaHS and MaMH = @MaMH 
				and MaHK = @MaHK and MaNH = @MaNH and MaLop = @MaLop
		end
		else
		begin
			insert into Diem values(@MaHS, @MaMH, @MaHK, @MaNH, @MaLop, 
			@MaGV, @DiemMieng, @Diem15Phut, @Diem1Tiet, @DiemThi, @DiemTK)
		end
	end
		




GO
/****** Object:  StoredProcedure [dbo].[spDiem_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spDiem_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT Diem.*
		FROM Diem
		JOIN HocSinh ON Diem.MaHS = HocSinh.MaHS
		JOIN MonHoc ON Diem.MaMH = MonHoc.MaMH
		JOIN HocKy ON Diem.MaHK = HocKy.MaHK
		JOIN GiaoVien ON Diem.MaGV = GiaoVien.MaGV
	END

	--execute [spDiem_GetAll]











GO
/****** Object:  StoredProcedure [dbo].[spDiem_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[spDiem_GetById]
	@MaHS varchar(30),
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		SELECT Diem.MaHS, TenHS, TenMH, TenHK, TenGV,
			   ISNULL(DiemMieng, '') AS DiemMieng,
			   ISNULL(Diem15Phut, '') AS Diem15Phut,
			   ISNULL(Diem1Tiet, '') AS Diem1Tiet,
			   ISNULL(DiemThi, '') AS DiemThi
		FROM Diem
		JOIN HocSinh ON Diem.MaHS = HocSinh.MaHS
		JOIN MonHoc ON Diem.MaMH = MonHoc.MaMH
		JOIN HocKy ON Diem.MaHK = HocKy.MaHK
		JOIN GiaoVien ON Diem.MaGV = GiaoVien.MaGV
		WHERE Diem.MaHS = @MaHS AND Diem.MaHK = @MaHK
	END




GO
/****** Object:  StoredProcedure [dbo].[spDiem_GetDiemHocSinh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spDiem_GetDiemHocSinh]
(
	@MaHS varchar(30),
	@MaLop bigint,
	@MaNH bigint,
	@MaHK int,
	@MaMH bigint
)
as
begin
select HocSinh.MaHS, HocSinh.TenHS, 
Diem.MaMH,
ISNULL(Diem.DiemMieng, '') AS DiemMieng,
ISNULL(Diem.Diem15Phut, '') as Diem15Phut,
ISNULL(Diem.Diem1Tiet, '') as Diem1Tiet,
ISNULL(Diem.DiemThi, '')as DiemThi,
ISNULL(Diem.DiemTK, '') as DiemTK
from HocSinh
	join HocSinhLop on HocSinhLop.MaHS = HocSinh.MaHS
	join Lop on Lop.MaLop = HocSinhLop.MaLop
	left join Diem on Diem.MaLop = Lop.MaLop 
	and Diem.MaNH = HocSinhLop.MaNH 
	and Diem.MaHS = HocSinh.MaHS
where HocSinhLop.MaLop = @MaLop
	and HocSinhLop.MaNH = @MaNH
	and Diem.MaMH = @MaMH
	and Diem.MaHK = @MaHK
	and Diem.MaHS = @MaHS
end
--execute spDiem_HocSinh_Filter 'HS0001', 10,1,1,1

--select * from Diem



GO
/****** Object:  StoredProcedure [dbo].[spDiem_HocSinh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spDiem_HocSinh]
(
	@MaLop bigint,
	@MaNH bigint
)
as
begin
select HocSinh.MaHS, HocSinh.TenHS, TenLop
from HocSinh
	join HocSinhLop on HocSinhLop.MaHS = HocSinh.MaHS
	join Lop on Lop.MaLop = HocSinhLop.MaLop
where HocSinhLop.MaLop = @MaLop
	and HocSinhLop.MaNH = @MaNH	
	
end

--execute [spDiem_HocSinh] 10, 1


GO
/****** Object:  StoredProcedure [dbo].[spDiem_HocSinh_Filter]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spDiem_HocSinh_Filter]
(
	@MaHS varchar(30),
	@MaLop bigint,
	@MaNH bigint,
	@MaHK int,
	@MaMH bigint
)
as
begin
select HocSinh.MaHS, HocSinh.TenHS, 
Diem.MaMH,
ISNULL(Diem.DiemMieng, '') AS DiemMieng,
ISNULL(Diem.Diem15Phut, '') as Diem15Phut,
ISNULL(Diem.Diem1Tiet, '') as Diem1Tiet,
ISNULL(Diem.DiemThi, '')as DiemThi,
ISNULL(Diem.DiemTK, '') as DiemTK
from HocSinh
	join HocSinhLop on HocSinhLop.MaHS = HocSinh.MaHS
	join Lop on Lop.MaLop = HocSinhLop.MaLop
	left join Diem on Diem.MaLop = Lop.MaLop 
	and Diem.MaNH = HocSinhLop.MaNH 
	and Diem.MaHS = HocSinh.MaHS
where HocSinhLop.MaLop = @MaLop
	and HocSinhLop.MaNH = @MaNH
	and Diem.MaMH = @MaMH
	and Diem.MaHK = @MaHK
	and Diem.MaHS = @MaHS
end
--execute spDiem_HocSinh_Filter 10,1,1,1

--select * from Diem



GO
/****** Object:  StoredProcedure [dbo].[spDiem_HocSinhTheoLop]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spDiem_HocSinhTheoLop]
	(
		@MaLop bigint,
		@MaMH bigint,
		@MaHK int,
		@MaNH bigint
	)
	as
	begin
	select distinct HocSinh.TenHS, HocSinh.MaHS, Diem.* From HocSinh
	join HocSinhLop on HocSinhLop.MaHS = HocSinh.MaHS
	join Lop on Lop.MaLop = HocSinhLop.MaLop
	left join Diem on Lop.MaLop = Diem.MaLop
	where Lop.MaLop = @MaLop 
	

	end



GO
/****** Object:  StoredProcedure [dbo].[spDiem_KetQuaHocTap]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[spDiem_KetQuaHocTap]
	(
		@MaHS varchar(30),
		@MaLop bigint
	)
	as
	begin
			select 
			HocSinh.MaHS, TenHS,  MonHoc.TenMH, MonHoc.MaMH,
			ISNULL(DiemMieng, '') as DiemMieng, 
			ISNULL(Diem15Phut, '') as Diem15Phut, 
			ISNULL(Diem1Tiet, '') as Diem1Tiet, 
			ISNULL(DiemThi, 0) as DiemThi, 
			ISNULL(DiemTK, '') as DiemTK, 
			Diem.MaHK
			from HocSinh
			join HocSinhLop on HocSinhLop.MaHS = HocSinh.MaHS
			join Lop on Lop.MaLop = HocSinhLop.MaLop
			join Diem on Diem.MaHS = HocSinh.MaHS 
			join NamHoc on Diem.MaNH = NamHoc.MaNH	
			join MonHoc on MonHoc.MaMH = Diem.MaMH
			where Lop.MaLop = @MaLop 
			
			and Diem.MaHS = @MaHS and NamHoc.NamDangHoc = 1

	end

	--[spDiem_KetQuaHocTap] 'HS0001',1





GO
/****** Object:  StoredProcedure [dbo].[spDiem_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spDiem_Remove]
	@MaHS varchar(255),
	@MaMH bigint,
	@MaHK bigint,
	@MaGV bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM Diem
		WHERE MaHS = @MaHS AND MaMH = @MaMH AND MaHK = @MaHK AND MaGV = @MaGV
	END











GO
/****** Object:  StoredProcedure [dbo].[spDiem_ThemDiem]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spDiem_ThemDiem]
(
	@MaHS varchar(30),
	@MaMH bigint,
	@MaHK int
)
as
begin
	insert into Diem(MaHS, MaMH, MaHK) Values(@MaHS, @MaMH, @MaHK)
end




GO
/****** Object:  StoredProcedure [dbo].[spGetHocBa]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetHocBa]
(
	@maHS varchar(30),
	@MaLop int,
	@MaNH int
)
as
begin
select TenMH,  [1] as HK1, 
[2] as HK2,
((case when [1] is null then 0 else [1] end) +  (case when [2] is null then 0 else [2] end)*2)/3 as CaNam
from 
(
  select d.MaMH, TenMH, MaHK, case when DiemTK is null then 0 else DiemTK end as DiemTK
  from Diem d right join MonHoc mh on 
  d.MaMH = mh.MaMH and d.MaHS =  @maHS and 
  d.MaLop =  cast(@MaLop as varchar(20))  and d.MaNH = cast(@MaNH as varchar(20)) 
  left join Lop on Lop.MaLop = d.MaLop
) src
pivot
(
  avg(DiemTK)
  for MaHK in  ([1], [2])
) piv;

end

--execute spGetHocBa 'HS0001', 10, 1

--select * from Diem



GO
/****** Object:  StoredProcedure [dbo].[spGiangDay_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiangDay_Add]
	@MaGV varchar(255),
	@MaMH bigint
AS
	BEGIN
		SET NOCOUNT ON
		--INSERT GiangDay VALUES (@MaGV, @MaMH, NULL, NULL)
	END









GO
/****** Object:  StoredProcedure [dbo].[spGiangDay_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiangDay_Edit]
	@MaGV bigint,
	@MaMH bigint,
	@MaLop bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON

		declare @demMonHoc int = (select count(GiangDay.MaMH)
								  from GiangDay
								  where GiangDay.MaMH = @MaMH)

		if(@demMonHoc <= 0)
			begin 
				insert into GiangDay(MaGV,MaMH,MaLop,MaHK) values(@MaGV,@MaMH, @MaLop, @MaHK)
			end
		else
			begin
				UPDATE GiangDay
				SET MaLop = @MaLop, MaHK = @MaHK, MaGV = @MaGV, MaMH = @MaMH
				WHERE GiangDay.MaGV = @MaGV and GiangDay.MaMH = @MaMH
			end		
	END






GO
/****** Object:  StoredProcedure [dbo].[spGiangDay_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiangDay_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT GiaoVien.MaGV, ISNULL(TenGV, N'(Chưa phân giáo viên)') AS TenGV, MonHoc.MaMH, TenMH, Lop.MaLop, ISNULL(TenLop, N'(Chưa phân lớp)') AS TenLop, HocKy.MaHK, ISNULL(TenHK, N'') AS TenHK
		FROM GiangDay
		RIGHT JOIN GiaoVien ON GiangDay.MaGV = GiaoVien.MaGV
		RIGHT JOIN MonHoc ON GiangDay.MaMH = MonHoc.MaMH
		LEFT JOIN Lop ON GiangDay.MaLop = Lop.MaLop
		LEFT JOIN HocKy ON GiangDay.MaHK = HocKy.MaHK
	END






GO
/****** Object:  StoredProcedure [dbo].[spGiangDay_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiangDay_GetById]
	@MaGV bigint,
	@MaMH bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT GiaoVien.MaGV, TenGV, MonHoc.MaMH, TenMH, Lop.MaLop, TenLop, HocKy.MaHK, TenHK
		FROM GiangDay
		JOIN GiaoVien ON GiangDay.MaGV = GiaoVien.MaGV
		JOIN MonHoc ON GiangDay.MaMH = MonHoc.MaMH
		JOIN Lop ON GiangDay.MaLop = Lop.MaLop
		JOIN HocKy ON GiangDay.MaHK = HocKy.MaHK
		WHERE GiaoVien.MaGV = @MaGV AND MonHoc.MaMH = @MaMH
	END






GO
/****** Object:  StoredProcedure [dbo].[spGiangDay_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiangDay_Remove]
	@MaGV bigint,
	@MaMH bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM GiangDay
		WHERE MaGV = @MaGV AND MaMH = @MaMH
	END











GO
/****** Object:  StoredProcedure [dbo].[spGiangDay_TheoNH]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGiangDay_TheoNH]
@MaNH int
as
begin
select * from MonHoc
left join GiangDay on MonHoc.MaMH = GiangDay.MaMH and GiangDay.MaNH = @MaNH

end


GO
/****** Object:  StoredProcedure [dbo].[spGiaoVien_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiaoVien_Add]
	@TenGV nvarchar(100),
	@GioiTinh bit,
	@NgaySinh date,
	@DienThoai varchar(20),
	@Email varchar(30),
	@DiaChi nvarchar(100),
	@TaiKhoan varchar(30)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT GiaoVien (TenGV, GioiTinh, NgaySinh, DienThoai, Email, DiaChi, TaiKhoan)
		VALUES (@TenGV, @GioiTinh, @NgaySinh, @DienThoai, @Email, @DiaChi, @TaiKhoan)
	END











GO
/****** Object:  StoredProcedure [dbo].[spGiaoVien_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiaoVien_Edit]
	@MaGV bigint,
	@TenGV nvarchar(100),
	@GioiTinh bit,
	@NgaySinh date,
	@DienThoai varchar(20),
	@Email varchar(30),
	@DiaChi nvarchar(100)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE GiaoVien
		SET TenGV = @TenGV, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, DienThoai = @DienThoai, Email = @Email, DiaChi = @DiaChi
		WHERE MaGV = @MaGV
	END











GO
/****** Object:  StoredProcedure [dbo].[spGiaoVien_GetAccount]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiaoVien_GetAccount]
	@TenGV nvarchar(60)
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaGV FROM GiaoVien
		WHERE TenGV LIKE @TenGV
	END







GO
/****** Object:  StoredProcedure [dbo].[spGiaoVien_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiaoVien_GetAll]
(
	@term nvarchar(max),
	@maMH bigint
)
AS
	BEGIN
		SET NOCOUNT ON
		if(@maMH > 0)
			begin
			print('tham')
				SELECT MaGV, TenGV, GioiTinh, NgaySinh, DienThoai, Email, DiaChi, TaiKhoan, 
				LEFT(ChuyenMon, LEN(ChuyenMon)-1) AS ChuyenMon
				FROM
					(
						SELECT DISTINCT ST2.*,
							(
								SELECT MonHoc.TenMH + ', ' AS [text()]
								FROM ChuyenMon gd
								JOIN MonHoc ON gd.MaMH = MonHoc.MaMH
								WHERE ST2.MaGV = gd.MaGV
								and (TaiKhoan like N'%' + @term + '%' 
								or TenGV like N'%' + @term + '%' 
								or  NgaySinh like '%' + @term + '%' or 
								DienThoai like @term 
								or DiaChi like N'%' + @term + '%')
								and gd.MaMH = @maMH
								ORDER BY gd.MaGV
								FOR XML PATH ('')
							) [ChuyenMon]
						FROM GiaoVien ST2
					) [Main]
					where ChuyenMon is not null
			end
		else
			begin
			print('tham 2')
				SELECT MaGV, TenGV, GioiTinh, NgaySinh, DienThoai, Email, DiaChi, TaiKhoan,
					LEFT(ChuyenMon, LEN(ChuyenMon)-1) AS ChuyenMon
					FROM
						(
							SELECT DISTINCT ST2.*,
								(
									SELECT MonHoc.TenMH + ', ' AS [text()]
									FROM ChuyenMon gd
									JOIN MonHoc ON gd.MaMH = MonHoc.MaMH
									WHERE ST2.MaGV = gd.MaGV
									and (TaiKhoan like N'%' + @term + '%' 
									or TenGV like N'%' + @term + '%' 
									or  NgaySinh like '%' + @term + '%' 
									or DienThoai like @term 
									or DiaChi like N'%' + @term + '%')
									ORDER BY gd.MaGV
									FOR XML PATH ('')
								) [ChuyenMon]
							FROM GiaoVien ST2
						) [Main]
			end
	END

	--execute [spGiaoVien_GetAll] '', 1





GO
/****** Object:  StoredProcedure [dbo].[spGiaoVien_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiaoVien_GetById]
	@MaGV bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaGV, TenGV, GioiTinh, NgaySinh, DienThoai, Email, DiaChi, TaiKhoan, 
		LEFT(ChuyenMon, len(ChuyenMon)-1) AS ChuyenMon
		FROM
			(
				SELECT DISTINCT ST2.*,
					(
						SELECT CAST(MonHoc.MaMH as varchar(10)) + ',' AS [text()]
						FROM ChuyenMon
						JOIN MonHoc ON ChuyenMon.MaMH = MonHoc.MaMH
						WHERE ST2.MaGV = ChuyenMon.MaGV
						ORDER BY ChuyenMon.MaGV
						FOR XML PATH ('')
					) [ChuyenMon]
				FROM GiaoVien ST2
			) [Main]
		WHERE MaGV = @MaGV
	END


	--execute [spGiaoVien_GetById] 21








GO
/****** Object:  StoredProcedure [dbo].[spGiaoVien_GetID]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiaoVien_GetID]
	@TenDangNhap varchar(30)
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaGV FROM GiaoVien
		WHERE TaiKhoan = @TenDangNhap
	END







GO
/****** Object:  StoredProcedure [dbo].[spGiaoVien_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGiaoVien_Remove]
	@MaGV bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM GiaoVien WHERE MaGV = @MaGV
	END











GO
/****** Object:  StoredProcedure [dbo].[spHoatDongLienLac_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHoatDongLienLac_Add]
	@NoiDung ntext,
	@HinhThucGui nvarchar(50),
	@NgayGui date,
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		INSERT HoatDongLienLac (NoiDung, HinhThucGui, NgayGui, MaPH)
		VALUES (@NoiDung, @HinhThucGui, @NgayGui, @MaPH)
	END











GO
/****** Object:  StoredProcedure [dbo].[spHoatDongLienLac_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHoatDongLienLac_Edit]
	@MaTN bigint,
	@NoiDung ntext,
	@HinhThucGui nvarchar(50),
	@NgayGui date,
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE HoatDongLienLac
		SET NoiDung = @NoiDung, HinhThucGui = @HinhThucGui, NgayGui = @NgayGui, MaPH = @MaPH
		WHERE MaTN = @MaTN
	END











GO
/****** Object:  StoredProcedure [dbo].[spHoatDongLienLac_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHoatDongLienLac_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaTN, NoiDung, HinhThucGui, NgayGui, TenPH
		FROM HoatDongLienLac
		JOIN PhuHuynh ON HoatDongLienLac.MaPH = PhuHuynh.MaPH
	END











GO
/****** Object:  StoredProcedure [dbo].[spHoatDongLienLac_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHoatDongLienLac_GetById]
	@MaTN bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT NoiDung, HinhThucGui, NgayGui, TenPH
		FROM HoatDongLienLac
		JOIN PhuHuynh ON HoatDongLienLac.MaPH = PhuHuynh.MaPH
		WHERE MaTN = @MaTN
	END











GO
/****** Object:  StoredProcedure [dbo].[spHoatDongLienLac_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHoatDongLienLac_Remove]
	@MaTN bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM HoatDongLienLac WHERE MaTN = @MaTN
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocBa]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spHocBa]
	(
		@MaHS varchar(30),
		@MaLop bigint
	)
	as
	begin
	select *, ([1]+[2])/2 as 'Ca nam'
from 
(
 select 
			HocSinh.MaHS, TenHS,  MonHoc.TenMH, MonHoc.MaMH,			
			ISNULL(DiemTK, '') as DiemTK, 
			Diem.MaHK
			from HocSinh
			join HocSinhLop on HocSinh.MaHS = HocSinhLop.MaHS
			join Lop on Lop.MaLop = HocSinhLop.MaLop
			join Diem on Diem.MaHS = HocSinh.MaHS 
			join NamHoc on Diem.MaNH = NamHoc.MaNH	
			join MonHoc on MonHoc.MaMH = Diem.MaMH
			where Lop.MaLop = @MaLop 
			and Diem.MaHS = @MaHS 
			and NamHoc.NamDangHoc = 1
) src
pivot
(
  avg(DiemTK)
  for MaHK in ([1], [2])
) piv;
end

	--[spHocBa] 'HS0001', 1




GO
/****** Object:  StoredProcedure [dbo].[spHocBa_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocBa_Add]
	@MaHS varchar(255),
	@NienKhoa varchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT HocBa (MaHS, NienKhoa) VALUES (@MaHS, @NienKhoa)
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocBa_CapNhat]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spHocBa_CapNhat]
( 
	@MaHS varchar(30),
	@MaLop int,
	@MaNH int,
	@HocLuc nvarchar(50),
	@HanhKiem nvarchar(50),
	@NhanXet nvarchar(500),
	@SoNgayNghi int,
	@DiemCaNam float,
	@MaHK int
)
as
begin
	declare @isExists int = (select COUNT(MaHS) from ChiTietHocBa where MaHS = @MaHS and MaLop = @MaLop and MaNH = @MaNH and MaHK = @MaHK)
	if(@isExists <= 0)
	begin
		insert into 
		ChiTietHocBa(MaHS, MaLop, MaNH, MaHK, HocLuc, HanhKiem, SoNgayNghi, NhanXet, NgayCapNhat, DiemCaNam)
		values(@MaHS, @MaLop, @MaNH, @MaHK, @HocLuc, @HanhKiem, @SoNgayNghi, @NhanXet, GETDATE(), @DiemCaNam)
	end
	else
	begin
		update ChiTietHocBa
		set HocLuc = @HocLuc,
		HanhKiem = @HanhKiem,
		SoNgayNghi = @SoNgayNghi,
		NhanXet = @NhanXet,
		NgayCapNhat = GETDATE(),
		DiemCaNam = @DiemCaNam
		where MaHS = @MaHS and MaLop = @MaLop and MaNH = @MaNH and MaHK = @MaHK
	end
end

--execute spHocBa_CapNhat 'HS0001', 1,1, 'toft', 'tsdfsdfot', 'sfskdgha', 3


GO
/****** Object:  StoredProcedure [dbo].[spHocBa_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocBa_Edit]
	@MaHB bigint,
	@MaHS varchar(255),
	@NienKhoa varchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE HocBa
		SET MaHS = @MaHS, NienKhoa = @NienKhoa
		WHERE MaHB = @MaHB
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocBa_Get]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocBa_Get]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaHB, TenHS, NienKhoa
		FROM HocBa
		JOIN HocSinh ON HocBa.MaHS = HocSinh.MaHS
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocBa_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocBa_Remove]
	@MaHB bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM HocBa WHERE MaHB = @MaHB
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocKy_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocKy_Add]
	@TenHK nvarchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT HocKy (TenHK) VALUES (@TenHK)
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocKy_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocKy_Edit]
	@MaHK bigint,
	@TenHK nvarchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE HocKy
		SET TenHK = @TenHK
		WHERE MaHK = @MaHK
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocKy_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocKy_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT * FROM HocKy
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocKy_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocKy_Remove]
	@MaHK bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM HocKy WHERE MaHK = @MaHK
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocSinh_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocSinh_Add]
	@TenHS nvarchar(100),
	@GioiTinh bit,
	@NgaySinh date,
	@DienThoai varchar(20),
	@DiaChi nvarchar(MAX),
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		INSERT HocSinh (MaHS, TenHS, GioiTinh, NgaySinh, DienThoai, DiaChi, MaPH, DaXoa)
		OUTPUT inserted.MaHS
		VALUES ((SELECT dbo.HocSinh_GenerateNewID('HS')), @TenHS, @GioiTinh, @NgaySinh, @DienThoai, @DiaChi, @MaPH, 0)
	END

--[spHocSinh_Add] 'demo 2', 1,'2004-12-12', '23423532', '12 Quang Trung', 1, 2

--insert into dbo.Diem(MaHS, MaMH, MaHK)
--select
--    hs.MaHS,
--	MonHoc.MaMH,
--	HocKy.MaHK
--from HocSinh hs
--inner join Diem 
--on Diem.MaHS = hs.MaHS
--   inner join MonHoc on MonHoc.MaMH = Diem.MaMH
--   inner join HocKy on Diem.MaHK = HocKy.MaHK





GO
/****** Object:  StoredProcedure [dbo].[spHocSinh_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocSinh_Edit]
	@MaHS varchar(30),
	@TenHS nvarchar(100),
	@GioiTinh bit,
	@NgaySinh date,
	@DienThoai varchar(20),
	@DiaChi nvarchar(MAX),
	@MaLop bigint,
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE HocSinh
		SET TenHS = @TenHS, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, DienThoai = @DienThoai, DiaChi = @DiaChi, MaPH = @MaPH
		WHERE MaHS = @MaHS
	END











GO
/****** Object:  StoredProcedure [dbo].[spHocSinh_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[spHocSinh_GetAll]
(
	@term nvarchar(max),
	@maLop bigint,
	@maNH bigint
)
AS
	BEGIN
		SET NOCOUNT ON
		if(@maLop != 0 and @maNH != 0)
			begin
			SELECT HocSinh.MaHS,
				TenHS,
				GioiTinh,
				NgaySinh,
				DienThoai,
				DiaChi
			FROM HocSinh 
			join HocSinhLop on HocSinhLop.MaHS = HocSinh.MaHS
			join NamHoc on NamHoc.MaNH = HocSinhLop.MaNH
			join Lop on Lop.MaLop = HocSinhLop.MaLop
			where (TenHS like N'%' + @term + '%' or  NgaySinh like '%' + @term + '%' or DienThoai like @term) 
				 and HocSinhLop.MaLop = @maLop
				 and NamHoc.MaNH = @maNH
			end	

			else

			begin
			SELECT MaHS,
				   TenHS,
				   GioiTinh,
				   NgaySinh,
				   DienThoai,
				   DiaChi
				FROM HocSinh where TenHS like N'%' + @term + '%' or NgaySinh like '%' + @term + '%' or DienThoai like @term
			end
		END














GO
/****** Object:  StoredProcedure [dbo].[spHocSinh_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spHocSinh_GetById]
	@MaHS varchar(30)
AS
	BEGIN
		SET NOCOUNT ON
		--SELECT MaHS, TenHS, [Main].GioiTinh, [Main].NgaySinh, 
		--[Main].DienThoai, [Main].DiaChi,
		--[Main].MaPH, TenPH, 
		--LEFT(Lop, len(Lop)-1) AS Lop
		--FROM
		--	(
		--		SELECT DISTINCT ST2.*,
		--			(
		--				SELECT CAST(Lop.MaLop as varchar(10)) + ',' AS [text()]
		--				FROM HocSinhLop
		--				JOIN Lop ON Lop.MaLop = HocSinhLop.MaLop
		--				WHERE ST2.MaHS = HocSinhLop.MaHS
		--				FOR XML PATH ('')
		--			) [Lop]
		--		FROM HocSinh ST2
		--	) [Main]
		--join PhuHuynh on PhuHuynh.MaPH = [Main].MaPH
		SELECT DISTINCT HocSinh.MaHS,
						TenHS,
						HocSinh.GioiTinh,
						HocSinh.NgaySinh,
						HocSinh.DienThoai,
						HocSinh.DiaChi,
						MaPH,
						TenLop
		FROM HocSinh
		JOIN HocSinhLop ON HocSinh.MaHS = HocSinhLop.MaHS
		JOIN LopNamHoc ON HocSinhLop.MaLop = LopNamHoc.MaLop
		JOIN Lop ON LopNamHoc.MaLop = Lop.MaLop
		WHERE HocSinh.MaHS = @MaHS
	END

GO
/****** Object:  StoredProcedure [dbo].[spHocSinh_GetPhuHuynh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocSinh_GetPhuHuynh]
	@MaHS varchar(30)
AS
	BEGIN
		SELECT MaPH FROM HocSinh
		WHERE MaHS = @MaHS
	END

GO
/****** Object:  StoredProcedure [dbo].[spHocSinh_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spHocSinh_Remove]
	@MaHS varchar(30)
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM HocSinh WHERE MaHS = @MaHS
	END











GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLogin]
	@Username varchar(255),
	@Password nvarchar(150)
AS
	BEGIN
		SET NOCOUNT ON
		SELECT * FROM TaiKhoan
		WHERE TenDangNhap = @Username AND MatKhau = @Password COLLATE SQL_Latin1_General_CP1_CS_AS
	END











GO
/****** Object:  StoredProcedure [dbo].[spLop_CuaHocSinh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spLop_CuaHocSinh]
@MaHS varchar(30)
as
begin
select Lop.* from Lop
join HocSinhLop on Lop.MaLop = HocSinhLop.MaLop
join HocSinh on HocSinh.MaHS = HocSinhLop.MaHS
where HocSinh.MaHS = @MaHS
end





GO
/****** Object:  StoredProcedure [dbo].[spLop_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLop_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT * FROM Lop
	END











GO
/****** Object:  StoredProcedure [dbo].[spLop_GetByYear]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLop_GetByYear]
	@MaNH bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT *
		FROM Lop
		JOIN LopNamHoc ON Lop.MaLop = LopNamHoc.MaLop
		JOIN NamHoc ON NamHoc.MaNH = LopNamHoc.MaNH
		WHERE NamHoc.MaNH = @MaNH
	END




GO
/****** Object:  StoredProcedure [dbo].[spLop_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLop_Remove]
	@MaLop bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM Lop WHERE MaLop = @MaLop
	END











GO
/****** Object:  StoredProcedure [dbo].[spLopChuNhiem_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLopChuNhiem_Add]
	@MaLop bigint,
	@MaGV bigint,
	@NienKhoa varchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT LopChuNhiem (MaLop, MaGV, NienKhoa)
		VALUES (@MaLop, @MaGV, @NienKhoa)
	END











GO
/****** Object:  StoredProcedure [dbo].[spLopChuNhiem_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLopChuNhiem_Edit]
	@MaLop bigint,
	@MaGV bigint,
	@NienKhoa varchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE LopChuNhiem
		SET NienKhoa = @NienKhoa
		WHERE MaLop = @MaLop AND MaGV = @MaGV
	END











GO
/****** Object:  StoredProcedure [dbo].[spLopChuNhiem_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLopChuNhiem_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT GiaoVien.MaGV, TenGV, Lop.MaLop, TenLop, SiSo, NienKhoa
		FROM LopChuNhiem
		JOIN Lop ON LopChuNhiem.MaLop = Lop.MaLop
		JOIN GiaoVien ON LopChuNhiem.MaGV = GiaoVien.MaGV
	END











GO
/****** Object:  StoredProcedure [dbo].[spLopChuNhiem_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLopChuNhiem_Remove]
	@MaLop bigint,
	@MaGV bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM LopChuNhiem WHERE MaLop = @MaLop AND MaGV = @MaGV
	END











GO
/****** Object:  StoredProcedure [dbo].[spMonHoc_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMonHoc_Add]
	@TenMH nvarchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT MonHoc (TenMH) VALUES (@TenMH)
	END











GO
/****** Object:  StoredProcedure [dbo].[spMonHoc_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMonHoc_Edit]
	@MaMH bigint,
	@TenMH nvarchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE MonHoc
		SET TenMH = @TenMH
		WHERE MaMH = @MaMH
	END











GO
/****** Object:  StoredProcedure [dbo].[spMonHoc_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMonHoc_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT * FROM MonHoc
	END











GO
/****** Object:  StoredProcedure [dbo].[spMonHoc_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMonHoc_GetById]
	@MaMH bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT TenMH FROM MonHoc
		WHERE MaMH = @MaMH
	END











GO
/****** Object:  StoredProcedure [dbo].[spMonHoc_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spMonHoc_Remove]
	@MaMH bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM MonHoc WHERE MaMH = @MaMH
	END











GO
/****** Object:  StoredProcedure [dbo].[spMonHoc_TheoGV]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spMonHoc_TheoGV]
@MaGV int
as
begin
select MonHoc.* from GiaoVien join
ChuyenMon  on ChuyenMon.MaGV = GiaoVien.MaGV
join MonHoc on MonHoc.MaMH = ChuyenMon.MaMH
where GiaoVien.MaGV = @MaGV
end


GO
/****** Object:  StoredProcedure [dbo].[spNamHoc_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spNamHoc_Add]
	@TenNH varchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT NamHoc (TenNH) VALUES (@TenNH)
	END











GO
/****** Object:  StoredProcedure [dbo].[spNamHoc_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spNamHoc_Edit]
	@MaNH bigint,
	@TenNH varchar(50)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE NamHoc
		SET TenNH = @TenNH
		WHERE MaNH = @MaNH
	END











GO
/****** Object:  StoredProcedure [dbo].[spNamHoc_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spNamHoc_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT * FROM NamHoc
	END








GO
/****** Object:  StoredProcedure [dbo].[spNamHoc_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spNamHoc_Remove]
	@MaNH bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM NamHoc WHERE MaNH = @MaNH
	END










GO
/****** Object:  StoredProcedure [dbo].[spNamHoc_TheoLop]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spNamHoc_TheoLop]
@MaLop int
as
begin
select NamHoc.* from Lop
join LopNamHoc on Lop.MaLop = LopNamHoc.MaLop
join NamHoc on NamHoc.MaNH = LopNamHoc.MaNH
where Lop.MaLop = @MaLop
end



GO
/****** Object:  StoredProcedure [dbo].[spNamHocHocKy_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spNamHocHocKy_Add]
	@MaNH bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		INSERT NamHocHocKy VALUES (@MaNH, @MaHK)
	END











GO
/****** Object:  StoredProcedure [dbo].[spNamHocHocKy_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spNamHocHocKy_Edit]
	@MaNH bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE NamHocHocKy
		SET MaHK = @MaHK
		WHERE MaNH = @MaNH
	END











GO
/****** Object:  StoredProcedure [dbo].[spNamHocHocKy_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spNamHocHocKy_Remove]
	@MaNH bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM NamHocHocKy WHERE MaNH = @MaNH AND MaHK = @MaHK
	END










GO
/****** Object:  StoredProcedure [dbo].[spPhanHoi_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhanHoi_Add]
	@TieuDe nvarchar(500),
	@NoiDung nvarchar(max),
	@Email varchar(30),
	@DienThoai varchar(20),
	@NguoiPhanHoi nvarchar(60),
	@NgayGui date
AS
	BEGIN
		SET NOCOUNT ON
		INSERT PhanHoi (TieuDe, NoiDung, Email, DienThoai, NguoiPhanHoi, NgayGui)
		VALUES (@TieuDe, @NoiDung, @Email, @DienThoai, @NguoiPhanHoi, @NgayGui)
	END











GO
/****** Object:  StoredProcedure [dbo].[spPhanHoi_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhanHoi_Edit]
	@IdPH bigint,
	@TieuDe nvarchar(500),
	@NoiDung nvarchar(max),
	@Email varchar(30),
	@DienThoai varchar(20),
	@NguoiPhanHoi nvarchar(60),
	@NgayGui date
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE PhanHoi
		SET TieuDe = @TieuDe, NoiDung = @NoiDung, Email = @Email, DienThoai = @DienThoai, NguoiPhanHoi = @NguoiPhanHoi, NgayGui = @NgayGui
		WHERE IdPH = @IdPH
	END











GO
/****** Object:  StoredProcedure [dbo].[spPhanHoi_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhanHoi_GetAll]
AS
	BEGIN
		SET NOCOUNT ON
		SELECT * FROM PhanHoi
	END











GO
/****** Object:  StoredProcedure [dbo].[spPhanHoi_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhanHoi_GetById]
	@IdPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT * FROM PhanHoi
		WHERE IdPH = @IdPH
	END











GO
/****** Object:  StoredProcedure [dbo].[spPhanHoi_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhanHoi_Remove]
	@IdPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM PhanHoi WHERE IdPH = @IdPH
	END











GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_Add]
	@TenPH nvarchar(100),
	@GioiTinh bit,
	@NgaySinh date,
	@Email varchar(50),
	@DiaChi nvarchar(100),
	@DienThoai varchar(20)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT PhuHuynh (TenPH, GioiTinh, NgaySinh, Email, DiaChi, DienThoai)
		OUTPUT inserted.MaPH
		VALUES (@TenPH, @GioiTinh, @NgaySinh, @Email, @DiaChi, @DienThoai)
	END





GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_Edit]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_Edit]
	@MaPH bigint,
	@TenPH nvarchar(100),
	@GioiTinh bit,
	@NgaySinh date,
	@DienThoai varchar(20),
	@Email varchar(50),
	@DiaChi nvarchar(100)
AS
	BEGIN
		SET NOCOUNT ON
		UPDATE PhuHuynh
		SET TenPH = @TenPH, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, DienThoai = @DienThoai, Email = @Email, DiaChi = @DiaChi
		WHERE MaPH = @MaPH
	END






GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_GetAccount]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_GetAccount]
	@TenPH nvarchar(60)
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaPH FROM PhuHuynh
		WHERE TenPH LIKE @TenPH
	END

GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_GetAll]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPhuHuynh_GetAll]
(
	@Term nvarchar(max),
	@MaLop bigint
)
as
begin

		select PhuHuynh.* from PhuHuynh
end





GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_GetById]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_GetById]
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaPH, TenPH, GioiTinh, NgaySinh, DienThoai, Email, DiaChi, TaiKhoan
		FROM PhuHuynh
		WHERE MaPH = @MaPH
	END











GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_GetHocSinh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_GetHocSinh]
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaHS, TenHS FROM HocSinh
		WHERE MaPH = @MaPH
	END

GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_GetID]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_GetID]
	@TenDangNhap varchar(30)
AS
	BEGIN
		SET NOCOUNT ON
		SELECT MaPH FROM PhuHuynh
		WHERE TaiKhoan = @TenDangNhap
	END

GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_LayTaiKhoan]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_LayTaiKhoan]
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		SELECT TaiKhoan FROM PhuHuynh
		WHERE MaPH = @MaPH
	END

GO
/****** Object:  StoredProcedure [dbo].[spPhuHuynh_Remove]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spPhuHuynh_Remove]
	@MaPH bigint
AS
	BEGIN
		SET NOCOUNT ON
		DELETE FROM PhuHuynh WHERE MaPH = @MaPH
	END











GO
/****** Object:  StoredProcedure [dbo].[spRole]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spRole]
	@Username varchar(255)
AS
	BEGIN
		SELECT TenVT
		FROM PhanQuyen
		JOIN TaiKhoan ON PhanQuyen.TenDangNhap = TaiKhoan.TenDangNhap
		JOIN VaiTro ON PhanQuyen.MaVT = VaiTro.MaVT
		WHERE TaiKhoan.TenDangNhap = @Username
	END


GO
/****** Object:  StoredProcedure [dbo].[spTaiKhoan_Add]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spTaiKhoan_Add]
	@TenDangNhap varchar(30),
	@MatKhau nvarchar(30)
AS
	BEGIN
		INSERT TaiKhoan (TenDangNhap, MatKhau)
		VALUES (@TenDangNhap, @MatKhau)
	END

GO
/****** Object:  StoredProcedure [dbo].[spTaiKhoan_GetPassword]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spTaiKhoan_GetPassword]
	@Username varchar(30)
AS
	BEGIN
		SELECT MatKhau FROM TaiKhoan
		WHERE TenDangNhap = @Username
	END

GO
/****** Object:  StoredProcedure [dbo].[spThongKeHocLuc_Get]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spThongKeHocLuc_Get] --[spThongKeHocLuc_Get] 1,10,0,'Kém'
	@MaNH bigint,
	@MaLop bigint,
	@MaHK int,
	@MaHL nvarchar(100)
AS
	BEGIN
		SET NOCOUNT ON
		IF (@MaNH = 0 AND @MaLop = 0 AND @MaHK = 0 OR @MaHK = 3)
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.HocLuc = @MaHL
				
			END
		ELSE IF (@MaNH = 0 AND @MaLop = 0 AND @MaHL = '')
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaHK = @MaHK
			END
		ELSE IF (@MaNH = 0 AND @MaHK = 0 AND @MaHL = '')
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaLop = @MaLop
			END
		ELSE IF (@MaLop = 0 AND @MaHK = 0 AND @MaHL = '')
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaNH = @MaNH
			END
		ELSE IF (@MaNH = 0 AND @MaLop = 0)
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaHK = @MaHK AND
					  ChiTietHocBa.HocLuc = @MaHL
			END
		ELSE IF (@MaNH = 0 AND @MaHK = 0)
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaLop = @MaLop AND
					  ChiTietHocBa.HocLuc = @MaHL
			END
		ELSE IF (@MaNH = 0 AND @MaHL = '')
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaLop = @MaLop AND
					  ChiTietHocBa.MaHK = @MaHK
			END
		ELSE IF (@MaLop = 0 AND @MaHK = 0)
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.HocLuc = @MaHL
				
			END
		ELSE IF (@MaLop = 0 AND @MaHL = '')
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaHK = @MaHK
				
			END
		ELSE IF (@MaHK = 0 AND @MaHL = '')
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop
				
			END
		ELSE IF (@MaNH = 0)
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaLop = @MaLop AND
					  ChiTietHocBa.MaHK = @MaHK AND
					  HocLuc = @MaHL
				
			END
		ELSE IF (@MaLop = 0)
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaHK = @MaHK AND
					  HocLuc = @MaHL
				
			END
		ELSE IF (@MaHK = 0)
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop AND
					  HocLuc = @MaHL
				
			END
		ELSE IF (@MaHL = '')
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop AND
					  ChiTietHocBa.MaHK = @MaHK
				
			END
		ELSE
			BEGIN
				SELECT HocSinh.MaHS, TenHS, GioiTinh, NgaySinh, TenLop
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN Lop on Lop.MaLop = LopNamHoc.MaLop 
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK

				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop AND
					  ChiTietHocBa.MaHK = @MaHK AND
					  HocLuc = @MaHL
				
			END
	END



GO
/****** Object:  StoredProcedure [dbo].[spThongKeHocLucGioi]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spThongKeHocLucGioi]
	@MaNH bigint,
	@MaLop bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		IF (@MaHK != 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop AND
					  HocKy.MaHK = @MaHK 
					 
			END
		ELSE IF (@MaHK = 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop 
					 
			END
	END



GO
/****** Object:  StoredProcedure [dbo].[spThongKeHocLucKha]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spThongKeHocLucKha]
	@MaNH bigint,
	@MaLop bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		IF (@MaHK != 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop AND
					  ChiTietHocBa.HocLuc = N'Khá' AND
					  HocKy.MaHK = @MaHK 
					 
			END
		ELSE IF (@MaHK = 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop 
					  and ChiTietHocBa.HocLuc = N'Khá'
			END
	END



GO
/****** Object:  StoredProcedure [dbo].[spThongKeHocLucTrungBinh]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spThongKeHocLucTrungBinh]
	@MaNH bigint,
	@MaLop bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		IF (@MaHK != 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop AND
					  HocKy.MaHK = @MaHK
			END
		ELSE IF (@MaHK = 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop 
			END
	END



GO
/****** Object:  StoredProcedure [dbo].[spThongKeHocLucYeu]    Script Date: 2018-09-05 7:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spThongKeHocLucYeu]
	@MaNH bigint,
	@MaLop bigint,
	@MaHK int
AS
	BEGIN
		SET NOCOUNT ON
		IF (@MaHK != 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop AND
					  HocKy.MaHK = @MaHK 
			END
		ELSE IF (@MaHK = 0)
			BEGIN
				SELECT COUNT(HocLuc) AS SoLuong
				FROM ChiTietHocBa
				JOIN HocSinh ON ChiTietHocBa.MaHS =	HocSinh.MaHS
				JOIN LopNamHoc ON ChiTietHocBa.MaLop = LopNamHoc.MaLop AND ChiTietHocBa.MaNH = LopNamHoc.MaNH
				JOIN HocKy ON ChiTietHocBa.MaHK = HocKy.MaHK
				
				WHERE ChiTietHocBa.MaNH = @MaNH AND
					  ChiTietHocBa.MaLop = @MaLop 
			END
	END



GO
USE [master]
GO
ALTER DATABASE [QuanLyHocBa] SET  READ_WRITE 
GO
