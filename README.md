# 🏢 Ashley Furniture Analytics Dashboard

[![Live Dashboard](https://img.shields.io/badge/Live-Dashboard-blue?style=for-the-badge)](https://gkalidass27.github.io/ashley-dashboard/)
[![Data Source](https://img.shields.io/badge/Data-Azure%20SQL-orange?style=for-the-badge)](https://azure.microsoft.com/)
[![Auto Update](https://img.shields.io/badge/Auto-Update-green?style=for-the-badge)](https://github.com/Gkalidass27/ashley-dashboard)

> **Interactive business intelligence dashboard for Ashley Furniture store and warehouse performance insights across US & Canada**

---

## 🎯 Overview

This dashboard provides real-time analytics and insights for Ashley Furniture's retail operations, including:

- **845 Active Stores** across United States and Canada
- **216 Active Warehouses** for distribution
- **1,061 Total Locations** monitored
- **98.5% Data Quality Score** across all fields

---

## 📊 Features

### 📈 Key Performance Indicators (KPIs)
- Total Active Stores & Warehouses
- Data Quality Metrics
- Regional Distribution
- Store Type Breakdown
- Phone Data Quality Tracking

### 📉 Interactive Visualizations
- 🍩 **Store Type Distribution** - Doughnut chart showing HomeStore, Outlet, and eCommerce breakdown
- 🌍 **Regional Distribution** - Pie chart for US vs Canada locations
- 📊 **Data Quality by Field** - Bar chart showing match rates across all data fields
- 📈 **Status Comparison Trend** - Line chart tracking active locations over time
- 📊 **Store Model & Version Distribution** - Grouped bar chart for model analysis

### 🔍 Dynamic Filters
- **Region Filter**: All Regions / United States / Canada
- **Type Filter**: All Types / Stores Only / Warehouses Only
- **Status Filter**: All Status / Active Only / Inactive Only

### 📋 Data Table
- Top performing stores with detailed metrics
- Sortable columns
- Color-coded status badges
- Real-time data quality indicators

---

## 🚀 Live Demo

**[View Live Dashboard →](https://gkalidass27.github.io/ashley-dashboard/)**

---

## 💻 Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript
- **Charts**: Chart.js
- **Data Source**: Azure SQL Database
- **Backend**: Python 3.x
- **Database Connector**: pyodbc
- **Authentication**: Azure AD (Interactive Browser)
- **Hosting**: GitHub Pages
- **Auto-Update**: Windows Task Scheduler

---

## 📦 Installation

### Prerequisites
- Python 3.7+
- Azure SQL Database access
- Azure AD authentication

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Gkalidass27/ashley-dashboard.git
   cd ashley-dashboard
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Generate dashboard data**
   ```bash
   python generate_dashboard_data.py
   ```

4. **Open the dashboard**
   - Open `dashboard.html` in your web browser
   - Or visit the live version at: https://gkalidass27.github.io/ashley-dashboard/

---

## 🔄 Auto-Update Setup

### Windows Task Scheduler (Automatic Daily Updates)

1. **Run the setup script**
   ```powershell
   .\setup_auto_refresh.ps1
   ```

2. **Or manually setup**
   - Open Task Scheduler (`taskschd.msc`)
   - Create new task: `Ashley_Dashboard_Daily_Refresh`
   - Trigger: Daily at 6:00 AM
   - Action: Run `refresh_dashboard.bat`

### Manual Refresh

```bash
# Option 1: Run batch file
refresh_dashboard.bat

# Option 2: Run Python script
python generate_dashboard_data.py

# Option 3: Click "🔄 Refresh Data" button in dashboard
```

---

## 📊 Data Sources

The dashboard pulls real-time data from:

- **Semarchy_staging.smartsheet.storemastercustom** - Store master data
- **Semarchy_staging.smartsheet.RDCmasterlist** - Warehouse/RDC data
- **Retail_Sitemaster.dbo.GD_Site** - Golden record site data

### Data Refresh Schedule
- **Automatic**: Daily at 6:00 AM (configurable)
- **Manual**: On-demand via refresh button or script
- **Last Updated**: Displayed in dashboard header

---

## 📈 Current Metrics

| Metric | Value |
|--------|-------|
| Total Active Stores | 845 |
| Total Active Warehouses | 216 |
| Total Locations | 1,061 |
| US Stores | 789 |
| Canada Stores | 56 |
| Data Quality Score | 98.5% |
| Store Types | 3 (HomeStore, Outlet, eCommerce) |

---

## 🛠️ Files

- `dashboard.html` - Main dashboard interface
- `dashboard_data.json` - Real-time data cache
- `generate_dashboard_data.py` - Data extraction script
- `refresh_dashboard.bat` - Manual refresh script
- `setup_auto_refresh.ps1` - Auto-update setup
- `DASHBOARD_SETUP_INSTRUCTIONS.md` - Detailed setup guide

---

## 🔒 Security

- Azure AD authentication required
- Interactive browser login for security
- No credentials stored in code
- Token-based database access

---

## 📝 License

Internal use only - Ashley Furniture Industries, Inc.

---

## 👤 Author

**Gkalidass**
- GitHub: [@Gkalidass27](https://github.com/Gkalidass27)
- Email: gkalidass@ashleyfurniture.com

---

## 🙏 Acknowledgments

- Ashley Furniture IT Team
- Azure SQL Database Team
- Data Quality Team

---

**Last Updated**: 2026-02-12

**Dashboard Version**: 1.0.0

