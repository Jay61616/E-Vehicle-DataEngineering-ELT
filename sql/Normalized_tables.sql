
CREATE TABLE Make (
    MakeID INT PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(50) NOT NULL
);

CREATE TABLE Model (
    ModelID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(100) NOT NULL,
    ElectricRange INT NOT NULL,
    PrimaryUse VARCHAR(100),
    CleanAlternate VARCHAR(100)
);

CREATE TABLE Vehicle (
    VIN VARCHAR(50) PRIMARY KEY,
    ModelYear INT,
    MakeID INT,
    ModelID INT,
    Odometer INT,
    OdometerCondition VARCHAR(50),
    NewOrUsed VARCHAR(10),
    FOREIGN KEY (MakeID) REFERENCES Make(MakeID),
    FOREIGN KEY (ModelID) REFERENCES Model(ModelID)
);

CREATE TABLE Location (
    LocationID BIGINT PRIMARY KEY AUTO_INCREMENT,
    County VARCHAR(100),
    City VARCHAR(100),
    PostalCode VARCHAR(50),
    StateOfResidence CHAR(50),
    CensusTract BIGINT,
    LegislativeDistrict INT,
    ElectricUtility VARCHAR(200)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    DOLVehicleID BIGINT,
    TransactionVIN VARCHAR(50),
    DOLTransactionDate DATE,
    TransactionYear INT,
    PostalCode VARCHAR(50),
    ElectricVehicleType VARCHAR(100),
    TransportationType VARCHAR(100),
    HybridVehicle VARCHAR(50),
    VIN VARCHAR(50),
    SaleDate DATE,
    SalesPrice DECIMAL(10, 2),
    BaseMSRP DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN)
);

CREATE TABLE TransactionLocation (
    TransactionID INT,
    LocationID BIGINT,
    PRIMARY KEY (TransactionID, LocationID),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Sanction (
    SanctionID INT PRIMARY KEY AUTO_INCREMENT,
    TransactionID INT,
    HB2778Remark VARCHAR(255),
    HB2042Clean VARCHAR(255),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

CREATE TABLE SanctionRequirement (
    SanctionReqID INT PRIMARY KEY AUTO_INCREMENT,
    SanctionID INT,
    Meets2019HB VARCHAR(30),
    Meets2042HB VARCHAR(30),
    HB2042Alternative VARCHAR(255),
    HB2042Remark VARCHAR(255),
    HB2042SalePrice VARCHAR(50),
    FOREIGN KEY (SanctionID) REFERENCES Sanction(SanctionID)
);
