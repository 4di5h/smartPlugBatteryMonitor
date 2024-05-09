[YOUTUBE DEMO](https://youtu.be/tRVYT38KTz4?si=rqfJ2Ae0QtJGczWg)
# Smart Plug Battery Monitor

Automate laptop battery charging using Wi-Fi Smart Plug without relying on Webhooks, ensuring a completely free solution(as of the last update of this readme).

## Introduction
For those who spend extended hours working on laptops including me, managing battery charging can be a hassle. Leaving the charger plugged in all day, especially when the battery is fully charged, can degrade battery health over time. Ideally, batteries perform best when maintained around the 50% mark. However, achieving this manually is impractical. To address this problem there have been a few solutions in the past such as [this article](https://atulkhatri.medium.com/how-i-automated-my-laptops-battery-charging-45cf880895aa). However it is based on Webhooks, which is now a premium feature with IFTTT, this poses a challenge for users seeking a free alternative. To solve this issue, I developed this solution leveraging email triggers, which remain a free feature.

## Solution Overview
The idea is to automatically alert the IFTTT server via email when your laptop battery hits low or high levels using a PowerShell script. This script monitors battery levels and sends an email with a designated hashtag. Depending on the hashtag, specific applets in the IFTTT application are activated, triggering actions in the SmartLife App, like turning a plug on or off. While other scripting languages like Python are available, PowerShell was chosen for its efficiency, flexibility, minimal resource consumption, and seamless integration within the Windows environment.
![Untitled Diagram drawio-1](https://github.com/4di5h/smartPlugBatteryMonitor/assets/120532930/3d731174-ee29-4324-9f50-22250a9da7ff)

### Requirements
- **SMTP Email Service:** Gmail is used in this implementation.
- **IFTTT Account:** Free to sign up.
- **Tuya Smart Plug:** Covers most brands as they utilize Tuya IoT technology.
- **Windows Machine:** While Python could be an alternative for other platforms like MacOS, this solution currently supports Windows only.

## Instructions and Implementation
### Setting up the [SmartLife App](https://play.google.com/store/apps/details?id=com.tuya.smartlife&hl=en&gl=US&pli=1)
The SmartLife App is designed to control and manage IoT devices like Smart Plugs. While there are other apps capable of the same functionality, such as SmartThings, I opted for SmartLife due to its seamless integration with the IFTTT app, facilitating the linking of applets.

To enable remote control over your smart plug, it needs to be set up within this app or a similar one.

For better compatibility with the IFTTT app, configure tap-to-run scenes in the SmartLife App to toggle the power of the smart plug connected to the charger. Below is an example of a scene named 'Charging OFF,' demonstrating how to turn off the charger.

![Untitled](https://github.com/4di5h/smartPlugBatteryMonitor/assets/120532930/06ada0c9-4950-49a5-b7ec-95bfd6fe7c1f)

### Setting up [IFTTT](https://ifttt.com/create)
While the webhooks trigger option now requires a Pro version subscription, the email trigger option remains free. The free version allows for up to 2 applets, each associated with a unique hashtag such as #batterylow for low battery notifications and #batteryhigh for high battery notifications.

To set up automation triggers, simply send an email to the designated address provided by IFTTT, including the relevant hashtag (trigger@applet.ifttt.com).
Note: Ensure the email originates from the same address used to register your IFTTT account.

Once the trigger is activated, configure the desired action, such as executing a scene on your SmartLife or compatible app's account to control smart plugs. In this example, actions are linked to the Charging OFF and Charging ON scenes for added convenience. Simplify your automation tasks with ease.

The applets that are used for this project are also made public: [Battery Low Trigger](https://ift.tt/dtbKL1a), [Battery High Trigger](https://ift.tt/5AHKCFT)

### Using the Script
Finishing this script took longer than anticipated, thus instead of further writeup I have opted to present the script via my [YouTube video](https://youtu.be/tRVYT38KTz4?si=rqfJ2Ae0QtJGczWg)

Attention: If configuring the SMTP Server with GMail, ensure you acquire an app-specific password from the link in Resources below and activate it. You will need to enable the 2-step verification method in your Account settings to set up an App Specific password. Regular Gmail password is longer suffice for SMTP authentication; only the app-specific password will work.

## Resources
- [Win32_battery powershell.one](https://powershell.one/wmi/root/cimv2/win32_battery)
- [GMail SMTP Settings](https://www.saleshandy.com/smtp/gmail-smtp-settings/)
- [Google App Specific Passwords](https://myaccount.google.com/apppassword)
- Smart Plug that I am using: <a href="url"><img src="https://github.com/4di5h/smartPlugBatteryMonitor/assets/120532930/d216a2e0-99de-4f91-b76f-68dfd23b9564" align="left" height="80" width="80" ></a>

##### Your feedback and suggestions for improvements are welcome. Thank you for your support!
