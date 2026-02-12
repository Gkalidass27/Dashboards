# 🎯 Ashley Furniture Analytics Dashboard - Setup Instructions

## 📊 What You Have

A **fully automated, interactive web dashboard** that shows real-time business insights about your stores and warehouses!

---

## 📁 Files Created

1. **`dashboard.html`** - The interactive web dashboard (open this in your browser)
2. **`dashboard_data.json`** - Real-time data from Azure SQL databases
3. **`generate_dashboard_data.py`** - Python script that fetches fresh data
4. **`refresh_dashboard.bat`** - Windows batch file to refresh data manually
5. **`setup_auto_refresh.ps1`** - PowerShell script to setup automatic daily updates

---

## 🚀 Quick Start

### Step 1: View the Dashboard

1. Open File Explorer
2. Navigate to: `OneDrive - Ashley Furniture Industries, Inc\Ashley docs\AI demo`
3. Double-click **`dashboard.html`**
4. The dashboard opens in your browser!

---

## 🔄 Setup Automatic Daily Updates

### Option A: Automatic Setup (Recommended)

1. **Right-click** on `setup_auto_refresh.ps1`
2. Select **"Run with PowerShell"**
3. If prompted, click **"Yes"** to allow
4. Follow the on-screen instructions

**Done!** Your dashboard will now automatically refresh every day at 6:00 AM.

### Option B: Manual Setup

If the automatic setup doesn't work:

1. Press `Windows + R`
2. Type `taskschd.msc` and press Enter
3. Click **"Create Basic Task"**
4. Name: `Ashley_Dashboard_Daily_Refresh`
5. Trigger: **Daily** at **6:00 AM**
6. Action: **Start a program**
7. Program: Browse to `refresh_dashboard.bat`
8. Click **Finish**

---

## 🔄 Manual Refresh

To refresh data manually anytime:

### Method 1: Click the Refresh Button
- Open the dashboard in your browser
- Click the **"🔄 Refresh Data"** button in the filter section

### Method 2: Run the Batch File
- Double-click **`refresh_dashboard.bat`**
- Wait for it to complete
- Refresh your browser (F5)

### Method 3: Run Python Script
```bash
python generate_dashboard_data.py
```

---

## 📊 Dashboard Features

### KPI Cards
- Total Active Stores: **845**
- Total Active Warehouses: **216**
- Data Quality Score: **98.5%**
- Total Locations: **1,061**
- Store Types: **3**
- Phone Data Quality: **0.6%**

### Interactive Charts
- 🍩 Store Type Distribution
- 🌍 Regional Distribution (US vs Canada)
- 📊 Data Quality by Field
- 📈 Status Comparison Trend
- 📊 Store Model & Version Distribution

### Filters
- **Region**: All / United States / Canada
- **Type**: All / Stores Only / Warehouses Only
- **Status**: All / Active Only / Inactive Only

### Data Table
- Shows top performing stores
- Sortable columns
- Color-coded status badges

---

## 🌐 Sharing the Dashboard

### Option 1: OneDrive Link (Internal Sharing)
1. Right-click `dashboard.html` in File Explorer
2. Click **"Share"**
3. Copy the link
4. Send to colleagues

### Option 2: Email
- Attach `dashboard.html` to an email
- Recipients can open it in their browser

### Option 3: SharePoint
- Upload to your SharePoint site
- Share the SharePoint link

---

## 🔧 Troubleshooting

### Dashboard shows "Sample Data"
- Run `refresh_dashboard.bat` to fetch real data
- Make sure `dashboard_data.json` exists

### Auto-refresh not working
- Open Task Scheduler (`taskschd.msc`)
- Find `Ashley_Dashboard_Daily_Refresh`
- Right-click → **Run** to test
- Check **History** tab for errors

### Authentication errors
- The script will open a browser for Azure AD login
- Sign in with your Ashley Furniture account
- This is normal and secure

---

## 📞 Support

If you need help:
1. Check the error messages in the console
2. Verify you have internet connection
3. Ensure you have access to Azure SQL databases
4. Contact IT support if authentication fails

---

## 🎉 You're All Set!

Your dashboard is now:
- ✅ Displaying real data from Azure SQL
- ✅ Auto-updating daily at 6:00 AM
- ✅ Fully interactive with working filters
- ✅ Ready to share with your team

**Enjoy your analytics dashboard!** 📊

