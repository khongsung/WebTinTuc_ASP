USE [master]
GO
/****** Object:  Database [Web_Vietsoz]    Script Date: 27-Nov-2018 10:38:47 PM ******/
CREATE DATABASE [Web_Vietsoz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web_Vietsoz', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Web_Vietsoz.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Web_Vietsoz_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Web_Vietsoz_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Web_Vietsoz] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web_Vietsoz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web_Vietsoz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Web_Vietsoz] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Web_Vietsoz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web_Vietsoz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web_Vietsoz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Web_Vietsoz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web_Vietsoz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Web_Vietsoz] SET  MULTI_USER 
GO
ALTER DATABASE [Web_Vietsoz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web_Vietsoz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web_Vietsoz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web_Vietsoz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Web_Vietsoz]
GO
/****** Object:  StoredProcedure [dbo].[pr_insertCategory]    Script Date: 27-Nov-2018 10:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pr_insertCategory]
	@name nvarchar(50),
	@link nvarchar(50)
as
begin
	insert into tblCategories(sName,link,taget,slag) values(@name,@link,null,null)
end
GO
/****** Object:  StoredProcedure [dbo].[pr_insertUser]    Script Date: 27-Nov-2018 10:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pr_insertUser]
	@username nvarchar(50),
	@password nvarchar(50),
	@email nvarchar(50),
	@role nvarchar(50)
as
begin
	insert into tblUser(sUsername, sPassword, sEmail, sRole) values(@username, @password, @email, @role)
end
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 27-Nov-2018 10:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[iId] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](50) NULL,
	[link] [nvarchar](50) NULL,
	[taget] [nvarchar](50) NULL,
	[slag] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNews]    Script Date: 27-Nov-2018 10:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNews](
	[iId] [int] IDENTITY(1,1) NOT NULL,
	[sImage] [nvarchar](50) NULL,
	[sTitle] [nvarchar](max) NULL,
	[sDescription] [nvarchar](max) NULL,
	[sContent] [ntext] NULL,
	[iCategoryId] [int] NULL,
	[sAuthor] [nvarchar](50) NULL,
	[bStatus] [bit] NULL,
	[iClicked] [int] NULL,
	[dCreated] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 27-Nov-2018 10:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[iId] [int] IDENTITY(1,1) NOT NULL,
	[sUsername] [nvarchar](50) NULL,
	[sPassword] [nvarchar](50) NULL,
	[sEmail] [nvarchar](50) NULL,
	[sRole] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[iId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([iId], [sName], [link], [taget], [slag]) VALUES (1, N'Xã Hội', N'xahoi', N'', N'xa-hoi')
INSERT [dbo].[tblCategories] ([iId], [sName], [link], [taget], [slag]) VALUES (2, N'Thể Thao', N'thethao', NULL, N'the-thao')
INSERT [dbo].[tblCategories] ([iId], [sName], [link], [taget], [slag]) VALUES (3, N'Khoa Học', N'khoahoc', NULL, N'khoa-hoc')
INSERT [dbo].[tblCategories] ([iId], [sName], [link], [taget], [slag]) VALUES (4, N'Giáo Dục', N'giaoduc', NULL, N'giaoduc')
SET IDENTITY_INSERT [dbo].[tblCategories] OFF
SET IDENTITY_INSERT [dbo].[tblNews] ON 

INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (1, NULL, N'Khẩn: Nếu thời tiết diễn biến phức tạp, trường học TPHCM chủ động cho học sinh nghỉ học', N'Các cơ sở giáo dục, trường học ở TPHCM chủ động báo cáo và cho phép học sinh nghỉ học trong trường hợp thời tiết diễn biến phức tạp, không đảm bảo an toàn cho các hoạt động giáo dục.', N'Tối ngày 18/11, Sở GD-ĐT TPHCM đã có thông báo gửi tất cả các cơ sở giáo dục trên địa bàn về khẩn trương triển khai các phương án, biện pháp phòng, tránh ứng phó với áp thấp nhiệt đới trên biển Đông. Tại Khánh Hòa, hôm nay, học sinh sẽ nghỉ học để đảm bảo an toàn và khắc phục hậu quả của mưa bão.

Để tránh chủ quan, thiếu sót, bị động trong phòng, tránh, ứng phó với mọi tình huống và giảm thiểu tối đa các thiệt hại do áp thấp nhiệt đới trên biển Đông gây ra trên địa bàn thành phố, Sở GD-ĐT TPHCM đề nghị thủ trưởng các đơn vị thực hiện các biện pháp như sau:

Nâng cao ý thức cảnh giác cao độ, theo dõi chặt chẽ các thông tin về áp thấp nhiệt đới và xử lý kịp thời các tình huống trước, trong và sau khi áp thấp nhiệt đới trên biển Đông đi qua trên nguyên tắc an toàn tuyệt đối về người, thiết bị, cơ sở vật chất trường học.

Có phương án triển khai phòng, chống tại mỗi đơn vị trường học và thực hiện nghiêm túc phương án phòng, tránh, ứng phó bão, bão mạnh - rất mạnh đổ bộ trực tiếp vào thành phố theo quy định của thành phố.

Thủ trưởng các đơn vị chịu trách nhiệm trong việc tổ chức lực lượng, phân công kiểm tra, bảo vệ hệ thống, thiết bị, cơ sở vật chất trường học và xử lý mọi tình huống khi áp thấp đi qua. Hiệu trưởng các đơn vị phối hợp với cha mẹ học sinh để quản lý học sinh chặt chẽ trong tình huống áp thấp nhiệt đới xảy ra trên địa bàn thành phố.

Thủ trưởng các cơ sở giáo dục, trường học không tổ chức các hoạt động sinh hoạt ngoại khóa, tham quan, dã ngoại, tiết học ngoài nhà trường trong thời gian diễn ra áp thấp nhiệt đới cho đến khi cơ quan chức năng có thông tin cụ thể về thời tiết đảm bảo an toàn.

Thủ trưởng các cơ sở giáo dục, trường học chủ động báo cáo về Sở GD-ĐT và Thường trực UBND các quận, huyện cho phép học sinh nghỉ học trong trường hợp thời tiết diễn biến phức tạp, không đảm bảo an toàn cho các hoạt động giáo dục.

Theo đó, hiện bão số 8 có tên gọi Toraji đã suy yếu thành áp thấp nhiệt đới và còn cách Phan Rang (Ninh Thuận) khoảng 100 km về phía Đông Đông Nam, cách La Gi (Bình Thuận) khoảng 200 km về phía Đông Đông Bắc.

Sức gió tối đa 60 km/h, giật tăng hai cấp. Áp thấp nhiệt đới sẽ đi theo hướng Tây với tốc độ 10 km mỗi giờ. Dự báo 16h cùng ngày, tâm áp thấp nhiệt đới ở trên bờ biển các tỉnh từ Bình Thuận đến Bà Rịa-Vũng Tàu. Sức gió tối đa 50 km/h.

Tại Khánh Hòa, nhằm đảm bảo an toàn cho các em học sinh trên địa bàn trước tình hình mưa bão ảnh hưởng của cơn bão số 8, UBND tỉnh vừa có chỉ đạo khẩn yêu cầu toàn bộ học sinh các trường nghỉ học trong sáng thứ 2 (19/11) để khắc phục ảnh hậu quả', 1, N'Khổng Văn Sứng', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (3, NULL, N'Chi cục trưởng Chi cục Thuế kiện cấp trên vì bị cho nghỉ hưu trước tuổi', N'Sau khi nhận quyết định nghỉ hưu, cho rằng bị cấp trên “ăn bớt” 2 tuổi của mình, Chi cục trưởng Chi cục Thuế huyện Thường Xuân (Thanh Hóa) đã làm đơn kiện cấp trên', N'Theo đơn khởi kiện và quá trình giải quyết tại TAND, ông Hiền trình bày: Ông Hiền là công chức nhà nước, công tác tại Chi cục Thuế huyện Thường Xuân và giữ chức vụ Chi cục trưởng. Giấy khai sinh và các giấy tờ tùy thân khác của ông Hiền như chứng minh nhân dân (CMND), căn cước công dân (CCCD), sổ hộ khẩu gia đình, hồ sơ đảng viên và các loại bằng cấp chuyên môn đều thể hiện ngày sinh của ông là 8/8/1960. Riêng ngày, tháng, năm sinh ghi trong hồ sơ công chức và BHXH của ông Hiền là ngày 27/3/1958.

Ông Hiền đã nhiều lần đề nghị Cục Thuế và BHXH Thanh Hóa điều chỉnh lại ngày, tháng, năm sinh của mình trong hồ sơ công chức và BHXH theo giấy khai sinh nhưng không được giải quyết.

Ngày 15/1/2018, ông Hiền nhận được QĐ số 15QĐ-CT ngày 5/1/2018 về việc nghỉ hưu để hưởng chế độ BHXH của Cục trưởng Cục Thuế tỉnh Thanh Hóa.

Nhận thấy QĐ này là trái pháp luật nên ông Hiền đã làm đơn khiếu nại đến Cục Thuế tỉnh Thanh Hóa đề nghị xem xét quyền lợi chính đáng của ông. Ngày 13/3/2018, Cục Thuế Thanh Hóa ban hành QĐ số 292/QĐ-CT về việc giải quyết khiếu nại của ông Hiền.

Tại QĐ trên có nêu: Cục Thuế Thanh Hóa không có thẩm quyền xác định tính hợp pháp của giấy khai sinh và hồ sơ đảng viên mang tên Lê Hữu Hiền và không có thẩm quyền điều chỉnh ngày, tháng, năm sinh trong hồ sơ công chức.

Ông Hiền cho rằng, ông sinh ngày 8/8/1960, đến ngày 8/8/2020 ông mới đủ 60 tuổi. Hiện nay (năm 2018), ông mới 58 tuổi, chưa đủ điều kiện về hưu theo quy định của pháp luật. Việc Cục Thuế Thanh Hóa căn cứ vào ngày, tháng, năm sinh trong hồ sơ công chức để ra QĐ nghỉ hưu trong khi ông chưa đủ 60 tuổi là trái pháp luật, xâm phạm trực tiếp đến quyền và lợi ích hợp pháp của ông.

Không đồng ý với giải quyết khiếu nại của Cục trưởng Cục Thuế Thanh Hóa, ông Hiền đã làm đơn khởi kiện đến TAND tỉnh Thanh Hóa, yêu cầu hủy QĐ về việc nghỉ hưu và QĐ giải quyết khiếu nại của Cục trưởng Cục Thuế Thanh Hóa.

Sau khi nghiên cứu các tài liệu, chứng cứ có trong hồ sơ vụ án được thẩm tra tại phiên tòa và căn cứ vào kết quả tranh luận, HĐXX xét thấy: Vụ án thuộc thẩm quyền giải quyết của TAND tỉnh Thanh Hóa; tính pháp lý của giấy khai sinh ông Lê Hữu Hiền đều đúng với quy định.

Các giấy tờ cá nhân có nội dung về họ, chữ đệm, tên, ngày, tháng, năm sinh của ông Lê Hữu Hiền, như: CMND, CCCD, bằng tốt nghiệp đại học, giấy chứng nhận tốt nghiệp PTTH, thẻ đảng viên, sổ hộ khẩu gia đình, lý lịch đảng viên đều phù hợp với giấy khai sinh cấp lại cho ông Hiền ngày 1/6/2016 của UBND xã Thọ Thanh, huyện Thường Xuân.

Hồ sơ công chức của ông Hiền do Cục Thuế Thanh Hóa quản lý không có giấy tờ khai sinh gốc và có những tài liệu thể hiện ông Hiền sinh năm 1960 như: Lý lịch quân nhân, QĐ tặng huy hiệu đảng...

TAND tỉnh Thanh Hóa cho rằng: Lẽ ra, trong quá trình quản lý hồ sơ công chức thấy có nhiều tài liệu, giấy tờ thể hiện năm sinh khác nhau và Cục Thuế Thanh Hóa đã nhận được công văn đề nghị xin thay đổi ngày, tháng, năm sinh của ông Hiền thì phải yêu cầu ông Hiền xuất trình giấy khai sinh để kiểm tra, điều chỉnh kịp thời hồ sơ cán bộ công chức của ông Hiền theo đúng nội dung trong giấy khai sinh quy định tại Khoản 3, Điều 6, Nghị định 123/2015/NĐ-CP ngày 15/11/2015 của Chính phủ. Nhưng Cục Thuế Thanh Hóa đã không làm đúng như những quy định này.

Đối chiếu với ngày, tháng, năm sinh của ông Hiền ghi trong giấy khai sinh nói trên và quy định tại Điều 54 - Luật BHXH số 58/2014/QH13, tại thời điểm Cục Thuế Thanh Hóa ra QĐ về việc cho ông Hiền nghỉ hưu theo chế độ BHXH từ ngày 1/4/2018, khi ông Hiền chưa đủ 60 tuổi là trái pháp luật hiện hành.

Đồng thời, việc Cục Thuế Thanh Hóa yêu cầu ông Hiền vẫn phải chấp hành QĐ số 15QĐ-CT ngày 5/1/2018 khi chưa có văn bản của cơ quan có thẩm quyền điều chỉnh về ngày, tháng, năm sinh của ông Hiền cũng là trái pháp luật.

Ông Hiền là đảng viên, tại thời điểm ông xin thay đổi ngày, tháng, năm sinh nói trên cũng không trái với quy định và ngày, tháng, năm sinh của ông Hiền trong giấy khai sinh cấp lại ghi ngày 8/8/1960 cũng đúng với hồ sơ gốc lý lịch đảng viên khi ông được kết nạp vào Đảng ngày 8/3/1982 tại Đảng ủy Trung đoàn 27, Sư đoàn 390, Quân đoàn 1, Bộ Quốc phòng.

HĐXX xét thấy việc ông Hiền khởi kiện đối với Cục trưởng Cục Thuế Thanh Hóa là có căn cứ. Do vậy, cần phải hủy QĐ số 15/QĐ-CT ngày 5/1/2018 và QĐ số 292/QĐ-CT ngày 13/3/2018 của Cục Thuế Thanh Hóa. Buộc Cục Thuế Thanh Hóa phải khôi phục lại mọi quyền lợi, chế độ cho ông Hiền.', 1, N'Khổng Văn Sứng', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (5, NULL, N'Chi cục trưởng Chi cục Thuế kiện cấp trên vì bị cho nghỉ hưu trước tuổi', N'Sau khi nhận quyết định nghỉ hưu, cho rằng bị cấp trên “ăn bớt” 2 tuổi của mình, Chi cục trưởng Chi cục Thuế huyện Thường Xuân (Thanh Hóa) đã làm đơn kiện cấp trên.', N'Theo đơn khởi kiện và quá trình giải quyết tại TAND, ông Hiền trình bày: Ông Hiền là công chức nhà nước, công tác tại Chi cục Thuế huyện Thường Xuân và giữ chức vụ Chi cục trưởng. Giấy khai sinh và các giấy tờ tùy thân khác của ông Hiền như chứng minh nhân dân (CMND), căn cước công dân (CCCD), sổ hộ khẩu gia đình, hồ sơ đảng viên và các loại bằng cấp chuyên môn đều thể hiện ngày sinh của ông là 8/8/1960. Riêng ngày, tháng, năm sinh ghi trong hồ sơ công chức và BHXH của ông Hiền là ngày 27/3/1958.

Ông Hiền đã nhiều lần đề nghị Cục Thuế và BHXH Thanh Hóa điều chỉnh lại ngày, tháng, năm sinh của mình trong hồ sơ công chức và BHXH theo giấy khai sinh nhưng không được giải quyết.

Ngày 15/1/2018, ông Hiền nhận được QĐ số 15QĐ-CT ngày 5/1/2018 về việc nghỉ hưu để hưởng chế độ BHXH của Cục trưởng Cục Thuế tỉnh Thanh Hóa.

Nhận thấy QĐ này là trái pháp luật nên ông Hiền đã làm đơn khiếu nại đến Cục Thuế tỉnh Thanh Hóa đề nghị xem xét quyền lợi chính đáng của ông. Ngày 13/3/2018, Cục Thuế Thanh Hóa ban hành QĐ số 292/QĐ-CT về việc giải quyết khiếu nại của ông Hiền.

Tại QĐ trên có nêu: Cục Thuế Thanh Hóa không có thẩm quyền xác định tính hợp pháp của giấy khai sinh và hồ sơ đảng viên mang tên Lê Hữu Hiền và không có thẩm quyền điều chỉnh ngày, tháng, năm sinh trong hồ sơ công chức.

Ông Hiền cho rằng, ông sinh ngày 8/8/1960, đến ngày 8/8/2020 ông mới đủ 60 tuổi. Hiện nay (năm 2018), ông mới 58 tuổi, chưa đủ điều kiện về hưu theo quy định của pháp luật. Việc Cục Thuế Thanh Hóa căn cứ vào ngày, tháng, năm sinh trong hồ sơ công chức để ra QĐ nghỉ hưu trong khi ông chưa đủ 60 tuổi là trái pháp luật, xâm phạm trực tiếp đến quyền và lợi ích hợp pháp của ông.

Không đồng ý với giải quyết khiếu nại của Cục trưởng Cục Thuế Thanh Hóa, ông Hiền đã làm đơn khởi kiện đến TAND tỉnh Thanh Hóa, yêu cầu hủy QĐ về việc nghỉ hưu và QĐ giải quyết khiếu nại của Cục trưởng Cục Thuế Thanh Hóa.

Sau khi nghiên cứu các tài liệu, chứng cứ có trong hồ sơ vụ án được thẩm tra tại phiên tòa và căn cứ vào kết quả tranh luận, HĐXX xét thấy: Vụ án thuộc thẩm quyền giải quyết của TAND tỉnh Thanh Hóa; tính pháp lý của giấy khai sinh ông Lê Hữu Hiền đều đúng với quy định.

Các giấy tờ cá nhân có nội dung về họ, chữ đệm, tên, ngày, tháng, năm sinh của ông Lê Hữu Hiền, như: CMND, CCCD, bằng tốt nghiệp đại học, giấy chứng nhận tốt nghiệp PTTH, thẻ đảng viên, sổ hộ khẩu gia đình, lý lịch đảng viên đều phù hợp với giấy khai sinh cấp lại cho ông Hiền ngày 1/6/2016 của UBND xã Thọ Thanh, huyện Thường Xuân.

Hồ sơ công chức của ông Hiền do Cục Thuế Thanh Hóa quản lý không có giấy tờ khai sinh gốc và có những tài liệu thể hiện ông Hiền sinh năm 1960 như: Lý lịch quân nhân, QĐ tặng huy hiệu đảng...

TAND tỉnh Thanh Hóa cho rằng: Lẽ ra, trong quá trình quản lý hồ sơ công chức thấy có nhiều tài liệu, giấy tờ thể hiện năm sinh khác nhau và Cục Thuế Thanh Hóa đã nhận được công văn đề nghị xin thay đổi ngày, tháng, năm sinh của ông Hiền thì phải yêu cầu ông Hiền xuất trình giấy khai sinh để kiểm tra, điều chỉnh kịp thời hồ sơ cán bộ công chức của ông Hiền theo đúng nội dung trong giấy khai sinh quy định tại Khoản 3, Điều 6, Nghị định 123/2015/NĐ-CP ngày 15/11/2015 của Chính phủ. Nhưng Cục Thuế Thanh Hóa đã không làm đúng như những quy định này.

Đối chiếu với ngày, tháng, năm sinh của ông Hiền ghi trong giấy khai sinh nói trên và quy định tại Điều 54 - Luật BHXH số 58/2014/QH13, tại thời điểm Cục Thuế Thanh Hóa ra QĐ về việc cho ông Hiền nghỉ hưu theo chế độ BHXH từ ngày 1/4/2018, khi ông Hiền chưa đủ 60 tuổi là trái pháp luật hiện hành.

Đồng thời, việc Cục Thuế Thanh Hóa yêu cầu ông Hiền vẫn phải chấp hành QĐ số 15QĐ-CT ngày 5/1/2018 khi chưa có văn bản của cơ quan có thẩm quyền điều chỉnh về ngày, tháng, năm sinh của ông Hiền cũng là trái pháp luật.

Ông Hiền là đảng viên, tại thời điểm ông xin thay đổi ngày, tháng, năm sinh nói trên cũng không trái với quy định và ngày, tháng, năm sinh của ông Hiền trong giấy khai sinh cấp lại ghi ngày 8/8/1960 cũng đúng với hồ sơ gốc lý lịch đảng viên khi ông được kết nạp vào Đảng ngày 8/3/1982 tại Đảng ủy Trung đoàn 27, Sư đoàn 390, Quân đoàn 1, Bộ Quốc phòng.

HĐXX xét thấy việc ông Hiền khởi kiện đối với Cục trưởng Cục Thuế Thanh Hóa là có căn cứ. Do vậy, cần phải hủy QĐ số 15/QĐ-CT ngày 5/1/2018 và QĐ số 292/QĐ-CT ngày 13/3/2018 của Cục Thuế Thanh Hóa. Buộc Cục Thuế Thanh Hóa phải khôi phục lại mọi quyền lợi, chế độ cho ông Hiền.', 1, N'Khổng Văn Sứng', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (6, NULL, N'Chi cục trưởng Chi cục Thuế kiện cấp trên vì bị cho nghỉ hưu trước tuổi', N'Sau khi nhận quyết định nghỉ hưu, cho rằng bị cấp trên “ăn bớt” 2 tuổi của mình, Chi cục trưởng Chi cục Thuế huyện Thường Xuân (Thanh Hóa) đã làm đơn kiện cấp trên.', N'Theo đơn khởi kiện và quá trình giải quyết tại TAND, ông Hiền trình bày: Ông Hiền là công chức nhà nước, công tác tại Chi cục Thuế huyện Thường Xuân và giữ chức vụ Chi cục trưởng. Giấy khai sinh và các giấy tờ tùy thân khác của ông Hiền như chứng minh nhân dân (CMND), căn cước công dân (CCCD), sổ hộ khẩu gia đình, hồ sơ đảng viên và các loại bằng cấp chuyên môn đều thể hiện ngày sinh của ông là 8/8/1960. Riêng ngày, tháng, năm sinh ghi trong hồ sơ công chức và BHXH của ông Hiền là ngày 27/3/1958.

Ông Hiền đã nhiều lần đề nghị Cục Thuế và BHXH Thanh Hóa điều chỉnh lại ngày, tháng, năm sinh của mình trong hồ sơ công chức và BHXH theo giấy khai sinh nhưng không được giải quyết.

Ngày 15/1/2018, ông Hiền nhận được QĐ số 15QĐ-CT ngày 5/1/2018 về việc nghỉ hưu để hưởng chế độ BHXH của Cục trưởng Cục Thuế tỉnh Thanh Hóa.

Nhận thấy QĐ này là trái pháp luật nên ông Hiền đã làm đơn khiếu nại đến Cục Thuế tỉnh Thanh Hóa đề nghị xem xét quyền lợi chính đáng của ông. Ngày 13/3/2018, Cục Thuế Thanh Hóa ban hành QĐ số 292/QĐ-CT về việc giải quyết khiếu nại của ông Hiền.

Tại QĐ trên có nêu: Cục Thuế Thanh Hóa không có thẩm quyền xác định tính hợp pháp của giấy khai sinh và hồ sơ đảng viên mang tên Lê Hữu Hiền và không có thẩm quyền điều chỉnh ngày, tháng, năm sinh trong hồ sơ công chức.

Ông Hiền cho rằng, ông sinh ngày 8/8/1960, đến ngày 8/8/2020 ông mới đủ 60 tuổi. Hiện nay (năm 2018), ông mới 58 tuổi, chưa đủ điều kiện về hưu theo quy định của pháp luật. Việc Cục Thuế Thanh Hóa căn cứ vào ngày, tháng, năm sinh trong hồ sơ công chức để ra QĐ nghỉ hưu trong khi ông chưa đủ 60 tuổi là trái pháp luật, xâm phạm trực tiếp đến quyền và lợi ích hợp pháp của ông.

Không đồng ý với giải quyết khiếu nại của Cục trưởng Cục Thuế Thanh Hóa, ông Hiền đã làm đơn khởi kiện đến TAND tỉnh Thanh Hóa, yêu cầu hủy QĐ về việc nghỉ hưu và QĐ giải quyết khiếu nại của Cục trưởng Cục Thuế Thanh Hóa.

Sau khi nghiên cứu các tài liệu, chứng cứ có trong hồ sơ vụ án được thẩm tra tại phiên tòa và căn cứ vào kết quả tranh luận, HĐXX xét thấy: Vụ án thuộc thẩm quyền giải quyết của TAND tỉnh Thanh Hóa; tính pháp lý của giấy khai sinh ông Lê Hữu Hiền đều đúng với quy định.

Các giấy tờ cá nhân có nội dung về họ, chữ đệm, tên, ngày, tháng, năm sinh của ông Lê Hữu Hiền, như: CMND, CCCD, bằng tốt nghiệp đại học, giấy chứng nhận tốt nghiệp PTTH, thẻ đảng viên, sổ hộ khẩu gia đình, lý lịch đảng viên đều phù hợp với giấy khai sinh cấp lại cho ông Hiền ngày 1/6/2016 của UBND xã Thọ Thanh, huyện Thường Xuân.

Hồ sơ công chức của ông Hiền do Cục Thuế Thanh Hóa quản lý không có giấy tờ khai sinh gốc và có những tài liệu thể hiện ông Hiền sinh năm 1960 như: Lý lịch quân nhân, QĐ tặng huy hiệu đảng...

TAND tỉnh Thanh Hóa cho rằng: Lẽ ra, trong quá trình quản lý hồ sơ công chức thấy có nhiều tài liệu, giấy tờ thể hiện năm sinh khác nhau và Cục Thuế Thanh Hóa đã nhận được công văn đề nghị xin thay đổi ngày, tháng, năm sinh của ông Hiền thì phải yêu cầu ông Hiền xuất trình giấy khai sinh để kiểm tra, điều chỉnh kịp thời hồ sơ cán bộ công chức của ông Hiền theo đúng nội dung trong giấy khai sinh quy định tại Khoản 3, Điều 6, Nghị định 123/2015/NĐ-CP ngày 15/11/2015 của Chính phủ. Nhưng Cục Thuế Thanh Hóa đã không làm đúng như những quy định này.

Đối chiếu với ngày, tháng, năm sinh của ông Hiền ghi trong giấy khai sinh nói trên và quy định tại Điều 54 - Luật BHXH số 58/2014/QH13, tại thời điểm Cục Thuế Thanh Hóa ra QĐ về việc cho ông Hiền nghỉ hưu theo chế độ BHXH từ ngày 1/4/2018, khi ông Hiền chưa đủ 60 tuổi là trái pháp luật hiện hành.

Đồng thời, việc Cục Thuế Thanh Hóa yêu cầu ông Hiền vẫn phải chấp hành QĐ số 15QĐ-CT ngày 5/1/2018 khi chưa có văn bản của cơ quan có thẩm quyền điều chỉnh về ngày, tháng, năm sinh của ông Hiền cũng là trái pháp luật.

Ông Hiền là đảng viên, tại thời điểm ông xin thay đổi ngày, tháng, năm sinh nói trên cũng không trái với quy định và ngày, tháng, năm sinh của ông Hiền trong giấy khai sinh cấp lại ghi ngày 8/8/1960 cũng đúng với hồ sơ gốc lý lịch đảng viên khi ông được kết nạp vào Đảng ngày 8/3/1982 tại Đảng ủy Trung đoàn 27, Sư đoàn 390, Quân đoàn 1, Bộ Quốc phòng.

HĐXX xét thấy việc ông Hiền khởi kiện đối với Cục trưởng Cục Thuế Thanh Hóa là có căn cứ. Do vậy, cần phải hủy QĐ số 15/QĐ-CT ngày 5/1/2018 và QĐ số 292/QĐ-CT ngày 13/3/2018 của Cục Thuế Thanh Hóa. Buộc Cục Thuế Thanh Hóa phải khôi phục lại mọi quyền lợi, chế độ cho ông Hiền.', 2, N'Khổng Văn Sứng', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (7, NULL, N'Đường sắt Bắc - Nam thông tuyến sau 12 giờ tê liệt', N'Sáng 19/11, ông Lê Hồng Sơn, Phó Giám đốc Chi nhánh vận tải đường sắt Nha Trang cho biết, sau 12 giờ nỗ lực khắc phục, tuyến đường sắt qua Khánh Hòa đã thông tuyến từ 22h đêm qua', N'Trước đó, vào sáng 18/11, mưa lớn kéo dài, gây lũ ống đã khiến tuyến sắt đoạn qua Khánh Hòa bị tê liệt, ngưng trệ. Cụ thể, khu gian Nha Trang – Lương Sơn bị phong tỏa vào lúc 8h38 sáng 18/11 và khu gian Nha Trang – Cây Cầy bị phong tỏa lúc 8h46 cùng ngày. Một số đoạn đường sắt bị ngập sâu từ 40-50cm.

Tuyến tàu SE7 chạy hướng Bắc – Nam bị mắc kẹt ở Lương Sơn (xã Vĩnh Lương, TP Nha Trang).

Trên quốc lộ 1A đoạn qua Khánh Hòa cũng bị ngập cục bộ nhiều nơi khiến các phương tiện lưu thông hỗn loạn, gián đoạn. Nghiêm trọng nhất là quốc lộ 1A đoạn từ phường Cam Nghĩa đến phường Cam Phúc Bắc (TP Cam Ranh) bị ngập từ 0,5-0,7m. Lực lượng chức năng đã phá dỡ các con lươn để cho dòng nước tràn ra khỏi mặt đường.

Đến nay, về cơ bản giao thông trên quốc lộ 1A đoạn qua Khánh Hòa đã lưu thông bình thường.

Trên đường Nha Trang đi sân bay quốc tế Cam Ranh hiện vẫn tê liệt do bị khối đất đá 2.000m3 vùi lấp toàn bộ mặt đường, đoạn trên đèo Cù Hin. Lực lượng chức năng đang khẩn trương hốt dọn và dự kiến trưa nay sẽ thông đường đi sân bay quốc tế Cam Ranh.', 1, N'Khổng Văn Sứng', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (8, NULL, N'Đội tuyển Việt Nam từng ghi dấu cho sự đi xuống của bóng đá Myanmar', N'Liên tiếp trong 2 năm 1995 và 1996, đội tuyển Việt Nam có 2 chiến thắng đầy bất ngờ trước Myanmar. Nếu như các chiến thắng đấy đánh dấu cho sự trở lại của bóng đá Việt Nam ở tư thế nhóm đầu khu vực, thì những trận thua này cũng mở ra giai đoạn đi xuống của bóng đá Myanmar', N'Sau đó, bóng đá Myanmar có suy yếu, nhưng ở Đông Nam Á, Thái Lan vẫn ngại họ nhất. Cụ thể là khi dự SEA Games 1995 tại Chiang Mai (Thái Lan), đội tuyển Myanmar vẫn mang tư cách là đương kim Á quân của giải.

Khi đó, Thái Lan dù là đội chủ nhà nhưng vẫn ngại nếu phải gặp Myanmar trong trận chung kết. Dù vậy, thất bại trước đội tuyển Việt Nam ở bán kết năm đó, khiến Myanmar không có cơ hội đá trận chung kết với Thái Lan, và đội bóng đất Chùa Vàng thời điểm này cất đi một gánh nặng lớn, nhờ tránh được Myanmar ở chung kết.

Trận bán kết SEA Games ở Chiang Mai của Myanmar với đội tuyển Việt Nam năm 1995 là trận đấu mà Huỳnh Đức giúp đội bóng của HLV Karl Heinz Weigang dẫn 1-0, Myanmar gỡ hoà 1-1, sau đó Trần Minh Chiến ghi bàn thắng vàng trong hiệp phụ, giúp đội tuyển Việt Nam thắng chung cuộc 2-1.

Cũng cần biết rằng sau khi tỷ số là 1-1, Myanmar bị đuổi 1 người. Dù vậy, họ mạnh đến mức mà đá ở thế 10 chống 11, Myanmar vẫn liên tục gây sức ép cho đội tuyển Việt Nam.

1 năm sau, khi giải vô địch Đông Nam Á AFF Cup được khai sinh, với tiền thân là Tiger Cup, Myanmar tràn đầy quyết tâm giành ngôi vô địch của giải đấu tổ chức tại Singapore, hòng để lấy lại vị thế tại Đông Nam Á, cũng như “rửa mặt” cho thất bại ở SEA Games năm 1995.

Nhưng “Cơn địa chấn Jurong” – cụm từ mà truyền thông Đông Nam Á dùng để mô tả chiến thắng 4-1 của đội tuyển Việt Nam trước Myanmar ở sân Jurong – Singapore đã chính thức loại Myanmar khỏi bán kết, chính thức gạch tên đội bóng này khỏi nhóm các đội mạnh của bóng đá khu vực cho đến tận bây giờ.

Thời đấy, người ta phải dùng từ “địa chấn” bởi trước giờ bóng lăn, không ai tin một Myanmar hùng mạnh trong quá khứ lại thua đậm đến vậy, đồng thời càng không tin đại diện của một trong những nền bóng đá đáng gờm nhất Đông Nam Á trước đó lại dừng bước quá sớm ở kỳ giải vô địch Đông Nam Á lần đầu tiên.

Các chiến thắng của đội tuyển Việt Nam thuộc thế hệ những Hồng Sơn, Huỳnh Đức, Công Minh, Hữu Đang, Hoàng Bửu… vào các năm 1995 và 1996 nêu trên không những đánh dấu cho sự trở lại nhóm đầu khu vực của bóng đá Việt Nam, trước khi chúng ta duy trì vị thế ấy cho đến tận bây giờ, mà còn mở ra chu kỳ tuột dốc của bóng đá Myanmar so với quá khứ huy hoàng của chính họ, chính thức đẩy Myanmar ra khỏi nhóm các đội mạnh hàng đầu Đông Nam Á cũng cho đến tận bây giờ!', 2, N'Đỗ Văn Hiếu', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (9, NULL, N'Nhận diện thực lực của Myanmar trước trận gặp đội tuyển Việt Nam', N'Cùng với đội tuyển Việt Nam, Myanmar là một trong những đội có tuổi trung bình thấp nhất AFF Cup 2018. Tuy nhiên, nếu như cầu thủ Việt Nam dù trẻ nhưng không thiếu kinh nghiệm thi đấu quốc tế, thì cầu thủ Myanmar vẫn còn khá non nớt.', N'Dù vậy, nếu như những Văn Quyết, Anh Đức của đội tuyển Việt Nam đều đã trải qua những giải đấu tế thành công, vào rất sâu ở sân chơi quốc tế cùng đội tuyển Việt Nam (Văn Quyết) hoặc cấp độ CLB (Anh Đức), trải qua những trận đấu căng thẳng tột độ để tăng cường bản lĩnh, thì cầu thủ Myanmar không có được may mắn như vậy.

Nguyên nhân đến từ việc đội tuyển Myanmar thường xuyên bị loại sớm ở các giải đấu tầm khu vực, nên cầu thủ của họ không có điều kiện để trải qua nhiều trận đấu mang tính chất một mất một còn.

Đấy chính là lý do mà một số cầu thủ khác của Myanmar, dù đã đá vài giải AFF Cup, kèm theo một số kỳ SEA Games, như tiền đạo Aung Thu, Zin Min Tun, tiền vệ Sithu Aung, Maung Maung Soe, hoặc hậu vệ Zaw Min Tun, nhưng kinh nghiệm của họ vẫn không tốt.

Về mặt lối chơi, lối chơi của Myanmar cũng không đa dạng như đội tuyển Việt Nam vào lúc này. Myanmar trước sau vẫn thường đá một kiểu, đó là tấn công, chơi ào ạt, bất chấp đối thủ là ai. Chính lối chơi vốn không biết mình biết người này của Myanmar khiến cho họ thường nhận những trận thua vỡ mặt, nếu đối đầu với các đối thủ già dặn, mà chính đội tuyển Việt Nam từng thắng Myanmar rất đậm ở đấu trường AFF Cup (7-1 năm 2010 và 4-1 năm 1996).

Đội tuyển Myanmar cũng không giỏi điều tiết lối đá lúc nhanh, lúc chậm giống đội tuyển Việt Nam, có lẽ do họ không có mẫu tiền vệ tổ chức kiểu Quang Hải hoặc Xuân Trường mà đội tuyển Việt Nam đang có.

Về mặt thể hình, Myanmar là một trong số những đội bóng có thể hình kém nhất giải. Nhóm 3 tiền đạo của đội tuyển Myanmar dự AFF Cup 2018 gồm Aung Thu, Than Htet Aung và Aee Soe không người nào cao đến 1m70. Tiền đạo còn lại là Zin Min Tun cũng không thuộc dạng tiền đạo có thể hình quá lý tưởng.

Tức là Myanmar không mạnh trong các pha tấn công bóng bổng, mà điều này càng là lý do khiến đội tuyển Việt Nam qua các thời kỳ không ngán bóng đá Myanmar. Bởi, yếu tố mà đội tuyển Việt Nam thường ngại nhất chính là các đội bóng có thể hình, thể lực mạnh mẽ, thì Myanmar cũng không có.', 2, N'Đỗ Văn Hiếu', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (10, NULL, N'1 đại gia bị giang hồ đánh đập dã man, buộc viết giấy nợ 40 tỉ đồng', N'Nạn nhân bị đưa vào một biệt thự ven biển, bị đánh đập dã man và viết giấy nhận nợ. Người này phải ở lại trụ sở công an để tránh bị truy sát.', N'Theo nguồn tin, ngày 14-11, sau khi CQĐT Công an tỉnh Bình Thuận bắt giam Phạm Thanh Liêm , nguyên cán bộ Phòng Tài chính huyện Bắc Bình, khi Liêm giả mạo sổ đỏ lừa bán cho nhiều người hơn 70 tỉ đồng thì đã có rất nhiều nhóm giang hồ, xã hội đen đến nhà Liêm để đòi nợ. Những nhóm người này đến từ TP.HCM, Đồng Nai và sau khi trích sao kê tài khoản ngân hàng của Liêm đã phát hiện trước ngày bị bắt, Liêm nhiều lần giao dịch, chuyển tiền cho ông D. với số tiền khoảng 15 tỉ đồng.

Lập tức một nhóm khoảng 30 người đi trên tám ô tô đến thuê một căn biệt thự tại khu Sea Link City (Phan Thiết) và sáng 15-11 gọi điện thoại yêu cầu ông D. phải có mặt để gặp gỡ, trao đổi việc liên quan đến bị can Liêm.

', 3, N'Nguyễn Duy Phương', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (11, NULL, N'Truy bắt nam thanh niên cầm búa cướp tiệm vàng', N'Đến hơn 19h ngày 19/11, lực lượng chức năng vẫn đang phong tỏa hiện trường để tiến hành khám nghiệm hiện trường về một vụ cướp tiệm vàng xảy ra ở khu vực khu công nghiệp Điện Nam – Điện Ngọc thuộc thị xã Điện Bàn, Quảng Nam.', N'Tại hiện trường vụ cướp, tủ kính chứa vàng đã bị đập bể, kính văng nhiều nơi, chiếc búa vẫn đang nằm tại hiện trường. Hiện số vàng bị cướp tại tiệm vàng Kim Dũng II vẫn chưa được thống kê cụ thể. Lực lượng Công an thị xã Điện Bàn vẫn khám nghiệm hiện trường để điều tra, truy bắt đối tượng.

Vụ việc khiến rất đông người đi đường hiếu kỳ và người dân địa phương tập trung theo dõi gây ách tắc cục bộ.

', 4, N'Nguyễn Duy Phương', 1, 100, CAST(0xF83E0B00 AS Date))
INSERT [dbo].[tblNews] ([iId], [sImage], [sTitle], [sDescription], [sContent], [iCategoryId], [sAuthor], [bStatus], [iClicked], [dCreated]) VALUES (12, NULL, N'Niềm vui của cô giáo vùng cao trên những công trình phòng học mang tên Dân trí', N'Tôi hỏi cô giáo, ngày 20/11 có mơ ước gì, cô chỉ nói vẻn vẹn một câu: “Chỉ được nghe tiếng con gọi mẹ qua điện thoại, thấy hình con qua Facebook”. Cái ước mơ tưởng như bình dị, đơn giản như vậy, nhưng với cô giáo ở trên đỉnh núi quanh năm mây ngàn này, nhiều khi cũng là điều xa xỉ.', N'Nhưng em không buồn đâu, em có vất vả, khổ cực tý nhưng dù sao cũng giúp các em học sinh trên này được tốt hơn.

Em coi bọn trẻ trên núi này cũng như con của mình ở nhà vậy. Đứa nào cũng nhem nhuốc, khổ cực nhưng đều đáng thương và đáng yêu.

Năm nay em càng vui hơn khi sắp được báo Dân trí xây phòng học mới cho cô và trò. Đó mới là tình cảm của mọi người dành cho nghề giáo của bọn em chứ không phải chỉ dành cho trong ngày 20/11”, cô Lục Thị Lý nói.

2. Không phải trèo đèo lội suối như cô Lý, thậm chí ô tô có thể đỗ tận cửa, nhưng sự vất vả, khó khăn của các giáo viên ở trường mầm non Tà Hộc, xã Tà Hộc, huyện Mai Sơn, tỉnh Sơn La cũng khiến chúng tôi cảm phục, thương cảm không kém.

Bao năm nay các giáo viên ở đây vẫn đang ở trọ trong căn phòng công vụ tạm bợ, cũng xa chồng xa con, cũng thiếu thốn trăm bề.', 4, N'Khổng Văn Sứng', 1, 30, CAST(0xF93E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tblNews] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([iId], [sUsername], [sPassword], [sEmail], [sRole]) VALUES (19, N'Khổng Văn Sứng', N'123', N'sung@gmail.com', N'admin')
INSERT [dbo].[tblUser] ([iId], [sUsername], [sPassword], [sEmail], [sRole]) VALUES (20, N'Nguyễn Thùy Linh', N'123', N'linh@gmail.com', N'admin')
INSERT [dbo].[tblUser] ([iId], [sUsername], [sPassword], [sEmail], [sRole]) VALUES (23, N'Thân Văn Lâm', N'123', N'lam@gmail.com', N'writer')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD  CONSTRAINT [idCaterory_Catergories] FOREIGN KEY([iCategoryId])
REFERENCES [dbo].[tblCategories] ([iId])
GO
ALTER TABLE [dbo].[tblNews] CHECK CONSTRAINT [idCaterory_Catergories]
GO
USE [master]
GO
ALTER DATABASE [Web_Vietsoz] SET  READ_WRITE 
GO
