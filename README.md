# SQL Data Warehouse Project

## Overview

This project demonstrates the design and implementation of a modern SQL Data Warehouse using the Medallion Architecture (Bronze, Silver, and Gold layers).

The project covers the complete data warehousing lifecycle, including data ingestion, data cleaning, transformation, dimensional modeling, and the creation of business-ready datasets for reporting and analytics.

## Project Objectives

* Build a scalable SQL Data Warehouse.
* Implement Bronze, Silver, and Gold layers.
* Perform data cleaning and standardization.
* Create analytical data models.
* Support business intelligence and reporting requirements.

## Architecture

### Bronze Layer

**Purpose:** Raw data ingestion from source systems.

**Load Strategy:**

* Batch Processing
* Full Load
* Truncate & Insert

**Tasks:**

* Store raw source data.
* Maintain original records.
* Apply minimal transformations.

### Silver Layer

**Purpose:** Clean and standardized data.

**Transformations:**

* Data Cleaning
* Data Standardization
* Duplicate Removal
* Null Handling
* Data Validation
* Data Type Corrections

### Gold Layer

**Purpose:** Business-ready analytical datasets.

**Activities:**

* Fact Table Creation
* Dimension Table Creation
* Star Schema Modeling
* KPI Calculations
* Aggregated Metrics
* Reporting Support

## Technologies Used

* SQL Server
* T-SQL
* ETL Processes
* Data Warehousing
* Dimensional Modeling

## Project Structure

```text
sql-datawarehouse-project/
│
├── datasets/
├── bronze_layer/
├── silver_layer/
├── gold_layer/
├── scripts/
└── README.md
```

## Key Learnings

* Data Warehouse Design
* ETL Development
* Data Transformation
* Data Quality Management
* Dimensional Modeling
* SQL Optimization
* Business Analytics

## Author

Sama

Aspiring Data Analyst passionate about Data Engineering, Data Warehousing, and Business Intelligence.
