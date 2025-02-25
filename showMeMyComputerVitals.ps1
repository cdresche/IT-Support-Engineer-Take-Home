# Log file path and file name appended with timestamp to accomodate rolling logs
$logFile = "$HOME\System_Vitals_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

# Simple error checking implemented (try, catch) and user-friendly CLI outputting for script run status.
try {
    # How much disk space is left?
    $diskSpace = Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name="Free"; Expression={[math]::Round($_.Free / 1GB, 2)}}

    # What's the CPU up to?
    $cpuTotal = Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue

    # Memory usage
    $memory = Get-CimInstance Win32_OperatingSystem | Select-Object @{Name="Total Memory"; Expression={[math]::Round($_.TotalVisibleMemorySize / 1MB, 2)}}, @{Name="Free Memory"; Expression={[math]::Round($_.FreePhysicalMemory / 1MB, 2)}}

    # Recent updates
    $updates = Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 3 @{Name="Installed On"; Expression={$_.InstalledOn}}, Description, @{Name="HotFix ID"; Expression={$_.HotFixID}}

    # Is the printer still talking to us?
    $printerStatus = Get-Printer | Select-Object Name, @{Name="Printer Status"; Expression={$_.PrinterStatus}}

    # Viewer-friendly formatting using labels, tables, and trim. Save to log file.
    $logData = @"
System Vitals Report - $(Get-Date)
=====================================================

Disk Space (GB):

$(($diskSpace | Format-Table -Wrap -AutoSize | Out-String).Trim())

-----------------------------------------------------

CPU Usage (% Load):

$([math]::Round($cpuTotal, 2)) %

-----------------------------------------------------

Memory Usage (GB):

$(($memory | Format-Table -Wrap -AutoSize | Out-String).Trim())

-----------------------------------------------------

Recent Updates:

$(($updates | Format-Table -Wrap -AutoSize | Out-String).Trim())

-----------------------------------------------------

Printer Status:

$(($printerStatus | Format-Table -Wrap -AutoSize | Out-String).Trim())
=====================================================
"@

    $logData | Out-File -FilePath $logFile
    Write-Output "System vitals saved to: $logFile"

} catch {
    Write-Output "An error occurred: $($_.Exception.Message)"
}
