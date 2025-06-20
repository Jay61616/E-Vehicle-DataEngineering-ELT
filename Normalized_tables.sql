
-- normalized_tables.sql

CREATE TABLE Make (
    MakeID INT PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(50) NOT NULL
);

CREATE TABLE Model (
    ModelID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(50) NOT NULL,
    ElectricRange INT NOT NULL,
    PrimaryUse VARCHAR(150),
    CleanAlternate VARCHAR(150)
);

CREATE TABLE Vehicle (
    VIN VARCHAR(17) PRIMARY KEY,
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
    County VARCHAR(40),
    City VARCHAR(40),
    PostalCode VARCHAR(10),
    StateOfResidence VARCHAR(10),
    CensusTract BIGINT,
    LegislativeDistrict INT,
    ElectricUtility VARCHAR(455)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    DOLVehicleID BIGINT,
    TransactionVIN VARCHAR(20),
    DOLTransactionDate DATE,
    TransactionYear INT,
    PostalCode VARCHAR(10),
    ElectricVehicleType VARCHAR(30),
    TransportationType VARCHAR(200),
    HybridVehicle VARCHAR(17),
    VIN VARCHAR(17),
    SaleDate DATE,
    SalesPrice INT,
    BaseMSRP INT,
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
    HB2778Remark VARCHAR(300),
    HB2042Clean VARCHAR(300),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

CREATE TABLE SanctionRequirement (
    SanctionReqID INT PRIMARY KEY AUTO_INCREMENT,
    SanctionID INT,
    Meets2019HB VARCHAR(30),
    Meets2042HB VARCHAR(30),
    HB2042Alternative VARCHAR(300),
    HB2042Remark VARCHAR(300),
    HB2042SalePrice VARCHAR(300),
    FOREIGN KEY (SanctionID) REFERENCES Sanction(SanctionID)
);
