# covid-vaccination-database-project
covid-vaccination-database-project
# COVID-19 Vaccination Database Project

This repository contains my **Database Design Project** developed as part of a university course on Database Concepts. The project demonstrates the complete lifecycle of designing, implementing, and querying a relational database using a real-world dataset.

## 📌 Project Scenario
The project is based on the **Our World in Data COVID-19 Vaccination Dataset** ([OWID GitHub](https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations)), which tracks vaccine rollouts globally.  
My goal was to design a relational database schema, normalise it to ensure data integrity, import the dataset into SQLite, and run queries to extract meaningful insights.

## 🛠️ What I Did
- **Data Understanding:** Reviewed and cleaned CSV files (`locations.csv`, `vaccinations.csv`, `vaccinations-by-age-group.csv`, `vaccinations-by-manufacturer.csv`, and country-level files).  
- **Database Design:** Created an **ER diagram** and defined assumptions about data relationships.  
- **Normalisation:** Applied 1NF → 2NF → 3NF to remove partial and transitive dependencies:contentReference[oaicite:5]{index=5}.  
- **Schema Implementation:** Built schema in SQLite with integrity constraints (PK, FK):contentReference[oaicite:6]{index=6}.  
- **Data Import:** Populated the database (`Vaccinations.db`) with the updated CSV files.  
- **Queries:** Wrote five SQL queries to answer analytical questions, including:  
  1. Countries with higher-than-average daily vaccinations.  
  2. Countries with above-average cumulative doses.  
  3. Vaccine types used per country.  
  4. Maximum vaccinations by data source.  
  5. Weekly comparison of fully vaccinated people in Australia, Germany, England, and France:contentReference[oaicite:7]{index=7}.  
- **Visualisation:** Exported query results and created graphs (Queries.pdf).

## 📂 Repository Structure
