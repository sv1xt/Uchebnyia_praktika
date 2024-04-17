USE [master]
GO
/****** Object:  Database [Pracktika]    Script Date: 17.04.2024 5:32:27 ******/
CREATE DATABASE [Pracktika]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pracktika', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Pracktika.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pracktika_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Pracktika_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pracktika] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pracktika].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pracktika] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pracktika] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pracktika] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pracktika] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pracktika] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pracktika] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pracktika] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pracktika] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pracktika] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pracktika] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pracktika] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pracktika] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pracktika] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pracktika] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pracktika] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pracktika] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pracktika] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pracktika] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pracktika] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pracktika] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pracktika] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pracktika] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pracktika] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pracktika] SET  MULTI_USER 
GO
ALTER DATABASE [Pracktika] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pracktika] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pracktika] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pracktika] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pracktika] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pracktika] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pracktika] SET QUERY_STORE = OFF
GO
USE [Pracktika]
GO
/****** Object:  Table [dbo].[Заявки]    Script Date: 17.04.2024 5:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки](
	[ID_заявки] [int] IDENTITY(1,1) NOT NULL,
	[ID_пользователя] [int] NULL,
	[ID_подразделения] [int] NULL,
	[ID_сотрудника] [int] NULL,
	[Тип_заявки] [nvarchar](255) NOT NULL,
	[Дата_Начала] [date] NULL,
	[Дата_Окончания] [date] NULL,
	[Статус] [nvarchar](255) NOT NULL,
	[Причина_отказа] [nvarchar](255) NULL,
 CONSTRAINT [PK__Заявки__E9A9C3186A509306] PRIMARY KEY CLUSTERED 
(
	[ID_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Информация_о_посетителях]    Script Date: 17.04.2024 5:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Информация_о_посетителях](
	[ID_посетителя] [int] IDENTITY(1,1) NOT NULL,
	[ID_заявки] [int] NULL,
	[Фамилия] [nvarchar](255) NOT NULL,
	[Имя] [nvarchar](255) NOT NULL,
	[Отчество] [nvarchar](255) NULL,
	[Телефон] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Организация] [nvarchar](255) NULL,
	[Примечание] [nvarchar](255) NOT NULL,
	[Дата_рождения] [date] NOT NULL,
	[Серия_паспорта] [nvarchar](4) NOT NULL,
	[Номер_паспорта] [nvarchar](6) NOT NULL,
	[Фотография] [varbinary](max) NULL,
	[Фотография_название_файла] [nvarchar](255) NULL,
	[Скан_паспорта] [varbinary](max) NULL,
	[Скан_паспорта_название_файла] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделения]    Script Date: 17.04.2024 5:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделения](
	[ID_подразделения] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 17.04.2024 5:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[ID_пользователя] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Пароль] [nvarchar](255) NOT NULL,
	[Хэш_пароля] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 17.04.2024 5:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](255) NOT NULL,
	[Имя] [nvarchar](255) NOT NULL,
	[Отчество] [nvarchar](255) NULL,
	[ID_Подразделение] [int] NULL,
	[Должность] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Телефон] [nvarchar](255) NULL,
 CONSTRAINT [PK__Сотрудни__E647AF7C06526C43] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список_посетителей_группы]    Script Date: 17.04.2024 5:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список_посетителей_группы](
	[ID_посетителя] [int] IDENTITY(1,1) NOT NULL,
	[ID_заявки] [int] NULL,
	[Номер_по_порядку] [int] NULL,
	[Фамилия_и_инициалы] [nvarchar](255) NOT NULL,
	[Контакты] [nvarchar](255) NOT NULL,
	[Фотография] [varbinary](max) NULL,
	[Фотография_название_файла] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заявки] ON 

INSERT [dbo].[Заявки] ([ID_заявки], [ID_пользователя], [ID_подразделения], [ID_сотрудника], [Тип_заявки], [Дата_Начала], [Дата_Окончания], [Статус], [Причина_отказа]) VALUES (1, 1, 1, 1, N'личная', CAST(N'2024-04-17' AS Date), CAST(N'2024-04-28' AS Date), N'проверка', NULL)
INSERT [dbo].[Заявки] ([ID_заявки], [ID_пользователя], [ID_подразделения], [ID_сотрудника], [Тип_заявки], [Дата_Начала], [Дата_Окончания], [Статус], [Причина_отказа]) VALUES (2, 2, 2, 2, N'групповая', CAST(N'2024-04-18' AS Date), CAST(N'2024-04-29' AS Date), N'проверка', NULL)
INSERT [dbo].[Заявки] ([ID_заявки], [ID_пользователя], [ID_подразделения], [ID_сотрудника], [Тип_заявки], [Дата_Начала], [Дата_Окончания], [Статус], [Причина_отказа]) VALUES (3, 3, 3, 3, N'личная', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-30' AS Date), N'проверка', NULL)
SET IDENTITY_INSERT [dbo].[Заявки] OFF
GO
SET IDENTITY_INSERT [dbo].[Информация_о_посетителях] ON 

INSERT [dbo].[Информация_о_посетителях] ([ID_посетителя], [ID_заявки], [Фамилия], [Имя], [Отчество], [Телефон], [Email], [Организация], [Примечание], [Дата_рождения], [Серия_паспорта], [Номер_паспорта], [Фотография], [Фотография_название_файла], [Скан_паспорта], [Скан_паспорта_название_файла]) VALUES (1, 1, N'Иванов', N'Иван', NULL, NULL, N'visitor1@example.com', NULL, N'Нет примечаний', CAST(N'1990-01-01' AS Date), N'1234', N'567890', NULL, NULL, NULL, NULL)
INSERT [dbo].[Информация_о_посетителях] ([ID_посетителя], [ID_заявки], [Фамилия], [Имя], [Отчество], [Телефон], [Email], [Организация], [Примечание], [Дата_рождения], [Серия_паспорта], [Номер_паспорта], [Фотография], [Фотография_название_файла], [Скан_паспорта], [Скан_паспорта_название_файла]) VALUES (2, 2, N'Петров', N'Петр', NULL, NULL, N'visitor2@example.com', NULL, N'Нет примечаний', CAST(N'1985-05-05' AS Date), N'5678', N'123456', NULL, NULL, NULL, NULL)
INSERT [dbo].[Информация_о_посетителях] ([ID_посетителя], [ID_заявки], [Фамилия], [Имя], [Отчество], [Телефон], [Email], [Организация], [Примечание], [Дата_рождения], [Серия_паспорта], [Номер_паспорта], [Фотография], [Фотография_название_файла], [Скан_паспорта], [Скан_паспорта_название_файла]) VALUES (3, 3, N'Сидорова', N'Анна', NULL, NULL, N'visitor3@example.com', NULL, N'Нет примечаний', CAST(N'1988-10-10' AS Date), N'9876', N'543210', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Информация_о_посетителях] OFF
GO
SET IDENTITY_INSERT [dbo].[Подразделения] ON 

INSERT [dbo].[Подразделения] ([ID_подразделения], [Название]) VALUES (1, N'Отдел продаж')
INSERT [dbo].[Подразделения] ([ID_подразделения], [Название]) VALUES (2, N'Отдел разработки')
INSERT [dbo].[Подразделения] ([ID_подразделения], [Название]) VALUES (3, N'Отдел маркетинга')
SET IDENTITY_INSERT [dbo].[Подразделения] OFF
GO
SET IDENTITY_INSERT [dbo].[Пользователи] ON 

INSERT [dbo].[Пользователи] ([ID_пользователя], [Email], [Пароль], [Хэш_пароля]) VALUES (1, N'user1@example.com', N'password1', N'hash1')
INSERT [dbo].[Пользователи] ([ID_пользователя], [Email], [Пароль], [Хэш_пароля]) VALUES (2, N'user2@example.com', N'password2', N'hash2')
INSERT [dbo].[Пользователи] ([ID_пользователя], [Email], [Пароль], [Хэш_пароля]) VALUES (3, N'user3@example.com', N'password3', N'hash3')
INSERT [dbo].[Пользователи] ([ID_пользователя], [Email], [Пароль], [Хэш_пароля]) VALUES (7, N'1', N'12', N'c20ad4d76fe97759aa27a0c99bff6710')
SET IDENTITY_INSERT [dbo].[Пользователи] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([ID_сотрудника], [Фамилия], [Имя], [Отчество], [ID_Подразделение], [Должность], [Email], [Телефон]) VALUES (1, N'Иванов', N'Петр', NULL, 1, N'Менеджер', N'employee1@example.com', N'+7 (123) 456-78-90')
INSERT [dbo].[Сотрудники] ([ID_сотрудника], [Фамилия], [Имя], [Отчество], [ID_Подразделение], [Должность], [Email], [Телефон]) VALUES (2, N'Петрова', N'Мария', NULL, 2, N'Программист', N'employee2@example.com', N'+7 (987) 654-32-10')
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
GO
SET IDENTITY_INSERT [dbo].[Список_посетителей_группы] ON 

INSERT [dbo].[Список_посетителей_группы] ([ID_посетителя], [ID_заявки], [Номер_по_порядку], [Фамилия_и_инициалы], [Контакты], [Фотография], [Фотография_название_файла]) VALUES (1, 2, 1, N'Козлов И.И.', N'тел. +7 (123) 456-78-90, email: kozlov@example.com', NULL, NULL)
INSERT [dbo].[Список_посетителей_группы] ([ID_посетителя], [ID_заявки], [Номер_по_порядку], [Фамилия_и_инициалы], [Контакты], [Фотография], [Фотография_название_файла]) VALUES (2, 2, 2, N'Смирнова Е.П.', N'тел. +7 (987) 654-32-10, email: smirnova@example.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Список_посетителей_группы] OFF
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK__Заявки__ID_подра__3B75D760] FOREIGN KEY([ID_подразделения])
REFERENCES [dbo].[Подразделения] ([ID_подразделения])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK__Заявки__ID_подра__3B75D760]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK__Заявки__ID_польз__3A81B327] FOREIGN KEY([ID_пользователя])
REFERENCES [dbo].[Пользователи] ([ID_пользователя])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK__Заявки__ID_польз__3A81B327]
GO
ALTER TABLE [dbo].[Информация_о_посетителях]  WITH CHECK ADD  CONSTRAINT [FK__Информаци__ID_за__3E52440B] FOREIGN KEY([ID_заявки])
REFERENCES [dbo].[Заявки] ([ID_заявки])
GO
ALTER TABLE [dbo].[Информация_о_посетителях] CHECK CONSTRAINT [FK__Информаци__ID_за__3E52440B]
GO
ALTER TABLE [dbo].[Информация_о_посетителях]  WITH CHECK ADD  CONSTRAINT [FK_Информация_о_посетителях_Пользователи] FOREIGN KEY([ID_посетителя])
REFERENCES [dbo].[Пользователи] ([ID_пользователя])
GO
ALTER TABLE [dbo].[Информация_о_посетителях] CHECK CONSTRAINT [FK_Информация_о_посетителях_Пользователи]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Подразделения] FOREIGN KEY([ID_Подразделение])
REFERENCES [dbo].[Подразделения] ([ID_подразделения])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Подразделения]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Пользователи] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Пользователи] ([ID_пользователя])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Пользователи]
GO
ALTER TABLE [dbo].[Список_посетителей_группы]  WITH CHECK ADD  CONSTRAINT [FK__Список_по__ID_за__412EB0B6] FOREIGN KEY([ID_заявки])
REFERENCES [dbo].[Заявки] ([ID_заявки])
GO
ALTER TABLE [dbo].[Список_посетителей_группы] CHECK CONSTRAINT [FK__Список_по__ID_за__412EB0B6]
GO
USE [master]
GO
ALTER DATABASE [Pracktika] SET  READ_WRITE 
GO
