# Diary sector

## Dairy Supply Chain Analytics: SQL Database Engine
A production-grade relational database framework engineered to model, evaluate, and optimize an end-to-end dairy supply chain mapping system. This project transforms raw data registers into actionable metrics targeting complex dairy challenges like hyper-local production variables, rigid storage configurations, perishable inventory tracking, multi-channel distribution networks, and state-wise revenue optimization.
##  Project Overview
The core objective of this database engine is to convert operational agricultural logs into data structures optimized for real-time warehouse safety monitoring, dynamic financial margin adjustments, perishability mitigation pipelines, and geographical trade-lane logic.
## Key Analytical Pillars

* Inventory Safety Monitoring: Flags active warehouse stocks dipping under safety parameters to automate calculations for replenishment needs.
* Dynamic Revenue Analysis: Examines pricing variances between basic processing costs and clearing market prices across distinct retail/wholesale channels.
* Perishability Mitigation Pipeline: Tracks stock expiration metrics to dynamically surface degrading components and prioritize fast fulfillment paths.
* Geographical Supply Modeling: Maps asset origins against consumer locations to discover cross-state trade lanes and refine logistics strategies.


##  Database Schema & Parameters
The transactional schema maps 23 explicit operational variables partitioned across three logical domain spaces:
## 1. Farm & Production Infrastructure

* Location: Point of raw material origination (e.g., Telangana, Uttar Pradesh, Tamil Nadu).
* Total Land Area (acres): Explains asset capacities and footprint footprints.
* Number of Cows: Active animal inventory numbers.
* Farm Size: Operational categorization matrix (Small, Medium, Large).

## 2. Product Logistical Matrix

* Product ID / Product Name: Primary identifiers (e.g., raw milk, ghee, paneer, ice cream).
* Brand: Manufacturing house handling processing tasks (e.g., Amul, Mother Dairy, Sudha).
* Quantity (liters/kg) / Price per Unit: Wholesale capacity variables and valuations.
* Total Value / Storage Condition: Manufacturing cost baselines against strict climate rules (Ambient, Refrigerated, Frozen, Tetra Pack).
* Production Date / Expiration Date / Shelf Life (days): Temporal parameters calculating inventory freshness windows.

## 3. Sales & Inventory Intercept

* Quantity Sold / Price per Unit (sold): Realized transaction volumes and market-clearing pricing.
* Approx. Total Revenue (INR): Revenue generation per market completion.
* Customer Location / Sales Channel: Demand location vectors running across Retail, Wholesale, or Online setups.
* Quantity in Stock / Minimum Stock Threshold / Reorder Quantity: Core stock indicators monitoring stockout risks.


##  SQL Analytics & Core Queries
This repository holds a comprehensive suite of exploratory and analytical queries designed for database systems like MySQL / PostgreSQL. Below are core technical implementations extracted from the transactional register scripts:
## 1. Aggregated Revenue by Product
Identifies total realized revenue metrics per commodity group to rank inventory performance.

SELECT ProductName, ROUND(SUM(total_rev)) AS total_revenueFROM dairy_products GROUP BY ProductName ORDER BY total_revenue DESC;

## 2. Warehouse Stockout & Reorder Triggers
Surfaces high-risk lines operating beneath localized minimum stock levels that require priority restocking.

SELECT ProductName, min_stock_th, qty_stock FROM dairy_products WHERE min_stock_th >= qty_stock;

## 3. Perishability Risk Monitoring
Constructs an alert matrix surfacing in-stock items with fewer than 10 days of residual shelf life.

SELECT ProductName, ROUND(AVG(ShelfLife)) AS min_shelf_life FROM dairy_products WHERE ShelfLife < 10 GROUP BY ProductNameORDER BY min_shelf_life;

## 4. Cross-State Supply & Purchase Tracking
Maps out demand-heavy shipping targets by isolating customer regions showing the largest purchase volume spikes.

SELECT Location, ROUND(SUM(TotalValue)) AS purchase_volume FROM dairy_products GROUP BY Location ORDER BY purchase_volume DESC LIMIT 5;

## 5. Automated Shelf-Life Profiling by Brand
Tracks structural production capacities and quality controls by highlighting shelf-life behaviors among active distributors.

SELECT Brand, ROUND(AVG(ShelfLife)) AS avg_shelf_life FROM dairy_products GROUP BY Brand ORDER BY avg_shelf_life;

------------------------------
##  Derived Data Insights
Running these analytical scripts against the transactional tables produced several key operations insights:
##  Financial Performance & Volatility

* Product Thresholds: Core lines steadily generate between ₹45L to ₹50L in gross revenue, yielding an operating profit margin between ₹14L to ₹15L per product tier.
* Macro Trends: Annualized analytics show revenue contraction trends, with performance slowing from a peak of ₹15Cr in 2019 down to ₹14Cr by the end of 2022.
* Fulfillment Strengths: The Retail sales channel functions as the largest corporate revenue driver overall.

##  Inventory Safety & Perishability Controls

* Replenishment Barriers: Reorder targets maintain a baseline average configuration of 2.0k units across products. Immediate warehouse actions are triggered for high-risk stockout lines including Butter, Yogurt, Cheese, and Milk.
* Shelf Life Extremes: Ghee shows the highest environmental durability (106 days avg), whereas Curd exhibits the tightest risk profile (6 days avg).
* Critical Exposure Alerts: Heavy operational vulnerabilities exist for Milk, Curd, Buttermilk, and Paneer due to remaining shelf-life profiles dipping under 10 days.

##  Logistics & Supply Optimization

* Demand Hotspots: Chandigarh and Delhi lead consumption volumes. Concurrently, Chandigarh matches records for hosting the largest infrastructure footprints by farm land area.
* Volumetric Production Leaders: Tamil Nadu, Madhya Pradesh, and Telangana represent the core regions driving processing outputs.



* Do you need instructions on how to set up / import the database?
* Should we add steps for visualizing the data (e.g., via Power BI, Tableau, or Python)?
* Would you like me to generate a specific license file or contribution guidelines?



