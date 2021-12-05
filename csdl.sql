USE [master]
GO
/****** Object:  Database [DBQuanLyHumanResource]    Script Date: 12/5/2021 3:20:50 PM ******/
CREATE DATABASE [DBQuanLyHumanResource]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBQuanLyHumanResource', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBQuanLyHumanResource.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBQuanLyHumanResource_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBQuanLyHumanResource_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBQuanLyHumanResource] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBQuanLyHumanResource].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBQuanLyHumanResource] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET  MULTI_USER 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBQuanLyHumanResource] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBQuanLyHumanResource] SET QUERY_STORE = OFF
GO
USE [DBQuanLyHumanResource]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/5/2021 3:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/5/2021 3:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id_category] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policies]    Script Date: 12/5/2021 3:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policies](
	[id_policy] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[id_category] [int] NOT NULL,
	[content] [nvarchar](1000) NULL,
	[format] [nvarchar](1000) NULL,
	[note] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.Policies] PRIMARY KEY CLUSTERED 
(
	[id_policy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/5/2021 3:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 12/5/2021 3:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[id_schedule] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Schedules] PRIMARY KEY CLUSTERED 
(
	[id_schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/5/2021 3:20:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[birthday] [datetime] NOT NULL,
	[gender] [int] NOT NULL,
	[phoneNumber] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[id_role] [int] NOT NULL,
	[startDay] [datetime] NOT NULL,
	[identityCard] [nvarchar](255) NULL,
	[bankAccount] [nvarchar](255) NULL,
	[request] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202111210715347_crate-dabase', N'ManageHR.Migrations.Configuration', 0x1F8B0800000000000400DD5BDB6EE336107D2FD07F10F45864A3248B05DAC0DE45EA6CDAA0BB491067177D0B188976844A944A52698CA25FD6877E527FA1A32B2992922559B6D3204060539CC3E1CC687899E37FFFFE67F2E1390CAC274C991F91A97D7C78645B98B891E793E5D44EF8E2CDF7F687F7DF7E33F9E885CFD6D7B2DFDBB41F481236B51F398F4F1D87B98F3844EC30F45D1AB168C10FDD28749017392747473F38C7C70E06081BB02C6B729B10EE8738FB025F67117171CC13147C8E3C1CB0A21D9ECC3354EB0A8598C5C8C553FB332268897FBE3DCCBBDAD659E02350638E83856D2142228E382879FA85E139A71159CE636840C1DD2AC6D06F8102860BE54F45F7AEF3383A49E7E108C112CA4D188FC29E80C76F0BC338AAF820F3DA95E1C0741FC1C47C95CE3A33DFD49E218E97115DD9963AD8E92CA06947CDBA87A5CC81553E39A8A2008225FD3BB06649C0138AA704279CA2E0C0BA491E02DFFD05AFEEA2DF309992240864D5403978566B80A61B1AC598F2D52D5E140AFBDEBD5BE9ECD4011C15A1923709E793BB24FCED896D5D813AE821C0552C488698F388E29F30C11464BD1BC439A6E0CA4B0F67D6D4D4500625F0BF1C0D820F5E221B0CF7FC0993257F9CDA27EFDED9D685FF8CBDB2A5D0E00BF1E19D03214E136CD0501E75E208CFB6FAFB260227F4F2762EB12F5FC785BE033C5D8ABE263F6F14D20AD0157AF297D9CC154891136E719075608F7E9C67D3221CEE459F0B1A85B75150C556F5E87E1E25D44D4D12999FDF21BAC47C6020A7907DC238EDBFAF20A699AE034238177C4D01DCD9BFE922EF25FD7C5CCAECCBCFACD27980AF85F0AEFCED815439DA397CBEF3C341F92761988E957BBE645886BC53FAF63EEF21B24EED819673EA4F37CA38F9C0DDA331EDBFAF48CC5D32200ABBF872BC084C47DBCFB209FB663FD8FDB03162EC8F887ABB1F7901DD473275FB40C8F328666CEBE33CF8943F7A68B571065B62E2F54E60AA5F1F2382AF92F041006D6DE20CDEBD846DA66FC7BD45D7AC9D6FC60C593BCBBAF95391B1AB462D5B8B277D32F5196391EB6743D74E3962935A9FC647E2596B76ACB907C57E17DC08C9DA8FE1332830B5BFD36CD30C5A4E450215BBE73AECB1AD66F76B728E03CCB175E6E6170833C45CE419B618A040BD0516044CD33C8C8219380596189F707DF5F089EBC72868575E11EB7B324FF5AB46529F9CE3387D03096F77CA082A542329A65B67A9892385587BE489806F0A0F43F48BC0C8F718DD634D7F6124B0FCBD7B6911A6A9DCD1B1A64354AFB8D20CBFE1C03B88A6FAA6B729081A76C02210C459AA7B649937CE6B4275FFD16554BBA3A34D9BE65E116674C486838F1E65F91A0A321C24302D34C88F29E70F693B7EE686730ECCA938EAB0629FA2864E8A3BC7BC7E8BE463D8AA88755B5B00B500ACA3649778668C1BF3D5A08A90BAC6247E6BBA9451854B8F9A00E64DA77D15248D0613C017D3214DF29A40D02EDDA45E0DF7726A20ADDFF4546ACB56D70272FD3E47C29163407DDFEB13ED6004692FA94FBF61DD5DB3F24AAA164E6A99AFBED64AE245946D3C49E59A439F68CB92D0615190349642BB65D2E665609DDD5A265E6EE2AB0424EA7A4E5ED82B0B804E430570F219C5311CADA48A60D162CDF372E0ECCDBC7FA92CCC311C97192A6695B6D5483CA2903095A73034687AE153C6E1388A1E507A889A79A1D64D4DB70D09A41C4DCBA8BAC3CADC528AA49FE5D4AE97EF0C2B53217C01530BD3652DBBDED1DF67836856964501A26DE58959142421E9B0556FC6CBAF3064A0BC45479838CA6CB4A555339AB623A9BBA19393AAD4B9898B8AA5ADBF839A045BDC5396C914E7980B6FE3B866EC60D993ABF39CBF899F4D0B56072F9BC55AAC9A1F61148B9ACF3563F8774FFE102BDA263EA9B675FDFDD22CDAE21B51F751FCD3544D6AC3CB4B3A3250DED2EB1DCC8F228A36E6F3C9DE7C9D6F3B36F1B369FFD4C1C766B1B1ACD984230A25329068ED8E54143E6498A2A93B86A862C830A2B53B92A84AC848A2B53B5255769081AAC6EE38A2AC200389D6EE48655D41C629DB7AD85AAE2CD4CC2D3FE88E57560F64A8B2AD5796E8B5A66C354B68470AB54B357A75B4508E1093623BBF9E69A8EDEFF32EB605067AF2BD746F3F5F318EC3C3B4C3E1FCF76016F8305FD101F290BFC08CE7355EFBE4E8F844E12BBE1CEEA0C39817188E43260261DD5F7BE1F2F9A99DD796A47B96CAE4A2297942D47D4454AFEA8DCACE1B66CAD1A8722FD58CDD6340BBBCBC84B4FB3CB5FFCCE44EADCB5FEF25D103EB9AC28B796A1D597F8DE549430968A76CB197EAC3FEFCAF61461C958AB51563CAECABF4331F817DD523F8938C9D347EE01B2A553B252D6DC5572A4F69B40456A3218D86AAB28C46035649445D80077086C682552942835FB33A45280BB1CD094263CDB2CE071AA29C69EDE8964568C6AADE388B0C67F0CC94E57F77F41AB51036883534A8C6DD7281BF6D56CEAB61E1DC4AF1BE1BB24CBD903880F53328561A6E98B7C7B07935AC9A4E5EDA5284CC950D684F16CF605ED6CE9932FF13768C5ED56DB8A4D67E41D5C27CC96F8E6057F210819FF335B38530A18E512E318DBC1813FE4D03B1C3C89A6924CD9890CD0488263E4D2B9DC604DFC85630B26D1AC9362668338361FB3C1C3548EA15F6F5CC9B9A5C03196A0F2C1B397244B5721DB146E394BC242E4D27051B12B8A93CB815B68C7E850D6950FA493DE460E62F0544FA037B82DD5A02ACFA5C924554266245A3B28B7286F88C3982F3153AA3DC5F2097C363178E74D94F20BEA220812E1FE1F4E35D92EB84C7098729E3F021A8856C9ACFDBC6CF2841759D27D771F6938331A6006AFAE911F19AFC98F88157E97D6138C83440A40B4571EF90FA92A7F70FCB5585740587C06E4085F9AAF5ED0E87710060EC9ACCD1131EA21B04ED27BC44EEAAAC443483AC7744DDEC93731F2D290A598121E4E12BC4B0173EBFFF0F5AAB39EB59420000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202112050721375_nguyen', N'ManageHR.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4586423278B05DAC0DE45EA246DD0CD0571B2E85B404BB423AC4469292A8D51F4CBFAD04FEA2F7474254552B224CB761A1428128A3C1CCE0C391CCEC9FEFBF73FE34F2FBE673C631AB9019998478723D3C0C40E1C972C2766CC16EF7E343F7DFCFEBBF1B9E3BF185F8A7EEF937E30924413F389B1F0C4B222FB09FB283AF45D9B0651B0608776E05BC809ACE3D1E827EBE8C8C200610296618CEF62C25C1FA7BFC0AFD380D8386431F2AE02077B51DE0E5F6629AA718D7C1C85C8C613F30A11B4C4BFDE1D665D4DE3D473118831C3DEC234102101430C843C7988F08CD1802C67213420EF7E1562E8B7405E8473E14F78F7B6EB181D27EBB0F8C002CA8E2316F81D018FDEE78AB1E4E1BDD46B968A03D59D838AD92A5975AABE8939450C2F03BA320D79B293A947938E8A760F8B310746F1E5A0F4027096E4BF03631A7B2CA6784270CC28F20E8CDB78EEB9F66F78751F7CC5644262CF134503E1E05BA5019A6E691062CA567778910BEC3A8F7629B35505B0648472BC6E70B6B84BC2DE1F9BC6358883E61E2E7D4150C48C0514FF8209A630D6B9458C610AA6BC7470AA4D450C695202FF2F6603E7834D6482E25E3E63B2644F13F3F8C307D3B8705FB053B4E4123C1017F61C0C6234C61A09C559C716B76CA3BD6F033042276B6723F665EB3097B787A58BA16FC9CEEAAC764018C8D730F1D168346A3573F3448B80FA6807F380399AD438D02C1D4E0209E81A3DBBCBD46124487E94DE612FED103DB9611684F25DF4C8FB5CD0C0BF0BBC724B969F1E67414CED440581FEFB3DA24BCC7AEEFF04B2CBEE4FFAEF6BEFD354D61E3B3F1BF896F67D6BFB26772327EE66E362CCBEEC1C9532F7B0351FBC2B7B3B881F5067F0F3BDEB773FB641F238C274A8B3E721C5D29C3B856D1FB31EFCD4A97C50CE9CEAD78D4E9C6CE2F6DE98F4DF97276626E9E1856D6C399C0726B3EDE7B601E986EBED7EDA1045D11F0175763FF302BA0FA4EAE68990E3501C455B9F67EE52F6E4A0D5C627D81213A7F30126DBF52920F83AF6E71C686B0B8F60EFC5D166F2020665670328CFCD77FA140DE2D46B4C8EC8D753DB0EE2C6346198B928FE16E368076942CB6B5EDB009ADD8B3501340D80D9571E3CCB462570F22F5D82E6691405B69B4E5DC9D379BE505DC639718C35C943A67E9E7A800D206EBA21FC0C024CCC1F14DDD483164B1140792253853D32E5407B43CEB08719364EEDEC096C8A221B399ADB1E08506D81D88C69B251903705A340B477095303B94B6C37445EB3F0D2B0AE6F4B897CE54CF297331C26872161CD4619408472264975EB3435B604176BF63CEEF075EEA1F17EEE18D975AFBDAFA91B4600CBF6DD6BF33045E49686D5E5B39DFC4A51FC8613EFC09BAAF9479D13D42423DC11785ADBDEB3F439CC1A57DDBF7769C56E69685DFED2C9C3B486D870F2C1BD2C8BA13086C1084C7309B28CF16C9EB4E317A64939614D79D619E5770CD97512DC1966D5073D17C3AD91C76D25002A0E5845499FA1F518B7FAC76D1921318D6EF89DEE7D4C1E5C58540730AB7B789141126FD0013CE8F265C16A1C4179FF147AD53C91CA8EB4FED2538A2D6A5D71C8F5F71C0147F40179BF5717DA4209C25D525D7E4DDC5D13790551732335AC578DB5C2F0DCCB365EA4F4E2A42EB42124B4080A82C4826B372C5A1F06D6E9AD61E1C525BE3C807865DACA4AD34509DBAAA9618FAF5018425E24D4B4F316639615B4A7EF66DD8BBD7E8661D991A6E65B4A5BCEC4020A07A6F415A606492F5C1A419ECBD01C2549D4D4F1956EF2715B738014B32927AA6AB0E26C2986243F8B47BB5A80D644A67CF0052CCD4FC25AFAD2A6EE67CDD09458803C449B2A45D3C08B7DD2E2AA5E8F97BD268940598B8A30B6A4D528A155519A7223A99AA19591CAA3731313E5A1ADBB81EA063698A728F44AC6D1978E87314D1D42598D1541CAC6F63845B1558429DA3AAC272DA556D693B6B447E8EBFC7B72DD2C866DE2B7BA00DCC26BF5C31AB49AA5649246F5795A837D5FFB51C223F4263629AFA9DDED523FB4C136BCA428D9A7AE50D98497550B45A0ACA5D31ECC522B491A7DBEB5375B67D7A84DECACBB0FB6B0B17ED850DAACC3E135381188B7B647CA6B6A224CDED41E8317C84418DEDA21F29405AF4AEC295BDB2395152D11A86C6C8FC32B5622106F6D8F5494AC449CA2AD83AEC5A25545DDE287F67845614A842ADA3AA1E4A52909276FED72DE88B5A9EA3611BF74B0A05880AA1851FCD01EAF2C3289586563A793B5531CDEEAC9AAA495729772F632BD94D2C8719ED2ADE74B2B395ED6C5344041CF6065C8EF66AB8861FF30E97038FBE64D3D37BDC2161DE0EC7617A0EE8C72611E8F8E8E25D6F5EB61405B51E4789A94584783AEDA6B2F8C6437D1F35A8648C782B3C86120CF88DA4F88AAE5DF4139C6FD543918E1F7B5AA51059528BC5ADCAC6ACE81BB337607831509BA8381D6ED03E511FF12C2F5CBC4FC331D77625CFEFE280C3D306E281C4E27C6C8F86B286FD69442774A607DAD7EDC9D92DA4F8983B243B7A24C91109AFCCC0620847670FE38254C0EEFF89A8AED4E79945BB1954C9D1CEC10AF3023074395898F8301CBBCC636C03D688C43C1CAACC5DEDBACCA5A4C5D6C73CEE250ABAC5214FB0827131437388E5482E260C654F98843414BF4C321AF274A4C6E773AD3F40F68363E9DFB3304A7D2B56A77F43DB9D0DE8B95D88B43D35020DC36EBEFCDB0FCEE047FDF0D19AF4A54E8C12AECE52B35159FED31F8DE0C6BAF9595B6E42133E962DF9125D89BF7B97326DEFF847DA7B2466A8A46F2835B13B32E7B95845BCC3C003B6731B3819025CF5184985ADE9D0EFFB68638A665E5D592F274C87A82551D5FAF91AEA783AF654369D97CB5643E1DB49E21B57D9E9FEC245506CF7A665F655C0DD9720F2C3ED173387B601D714FE1ACBD26AE5E2B016B0E705DB97E2B6C3CB53C02C7A0F08FCEC0191CB94B0E91FC133404DB9503B0EC7349164171104B12155DA41CE20A3304F9183AA5CC5D209BC1671B52E5F4EFA3BE202F862EE790553A97E4266661CC60C9D89F7B15974DCEF3A6F953CA6155E6F14D98FE49D3104B0031DD24A5BC213FC7AEE794725F6812991A882450E4EF39892D59F2AEB35C9548D7905CB703CAD557C6B77BEC871E80453764869E711FD9C0693FE325B2574595AB1E64BD21AA6A1F9FB96849911FE5187C3CFC0A3EECF82F1FFF03D2C2AF1E7B490000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id_category], [name]) VALUES (1, N'Khen thưởng')
INSERT [dbo].[Categories] ([id_category], [name]) VALUES (2, N'Đãi ngộ')
INSERT [dbo].[Categories] ([id_category], [name]) VALUES (3, N'Kỷ luật')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Policies] ON 

INSERT [dbo].[Policies] ([id_policy], [name], [id_category], [content], [format], [note]) VALUES (1, N'Nhân viên mới', 1, N'Nhân viên mới vào làm nhận được trợ cấp', N'Chuyển khoản qua tháng lương đầu tiên', N'Áp dụng tất cả nhân viên')
INSERT [dbo].[Policies] ([id_policy], [name], [id_category], [content], [format], [note]) VALUES (5, N'Đãi ngộ mới', 2, N'Đãi ngộ thật nhiều', N'Đãi ngộ thông qua chuyển khoản', N'2 lần 1 năm')
INSERT [dbo].[Policies] ([id_policy], [name], [id_category], [content], [format], [note]) VALUES (6, N'Kỷ luật đi trễ', 3, N'Đi trễ 5 phút bị kỉ luật và phạt tiền', N'Phạt 50000 vào quỹ', N'Áp dụng tất cả nhân viên')
SET IDENTITY_INSERT [dbo].[Policies] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id_role], [name]) VALUES (1, N'Nhân viên')
INSERT [dbo].[Roles] ([id_role], [name]) VALUES (2, N'Quản lý')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([id_schedule], [date], [id_user]) VALUES (5, CAST(N'2021-11-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Schedules] ([id_schedule], [date], [id_user]) VALUES (6, CAST(N'2021-11-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Schedules] ([id_schedule], [date], [id_user]) VALUES (7, CAST(N'2021-12-05T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Schedules] ([id_schedule], [date], [id_user]) VALUES (8, CAST(N'2021-12-05T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Schedules] ([id_schedule], [date], [id_user]) VALUES (9, CAST(N'2021-12-04T00:00:00.000' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [username], [email], [password], [fullname], [address], [birthday], [gender], [phoneNumber], [status], [id_role], [startDay], [identityCard], [bankAccount], [request]) VALUES (1, N'admin', N'admin@gmail.com', N'admin', N'Admin', N'Hà Nội', CAST(N'1998-07-06T00:00:00.000' AS DateTime), 1, N'0394071234', 1, 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'206125756', N'1698735987456', N'Nhân viên mới nên chăm chước')
INSERT [dbo].[Users] ([id_user], [username], [email], [password], [fullname], [address], [birthday], [gender], [phoneNumber], [status], [id_role], [startDay], [identityCard], [bankAccount], [request]) VALUES (3, N'levanc', N'levanc@gmail.com', N'levanc', N'Lê Văn C', N'Hà Nội', CAST(N'1999-11-28T00:00:00.000' AS DateTime), 1, N'0394012345', 1, 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'206197456', N'1006236197455', N'Nhân viên mới nên chăm chước')
INSERT [dbo].[Users] ([id_user], [username], [email], [password], [fullname], [address], [birthday], [gender], [phoneNumber], [status], [id_role], [startDay], [identityCard], [bankAccount], [request]) VALUES (4, N'builetoan', N'builetoan@gmail.com', N'123456789', N'Bùi Lê Tuân', N'Hà Nội', CAST(N'1997-12-05T00:00:00.000' AS DateTime), 1, N'0394012365', 1, 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'206123431', N'1235987469712', N'Nhân viên mới nên chăm chước')
INSERT [dbo].[Users] ([id_user], [username], [email], [password], [fullname], [address], [birthday], [gender], [phoneNumber], [status], [id_role], [startDay], [identityCard], [bankAccount], [request]) VALUES (6, N'lethiloan', N'lethiloan@gmail.com', N'123456', N'Lê Thị Loan', N'Đà Nẵng', CAST(N'1993-12-05T00:00:00.000' AS DateTime), 0, N'039412361', 1, 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'206123456', N'1235987456122', N'Nhân viên mới nên chăm chước')
INSERT [dbo].[Users] ([id_user], [username], [email], [password], [fullname], [address], [birthday], [gender], [phoneNumber], [status], [id_role], [startDay], [identityCard], [bankAccount], [request]) VALUES (7, N'kieutrang', N'kieutrang@gmail.com', N'123456', N'Kiều Trang', N'Quảng Bình', CAST(N'1997-12-05T00:00:00.000' AS DateTime), 0, N'039401235', 1, 1, CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'123456789', N'1006239687412', N'Nhân viên có 4 năm kinh nghiệm')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_id_category]    Script Date: 12/5/2021 3:20:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_category] ON [dbo].[Policies]
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_user]    Script Date: 12/5/2021 3:20:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_user] ON [dbo].[Schedules]
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_role]    Script Date: 12/5/2021 3:20:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_id_role] ON [dbo].[Users]
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [startDay]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Policies_dbo.Categories_id_category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Categories] ([id_category])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_dbo.Policies_dbo.Categories_id_category]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Schedules_dbo.Users_id_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_dbo.Schedules_dbo.Users_id_user]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_id_role] FOREIGN KEY([id_role])
REFERENCES [dbo].[Roles] ([id_role])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_id_role]
GO
USE [master]
GO
ALTER DATABASE [DBQuanLyHumanResource] SET  READ_WRITE 
GO
