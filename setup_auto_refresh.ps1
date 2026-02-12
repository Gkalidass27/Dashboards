# ====================================================================================================
# Ashley Furniture Dashboard - Setup Automatic Daily Refresh
# This PowerShell script creates a Windows Task Scheduler task to refresh dashboard data daily
# ====================================================================================================

Write-Host "=====================================================================================================" -ForegroundColor Cyan
Write-Host "ASHLEY FURNITURE DASHBOARD - SETUP AUTO-REFRESH" -ForegroundColor Cyan
Write-Host "=====================================================================================================" -ForegroundColor Cyan
Write-Host ""

# Get the current directory
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$BatchFile = Join-Path $ScriptPath "refresh_dashboard.bat"

Write-Host "Dashboard Location: $ScriptPath" -ForegroundColor Yellow
Write-Host "Refresh Script: $BatchFile" -ForegroundColor Yellow
Write-Host ""

# Task Scheduler settings
$TaskName = "Ashley_Dashboard_Daily_Refresh"
$TaskDescription = "Automatically refreshes Ashley Furniture dashboard data from Azure SQL databases daily at 6:00 AM"

# Check if task already exists
$ExistingTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($ExistingTask) {
    Write-Host "Task '$TaskName' already exists!" -ForegroundColor Yellow
    $Response = Read-Host "Do you want to update it? (Y/N)"
    if ($Response -ne "Y" -and $Response -ne "y") {
        Write-Host "Setup cancelled." -ForegroundColor Red
        exit
    }
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
    Write-Host "Existing task removed." -ForegroundColor Green
}

# Create the scheduled task action
$Action = New-ScheduledTaskAction -Execute $BatchFile -WorkingDirectory $ScriptPath

# Create the trigger (daily at 6:00 AM)
$Trigger = New-ScheduledTaskTrigger -Daily -At "06:00AM"

# Create task settings
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

# Get current user
$Principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive

# Register the scheduled task
try {
    Register-ScheduledTask -TaskName $TaskName `
        -Description $TaskDescription `
        -Action $Action `
        -Trigger $Trigger `
        -Settings $Settings `
        -Principal $Principal `
        -Force

    Write-Host ""
    Write-Host "=====================================================================================================" -ForegroundColor Green
    Write-Host "SUCCESS! Automatic refresh has been set up!" -ForegroundColor Green
    Write-Host "=====================================================================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Task Name: $TaskName" -ForegroundColor Cyan
    Write-Host "Schedule: Daily at 6:00 AM" -ForegroundColor Cyan
    Write-Host "Script: $BatchFile" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Your dashboard will now automatically update every day at 6:00 AM!" -ForegroundColor Green
    Write-Host ""
    Write-Host "To view or modify the task:" -ForegroundColor Yellow
    Write-Host "  1. Open Task Scheduler (taskschd.msc)" -ForegroundColor Yellow
    Write-Host "  2. Look for '$TaskName'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To test the refresh now, run: refresh_dashboard.bat" -ForegroundColor Yellow
    Write-Host "=====================================================================================================" -ForegroundColor Green
    
} catch {
    Write-Host ""
    Write-Host "=====================================================================================================" -ForegroundColor Red
    Write-Host "ERROR: Failed to create scheduled task" -ForegroundColor Red
    Write-Host "=====================================================================================================" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please run this script as Administrator and try again." -ForegroundColor Yellow
    Write-Host "=====================================================================================================" -ForegroundColor Red
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

