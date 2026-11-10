#define MyAppName "HSE Management System"
#define MyAppVersion "1.4.19"
#define MyAppPublisher "HSE"
#define MyAppExeName "HSEManagementSystem.exe"

[Setup]
AppId={{A19B9A5A-7C21-4E63-9B2D-1F5C2D9E1A40}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
SetupIconFile=..\assets\hse.ico
UninstallDisplayIcon={app}\HSEManagementSystem.exe
DefaultDirName={localappdata}\Programs\HSE Management System
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=..\installer_output
OutputBaseFilename=HSE_Management_System_Setup_{#MyAppVersion}
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName={#MyAppName}
CloseApplications=yes
RestartApplications=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional shortcuts:"; Flags: unchecked

[Files]
Source: "..\dist\HSEManagementSystem\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: postinstall nowait skipifsilent

; Intentionally do not delete %LOCALAPPDATA%\HSE Management System on uninstall.
; That folder contains the user's database, evidence attachments, reports, backups and logs.
