# 🕵️‍♂️ Recruitment Black Hole Analysis
### End-to-End Data Pipeline & Bottleneck Detection


## 📖 Project Overview
Large organizations often face the **"Recruitment Black Hole"**—a phenomenon where candidates vanish in specific hiring stages due to process inefficiencies, causing increased Time-to-Hire and candidate dissatisfaction.

This project is a full-stack data solution that:
1.  **Generates** realistic, complex recruitment transaction logs using **Python**.
2.  **Transforms** raw logs into a professional **Star Schema (Dim/Fact)** in **SQL Server**.
3.  **Analyzes** the data using advanced SQL to identify a **27.29% bottleneck** in the Technical Interview phase.
4.  **Visualizes** the findings in a **Power BI** Funnel Dashboard.

---

## 🛠️ Tech Stack & Architecture

| Component | Tool | Description |
| :--- | :--- | :--- |
| **ETL & Data Gen** | Python (Pandas, SQLAlchemy) | Generated 12,000+ candidate logs with biased "failure patterns" to simulate real-world issues. |
| **Data Warehouse** | SQL Server (T-SQL) | Designed a normalized **Star Schema** (`Dim_Candidates`, `Fact_Application_History`). |
| **Analysis** | Advanced SQL | Used **Window Functions** and **Conditional Aggregation** to calculate stage-wise conversion rates. |
| **Visualization** | Power BI | Built Funnel Charts and KPI Cards to track the "Stuck Rate" by Source. |

---

## 📊 Key Findings (The "Black Hole")
The analysis revealed a critical bottleneck in the **Technical Round 1**:
* **Total Applicants:** 12,000+
* **Screening Pass Rate:** 50%
* **Bottleneck:** **29.27%** of candidates who entered "Tech Round 1" remained in `Started` status for >45 days (The "Black Hole").
* **Root Cause Indicator:** High correlation between *LinkedIn* applicants and delays, suggesting high volume overload from that specific channel.

---

## 📂 Repository Structure

```text
├── data_generation/
│   └── etl_pipeline.py       # Python script to generate data & upload to SQL
├── sql_queries/
│   ├── 01_schema_setup.sql   # DDL for Star Schema
│   └── 02_bottleneck_analysis.sql # The "Stuck Count" Logic
├── dashboard/
│   └── recruitment_funnel.pbix  # Power BI Dashboard file
└── README.md

