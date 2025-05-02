-- Tạo database mới
create database RestaurantDatabase;
GO

-- Sử dụng database mới
USE RestaurantDatabase;

GO
/****** Object:  Table [dbo].[CookingStatusLog]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CookingStatusLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ItemID] [int] NULL,
	[CookedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[TableNumber] [int] NOT NULL,
	[OrderTime] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevenueReports]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueReports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportDate] [date] NULL,
	[TotalIncome] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Role] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (1, N'Phở Bò', N'Phở bò truyền thống với nước dùng đậm đà', CAST(45000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (2, N'Cơm Gà', N'Cơm gà chiên giòn kèm rau sống', CAST(40000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (3, N'Bún Chả', N'Bún chả Hà Nội đặc trưng', CAST(42000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (4, N'Gỏi Cuốn', N'Gỏi cuốn tươi kèm nước chấm', CAST(25000.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (5, N'Hủ Tiếu Nam Vang', N'Hủ tiếu nước kiểu Nam Vang với thịt heo, tôm, trứng cút', CAST(48000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (6, N'Bánh Mì Thịt Nướng', N'Bánh mì kẹp thịt nướng thơm lừng và rau sống', CAST(30000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (7, N'Mì Quảng', N'Mì Quảng đậm đà hương vị miền Trung', CAST(45000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (8, N'Bánh Xèo', N'Bánh xèo giòn rụm nhân tôm thịt, ăn kèm rau sống và nước mắm chua ngọt', CAST(40000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (9, N'Lẩu Thái Hải Sản', N'Lẩu chua cay kiểu Thái với mực, tôm, cá, và rau', CAST(150000.00 AS Decimal(10, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (2, 1, 2, 2)
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (3, 2, 3, 1)
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (4, 3, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [TableNumber], [OrderTime], [Status]) VALUES (1, 1, CAST(N'2025-04-15T11:19:27.500' AS DateTime), N'pending')
GO
INSERT [dbo].[Orders] ([OrderID], [TableNumber], [OrderTime], [Status]) VALUES (2, 2, CAST(N'2025-04-15T11:19:27.500' AS DateTime), N'cooking')
GO
INSERT [dbo].[Orders] ([OrderID], [TableNumber], [OrderTime], [Status]) VALUES (3, 3, CAST(N'2025-04-15T11:19:27.500' AS DateTime), N'ready')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (1, N'staff01', N'123456', N'Nguyễn Văn A', N'staff', 1)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (2, N'kitchen01', N'123456', N'Trần Thị B', N'kitchen', 1)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (3, N'manager01', N'123456', N'Lê Văn C', N'manager', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4AFE7D510]    Script Date: 4/23/2025 21:45:52 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CookingStatusLog] ADD  DEFAULT (getdate()) FOR [CookedAt]
GO
ALTER TABLE [dbo].[MenuItems] ADD  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('pending') FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CookingStatusLog]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[MenuItems] ([ItemID])
GO
ALTER TABLE [dbo].[CookingStatusLog]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[MenuItems] ([ItemID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='manager' OR [Role]='kitchen' OR [Role]='staff'))
GO
USE [master]
GO
ALTER DATABASE [RestauranceManage] SET  READ_WRITE 
GO


GO
/****** Object:  Table [dbo].[CookingStatusLog]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CookingStatusLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ItemID] [int] NULL,
	[CookedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[TableNumber] [int] NOT NULL,
	[OrderTime] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevenueReports]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueReports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportDate] [date] NULL,
	[TotalIncome] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/23/2025 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Role] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (1, N'Phở Bò', N'Phở bò truyền thống với nước dùng đậm đà', CAST(45000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (2, N'Cơm Gà', N'Cơm gà chiên giòn kèm rau sống', CAST(40000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (3, N'Bún Chả', N'Bún chả Hà Nội đặc trưng', CAST(42000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (4, N'Gỏi Cuốn', N'Gỏi cuốn tươi kèm nước chấm', CAST(25000.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (5, N'Hủ Tiếu Nam Vang', N'Hủ tiếu nước kiểu Nam Vang với thịt heo, tôm, trứng cút', CAST(48000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (6, N'Bánh Mì Thịt Nướng', N'Bánh mì kẹp thịt nướng thơm lừng và rau sống', CAST(30000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (7, N'Mì Quảng', N'Mì Quảng đậm đà hương vị miền Trung', CAST(45000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (8, N'Bánh Xèo', N'Bánh xèo giòn rụm nhân tôm thịt, ăn kèm rau sống và nước mắm chua ngọt', CAST(40000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[MenuItems] ([ItemID], [Name], [Description], [Price], [Available]) VALUES (9, N'Lẩu Thái Hải Sản', N'Lẩu chua cay kiểu Thái với mực, tôm, cá, và rau', CAST(150000.00 AS Decimal(10, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (2, 1, 2, 2)
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (3, 2, 3, 1)
GO
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (4, 3, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [TableNumber], [OrderTime], [Status]) VALUES (1, 1, CAST(N'2025-04-15T11:19:27.500' AS DateTime), N'pending')
GO
INSERT [dbo].[Orders] ([OrderID], [TableNumber], [OrderTime], [Status]) VALUES (2, 2, CAST(N'2025-04-15T11:19:28.500' AS DateTime), N'cooking')
GO
INSERT [dbo].[Orders] ([OrderID], [TableNumber], [OrderTime], [Status]) VALUES (3, 3, CAST(N'2025-04-15T11:19:29.500' AS DateTime), N'ready')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (1, N'staff01', N'123456', N'Nguyễn Văn A', N'staff', 1)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (2, N'kitchen01', N'123456', N'Trần Thị B', N'kitchen', 1)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (3, N'manager01', N'123456', N'Lê Văn C', N'manager', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4AFE7D510]    Script Date: 4/23/2025 21:45:52 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CookingStatusLog] ADD  DEFAULT (getdate()) FOR [CookedAt]
GO
ALTER TABLE [dbo].[MenuItems] ADD  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('pending') FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CookingStatusLog]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[MenuItems] ([ItemID])
GO
ALTER TABLE [dbo].[CookingStatusLog]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[MenuItems] ([ItemID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='manager' OR [Role]='kitchen' OR [Role]='staff'))
GO
USE [master]
GO
ALTER DATABASE [RestauranceManage] SET  READ_WRITE 
GO

