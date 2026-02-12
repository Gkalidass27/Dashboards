"""
Generate Dashboard Data from Azure SQL Database
Fetches real-time data for the analytics dashboard
"""

import pyodbc
import pandas as pd
import json
from azure.identity import DefaultAzureCredential, InteractiveBrowserCredential
import struct

def get_azure_token():
    """Get Azure AD token for SQL authentication"""
    try:
        credential = DefaultAzureCredential()
        token = credential.get_token("https://database.windows.net/.default")
    except Exception as e:
        print(f"DefaultAzureCredential failed: {e}")
        print("Falling back to InteractiveBrowserCredential...")
        credential = InteractiveBrowserCredential()
        token = credential.get_token("https://database.windows.net/.default")
    
    print("✓ Authenticated with Azure AD (browser)")
    return token

def create_connection(server, database, token):
    """Create database connection using Azure AD token"""
    token_bytes = token.token.encode("UTF-16-LE")
    token_struct = struct.pack(f'<I{len(token_bytes)}s', len(token_bytes), token_bytes)
    
    conn_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database}'
    
    conn = pyodbc.connect(conn_string, attrs_before={1256: token_struct})
    return conn

# Configuration
server = 'afi-edme-semarchy-sql.database.windows.net'
db_semarchy = 'Semarchy_staging'
db_retail = 'Retail_Sitemaster'

print("=" * 100)
print("GENERATING DASHBOARD DATA")
print("=" * 100)

# Authenticate
token = get_azure_token()

# Connect to databases
print("\nConnecting to databases...")
conn_semarchy = create_connection(server, db_semarchy, token)
conn_retail = create_connection(server, db_retail, token)
print("✓ Connected to both databases")

# Fetch Store Data
print("\nFetching store data...")
store_query = """
SELECT 
    Status,
    Location,
    Account,
    StoreFrontShipTo,
    StoreType,
    City,
    StateProvince,
    Country,
    StoreModel,
    StoreVersion,
    Market,
    Region
FROM smartsheet.storemastercustom
WHERE Country IN ('United States', 'Canada')
  AND Status LIKE 'Active%'
"""
df_stores = pd.read_sql(store_query, conn_semarchy)

# Fetch Warehouse Data
print("Fetching warehouse data...")
warehouse_query = """
SELECT 
    Status,
    Location,
    Account,
    ShipTo,
    City,
    State,
    Country
FROM smartsheet.RDCmasterlist
WHERE Status IN ('Active', 'ACTIVE')
"""
df_warehouses = pd.read_sql(warehouse_query, conn_semarchy)

# Fetch GD_Site Data
print("Fetching GD_Site data...")
gd_query = """
SELECT 
    B_SOURCEID,
    OPERATIONAL_STATUS,
    TYPE,
    ACCOUNT_NUMBER,
    SHIP_TO_NUM,
    MODEL,
    VERSION,
    MARKET,
    REGION,
    B_PUBID
FROM dbo.GD_Site
WHERE B_PUBID IN ('SSMASTER_STORES', 'SSMASTER_RDC')
  AND OPERATIONAL_STATUS = 'Active'
"""
df_gd = pd.read_sql(gd_query, conn_retail)

conn_semarchy.close()
conn_retail.close()

print("✓ Data fetched successfully")

# Calculate KPIs
print("\nCalculating KPIs...")

kpis = {
    'total_active_stores': len(df_stores),
    'total_active_warehouses': len(df_warehouses),
    'total_locations': len(df_stores) + len(df_warehouses),
    'us_stores': len(df_stores[df_stores['Country'] == 'United States']),
    'canada_stores': len(df_stores[df_stores['Country'] == 'Canada']),
    'store_types': df_stores['StoreType'].value_counts().to_dict(),
    'stores_by_market': df_stores['Market'].value_counts().head(10).to_dict(),
    'stores_by_region': df_stores['Region'].value_counts().head(10).to_dict(),
    'stores_by_model': df_stores['StoreModel'].value_counts().to_dict(),
    'stores_by_version': df_stores['StoreVersion'].value_counts().to_dict(),
    'gd_site_stores': len(df_gd[df_gd['B_PUBID'] == 'SSMASTER_STORES']),
    'gd_site_warehouses': len(df_gd[df_gd['B_PUBID'] == 'SSMASTER_RDC']),
}

# Top stores data - include ALL stores for filtering, not just top 20
top_stores = df_stores[['Location', 'Account', 'StoreType', 'Status', 'Market', 'Region', 'StoreModel', 'Country']].to_dict('records')

# Prepare dashboard data
dashboard_data = {
    'kpis': kpis,
    'top_stores': top_stores,
    'last_updated': pd.Timestamp.now().strftime('%Y-%m-%d %H:%M:%S')
}

# Save to JSON
output_file = 'dashboard_data.json'
with open(output_file, 'w') as f:
    json.dump(dashboard_data, f, indent=2)

print(f"\n✓ Dashboard data saved to: {output_file}")
print("\n" + "=" * 100)
print("SUMMARY")
print("=" * 100)
print(f"Total Active Stores: {kpis['total_active_stores']}")
print(f"Total Active Warehouses: {kpis['total_active_warehouses']}")
print(f"Total Locations: {kpis['total_locations']}")
print(f"US Stores: {kpis['us_stores']}")
print(f"Canada Stores: {kpis['canada_stores']}")
print(f"GD_Site Stores: {kpis['gd_site_stores']}")
print(f"GD_Site Warehouses: {kpis['gd_site_warehouses']}")
print("=" * 100)

