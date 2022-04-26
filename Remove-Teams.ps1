Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq "{39AF0813-FA7B-4860-ADBE-93B9B214B914}"} | Remove-WmiObject

$TeamsUsersExclusion = ((Get-ChildItem "C:\Users" | Sort-Object LastWriteTime -Descending)[0]).name
$TeamsUsers = Get-ChildItem -Path "$($ENV:SystemDrive)\Users" -Exclude $TeamsUsersExclusion

$TeamsUsers | ForEach-Object {
    Try {
        if (Test-Path "$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Local\Microsoft\Teams") {
            Remove-Item –Path "$($ENV:SystemDrive)\Users\$($_.Name)\AppData\Local\Microsoft\Teams" -Recurse -Force -ErrorAction Ignore
        }
    } Catch {
        Out-Null
    }
}

