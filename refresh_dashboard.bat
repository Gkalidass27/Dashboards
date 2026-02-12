@echo off
REM ====================================================================================================
REM Ashley Furniture Dashboard - Automated Data Refresh
REM This script runs daily to update the dashboard with fresh data from Azure SQL
REM ====================================================================================================

echo ====================================================================================================
echo ASHLEY FURNITURE DASHBOARD - DATA REFRESH
echo ====================================================================================================
echo Starting at: %date% %time%
echo.

REM Change to the dashboard directory
cd /d "%~dp0"

REM Run the Python script to fetch latest data
echo Running data refresh script...
python generate_dashboard_data.py

REM Check if the script ran successfully
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ====================================================================================================
    echo SUCCESS: Dashboard data refreshed successfully!
    echo ====================================================================================================
    echo Completed at: %date% %time%
    echo.
    echo The dashboard will now show updated data when you refresh your browser.
    echo ====================================================================================================
) else (
    echo.
    echo ====================================================================================================
    echo ERROR: Data refresh failed with error code %ERRORLEVEL%
    echo ====================================================================================================
    echo Please check the error messages above and try again.
    echo ====================================================================================================
)

REM Keep window open for 10 seconds to see results (remove this line for silent execution)
timeout /t 10

exit /b %ERRORLEVEL%

