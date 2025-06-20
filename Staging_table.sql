
-- staging_table.sql

CREATE TABLE Staging_ElectricVehicles (
    VIN VARCHAR(20),
    County VARCHAR(100),
    City VARCHAR(100),
    State CHAR(2),
    PostalCode VARCHAR(10),
    ModelYear INT,
    Make VARCHAR(50),
    Model VARCHAR(100),
    EVType VARCHAR(100),
    CAFV_Eligibility VARCHAR(150),
    ElectricRange INT,
    BaseMSRP DECIMAL(10, 2),
    LegislativeDistrict INT,
    DOLVehicleID BIGINT,
    VehicleLocation VARCHAR(100),
    ElectricUtility VARCHAR(200),
    CensusTract BIGINT
);
