
-- insert_data_from_staging.sql

-- Insert into Make
INSERT INTO Make (Make)
SELECT DISTINCT Make
FROM Staging_ElectricVehicles
WHERE Make IS NOT NULL;

-- Insert into Model
INSERT INTO Model (Model, ElectricRange, PrimaryUse, CleanAlternate)
SELECT DISTINCT 
    Model, 
    COALESCE(ElectricRange, 0),
    NULL,
    NULL
FROM Staging_ElectricVehicles
WHERE Model IS NOT NULL;

-- Insert into Vehicle
INSERT INTO Vehicle (VIN, ModelYear, MakeID, ModelID, Odometer, OdometerCondition, NewOrUsed)
SELECT 
    s.VIN,
    s.ModelYear,
    m.MakeID,
    mo.ModelID,
    NULL,
    NULL,
    'New'
FROM Staging_ElectricVehicles s
JOIN Make m ON s.Make = m.Make
JOIN Model mo ON s.Model = mo.Model;

-- Insert into Location
INSERT INTO Location (County, City, PostalCode, StateOfResidence, CensusTract, LegislativeDistrict, ElectricUtility)
SELECT DISTINCT 
    County, 
    City, 
    PostalCode,
    State,
    CensusTract,
    LegislativeDistrict,
    ElectricUtility
FROM Staging_ElectricVehicles;

-- Insert into Transactions
INSERT INTO Transactions (
    DOLVehicleID, TransactionVIN, DOLTransactionDate, TransactionYear, PostalCode,
    ElectricVehicleType, TransportationType, HybridVehicle,
    VIN, SaleDate, SalesPrice, BaseMSRP
)
SELECT 
    DOLVehicleID,
    VIN,
    CURRENT_DATE,
    ModelYear,                 
    PostalCode,
    EVType,
    NULL,
    NULL,
    VIN,
    CURRENT_DATE,
    NULL,
    BaseMSRP
FROM Staging_ElectricVehicles;

-- Insert into TransactionLocation
INSERT INTO TransactionLocation (TransactionID, LocationID)
SELECT 
    t.TransactionID,
    l.LocationID
FROM Transactions t
JOIN Location l 
  ON l.PostalCode = t.PostalCode
  AND l.County = (SELECT County FROM Staging_ElectricVehicles WHERE VIN = t.VIN LIMIT 1);

-- Insert into Sanction (Mock)
INSERT INTO Sanction (TransactionID, HB2778Remark, HB2042Clean)
SELECT 
    TransactionID, 
    NULL, 
    NULL
FROM Transactions;

-- Insert into SanctionRequirement (Mock)
INSERT INTO SanctionRequirement (
    SanctionID, Meets2019HB, Meets2042HB, HB2042Alternative, HB2042Remark, HB2042SalePrice
)
SELECT 
    s.SanctionID,
    NULL, NULL, NULL, NULL, NULL
FROM Sanction s;
