USE [WarehouseManagement]
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (1, N'Kg')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (2, N'Barrel')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (3, N'Pack')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'KTeam', N'somewhwere', N'12343124', N'supliewr2@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSupplier], [QRCode], [BarCode]) VALUES (N'1', N'Cement', 3, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSupplier], [QRCode], [BarCode]) VALUES (N'2', N'Brick', 3, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'KKK', N'somesfa', N'123424', N'asdf@gmail.com', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (2, N'QQQ', N'errerrewr', N'1234235665', N'dsaf3rfefw@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'1', CAST(N'2020-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'2', CAST(N'2020-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'1', N'1', N'1', 100, 150, 250, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'2', N'2', N'1', 200, 260, 300, NULL)
GO
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdInputInfo], [IdCustomer], [Count], [Status]) VALUES (N'1', N'1', N'1', 1, 20, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdInputInfo], [IdCustomer], [Count], [Status]) VALUES (N'2', N'2', N'1', 1, 10, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (1, N'admin')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (2, N'staff')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (11, N'admin', N'admin', N'db69fc039dcbd2962cb4d28f5891aae1', 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (12, N'staff', N'staff', N'978aae9bb6bee8fb75de3e4830a1be46', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'1', CAST(N'2020-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'2', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
GO
