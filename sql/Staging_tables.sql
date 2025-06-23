
CREATE TABLE Staging_ElectricVehicles (
    VIN VARCHAR(50),
    County VARCHAR(100),
    City VARCHAR(100),
    State CHAR(50),
    PostalCode VARCHAR(50),
    ModelYear INT,
    Make VARCHAR(50),
    Model VARCHAR(100),
    EVType VARCHAR(100),
    CAFV_Eligibility VARCHAR(255),
    ElectricRange INT,
    BaseMSRP DECIMAL(10, 2),
    LegislativeDistrict INT,
    DOLVehicleID BIGINT,
    VehicleLocation VARCHAR(100),
    ElectricUtility VARCHAR(200),
    CensusTract BIGINT
);
