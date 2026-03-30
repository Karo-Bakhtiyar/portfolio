# Retail Sales Data Exploration: Advanced SQL Queries for Fashion E-commerce

## Project Overview

I wrote comprehensive SQL queries to explore sales performance data for Balanced Tree Clothing Co., a trendy fashion company. Using advanced SQL techniques, I queried over 15,000 transaction records across their product catalog to answer critical business questions about revenue, customer segments, and product performance for their merchandising team.

## Business Problem

The CEO of Balanced Tree Clothing Co. needed data queries to:
- Extract information about which products drive the most revenue
- Query customer transaction patterns and member vs non-member behavior
- Identify top-performing product categories and segments through data retrieval
- Generate datasets for monthly financial reports
- Provide data extracts to support inventory and marketing decisions

## Dataset

I worked with 4 interconnected tables containing:
- **Sales Data**: 15,000+ transaction records with quantity, pricing, discounts, and member status
- **Product Details**: Complete product catalog with names, categories, and pricing
- **Product Hierarchy**: Organizational structure (Category → Segment → Style)
- **Product Prices**: Pricing information for financial calculations

## Technical Approach

I structured my queries into four key areas:

### 1. High-Level Sales Analysis
- Calculated total quantities sold and revenue generation
- Analyzed discount impacts across all products
- Built foundational metrics for business reporting

### 2. Transaction Analysis  
- Examined unique transaction patterns and customer behavior
- Used percentile functions to understand revenue distribution
- Compared member vs non-member purchasing patterns

### 3. Product Analysis
- Identified top revenue-generating products by category and segment
- Calculated product penetration rates across transactions
- Analyzed product combination patterns for cross-selling opportunities

## Key SQL Techniques Used

- **Aggregate Functions**: SUM, COUNT, AVG for business metrics
- **Window Functions**: ROW_NUMBER, RANK, PERCENTILE for advanced analytics
- **Complex Joins**: Multiple table relationships for comprehensive analysis
- **CTEs and Subqueries**: Breaking down complex business logic
- **Conditional Logic**: CASE statements for member/non-member segmentation

## Business Impact & Insights

Through these queries, I provided Balanced Tree with:
- Data extraction showing their most profitable products and categories
- Query results comparing member vs non-member behaviors  
- Transaction data to support inventory management decisions
- Reusable SQL scripts for monthly data extraction
- Dataset generation capabilities for business reporting

## Tools & Technologies

- **SQL (PostgreSQL)**: Primary analysis tool
- **DB Fiddle**: Interactive development environment
- **Advanced SQL**: Window functions, CTEs, recursive queries

## Repository Structure

```
📁 balanced-tree-analysis/
├── 📄 README.txt
│── 📁 01-high-level-sales-analysis.sql
│── 📁 02-transaction-analysis.sql
│── 📁 03-product-analysis.sql
│   
├── 📁 results/
│   ├── sales-summary-report.md
│   └── key-insights.md
└── 📁 documentation/
    └── Schema (PostgreSQL v13).txt
```

## Connect With Me

I'm passionate about turning data into actionable business insights.

 Feel free to connect with me:

- **LinkedIn**: [https://www.linkedin.com/in/karo-bakhtyiar-20646b228/]
- **Email**: [Karobaxtyar4@gmail.com]
- **Portfolio**: [https://github.com/Karo-Bakhtiyar/My-Data-Analytics-Portfolio]

---


*This project is part of Danny Ma's 8 Week SQL Challenge - an excellent resource for developing real-world SQL skills in business contexts.*
