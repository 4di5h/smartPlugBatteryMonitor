# smartPlugBatteryMonitor
# Smart Plug Battery Monitor

Automate laptop battery charging using Wi-Fi Smart Plug without relying on Webhooks, ensuring a completely free solution(as of the last update of this readme).

## Introduction
For those who spend extended hours working on laptops including me, managing battery charging can be a hassle. Leaving the charger plugged in all day, especially when the battery is fully charged, can degrade battery health over time. Ideally, batteries perform best when maintained around the 50% mark. However, achieving this manually is impractical. To address this problems there have been a few solutions in the past such as [this article](https://atulkhatri.medium.com/how-i-automated-my-laptops-battery-charging-45cf880895aa). However it is based on Webhooks, which is now a premium feature with IFTTT, this poses a challenge for users seeking a free alternative. To solve this issue, I developed this solution leveraging email triggers, which remain a free feature.

## Solution Overview
The idea is to automatically send an email to the IFTTT server with a certain hashtag when the laptop battery reaches low or high levels. This email trigger then activates the automation applet to turn the smart plug on or off accordingly. This functionality is implemented through a PowerShell script. While there are alternative methods such as Python, I opted for PowerShell due to its lightweight nature, flexibility, lower resource usage, and native support within Windows.

## Requirements
- **SMTP Email Service:** Gmail is used in this implementation.
- **IFTTT Account:** Free to sign up.
- **Tuya Smart Plug:** Covers most brands as they utilize Tuya IoT technology.
- **Windows Machine:** While Python could be an alternative for other platforms like MacOS, this solution currently supports Windows only.

## Instructions and Implementation
The provided PowerShell script (`Battery.ps1`) automates the process with minimal user inputs and comprehensive logging.

Finishing this script took longer than anticipated, thus instead of a long writeup I've opted to present the project and its instructions via a YouTube video. You can find the video tutorial at the following link: _____

Your feedback and suggestions for improvements are welcome. Thank you for your support!
