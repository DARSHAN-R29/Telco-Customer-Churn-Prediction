# Telco-Customer-Churn-Prediction



📦 End-to-End Customer Churn Analysis
SQL • Power BI • Python (XGBoost) • Predictive Modeling • ETL Pipeline

This project demonstrates a full end-to-end data analytics & machine learning pipeline built using real-world tools.
It integrates SQL (ETL), Power BI (Descriptive Analytics), and Python (Predictive Modeling) to uncover customer churn drivers and predict at-risk customers.

🏗️ Project Architecture
                                     📦 End-to-End Customer Churn Pipeline


                              Raw CSV Dataset                                  

                                  ▼

                     SQL Server (ETL & Data Cleaning)                          
                         - Data loading                                                                
                         - Standardization & cleaning                                                  
                         - Feature preparation                                                         

                                  ▼

                     Power BI (Descriptive Analytics)                           
                           - Churn KPIs                                                                  
                           - Customer segmentation                                                        
                           - Revenue leakage analysis                                                     

                                  ▼

                     Python (XGBoost Machine Learning)                      
                         - Feature engineering                                                          
                         - Predictive churn modeling                                                    
                         - SHAP explainability                                                          
                         - Export high-risk customers                                                   

                                  ▼

                     Power BI (ML Integration & Risk Dashboard)                      
                         - Load predictions                                                             
                         - High-risk customer dashboard                                                 


     


📊 Dataset

Source: Telco Customer Churn (Kaggle)
Rows: ≈ 7,000
Objective: Predict whether a customer will churn based on service usage, contract type, and demographics.

Key fields:

Customer demographics (Age, Gender, SeniorCitizen)

Account details (Contract, PaymentMethod)

Service details (InternetService, TechSupport, Streaming)

Financial metrics (MonthlyCharges, TotalCharges)

Churn label (Yes/No)

🗂️ 1. SQL ETL Pipeline
✔ Tasks Performed:

Created database & table (TelcoChurn)

Loaded raw dataset into SQL

Cleaned inconsistent TotalCharges values

Removed missing rows and sanitized text fields

Generated churn statistics for validation

📌 Sample SQL:
CREATE DATABASE TELCOCUSTOMER;
USE TELCOCUSTOMER;

CREATE TABLE TelcoChurn (
    CustomerID VARCHAR(20),
    Gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    Tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);

📌 Export cleaned data to CSV (for Power BI & Python):
SELECT * FROM TelcoChurn;


(Export performed via MySQL Workbench or Python due to secure-file-priv restrictions.)

📈 2. Power BI Dashboard

The Power BI dashboard provides actionable, business-level insights on churn behavior.

🔹 Page 1 — Churn Overview

KPIs: Total Customers, Churned Customers, Churn Rate, Revenue Loss

Donut Chart: Churned vs Retained

Line Chart: Churn by Tenure

Bar Chart: Churn by Contract Type

🔹 Page 2 — Customer Demographics

Bar Chart: Churn by Gender

Bar Chart: Churn by Senior Citizen

Treemap: Revenue by Payment Method

Filters: Internet Service, Contract Type

🔹 Page 3 — Revenue Impact

Waterfall: Revenue vs. Lost Revenue

Table: Top 10 High-Value Churned Customers

Optional: Integration of Python-generated churn predictions

🌟 Dashboard Outcomes:

Identified Month-to-Month contract customers as the highest churn contributors

Found Fiber Optic users churn more than DSL users

Electronic Check payment method strongly correlates with churn

New customers (<12 months) have the highest churn likelihood

🤖 3. Python Machine Learning Pipeline (XGBoost)

The predictive model identifies customers with the highest churn risk.

✔ Steps:

Load CSV from SQL output

Preprocess numeric & categorical features

Train/Test split (80/20)

XGBoost classifier training

Hyperparameter tuning

Threshold optimization to boost recall

Generate churn probability for each customer

Export high-risk customer list (Top 50)

📌 Model Performance:

ROC-AUC: ~0.84

Recall: ~0.76 (after threshold tuning)

Precision: Balanced for business needs

📌 Key Python Code:
df = pd.read_csv("telco_clean.csv")
df['Churn_flag'] = df['Churn'].map({'Yes': 1, 'No': 0})

pipeline.fit(X_train, y_train)

y_proba = pipeline.predict_proba(X_test)[:,1]
y_pred = (y_proba >= 0.52).astype(int)

🔍 4. Explainability with SHAP

SHAP was used to interpret model predictions.

Top Churn Drivers:

Month-to-Month Contract

Tenure (shorter tenure → higher churn)

Fiber Optic Internet Service

Electronic Check Payment

Monthly Charges

SHAP plots included:

Feature importance bar plot

Individual force plots

Summary plot

📤 5. Integration with Power BI

Python-generated predictions were exported as:

top50_risky_customers.csv


This file was imported into Power BI to create a new section:

🔶 High-Risk Customer Monitoring

List of customers with highest churn probability

Prioritized by revenue contribution

Helps business teams focus retention efforts

📁 Project Structure
├── data/
│   ├── telco_clean.csv
│   ├── top50_risky_customers.csv
│


├── powerbi/
│   ├── churn_dashboard.pbix
│   ├── dashboard_screenshots/
│

├── python/
│   ├── churn_model.ipynb
│   ├── churn_xgb_model.pkl
│   ├── train.py
│

├── sql/
│   ├── schema.sql
│   ├── cleaning_queries.sql
│
├── README.md

🎯 Final Results

Built a fully automated, end-to-end churn analysis system

Dashboard + ML pipeline gives complete visibility into customer behavior

Model identifies high-risk customers before they churn

SQL ensures clean, curated dataset

Power BI provides actionable business insights

🚀 Future Improvements

Deploy model as REST API (FastAPI/Flask)

Automate data pipelines with Airflow

Build real-time churn alerting system

Add customer lifetime value (LTV) calculation
