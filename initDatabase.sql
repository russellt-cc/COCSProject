CREATE DATABASE CateringSystemT02
GO
use CateringSystemT02
go
--
-- Table structure for table Providers
--
CREATE TABLE Caterers (
  Caterer_ID int NOT NULL primary key identity,
  Caterer_Name varchar(50) NOT NULL,
  Caterer_Description varchar(50) NULL,
  Caterer_Phone varchar(50) NULL,
  Caterer_Image varchar(100) NULL,
)


--
-- Table structure for table Food_Packages
--
CREATE TABLE Packages (
  Package_ID int NOT NULL PRIMARY KEY identity,
  Package_Name varchar(50) NOT NULL,
  Package_Desc varchar(400) NULL,
  Package_Discount decimal(10,2) NULL default(0),
  Package_Image varchar(100) NULL
)


--
-- Table structure for table Products
--
CREATE TABLE Items (
  Item_ID int NOT NULL primary key identity,
  Item_Name varchar(50) NOT NULL,
  Item_Desc varchar(400) NULL,
  Item_Price decimal(10,2) NOT NULL,
  Item_Calories int NULL,
  Item_Inventory int NULL,
  Item_Image varchar(100) NULL
)


--
-- Table structure for table Products
--
CREATE TABLE Package_Items (
  Package_ID int NOT NULL,
  Item_ID int NOT NULL,
  Quantity int NOT NULL,
  CONSTRAINT [PK_Package_Items] PRIMARY KEY(Item_ID,Package_ID),
  CONSTRAINT [FK_Package_Items_Items] FOREIGN KEY([Item_ID]) REFERENCES [Items]([Item_ID]),
  CONSTRAINT [FK_Package_Items_Food_Packages] FOREIGN KEY([Package_ID]) REFERENCES [Packages]([Package_ID])
)

--
-- Table structure for table Caterer_Packages
--
CREATE TABLE Caterer_Packages (
  Package_ID int NOT NULL PRIMARY KEY,
  Caterer_ID int NOT NULL,
  Limits int NOT NULL,
  CONSTRAINT [FK_Food_Packages_Packages] FOREIGN KEY([Package_ID]) REFERENCES [Packages]([Package_ID]),
  CONSTRAINT [FK_Food_Packages_Caterers] FOREIGN KEY([Caterer_ID]) REFERENCES [Caterers]([Caterer_ID]),
  )


--
-- Table structure for table Orders
--

CREATE TABLE Orders (
  OrderID int NOT NULL,
  Customer_ID int NOT NULL,
  Date_Ordered datetime NOT NULL,
  [Status] varchar(50) NOT NULL
)


-- --------------------------------------------------------

--
-- Table structure for table Order_Packages
--

CREATE TABLE Order_Packages (
  Order_ID int NOT NULL,
  Package_ID int NOT NULL,
  Quantity int NOT NULL,
) 

--
-- Table structure for Users
--

CREATE TABLE Users (
	User_ID int NOT NULL PRIMARY KEY identity,
	User_Name varchar(100) NOT NULL,
	Type varchar(100) NOT NULL,
	First_Name varchar(100) NOT NULL,
	Last_Name varchar(100) NOT NULL,
	Email varchar(100) NOT NULL,
	Password varchar(100) NOT NULL,
	Caterer_ID int
)
	