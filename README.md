# FinTech Customer Transaction & Risk Analytics

## Project Overview

The **FinTech Customer Transaction & Risk Analytics** project is a professional portfolio project designed to simulate the type of business analytics, payment operations reporting, and risk monitoring used by FinTech companies, digital banks, payment platforms, and financial services organizations.

This project analyzes synthetic customer and transaction data to evaluate transaction volume, fee revenue, failed payments, customer behavior, payment channel performance, merchant category trends, and transaction risk indicators.

The project demonstrates how an analyst can use **Python, SQL, Excel, and business reporting** to turn transaction-level data into meaningful insights for operations, finance, product, and risk teams.

This project is designed for roles such as:

* Financial Analyst
* Operations Analyst
* Business Analyst
* FinTech Analyst
* Data Analyst
* Payment Operations Analyst
* Risk Operations Analyst

---

## Business Problem

FinTech companies process thousands or millions of customer transactions across different payment channels, merchant categories, customer segments, and payment methods. These transactions create valuable business data, but they also create operational challenges.

A FinTech operations or analytics team needs to understand:

* How much transaction volume is being processed?
* How much fee revenue is being generated?
* Which customer segments are most valuable?
* Which payment channels have higher failure rates?
* Which merchant categories generate the most volume?
* Which transactions should be reviewed for risk?
* What failure reasons are affecting customer experience?
* How can business leaders monitor performance quickly through dashboards?

This project answers those questions through a structured analytics workflow.

---

## Tools and Technologies Used

* **Python** — data creation, analysis, KPI calculation, and risk scoring
* **Pandas** — data cleaning, grouping, aggregation, and reporting
* **NumPy** — numerical operations and synthetic data generation
* **Matplotlib** — visual analysis in the notebook
* **Jupyter Notebook** — step-by-step analysis workflow
* **SQL** — business queries for transaction, revenue, customer, and risk analysis
* **Excel** — PivotTables, KPI cards, and executive dashboard creation
* **GitHub** — documentation and version control

---

## Dataset Description

This project uses synthetic data created for portfolio and learning purposes. No real customer data, company data, bank data, or employer data is used.

The project includes two datasets:

### 1. Customer Profiles Dataset

The customer profile dataset includes information such as:

* Customer ID
* Signup date
* State
* Age group
* Customer segment
* Risk tier

### 2. FinTech Transactions Dataset

The transaction dataset includes information such as:

* Transaction ID
* Transaction date
* Customer ID
* State
* Age group
* Customer segment
* Risk tier
* Merchant category
* Payment channel
* Payment method
* Device type
* Transaction amount
* Fee amount
* Transaction status
* Failure reason
* Risk score
* Risk flag

The dataset is designed to represent a U.S.-based FinTech platform processing transactions through mobile app, web, API, and card terminal channels.

---

## Repository Structure

```text
fintech-transaction-risk-analytics/
│
├── data/
│   ├── customer_profiles.csv
│   └── fintech_transactions.csv
│
├── notebooks/
│   └── fintech_transaction_risk_analysis.ipynb
│
├── sql/
│   └── fintech_transaction_risk_queries.sql
│
├── dashboard/
│   ├── fintech_transaction_risk_dashboard.xlsx
│   └── fintech_dashboard_screenshot.png
│
├── reports/
│   └── insights.md
│
├── requirements.txt
└── README.md
```

---

## Project Workflow

### 1. Synthetic Data Creation

The project begins by creating synthetic customer and transaction datasets in a Jupyter Notebook. The data was designed to simulate realistic FinTech activity, including customer profiles, payment channels, merchant categories, transaction statuses, fee revenue, failed payments, and risk indicators.

### 2. Data Loading and Review

The generated CSV files were loaded back into the notebook to simulate a real analyst workflow. The data was reviewed for structure, columns, record counts, and business relevance.

### 3. Executive KPI Summary

Key performance indicators were calculated, including:

* Total transactions
* Completed transactions
* Failed transactions
* Failure rate
* Total completed transaction volume
* Total fee revenue
* Average completed transaction value
* High-risk transactions

### 4. Monthly Trend Analysis

Monthly transaction and revenue trends were analyzed to understand business activity over time. This helps identify changes in transaction volume, fee revenue, and failed payment activity.

### 5. Payment Channel Performance

Payment channels were compared based on transaction count, completed transactions, failed transactions, transaction volume, fee revenue, and average risk score.

This helps identify which channels may need operational review or performance improvement.

### 6. Merchant Category Performance

Merchant categories were analyzed to identify which categories generated the highest transaction volume, fee revenue, and risk activity.

This type of analysis can support product, operations, risk, and business strategy decisions.

### 7. Customer Segment Analysis

Customer segments were compared to understand differences in transaction behavior, revenue contribution, failed payments, average transaction size, and risk score.

Segments included:

* Standard
* Premium
* Small Business

### 8. Risk Flag Analysis

Transactions were assigned risk scores and grouped into risk flags:

* Low Risk
* Medium Risk
* High Risk

This helps identify transactions that may require additional review by fraud operations, compliance, payment operations, or customer risk teams.

### 9. Failed Transaction Analysis

Failed transactions were reviewed by failure reason to understand the most common payment issues. This analysis can help improve customer experience and reduce operational workload.

Failure reasons include:

* Insufficient Funds
* Card Declined
* Bank Network Error
* Account Verification Failed
* Limit Exceeded

### 10. Excel Dashboard Creation

An Excel dashboard was created using PivotTables, KPI cards, and charts. The dashboard gives business users a quick view of platform performance, revenue, failed payments, customer segments, payment channels, merchant categories, and risk indicators.

---

## Dashboard Preview

![FinTech Transaction & Risk Dashboard](dashboard/fintech_dashboard_screenshot.png)

---

## Key Analysis Areas

The project focuses on the following business and risk areas:

* Total transactions
* Completed and failed transactions
* Failure rate
* Transaction volume
* Fee revenue
* Average transaction value
* Monthly transaction trends
* Monthly fee revenue trends
* Payment channel performance
* Payment method performance
* Merchant category performance
* Customer segment performance
* Risk flag distribution
* Failed transaction reasons
* High-risk transaction review
* Customer-level activity patterns

---

## Key Insights

* Completed transactions drive fee revenue and overall platform performance.
* Failed transactions create customer experience issues and may reduce expected revenue.
* Some payment channels show higher failure activity and may require closer monitoring.
* Merchant category analysis helps identify high-volume business areas and categories with higher average risk.
* Customer segment analysis shows how different customer groups contribute to transaction volume and fee revenue.
* Risk flag analysis helps identify transactions that may require review by fraud, compliance, or operations teams.
* Dashboard reporting helps business teams monitor transaction performance and risk indicators more efficiently.

---

## Business Recommendations

Based on the analysis, the following recommendations were made:

* Monitor payment channels with higher failure rates to reduce customer friction.
* Review high-risk transactions regularly, especially large transactions and failed transactions.
* Track failed transaction reasons to identify repeated operational or payment processing issues.
* Prioritize high-volume and higher-risk merchant categories for closer review.
* Use customer segment reporting to support product, marketing, and risk decisions.
* Build recurring dashboard reporting for operations and leadership teams.
* Maintain customer-level transaction monitoring to identify unusual activity patterns.

---

## Skills Demonstrated

This project demonstrates the following skills:

* FinTech transaction analytics
* Customer behavior analysis
* Payment operations reporting
* Failed payment analysis
* Risk flag review
* KPI development
* Python data analysis
* Pandas aggregation and grouping
* SQL querying
* Excel PivotTables
* Excel dashboard creation
* Business insight reporting
* Executive dashboard documentation
* GitHub project organization

---

## How to Run This Project

### 1. Clone the Repository

```bash
git clone https://github.com/fitsa251/fintech-transaction-risk-analytics.git
```

### 2. Navigate Into the Project Folder

```bash
cd fintech-transaction-risk-analytics
```

### 3. Install Requirements

```bash
pip install -r requirements.txt
```

### 4. Open the Jupyter Notebook

Open and run the notebook below:

```text
notebooks/fintech_transaction_risk_analysis.ipynb
```

### 5. Review the Excel Dashboard

Open the Excel dashboard file:

```text
dashboard/fintech_transaction_risk_dashboard.xlsx
```

---

## Project Files

| File                                                | Description                                                                   |
| --------------------------------------------------- | ----------------------------------------------------------------------------- |
| `data/customer_profiles.csv`                        | Synthetic customer profile dataset                                            |
| `data/fintech_transactions.csv`                     | Synthetic FinTech transaction dataset                                         |
| `notebooks/fintech_transaction_risk_analysis.ipynb` | Python notebook for data creation, analysis, KPI calculation, and risk review |
| `sql/fintech_transaction_risk_queries.sql`          | SQL queries for transaction, revenue, customer, and risk analysis             |
| `dashboard/fintech_transaction_risk_dashboard.xlsx` | Excel dashboard workbook                                                      |
| `dashboard/fintech_dashboard_screenshot.png`        | Dashboard preview image                                                       |
| `reports/insights.md`                               | Final business insights and recommendations                                   |
| `requirements.txt`                                  | Python package requirements                                                   |

---

## Project Status

**Completed**

This project is complete and ready to be included in a professional finance, operations, business analytics, FinTech, or data analytics portfolio.

---

## Important Note

This project uses synthetic data only. No confidential company data, customer data, employer data, bank data, or private financial information is used.
