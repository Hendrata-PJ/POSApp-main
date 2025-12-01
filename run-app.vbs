' Simple VBScript wrapper to run run-app.bat without showing a console window.
' Usage: double-click this .vbs file in Explorer.
Option Explicit
Dim fso, wsh, scriptPath, scriptDir, batPath
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsh = CreateObject("WScript.Shell")

scriptPath = WScript.ScriptFullName
scriptDir = fso.GetParentFolderName(scriptPath)
batPath = scriptDir & "\run-app.bat"

If fso.FileExists(batPath) Then
  wsh.Run Chr(34) & batPath & Chr(34), 0, False
Else
  MsgBox "Launcher script 'run-app.bat' not found in the same folder.", vbExclamation, "MiniPOS Launcher"
End If
