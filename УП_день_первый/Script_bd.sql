USE [master]
GO
/****** Object:  Database [КИИ_Лутошкин_Практика]    Script Date: 15.04.2024 16:44:58 ******/
CREATE DATABASE [КИИ_Лутошкин_Практика]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'КИИ_Лутошкин_Практика', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\КИИ_Лутошкин_Практика.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'КИИ_Лутошкин_Практика_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\КИИ_Лутошкин_Практика_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [КИИ_Лутошкин_Практика].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET ARITHABORT OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET  DISABLE_BROKER 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET  MULTI_USER 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET DB_CHAINING OFF 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET DELAYED_DURABILITY = DISABLED 
GO
USE [КИИ_Лутошкин_Практика]
GO
/****** Object:  Table [dbo].[Данные_Авторизации]    Script Date: 15.04.2024 16:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные_Авторизации](
	[ID] [int] NOT NULL,
	[E-mail] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
	[Шифр] [nvarchar](50) NULL,
	[Роль] [int] NOT NULL,
 CONSTRAINT [PK_Данные_Авторизации_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Документы]    Script Date: 15.04.2024 16:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Документы](
	[id_Документа] [int] NOT NULL,
	[id_Посетителя] [int] NOT NULL,
	[Тип_документа] [text] NULL,
 CONSTRAINT [PK_Документы] PRIMARY KEY CLUSTERED 
(
	[id_Документа] ASC,
	[id_Посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявки]    Script Date: 15.04.2024 16:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки](
	[Id_Заявки] [int] NOT NULL,
	[Тип] [nvarchar](50) NULL,
	[Цель] [nvarchar](50) NULL,
	[ID_Подразделение] [int] NULL,
	[ID_Сотрудник] [int] NULL,
	[дата_начала] [date] NULL,
	[дата_окончания] [date] NULL,
	[Статус] [nvarchar](50) NULL,
 CONSTRAINT [PK_Заявки] PRIMARY KEY CLUSTERED 
(
	[Id_Заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделения]    Script Date: 15.04.2024 16:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделения](
	[ID_Подразделение] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
 CONSTRAINT [PK_Подразделения] PRIMARY KEY CLUSTERED 
(
	[ID_Подразделение] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Посетитель]    Script Date: 15.04.2024 16:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посетитель](
	[id_Посетителя] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[E-mail] [nvarchar](50) NULL,
	[Номер телефона] [nvarchar](50) NULL,
	[Организация] [nvarchar](50) NULL,
	[Примечание] [nvarchar](max) NULL,
	[Дата рождения] [date] NULL,
	[Серия паспорта] [int] NULL,
	[Номер паспорта] [int] NULL,
	[Фото посетителя] [varbinary](max) NULL,
	[Скан паспорта] [varbinary](max) NULL,
	[ID_Авторизации] [int] NULL,
 CONSTRAINT [PK_Посетитель_1] PRIMARY KEY CLUSTERED 
(
	[id_Посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роль]    Script Date: 15.04.2024 16:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роль](
	[ID_Роли] [int] NOT NULL,
	[Название роли] [nvarchar](50) NULL,
 CONSTRAINT [PK_Роль] PRIMARY KEY CLUSTERED 
(
	[ID_Роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 15.04.2024 16:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_Сотрудника] [int] NOT NULL,
	[ID_Подразделение] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Код_сотрудника] [int] NULL,
	[ID_Авторизации] [int] NULL,
 CONSTRAINT [PK_Сотрудники_1] PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (1, N'-', N'1', N'54', 1)
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (2, N'-', N'2', N'52', 2)
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (3, N'-', N'3', N'51', 3)
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (4, N'-', N'4', N'50', 4)
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (5, N'-', N'5', N'53', 5)
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (6, N'-', N'6', N'55', 6)
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (7, N'-', N'7', N'56', 7)
INSERT [dbo].[Данные_Авторизации] ([ID], [E-mail], [Пароль], [Шифр], [Роль]) VALUES (8, N'-', N'8', N'58', 8)
GO
INSERT [dbo].[Подразделения] ([ID_Подразделение], [Название]) VALUES (1, N'Производство')
INSERT [dbo].[Подразделения] ([ID_Подразделение], [Название]) VALUES (2, N'Сбыт')
INSERT [dbo].[Подразделения] ([ID_Подразделение], [Название]) VALUES (3, N'Администрация')
INSERT [dbo].[Подразделения] ([ID_Подразделение], [Название]) VALUES (4, N'Служба безопасности')
INSERT [dbo].[Подразделения] ([ID_Подразделение], [Название]) VALUES (5, N'Планирование')
GO
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (1, N'Степанова', N'Радинка', N'Власовна', N'Radinka100@yandex.ru', N'+7 (613) 272-60-62', N'Россельхоз банк', N'Сотрудник банка', CAST(N'1986-10-18' AS Date), 208, 530509, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (2, N'Шилов', N'Прохор', N'Герасимович', N'Prohor156@list.ru', N'+7 (615) 594-77-66', N'ВТБ', N'Сотрудник банка', CAST(N'1977-10-09' AS Date), 3036, 796488, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (3, N'Кононов', N'Юрин', N'Романович', N'YUrin155@gmail.com', N'+7 (784) 673-51-91', N'Сбербанк', N'Сотрудник банка', CAST(N'1971-10-08' AS Date), 2747, 790512, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (4, N'Елисеева', N'Альбина', N'Николаевна', N'Aljbina33@lenta.ru', N'+7 (654) 864-77-46', N'АльфаБанк', N'Сотрудник банка', CAST(N'1983-02-15' AS Date), 5241, 213304, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (5, N'Шарова', N'Клавдия', N'Макаровна', N'Klavdiya113@live.com', N'+7 (822) 525-82-40', N'Тинькофф', N'Сотрудник банка', CAST(N'1980-07-22' AS Date), 8143, 593309, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (6, N'Сидорова', N'Тамара', N'Григорьевна', N'Tamara179@live.com', N'+7 (334) 692-79-77', N'Россельхоз банк', N'Сотрудник банка', CAST(N'1995-11-22' AS Date), 8143, 905520, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (7, N'Петухов', N'Тарас', N'Фадеевич', N'Taras24@rambler.ru', N'+7 (376) 220-62-51', N'ВТБ', N'Сотрудник банка', CAST(N'1991-01-05' AS Date), 1609, 171096, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (8, N'Родионов', N'Аркадий', N'Власович', N'Arkadij123@inbox.ru', N'+7 (491) 696-17-11', N'Сбербанк', N'Сотрудник банка', CAST(N'1993-08-11' AS Date), 3841, 642594, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (9, N'Горшкова', N'Глафира', N'Валентиновна', N'Glafira73@outlook.com', N'+7 (553) 343-38-82', N'АльфаБанк', N'Сотрудник банка', CAST(N'1978-05-25' AS Date), 9170, 402601, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (10, N'Кириллова', N'Гавриила', N'Яковна', N'Gavriila68@msn.com', N'+7 (648) 700-43-34', N'Тинькофф', N'Сотрудник банка', CAST(N'1992-04-26' AS Date), 9438, 379667, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (11, N'Овчинников', N'Кузьма', N'Ефимович', N'Kuzjma124@yandex.ru', N'+7 (562) 866-15-27', N'Россельхоз банк', N'Сотрудник банка', CAST(N'1993-08-02' AS Date), 766, 647226, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (12, N'Беляков', N'Роман', N'Викторович', N'Roman89@gmail.com', N'+7 (595) 196-56-28', N'ВТБ', N'Сотрудник банка', CAST(N'1991-06-07' AS Date), 2411, 478305, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (13, N'Лыткин', N'Алексей', N'Максимович', N'Aleksej43@gmail.com', N'+7 (994) 353-29-52', N'Сбербанк', N'Сотрудник банка', CAST(N'1996-03-07' AS Date), 2383, 259825, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (14, N'Шубина', N'Надежда', N'Викторовна', N'Nadezhda137@outlook.com', N'+7 (736) 488-66-95', N'АльфаБанк', N'Сотрудник банка', CAST(N'1981-09-24' AS Date), 8844, 708476, NULL, NULL, NULL)
INSERT [dbo].[Посетитель] ([id_Посетителя], [Фамилия], [Имя], [Отчество], [E-mail], [Номер телефона], [Организация], [Примечание], [Дата рождения], [Серия паспорта], [Номер паспорта], [Фото посетителя], [Скан паспорта], [ID_Авторизации]) VALUES (15, N'Зиновьева', N'Бронислава', N'Викторовна', N'Bronislava56@yahoo.com', N'+7 (778) 565-12-18', N'Тинькофф', N'Сотрудник банка', CAST(N'1981-03-19' AS Date), 6736, 319423, NULL, NULL, NULL)
GO
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (1, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (2, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (3, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (4, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (5, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (6, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (7, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (8, NULL)
INSERT [dbo].[Роль] ([ID_Роли], [Название роли]) VALUES (9, NULL)
GO
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (1, 1, N'Фомичева', N'Авдотья', N'Трофимовна', 9367788, 1)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (2, 2, N'Гаврилова', N'Римма', N'Ефимовна', 9788737, 2)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (3, 3, N'Носкова', N'Наталия', N'Прохоровна', 9736379, 3)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (4, 4, N'Архипов', N'Тимофей', N'Васильевич', 9362832, 4)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (5, 5, N'Орехова', N'Вероника', N'Артемовна', 9737848, 5)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (6, 1, N'Савельев', N'Павел', N'Степанович', 9768239, 6)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (7, 2, N'Чернов', N'Всеволод', N'Наумович', 9404040, 7)
INSERT [dbo].[Сотрудники] ([ID_Сотрудника], [ID_Подразделение], [Фамилия], [Имя], [Отчество], [Код_сотрудника], [ID_Авторизации]) VALUES (8, 3, N'Марков', N'Юрий', N'Романович', 9605013, 8)
GO
ALTER TABLE [dbo].[Данные_Авторизации]  WITH CHECK ADD  CONSTRAINT [FK_Данные_Авторизации_Роль] FOREIGN KEY([Роль])
REFERENCES [dbo].[Роль] ([ID_Роли])
GO
ALTER TABLE [dbo].[Данные_Авторизации] CHECK CONSTRAINT [FK_Данные_Авторизации_Роль]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Подразделения] FOREIGN KEY([ID_Подразделение])
REFERENCES [dbo].[Подразделения] ([ID_Подразделение])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Подразделения]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Сотрудники] FOREIGN KEY([ID_Сотрудник])
REFERENCES [dbo].[Сотрудники] ([ID_Сотрудника])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Сотрудники]
GO
ALTER TABLE [dbo].[Посетитель]  WITH CHECK ADD  CONSTRAINT [FK_Посетитель_Данные_Авторизации] FOREIGN KEY([ID_Авторизации])
REFERENCES [dbo].[Данные_Авторизации] ([ID])
GO
ALTER TABLE [dbo].[Посетитель] CHECK CONSTRAINT [FK_Посетитель_Данные_Авторизации]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Данные_Авторизации1] FOREIGN KEY([ID_Авторизации])
REFERENCES [dbo].[Данные_Авторизации] ([ID])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Данные_Авторизации1]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Подразделения] FOREIGN KEY([ID_Подразделение])
REFERENCES [dbo].[Подразделения] ([ID_Подразделение])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Подразделения]
GO
USE [master]
GO
ALTER DATABASE [КИИ_Лутошкин_Практика] SET  READ_WRITE 
GO
