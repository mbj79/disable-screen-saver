Option Explicit

Const command = "powercfg /SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0"
Dim objShell

Set objShell = CreateObject("WScript.Shell")
objShell.Run COMMAND, 0