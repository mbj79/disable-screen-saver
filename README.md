# disable-screen-lock.vbs

Simple script for changing the "When plugged in, turn off after" setting for screen to "Never". 

In Windows 10, this setting is located in **Settings > System > Power & sleep**. The script *should* work for older versions of Windows, too, but hasn't been tested yet.

## Why?

In some remote desktop and VDI environments, the user's session gets locked if the user stays idle for too long, e.g., by doing most of their work in their local desktop and not checking the remote session frequently enough.

This is very annoying, especially when using a password manager to log in, since it's not possible (for good reasons) to paste passwords into the Windows lock screen, meaning the user has to disconnect the session and reconnect in order to be able to supply the password through their RDP/VDI client.

Manually changing the power settings on each login gets tedious. In some cases it doesn't even help, because settings get automatically reset through external mechanisms that the user has no control over.

## How to use

1. Copy `disable-screen-saver.vbs` to some folder.
2. Use Windows Task Scheduler to schedule the script to run as often as necessary
    * Recommendation: Run only when user is logged on (does not require storing password)
