# HR Attrition Analysis

*A Data Analytics internship project focused on employee attrition analysis using Python, MySQL, SQL, and Power BI.*

---

## 1. Project Overview

This project presents a comprehensive analysis of an HR employee attrition dataset, aimed at uncovering workforce trends, employee demographics, attrition patterns, salary insights, and key retention-related factors. The end-to-end workflow spans data cleaning and preprocessing in Python, structured storage and querying using MySQL and SQL, and interactive visualization through Power BI. The project was developed as part of a Data Analytics internship, with the objective of applying analytical tools to derive actionable business insights from real-world HR data.

---

## 2. Internship Details

| Detail | Information |
|---|---|
| **Intern Name** | Amey Kishor Sawatkar |
| **Company Name** | SkillinfyTech Solutions Pvt. Ltd. |
| **Internship Domain** | Data Analytics |
| **Project Title** | HR Attrition Analysis |

---

## 3. Objectives of the Project

- To clean, preprocess, and structure raw HR attrition data for analysis
- To design and implement a relational database using MySQL for efficient data storage
- To derive business-oriented insights using SQL queries
- To identify key factors influencing employee attrition
- To build an interactive Power BI dashboard for visualizing HR metrics and trends
- To support data-driven decision-making related to employee retention strategies

---

## 4. Tools & Technologies Used

| Category | Tools/Technologies |
|---|---|
| Programming Language | Python |
| Data Manipulation | Pandas, NumPy |
| Data Visualization | Matplotlib, Seaborn |
| Database | MySQL |
| Query Language | SQL |
| Business Intelligence | Power BI |

---

## 5. Dataset Information

- **Dataset Name:** IBM HR Attrition Dataset
- **Total Records:** 1,470
- **Total Columns (after cleaning):** 32
- **Data Type:** Employee-level HR data including demographics, job role, department, income, tenure, work-life balance, overtime status, and attrition status

---

## 6. Project Workflow / Methodology

The project was executed in the following structured stages:

1. **Data Cleaning in Python**
   - Loaded the raw HR attrition dataset using Pandas
   - Handled missing values, removed redundant/unnecessary columns, and standardized data types
   - Performed exploratory data analysis (EDA) using Matplotlib and Seaborn
   - Exported the cleaned dataset for downstream use

2. **Database Creation in MySQL**
   - Designed and created a MySQL database to store the cleaned HR dataset
   - Defined an appropriate table schema and imported the cleaned data

3. **SQL Analysis**
   - Wrote and executed business-oriented SQL queries to extract insights on attrition, department trends, compensation, and demographics

4. **Power BI Dashboard Creation**
   - Connected the cleaned dataset to Power BI
   - Designed a 3-page interactive dashboard with KPI cards, visualizations, and filters to present findings clearly

---

## 7. SQL Analysis Work

A total of **50 business-oriented SQL queries** were written and executed as part of this project. These queries covered areas such as:

- Overall attrition rate and headcount summaries
- Department-wise and job role-wise attrition analysis
- Salary and income distribution across employee segments
- Attrition trends based on overtime, work-life balance, and tenure
- Demographic breakdowns including age, gender, marital status, and education field

The complete set of queries is available in the `SQL/` folder of this repository.

---

## 8. Power BI Dashboard Overview

The dashboard consists of **three interactive pages**, each focused on a specific analytical perspective:

### Page 1 – Executive Dashboard
- KPI Cards: Total Employees, Attrition Count, Active Employees, Attrition Rate, Average Monthly Income, Average Age
- Attrition by Department
- Attrition by Job Role

### Page 2 – Employee Insights
- Gender Distribution
- Employees by Age Group
- Marital Status Distribution
- Employees by Education Field

### Page 3 – Attrition Analysis
- Attrition by Age Group
- Attrition by Overtime
- Attrition by Monthly Income
- Attrition by Work-Life Balance

---

## 9. Dashboard Screenshots

### Executive Dashboard
![Executive Dashboard](Screenshots/Executive_Dashboard.png)

### Employee Insights
![Employee Insights](Screenshots/Employee_Insights.png)

### Attrition Analysis
![Attrition Analysis](Screenshots/Attrition_Analysis.png)

---

## 10. Key Insights / Findings

- A notable proportion of attrition is concentrated among employees who frequently work overtime, suggesting a link between work intensity and turnover.
- Certain departments and job roles exhibit higher attrition rates compared to others, indicating role-specific retention challenges.
- Employees with lower monthly income levels tend to show a higher likelihood of attrition, pointing to compensation as a contributing factor.
- Work-life balance ratings show a clear relationship with attrition, with lower balance scores associated with higher turnover.
- Demographic patterns reveal variations in attrition across age groups, marital status, and education fields, offering additional context for targeted retention strategies.

---

## 11. Repository Structure

```
HR_ATTRITION_ANALYSIS/
│
├── Dataset/
│   └── HR_Attrition_Cleaned.csv
│
├── Python/
│   └── HR_Attrition_Analysis.ipynb
│
├── SQL/
│   └── HR_Attrition_Analysis_SQL_Queries.sql
│
├── Power_BI/
│   └── HR_ATTRITION_ANALYSIS.pbix
│
├── Report/
│   └── HR_Attrition_Analysis_Internship_Report.docx
│
├── PPT/
│   └── HR_Attrition_Analysis_Presentation.pptx
│
├── Screenshots/
│   ├── Executive_Dashboard.png
│   ├── Employee_Insights.png
│   └── Attrition_Analysis.png
│
└── README.md
```

---

## 12. Conclusion

This project demonstrates a complete data analytics workflow, from raw data cleaning to actionable business intelligence reporting. By combining Python for preprocessing, MySQL and SQL for structured querying, and Power BI for visualization, the analysis successfully highlights the key drivers of employee attrition within the organization. Through this project, practical skills were developed in data wrangling, database management, SQL-based business analysis, and dashboard design — all of which contribute to building a strong foundation in data analytics and HR analytics practices.
