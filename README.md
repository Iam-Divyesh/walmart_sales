# Walmart Sales Data Analysis Project

## 🚀 Project Overview

![Project Image](./Project%20Ex%20Image.png)


This project is an **end-to-end data analysis solution** designed to extract valuable business insights from **Walmart sales data** using:
- **SQL** for advanced data querying 📊
- **Python** for data cleaning and analysis 🐍
- **Structured problem-solving** to address key business questions 💡

**Ideal for:** Data analysts looking to improve their skills in **data manipulation, SQL querying, and data pipeline creation**.

---

## 🏗️ Project Workflow

### 🔹 1. Set Up the Environment
- **Tools Used:** Visual Studio Code (VS Code), Python, MySQL, PostgreSQL
- **Goal:** Organize project folders and create a structured workspace for efficient development.

### 🔹 2. Set Up Kaggle API
- **Obtain API Key:** Download `kaggle.json` from your Kaggle account.
- **Configure:** Place `kaggle.json` in `~/.kaggle/` and run:
  ```bash
  kaggle datasets download -d <dataset-path>
  ```

### 🔹 3. Download Walmart Sales Data
- **Source:** [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
- **Storage:** Save it in the `data/` folder for easy access.

### 🔹 4. Install Dependencies & Load Data
```bash
pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
```
- **Load Data into Pandas:**
  ```python
  import pandas as pd
  df = pd.read_csv('data/walmart_sales.csv')
  ```

### 🔹 5. Data Exploration & Cleaning
- **Explore Data:** Check structure using `.info()`, `.describe()`, and `.head()`.
- **Clean Data:**
  - Remove duplicates
  - Handle missing values
  - Convert data types (e.g., `datetime`, `float` for prices)

### 🔹 6. Feature Engineering
- **Enhance Dataset:** Create new column for `Total Amount`:
  ```python
  df['Total_Amount'] = df['unit_price'] * df['quantity']
  ```

### 🔹 7. Load Data into MySQL & PostgreSQL
- **Connect using SQLAlchemy** and insert cleaned data into databases.
- **Verify** data using SQL queries.

### 🔹 8. SQL Analysis & Business Insights
- **Key Queries:**
  - 📈 **Sales Trends** by branch, category, and city
  - 🔥 **Best-Selling Products**
  - ⏳ **Peak Shopping Hours**
  - 💰 **Profit Margin Analysis**
- **Example Query:** Find total sales by branch:
  ```sql
  SELECT branch, SUM(Total_Amount) AS total_sales
  FROM walmart_sales
  GROUP BY branch;
  ```

### 🔹 9. Project Documentation & Publishing
- **Write a structured README**
- **Publish on GitHub** with:
  - Jupyter Notebooks
  - SQL scripts
  - Data access instructions

---

## 📂 Project Structure
```plaintext
|-- Business_Questions.sql    # SQL analysis scripts
|-- Project Ex Image.png      # Example project image
|-- README.md                 # Project documentation
|-- Walmart.csv               # Dataset used for analysis
|-- project.ipynb             # Jupyter Notebook with analysis
|-- requirements.txt          # List of dependencies
```

---

## 📊 Insights & Results

✅ **Top-Selling Branches & Categories**  
✅ **Most Preferred Payment Methods**  
✅ **Customer Shopping Patterns & Peak Hours**  
✅ **Profitability Insights**  

---

## 🔮 Future Enhancements

🔹 **Power BI/Tableau Dashboards** for visualization  
🔹 **Automate Data Pipeline** for real-time updates  
🔹 **Integrate External Datasets** for deeper insights  

---

## 📜 License

This project is licensed under the **MIT License**.

---

## 🙌 Acknowledgments

🎯 **Data Source:** Kaggle Walmart Sales Dataset  
📚 **Inspiration:** Walmart’s business case studies on sales analytics  

---

🚀 **Get Started Now!** Clone the repo and explore Walmart’s sales insights! 🔥

