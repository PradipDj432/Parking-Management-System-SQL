USE [master]
GO
/****** Object:  Database [example]    Script Date: 10/9/2023 4:29:36 PM ******/
CREATE DATABASE [example]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'example', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS04\MSSQL\DATA\example.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'example_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS04\MSSQL\DATA\example_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [example] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [example].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [example] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [example] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [example] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [example] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [example] SET ARITHABORT OFF 
GO
ALTER DATABASE [example] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [example] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [example] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [example] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [example] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [example] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [example] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [example] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [example] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [example] SET  ENABLE_BROKER 
GO
ALTER DATABASE [example] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [example] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [example] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [example] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [example] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [example] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [example] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [example] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [example] SET  MULTI_USER 
GO
ALTER DATABASE [example] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [example] SET DB_CHAINING OFF 
GO
ALTER DATABASE [example] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [example] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [example] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [example] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [example] SET QUERY_STORE = ON
GO
ALTER DATABASE [example] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [example]
GO
/****** Object:  Table [dbo].[company]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[company_emailid] [varchar](255) NOT NULL,
	[password] [varchar](16) NULL,
	[name] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[total_parking] [int] NULL,
	[two_parking] [int] NULL,
	[four_parking] [int] NULL,
	[two_charge] [int] NULL,
	[four_charge] [int] NULL,
	[two_panalty] [int] NULL,
	[four_panalty] [int] NULL,
	[contact_no] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[company_emailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[realtime]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[realtime](
	[company_emailid] [varchar](255) NULL,
	[user_emailid] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[vihecle_plate] [varchar](255) NULL,
	[parking_spot_no] [int] NULL,
	[entrytime] [time](7) NULL,
	[exittime] [time](7) NULL,
	[vehicle_type] [int] NULL,
	[parking_charge] [int] NOT NULL,
	[panalty_charge] [int] NULL,
	[parking_date] [date] NULL,
	[parking_status] [int] NULL,
	[user_contact_no] [varchar](16) NULL,
	[user_booking_id] [int] IDENTITY(10000,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siteadmin]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siteadmin](
	[siteadmin_emailid] [varchar](255) NOT NULL,
	[password] [varchar](16) NOT NULL,
 CONSTRAINT [PK__siteadmi__888C92D4B36AC4DF] PRIMARY KEY CLUSTERED 
(
	[siteadmin_emailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_emailid] [varchar](255) NOT NULL,
	[password] [varchar](16) NULL,
	[name] [varchar](255) NULL,
	[contact_no] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_emailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[watchman]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[watchman](
	[watchman_emailid] [varchar](255) NOT NULL,
	[password] [varchar](16) NULL,
	[company_emailid] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[watchman_emailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company1@example.com', N'optimum', N'optimum', N'isckon cross road', 100, 50, 50, 100, 200, 50, 100, N'555-1234-5678')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company10@example.com', N'passwordstu', N'789ABC Company', N'789 Main St, Anytown USA', 175, 75, 100, 70, 140, 20, 40, N'555-6666-7777')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company11@example.com', N'passwordvwx', N'123XYZ Company', N'123 Maple St, Anytown USA', 250, 100, 150, 40, 80, 5, 10, N'555-8888-9999')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company12@example.com', N'passwordyza', N'456ABC Company', N'456 Oak St, Anytown USA', 100, 40, 60, 80, 160, 25, 50, N'555-2222-3333')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company2@example.com', N'password456', N'XYZ Company', N'456 Oak St, Anytown USA', 200, 100, 100, 75, 150, 25, 50, N'555-9876-5432')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company3@example.com', N'password789', N'123 Company', N'789 Elm St, Anytown USA', 150, 75, 75, 50, 100, 10, 20, N'555-5555-5555')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company4@example.com', N'passwordabc', N'ldce', N'456 Maple St, Anytown USA', 50, 25, 25, 200, 400, 100, 200, N'555-1111-2222')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company5@example.com', N'passworddef', N'optimum', N'789 Pine St, Anytown USA', 300, 150, 150, 80, 160, 30, 60, N'555-4444-3333')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company6@example.com', N'passwordghi', N'ABC123 Company', N'123 Oak St, Anytown USA', 75, 30, 45, 150, 250, 75, 150, N'555-7777-8888')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company7@example.com', N'passwordjkl', N'XYZ123 Company', N'456 Pine St, Anytown USA', 125, 60, 65, 60, 120, 15, 30, N'555-2222-1111')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company8@example.com', N'passwordmno', N'123ABC Company', N'789 Oak St, Anytown USA', 200, 80, 120, 90, 180, 40, 80, N'555-9999-0000')
INSERT [dbo].[company] ([company_emailid], [password], [name], [address], [total_parking], [two_parking], [four_parking], [two_charge], [four_charge], [two_panalty], [four_panalty], [contact_no]) VALUES (N'company9@example.com', N'passwordpqr', N'456XYZ Company', N'456 Pine St, Anytown USA', 50, 20, 30, 120, 200, 50, 100, N'555-3333-4444')
GO
INSERT [dbo].[siteadmin] ([siteadmin_emailid], [password]) VALUES (N'admin@test.com', N'password')
GO
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user1@example.com', N'password1', N'user1', N'1234567890')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user10@example.com', N'password10', N'user10', N'5551230000')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user11@example.com', N'password11', N'user11', N'1237895550')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user12@example.com', N'password12', N'user12', N'5550007891')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user13@example.com', N'password13', N'user13', N'5557890001')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user14@example.com', N'password14', N'user14', N'1234567891')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user15@example.com', N'password15', N'user15', N'5557894561')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user16@example.com', N'password16', N'user16', N'5551237891')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user17@example.com', N'password17', N'user17', N'1230004561')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user18@example.com', N'password18', N'user18', N'1234567892')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user19@example.com', N'password19', N'user19', N'5550007892')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user2@example.com', N'password2', N'user2', N'9876543210')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user20@example.com', N'password20', N'user20', N'5557890002')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user3@example.com', N'password3', N'user3', N'5551234567')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user4@example.com', N'password4', N'user4', N'1235557890')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user5@example.com', N'password5', N'user5', N'1234560000')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user6@example.com', N'password6', N'user6', N'5550001234')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user7@example.com', N'password7', N'user7', N'1230007890')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user8@example.com', N'password8', N'user8', N'1235550000')
INSERT [dbo].[users] ([user_emailid], [password], [name], [contact_no]) VALUES (N'user9@example.com', N'password9', N'user9', N'5557891234')
GO
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman1@example.com', N'password1', N'company1@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman10@example.com', N'password10', N'company10@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman11@example.com', N'password11', N'company11@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman12@example.com', N'password12', N'company12@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman13@example.com', N'password13', N'company13@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman14@example.com', N'password14', N'company14@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman15@example.com', N'password15', N'company15@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman16@example.com', N'password16', N'company16@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman17@example.com', N'password17', N'company17@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman18@example.com', N'password18', N'company18@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman19@example.com', N'password19', N'company19@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman2@example.com', N'password2', N'company2@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman20@example.com', N'password20', N'company20@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman3@example.com', N'password3', N'company3@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman4@example.com', N'password4', N'company4@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman5@example.com', N'password5', N'company5@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman6@example.com', N'password6', N'company6@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman7@example.com', N'password7', N'company7@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman8@example.com', N'password8', N'company8@example.com')
INSERT [dbo].[watchman] ([watchman_emailid], [password], [company_emailid]) VALUES (N'watchman9@example.com', N'password9', N'company9@example.com')
GO
ALTER TABLE [dbo].[realtime]  WITH CHECK ADD  CONSTRAINT [FK_realtime_company] FOREIGN KEY([company_emailid])
REFERENCES [dbo].[company] ([company_emailid])
GO
ALTER TABLE [dbo].[realtime] CHECK CONSTRAINT [FK_realtime_company]
GO
ALTER TABLE [dbo].[realtime]  WITH CHECK ADD  CONSTRAINT [FK_realtime_users] FOREIGN KEY([user_emailid])
REFERENCES [dbo].[users] ([user_emailid])
GO
ALTER TABLE [dbo].[realtime] CHECK CONSTRAINT [FK_realtime_users]
GO
/****** Object:  StoredProcedure [dbo].[GetAddBookingSP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAddBookingSP]
       @company_emailid varchar(100),
	   @user_emailid varchar(100),
	   @vehicle_plate varchar(100),
	   @parking_spot_no int,
	   @entrytime time(7),
	   @exittime time(7),
	   @vehicle_type bit
AS
BEGIN
  DECLARE @UserName VARCHAR(100)
  DECLARE @UserContact VARCHAR(100)

  
  SELECT @UserContact = users.contact_no FROM users WHERE user_emailid = @user_emailid
  SELECT @UserName = users.name FROM users WHERE user_emailid = @user_emailid
  
  INSERT INTO realtime (
                        company_emailid,
						user_emailid,
						username,
						vihecle_plate,
						parking_spot_no,
						entrytime,
						exittime,
						vehicle_type,
						parking_charge,
						panalty_charge,
						parking_date,
						parking_status,
						user_contact_no)
  VALUES (
          @company_emailid, 
		  @user_emailid,
		  @UserName, 
		  @vehicle_plate,
		  @parking_spot_no,
		  @entrytime,
		  @exittime,
		  @vehicle_type,0,0,
		  CAST(GETDATE() AS DATE), 0,
		  @UserContact)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminCompanyInfoSP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetAdminCompanyInfoSP]
as
select r.company_emailid, sum(r.parking_charge + r.panalty_charge), count(r.parking_status) from realtime as r group by r.company_emailid
GO
/****** Object:  StoredProcedure [dbo].[GetAdminDashboard]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminDashboard]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @admindashboardtable AS TABLE (
        Metric VARCHAR(50),
        Value INT
    );

	--Get total company
	INSERT INTO @admindashboardtable (Metric,Value)
	SELECT 'totalcompany',count(company.company_emailid) From company

    -- Get total parking slots
    INSERT INTO @admindashboardtable (Metric, Value)
    SELECT 'totalparking',sum(company.total_parking) From company

    -- Get total two-wheeler parking slots
    INSERT INTO @admindashboardtable (Metric, Value)
    SELECT 'totaltwowheeler', SUM(company.two_parking) FROM company;

    -- Get total four-wheeler parking slots
    INSERT INTO @admindashboardtable (Metric, Value)
    SELECT 'totalfourwheeler', SUM(company.four_parking) FROM company;

    -- Get total in-use slot
    INSERT INTO @admindashboardtable (Metric, Value)
    SELECT 'totalinuse', COUNT(realtime.user_booking_id) FROM realtime where parking_status=0;
    
	-- Get total in-use two
	INSERT INTO @admindashboardtable (Metric, Value)
    SELECT 'totalinusetwo', COUNT(realtime.user_booking_id) FROM realtime where (parking_status=0 or parking_status=1) and vehicle_type=0;

	-- Get total in-use four
	INSERT INTO @admindashboardtable (Metric, Value)
    SELECT 'totalinusefour', COUNT(realtime.user_booking_id) FROM realtime where (parking_status=0 or parking_status=1) and vehicle_type=1;

    SELECT *
    FROM @admindashboardtable;

END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllCompanySP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCompanySP]
AS
BEGIN
    SELECT company.company_emailid, company.name,company.address FROM company;
END
GO
/****** Object:  StoredProcedure [dbo].[GetChangeParkingStatusSP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetChangeParkingStatusSP]
       @user_booking_id varchar(100),
	   @flag int
as

-- for the prebook to live --- flag->1
-- for the live to end --- flag->2
if(@flag=1 or @flag=2)
begin
update realtime set parking_status = parking_status+1 where user_booking_id=@user_booking_id
end

-- for the cancel --> prebook to cancel flag->3
else if(@flag=3)
begin
update realtime set parking_status = parking_status+3 where user_booking_id=@user_booking_id
end
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyDashboard]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompanyDashboard] @company_emailid VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @companydashboardtable AS TABLE (
        Metric VARCHAR(50),
        Value INT
    );

    -- Get total parking slots
    INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TotalParkingSlots', total_parking FROM Company where company_emailid=@company_emailid;

    -- Get total two-wheeler parking slots
    INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TotalTwoWheelerParkingSlots', two_parking FROM Company where company_emailid=@company_emailid;

    -- Get total four-wheeler parking slots
    INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TotalFourWheelerParkingSlots', four_parking FROM Company where company_emailid=@company_emailid;

    -- Get In-use parking slots
    INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TotalInUseParkingSlots', Count(*) FROM realtime where company_emailid=@company_emailid and parking_status=1;

	-- Get In-use two Wheeler parking slots
    INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TotalInUseTwoWheelerParkingSlots', Count(*) FROM realtime where company_emailid=@company_emailid and parking_status=1 and vehicle_type=0 ;

	-- Get In-use four Wheeler parking slots
    INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TotalInUseFourWheelerParkingSlots', Count(*) FROM realtime where company_emailid=@company_emailid and parking_status=1 and vehicle_type=1 ;

    -- Get Two-wheeler parking charge
	INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TwoWheelerParkingCharge', two_charge FROM Company where company_emailid=@company_emailid;
 
	-- Get Two-wheeler panalty charge
	INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TwoWheelerPenaltyCharge', two_panalty FROM Company where company_emailid=@company_emailid;

	-- Get Two-wheeler parking charge
	INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'FourWheelerParkingCharge',four_charge FROM Company where company_emailid=@company_emailid;

	-- Get Two-wheeler panalty charge
	INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'FourWheelerPenaltyCharge',four_panalty FROM Company where company_emailid=@company_emailid;

	-- Get Total Revenue 
	INSERT INTO @companydashboardtable (Metric, Value)
    SELECT 'TotalRevenue', ISNULL(SUM(parking_charge), 0)
    FROM realtime
    WHERE company_emailid = @company_emailid;

    SELECT * FROM @companydashboardtable;

END;

exec GetCompanyDashboard @company_emailid='company1@example.com'
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyProfile]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCompanyProfile]
       @company_emailid varchar(50)
as 
begin
   
    SELECT *
    FROM company AS c
    INNER JOIN watchman AS w ON c.company_emailid = w.company_emailid
    WHERE c.company_emailid = @company_emailid

end;

GO
/****** Object:  StoredProcedure [dbo].[GetEditCompanyProfile]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEditCompanyProfile]
@company_email_id VARCHAR(50),
@company_password VARCHAR(50) = NULL,
@company_name VARCHAR(50) = NULL,
@company_address VARCHAR(250) = NULL,
@total_parking int = NULL,
@two_wheel_parking int = NULL,
@four_wheel_parking int = NULL,
@two_wheel_charge int = NULL,
@four_wheel_charge int= NULL,
@two_wheel_penalty int = NULL,
@four_wheel_penalty int = NULL,
@company_contact_no varchar(50) = NULL,
@watchman_password Varchar(50) = NULL,
@watchman_emailid varchar(50) = null
AS
BEGIN
SET NOCOUNT ON;
--SELECT * FROM company_tbl WHERE company_email_id = @company_email_id
UPDATE company
SET 
		password = ISNULL(@company_password, password),
        name = ISNULL(@company_name, name),
        address = ISNULL(@company_address, address),
        total_parking = ISNULL(@total_parking, total_parking),
        two_parking = ISNULL(@two_wheel_parking, two_parking),
        four_parking = ISNULL(@four_wheel_parking, four_parking),
        two_charge = ISNULL(@two_wheel_charge, two_charge),
        four_charge = ISNULL(@four_wheel_charge, four_charge),
        two_panalty = ISNULL(@two_wheel_penalty, two_panalty),
        four_panalty = ISNULL(@four_wheel_penalty, four_panalty),
        contact_no = ISNULL(@company_contact_no,contact_no)
		WHERE company_emailid = @company_email_id

		AND(
		password != ISNULL(@company_password, password)
		OR name != ISNULL(@company_name, name)
		OR address != ISNULL(@company_address, address)
		OR total_parking != ISNULL(@total_parking, total_parking)
		OR two_parking != ISNULL(@two_wheel_parking, two_parking)
		OR four_parking != ISNULL(@four_wheel_parking, four_parking)
		OR two_charge != ISNULL(@two_wheel_charge, two_charge)
		OR four_charge != ISNULL(@four_wheel_charge, four_charge)
		OR two_panalty != ISNULL(@two_wheel_penalty, two_panalty)
		OR four_panalty != ISNULL(@four_wheel_penalty, four_panalty)
		OR contact_no != ISNULL(@company_contact_no, contact_no))

update watchman
set
    watchman_emailid = ISNULL(@watchman_emailid,watchman_emailid),
	password = ISNULL(@watchman_password,password)
	WHERE company_emailid = @company_email_id
	AND(
	watchman_emailid = ISNULL(@watchman_emailid,watchman_emailid)
	or password = ISNULL(@watchman_password,password))

END
GO
/****** Object:  StoredProcedure [dbo].[GetInUseSlotSP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInUseSlotSP] 
      @company_emailid varchar(255),
	  @entrytime time(7), 
	  @exittime time(7), 
	  @vehicletype Bit
AS
		select realtime.parking_spot_no 
		from realtime 
		where company_emailid=@company_emailid and 
		realtime.entrytime< @exittime and  realtime.exittime > @entrytime and 
		@vehicletype=realtime.vehicle_type and (realtime.parking_status = 0 or realtime.parking_status=1)
GO
/****** Object:  StoredProcedure [dbo].[GetParkingSlipSP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetParkingSlipSP]
    @user_booking_id INT
AS
BEGIN
    DECLARE @charge INT;
    DECLARE @vehicletype BIT;
    DECLARE @currentDateTime DATETIME = GETDATE();

    UPDATE realtime
    SET parking_status = 4
    WHERE DATEADD(DAY, DATEDIFF(DAY, 0, parking_date), CAST(exittime AS DATETIME)) < @currentDateTime and parking_status=0;

    SELECT @vehicletype = vehicle_type
    FROM realtime
    WHERE user_booking_id = @user_booking_id;

    IF @vehicletype = 0
    BEGIN
        SELECT @charge = DATEDIFF(HOUR, realtime.entrytime, realtime.exittime) * (company.two_charge)
        FROM realtime
        INNER JOIN company ON realtime.company_emailid = company.company_emailid
        WHERE realtime.user_booking_id = @user_booking_id;
    END
    ELSE IF @vehicletype = 1
    BEGIN
        SELECT @charge = DATEDIFF(HOUR, realtime.entrytime, realtime.exittime) * (company.four_charge)
        FROM realtime
        INNER JOIN company ON realtime.company_emailid = company.company_emailid
        WHERE realtime.user_booking_id = @user_booking_id;
    END;

    UPDATE realtime
    SET parking_charge = @charge
    WHERE user_booking_id = @user_booking_id;

    SELECT @charge AS 'parking_charge';
END
GO
/****** Object:  StoredProcedure [dbo].[GetSearchCompanySP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSearchCompanySP]
    @companyname VARCHAR(100)
AS
BEGIN
    SELECT company.company_emailid, company.name,company.address FROM company
    WHERE company.name LIKE '%' + @companyname + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalParkingForInAvailableSP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalParkingForInAvailableSP]
    @company_emailid varchar(50),
    @vehicletype bit
AS
BEGIN
    IF @vehicletype = 0 
    BEGIN
        SELECT two_parking AS total_parking
        FROM company
        WHERE company_emailid = @company_emailid
    END
    ELSE 
    BEGIN
        SELECT four_parking AS total_parking
        FROM company
        WHERE company_emailid = @company_emailid
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserPreBookCard]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserPreBookCard]
    @useremail varchar(50)
AS
BEGIN
    select realtime.username,
	       company.name,
		   company.address,
		   realtime.entrytime,
		   realtime.exittime,
		   realtime.parking_date,
		   realtime.parking_spot_no,
		   realtime.user_booking_id from realtime 
	inner join company 
	on company.company_emailid=realtime.company_emailid 
	where realtime.user_emailid = @useremail and realtime.parking_status=0
END
GO
/****** Object:  StoredProcedure [dbo].[GetValidateUserLogin]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetValidateUserLogin]
	@Email VARCHAR(150),
	@Password VARCHAR(150),
	@UserRole VARCHAR(150)

	AS
	BEGIN
		SET NOCOUNT ON;

		DECLARE @IsValid BIT=0;

		IF(@UserRole = 'User')
			SELECT @IsValid = CASE WHEN EXISTS(SELECT 1 FROM users WHERE user_emailid = @Email AND  password COLLATE Latin1_General_CS_AS = @Password)THEN 1 ELSE 0 END;
		ELSE IF(@UserRole = 'Company')
			SELECT @IsValid = CASE WHEN EXISTS(SELECT 1 FROM company WHERE company_emailid= @EMAIL AND password COLLATE Latin1_General_CS_AS = @Password)THEN 1 ELSE 0 END;
		ELSE IF(@UserRole = 'Admin')
			SELECT @IsValid = CASE WHEN EXISTS(SELECT 1 FROM siteadmin WHERE siteadmin_emailid= @EMAIL AND password COLLATE Latin1_General_CS_AS = @Password)THEN 1 ELSE 0 END;
		ELSE IF(@UserRole = 'Watchman')
		begin
			SELECT @IsValid = CASE WHEN EXISTS(SELECT 1 FROM watchman WHERE watchman_emailid= @EMAIL AND password COLLATE Latin1_General_CS_AS = @Password)THEN 1 ELSE 0 END;
			    if(@IsValid=1)
				begin
				select company_emailid from watchman where watchman_emailid = @Email
				end
		end
		ELSE
			SELECT @IsValid = 0;

			SELECT @IsValid as IsValid;
	END
GO
/****** Object:  StoredProcedure [dbo].[GetViweBookingSP]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetViweBookingSP]
       @company_emailid varchar(100)
as
select realtime.parking_spot_no,
       realtime.username,
	   realtime.entrytime,
	   realtime.exittime,
	   realtime.vehicle_type,
	   realtime.vihecle_plate,
	   realtime.user_contact_no,
	   realtime.user_booking_id,
	   realtime.parking_status
from realtime where company_emailid = @company_emailid
GO
/****** Object:  StoredProcedure [dbo].[Selectallparkingbetween]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Selectallparkingbetween] 
AS 
SELECT * FROM realtime
WHERE entrytime > '01:00:00' AND
exittime <= '09:00:00'
ORDER BY parking_spot_no
GO
/****** Object:  StoredProcedure [dbo].[SelectParking]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectParking] 
AS 
SELECT * FROM realtime
WHERE entrytime >= '01:00:00' AND
exittime <= '09:00:00'
ORDER BY parking_spot_no
GO
/****** Object:  StoredProcedure [dbo].[spGetCompanyParkingDetails]    Script Date: 10/9/2023 4:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[spGetCompanyParkingDetails]    Script Date: 14-04-2023 11:24:55 ******/
CREATE PROCEDURE [dbo].[spGetCompanyParkingDetails]
AS
BEGIN
    SELECT
	    c.company_emailid,
        c.name,
        c.total_parking,
SUM(CASE WHEN r.parking_status = 2 THEN r.parking_charge + r.panalty_charge ELSE 0 END) AS total_revenue,
SUM(CASE WHEN r.parking_status = 1 THEN 1 ELSE 0 END) AS in_use
       
    FROM
        company AS c
        INNER JOIN realtime AS r ON c.company_emailid = r.company_emailid
 
    GROUP BY
        c.company_emailid,
		c.name,
        c.total_parking

END
GO
USE [master]
GO
ALTER DATABASE [example] SET  READ_WRITE 
GO
