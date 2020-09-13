


create database WarehouseManagement
go

use WarehouseManagement
go

create table Unit
(
	Id int identity(1, 1) primary key,
	DisplayName nvarchar(max) 
)
go

create table Supplier
(
	Id int identity(1, 1) primary key,
	DisplayName nvarchar(max),
	Address nvarchar(max),
	Phone nvarchar(20),
	Email nvarchar(200),
	MoreInfo nvarchar(max),
	ContractDate DateTime
)
go


create table Customer
(
	Id int identity(1, 1) primary key,
	DisplayName nvarchar(max),
	Address nvarchar(max),
	Phone nvarchar(20),
	Email nvarchar(200),
	MoreInfo nvarchar(max),
	ContractDate DateTime
)
go


create table Object
(
	Id nvarchar(128) primary key,
	DisplayName nvarchar(max),
	IdUnit int null,
	IdSupplier int null,
	QRCode nvarchar(max),
	BarCode nvarchar(max)

	foreign key(IdUnit) references Unit(id),
	foreign key(IdSupplier) references Supplier(id),
)
go

create table UserRole
(
	Id int identity primary key,
	DisplayName nvarchar(max),
)
go

create table Users
(
	Id int identity primary key,
	DisplayName nvarchar(max),
	UserName nvarchar(100),
	Password nvarchar(max),
	IdRole int not null

	foreign key (IdRole) references UserRole(id)
)
go

create table Input
(
	Id nvarchar(128) primary key,
	DateInput DateTime

)
go

create table InputInfo
(
	Id nvarchar(128) primary key,
	IdObject nvarchar(128) not null,
	IdInput nvarchar(128) not null,
	Count int,
	InputPrice float default 0,
	OutputPrice float default 0,
	Status nvarchar(max)

	foreign key (IdObject) references Object(Id),
	foreign key (IdInput) references Input(Id)
)
go

create table Output
(
	Id nvarchar(128) primary key,
	DateOutput DateTime

)
go

create table OutputInfo
(
	Id nvarchar(128) primary key,
	IdObject nvarchar(128) not null,
	IdInputInfo nvarchar(128) not null,
	IdCustomer int not null,
	Count int,
	InputPrice float default 0,
	OutputPrice float default 0,
	Status nvarchar(max)

	foreign key (IdObject) references Object(Id),
	foreign key (IdInputInfo) references InputInfo(Id),
	foreign key (IdCustomer) references Customer(Id),
)
go

insert into UserRole (DisplayName) values (N'admin')
insert into UserRole (DisplayName) values (N'staff')

insert into Users (DisplayName, Username, Password, IdRole) values (N'admin', N'admin', N'db69fc039dcbd2962cb4d28f5891aae1
', 1)
insert into Users (DisplayName, Username, Password, IdRole) values (N'staff', N'staff', N'978aae9bb6bee8fb75de3e4830a1be46

', 2)
go

select * from Users


use WarehouseManagement