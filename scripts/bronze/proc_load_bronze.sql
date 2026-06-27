/*
===========================================================
Procedure: bronze.load_bronze

Purpose:
Loads all CRM and ERP source files into the Bronze layer.
Performs a full refresh by truncating existing tables
before loading fresh data from CSV files.

Features:
- Full Refresh Loading
- BULK INSERT
- Error Handling (TRY...CATCH)
- Load Duration Tracking (Per Table)
- Total Bronze Layer Load Duration
===========================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    DECLARE @start_time DATETIME,
            @end_time DATETIME,
            @batch_start_time DATETIME,
            @batch_end_time DATETIME;

   BEGIN TRY

    SET @batch_start_time = GETDATE();

        PRINT '=====================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=====================================';

        PRINT '-------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '-------------------------------------';

    /*==================================================
      CRM CUSTOMER
    ==================================================*/

        SET @start_time = GETDATE();

        PRINT 'Loading Table: bronze.crm_cust_info';

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\tarek\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'        
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 
              'Load Duration: '
              + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR(10))
              + ' seconds';

        PRINT '-------------------------------------';


    /*==================================================
      CRM PRODUCT
    ==================================================*/

        SET @start_time = GETDATE();

        PRINT 'Loading Table: bronze.crm_prd_info';

        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\tarek\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 
              'Load Duration: '
              + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR(10))
              + ' seconds';

        PRINT '-------------------------------------';


    /*==================================================
      CRM SALES
    ==================================================*/
        SET @start_time = GETDATE();

        PRINT 'Loading Table: bronze.crm_sales_details';

        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\tarek\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 
              'Load Duration: '
              + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR(10))
              + ' seconds';

        PRINT '-------------------------------------';

        PRINT 'Loading ERP Tables';

        PRINT '-------------------------------------';


      /*==================================================
           ERP CUSTOMER
      ==================================================*/

        SET @start_time = GETDATE();

        PRINT 'Loading Table: bronze.erp_CUST_AZ12';

        TRUNCATE TABLE bronze.erp_CUST_AZ12;

        BULK INSERT bronze.erp_CUST_AZ12
        FROM 'C:\Users\tarek\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 
              'Load Duration: '
              + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR(10))
              + ' seconds';

        PRINT '-------------------------------------';


     /*==================================================
           ERP LOCATION
     ==================================================*/

        SET @start_time = GETDATE();

        PRINT 'Loading Table: bronze.erp_LOC_A101';

        TRUNCATE TABLE bronze.erp_LOC_A101;

        BULK INSERT bronze.erp_LOC_A101
        FROM 'C:\Users\tarek\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT
              'Load Duration: '
              + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR(10))
              + ' seconds';

        PRINT '-------------------------------------';


      /*==================================================
            ERP CATEGORIES
      ==================================================*/

        SET @start_time = GETDATE();

        PRINT 'Loading Table: bronze.erp_PX_CAT_G1V2';

        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM 'C:\Users\tarek\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 
              'Load Duration: '
              + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR(10))
              + ' seconds';

        PRINT '-------------------------------------';

         SET @batch_end_time = GETDATE();

PRINT '=====================================';
PRINT 'BRONZE LAYER LOAD SUMMARY';
PRINT '=====================================';

PRINT 'CRM Tables Loaded   : 3';
PRINT 'ERP Tables Loaded   : 3';
PRINT 'Total Tables Loaded : 6';

PRINT '';

PRINT 'Total Load Duration : '
      + CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS NVARCHAR(10))
      + ' seconds';

PRINT '=====================================';

    END TRY

    BEGIN CATCH

        PRINT '=====================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
        PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
        PRINT '=====================================';

    END CATCH

END;
GO
