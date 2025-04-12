# 🚦 Road Safety Data Warehouse and Analysis Project

## 📌 Objective
This project aims to improve road safety policy-making by designing a **data warehouse** for analyzing fatal road crashes in Australia. Using **dimensional modeling**, **ETL pipelines**, and **association rule mining**, we uncover critical insights about crash patterns, high-risk zones, and vulnerable user groups.

---

## 👨‍💻 Team  
- **Swapnil Gaikwad** (24060283)
- **Huixian Xu** (24120279)


---

## 🗃️ Data Warehouse Design

- **Grain**: Each row = 1 crash event
- **Dimensions (8)**:
  - Victim
  - Crash Event
  - Date
  - Time of Day
  - Location
  - Remoteness
  - Road Characteristics
  - Vehicle Involvement
- **Measures**:
  - Fatality Count
  - Normalized Fatality Rate (per 100k dwellings)
  - Composite Risk Factor Score

- **Schema**: Star Schema with surrogate keys, built using Kimball’s methodology.

---

## 🔧 ETL Process

**Tools Used**: `Python`, `Pandas`, `NumPy`, `Scikit-learn`, `PostgreSQL`, `SQL`, `Geopandas`  

**Steps**:
1. **Data Cleaning**: Handled `-9` values, outliers, inconsistent categories, temporal formatting
2. **Transformation**: Derived timestamps, normalized fields, enriched with coordinates
3. **Loading**: Loaded into PostgreSQL using efficient bulk COPY method

**Integrated Datasets**:
- Crash-level data (BITRE)
- Person-level fatalities
- Dwelling counts by LGA
- LGA boundary shapefiles (GeoJSON)

---

## 📈 Business Query Insights

### 🔍 Query 1: High-Risk Zones (2024)
- **WA**, Major Cities, *Undetermined Roads* → **80 fatalities**
- Excluding “Undetermined”:  
  **NSW**, Inner Regional, National/State Highway → **37 fatalities**

### 👥 Query 2: Road User Type (Evening Period)
- **Drivers**: ~43% of deaths in evenings  
- **Motorcyclists**: highest *relative* risk

### 🕒 Query 3: Temporal Patterns
- **NSW** shows highest fatalities across months  
- Evening and Night time = peak fatality hours

### 🚧 Query 4: Speed Zones
- **High-speed** zones → most fatalities  
- **NSW** leads in all speed categories

### 🛣️ Query 5: Remoteness + Road Type Risk
- **Remote National/State Highways** → highest composite risk score (~4.0)

---

## 🧠 Association Rule Mining

**Algorithm Used**: Apriori (min support: 0.1)  
**Top Rules**:
- 👩 **Female → Passenger** (lift = 1.6788)
- 🧑 **Male → Motorcycle Rider** (lift = 1.3370)
- 👨‍🦳 **Age 40–64 → Driver** (lift = 1.1125)
- 👨 **Age 26–39 → Driver** (lift = 1.1057)

---

## ✅ Recommendations

1. **Motorcycle Safety Programs** (targeted at male riders)
2. **Enhanced Passenger Safety** (focus on seatbelt use, rear protection)
3. **Age-Specific Driver Training** (esp. for 26–64 age group)

---

## 🏁 Conclusion

A comprehensive road safety data warehouse was successfully built using real-world crash data. Through dimensional modeling and rigorous ETL, the project delivers actionable insights for public safety stakeholders. The platform supports:
- Multi-dimensional crash analysis  
- Visual dashboards  
- Association mining for policy guidance  

It provides a powerful foundation for **data-driven interventions** to reduce traffic fatalities across Australia.

---
