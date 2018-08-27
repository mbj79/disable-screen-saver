# disable-screen-lock.vbs

Simple script for changing the "When plugged in, turn off after" setting for screen to "Never". 

In Windows 10, this setting is located in **Settings > System > Power & sleep**. The script *should* work for older versions of Windows, too, but hasn't been tested yet.

## Why?

In some remote desktop and VDI environments, the user's session gets locked if the user stays idle for too long, e.g., by doing most of their work in their local desktop and not checking the remote session frequently enough.

This is very annoying, especially when using a password manager to log in, since it's not possible (for good reasons) to paste passwords into the Windows lock screen, meaning the user has to disconnect the session and reconnect in order to be able to supply the password through their RDP/VDI client.

Manually changing the power settings on each login gets tedious. In some cases it doesn't even help, because settings get automatically reset through external mechanisms that the user has no control over.

## How to use

1. Copy `disable-screen-lock.vbs` to some folder.
2. Use Windows Task Scheduler to execute the script as often as necessary
    * Recommendation: Run only when user is logged on (does not require storing password)

## What does the script do?

It simply executes the command-line `powercfg /SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0`. 

## But why .vbs?

Because running the `powercfg` command directly from Task Scheduler causes a console window to appear for a fraction of a second, disrupting the focus from whatever the user happens to be working with. There is no way to configure a Task to run with the console window hidden. The default Windows Script Host (`wscript.exe`), does not create any console window, and its `WScript.Shell` interface supports specifying the window state when running console programs.
