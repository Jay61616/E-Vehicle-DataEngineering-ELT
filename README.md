# ⚙️ E-Vehicle-DataEngineering-ELT

The project starts off with Normalizing the data and creating the tables. Next, an empty staging table is created and the cleaning of data is done. ELT process is all about pre-processing the raw data prior to loading it to the normalized tables. 

## 📌 Project Summary

The project is divided into two main phases:

###🔹Phase 1: 
Normalization was done and tables were divided based on the 3rd Normal form.​

###🔹Phase 2: 
ELT process opted and cleaning was done in tableau prep and data was inserted into normalized tables.

## 🧱 Data Normalization
## Normalizing the tables:
`Normalization` is the process of structuring data into smaller, manageable tables that follow relational database principles.​

![3de3b3d5-8efd-471d-93a6-4f23b436b04f](https://github.com/user-attachments/assets/ef6289c8-ab37-4dc5-a6ef-b8d70d4d36f7)

Tables like `Vehicle`, `Make`, `Model`, `Transactions`, and `Location` were created to form a relational schema.

## 🔁 ELT Workflow
### 1️⃣ Creating the Staging Table
   The raw CSV data was first loaded into a staging table for preprocessing by the script [Staging Table SQL](sql/Staging_table.sql)
   ```sql
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
```
### 2️⃣ Loading the raw data
   Raw electric vehicle data was loaded into the staging table.
   
   ![513fd44f-ca6f-43fa-9827-1d4a24e3872c](https://github.com/user-attachments/assets/2004a4ea-9657-4f7e-9ff0-5e0ac8482d6c)
   
### 3️⃣ Processing data
   Initial cleaning and filtering was performed using Tableau Prep.
   
   ![8f3875ad-a102-41c4-bcf5-0c06d7f08f61](https://github.com/user-attachments/assets/550a3e8f-36d7-4aa7-bf24-ed1b34f37aaf)
   
### 4️⃣ Creating Normalized table
   Normalized tables were created based on the final schema. Using the script [Normalized Tables Script](sql/Normalized_tables.sql)
### 5️⃣ Mapping Data to Normalized table
   Final transformation: data from the staging table was mapped and inserted into normalized tables using SQL joins. Using Script [Insert Script](sql/Insert_data_from_staging.sql)
