# 🛒 Zepto Sales Analysis (SQL Project)

## 📌 Project Overview
This is my **first SQL data analysis project**, where I analyzed Zepto sales data to perform **data cleaning, exploration, and business-focused analysis** using SQL.

The project focuses on understanding product pricing, discounts, inventory status, category-wise performance, and revenue insights.

---

## 🛠️ Tools & Technologies
- SQL
- MySQL
- GitHub

---

## 🗄️ Database Details
- **Database Name:** `zepto_sales_db`
- **Table Name:** `zepto_v2`
- Added a unique `id` column as a **primary key**
- Converted price values from **paisa to rupees**

---

## 🧹 Data Cleaning Steps
- Checked for **NULL values** in important columns
- Removed products where:
  - `MRP = 0`
  - `discountedSellingPrice = 0`
- Converted:
  - `MRP` → Rupees  
  - `discountedSellingPrice` → Rupees
- Verified duplicate product names
- Checked stock availability

---

## 📊 Data Analysis & Business Questions

### 1️⃣ Top 10 Best-Value Products
- Identified products with the **lowest discounted selling price**

### 2️⃣ High MRP but Out-of-Stock Products
- Found products with **MRP > ₹300** that are currently **out of stock**

### 3️⃣ Category-wise Estimated Revenue
- Calculated total revenue using:

## 👤 Author
Sourabh Bhoir

