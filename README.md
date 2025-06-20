**# E-Vehicle-DataEngineering-ELT**

The project starts off with Normalizing the data and creating the tables. Next, an empty staging table is created and the cleaning of data is done. ELT process is all about pre-processing the raw data prior to loading it to the normalized tables. 

Phase 1: Normalization was done and tables were divided based on the 3rd Normal form.​
Phase 2: ELT process opted and cleaning was done in tableau prep and data was inserted into normalized tables.

**Normalizing the tables:**  
Normalization is accomplished by dividing a huge table into smaller, more manageable tables that adhere to specific standards or normal forms.​
![3de3b3d5-8efd-471d-93a6-4f23b436b04f](https://github.com/user-attachments/assets/ef6289c8-ab37-4dc5-a6ef-b8d70d4d36f7)

ELT:
Moving on with the ELT process includes 
1. Creating the Staging Table.
   Then Staging tables are created using the query [View Staging Table SQL](Staging_table.sql)
2. Loading the raw data.
   ![513fd44f-ca6f-43fa-9827-1d4a24e3872c](https://github.com/user-attachments/assets/2004a4ea-9657-4f7e-9ff0-5e0ac8482d6c)
3. Processing data.
   ![8f3875ad-a102-41c4-bcf5-0c06d7f08f61](https://github.com/user-attachments/assets/550a3e8f-36d7-4aa7-bf24-ed1b34f37aaf)
4. Creating Normalized table.
   Normalized Tables are created using the query [Normalized Tables Script](Normalized_tables.sql)
5. Mapping Data to Normalized table.
   Mapping is done using the insert command using the query [Insert Script](Insert_data_from_staging.sql)
