# Define the RAS Dial connection name to check for
$rasConnectionName = "DHT VPN"  # Replace with the name of the RAS connection you're looking for

# Check for the RAS Dial connection by querying existing VPN connections
$rasConnection = Get-VpnConnection | Where-Object { $_.Name -eq $rasConnectionName }

# If the RAS connection is found, remove it
if ($rasConnection) {
    Write-Host "RAS connection '$rasConnectionName' found. Removing..."

    # Remove the RAS connection
    Remove-VpnConnection -Name $rasConnectionName -Force -Confirm:$false
    Write-Host "RAS connection '$rasConnectionName' has been removed."
} else {
    Write-Host "No RAS connection named '$rasConnectionName' found."
}
