# Set the execution policy to RemoteSigned for the current session only
Set-ExecutionPolicy RemoteSigned -Scope Process
Write-Host "Setting execution policy to RemoteSigned..."

# Set the threshold values for low and high battery levels (in percentage)
$lowThreshold = 40  ###ADJUST THIS VALUE AS NEEDED###
$highThreshold = 60 ###ADJUST THIS VALUE AS NEEDED###
Write-Host "Threshold set to Low: $lowThreshold%, High: $highThreshold%."

# Check if the credential file exists, if not, prompt for credentials and save them
$credentialFilePath = "$env:USERPROFILE\hashed_SMTP.xml"
if (-not (Test-Path $credentialFilePath)) {
    Write-Host "Credential file not found. Prompting for credentials..."
    $credential = Get-Credential -Message "Enter your SMTP credentials, file doesn't exist"
    Write-Host "Credentials saved to $credentialFilePath."
    $credential | Export-Clixml -Path $credentialFilePath
}
else{
Write-Host "Credential file found"
}

# Function to check battery status
function CheckBatteryStatus {
    Write-Host "Checking battery status..."
    # Get the battery status using the Get-WmiObject cmdlet
    $batteryStatus = Get-WmiObject -Class Win32_Battery
    
    # Check if the battery status is available
    if ($batteryStatus) {
        # Get the current battery level in percentage
        $batteryLevel = $batteryStatus.EstimatedChargeRemaining
	Write-Host "Current battery level is: $batteryLevel%"
        
	# Check if the laptop is currently charging
	$isCharging = $batteryStatus.BatteryStatus -in @(2, 3, 6, 7, 8, 9)
	Write-Host "Laptop currently charging: $isCharging"

        # Check if the battery level is below the low threshold and not charging
        if ($batteryLevel -lt $lowThreshold -and !$isCharging) {
            SendEmailNotification "#batterylow" "#batterylow"
	    Write-Host "Battery level is low. Sending email notification..."
        }
        # Check if the battery level is above the high threshold and charging
        elseif ($batteryLevel -gt $highThreshold -and $isCharging) {
            SendEmailNotification "#batteryhigh" "#batteryhigh"
            Write-Host "Battery level is high and charging. Sending email notification..."
        }
	else {
            Write-Host "Battery level is within normal range."
	}

    }
    else {
        Write-Host "Failed to retrieve battery status."
    }
}

# Function to send email notification
function SendEmailNotification {
    param(
        [string]$subject,
        [string]$body
    )
    
    # Email settings (configure with your email server details)
    $smtpServer = "smtp.gmail.com"
    $smtpPort = 587
    $senderEmail = "something@domain.com" ###ADJUST THIS, PUT SENDER EMAIL ADDRESS###
    $recipientEmail = "nothing@domain.com" ###ADJUST THIS, PUT RECIPIENT EMAIL ADDRESS###
#   Importing Stored Credentials
    $credential = Import-Clixml -Path $credentialFilePath
    
    # Email message properties
    $emailParams = @{
        From = $senderEmail
        To = $recipientEmail
        Subject = $subject
        Body = $body
        SmtpServer = $smtpServer
        Port = $smtpPort
        Credential = $credential
        UseSsl = $true
    }
    
    # Send the email
    Send-MailMessage @emailParams
    Write-Host "Email sent to $recipientEmail from $senderEmail with subject: $subject"
}

# Monitor battery status continuously
while ($true) {
    CheckBatteryStatus
    $sleepDurationSeconds = 300  # Check battery status every 5 minutes (adjust as needed)
    Write-Host "Waiting for $sleepDurationSeconds seconds before checking battery status again..."
    Start-Sleep -Seconds $sleepDurationSeconds
}