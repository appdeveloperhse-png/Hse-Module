HSE MANAGEMENT SYSTEM — WINDOWS INSTALLER KIT
=============================================

This package includes the original application source, an application icon,
a local Windows build script, a branded application icon, an Inno Setup script, and a GitHub Actions
workflow that builds and publishes a Windows setup EXE automatically.

GITHUB RELEASE (recommended)
----------------------------
1. Create a new GitHub repository.
2. Upload/push all files from this folder to the repository's main branch.
3. Push a version tag, for example:
      git tag v1.4.19
      git push origin v1.4.19
4. Open GitHub > Actions and wait for "Build Windows installer" to succeed.
5. Open GitHub > Releases. Download the generated
   HSE_Management_System_Setup_1.4.19.exe.

End users download only the EXE from Releases. They do not need Python,
PyInstaller, or Inno Setup.

LOCAL WINDOWS BUILD (optional)
------------------------------
1. Windows 10/11 x64; install Python 3.11 x64 and Inno Setup 6.
2. Run build_windows.bat.
3. Open installer/HSE_Management_System.iss in Inno Setup Compiler.
4. Click Compile. The EXE is written to installer_output/.

DATA PROTECTION
---------------
The supplied source stores the database and user data in
%LOCALAPPDATA%\HSE Management System. The installer script does not remove
this folder on uninstall. Always test updates and backup/restore before
production rollout.

LIMITATION
----------
The Windows installer cannot be compiled or runtime-tested in this Linux
build environment. GitHub Actions performs the actual Windows build. Test
the resulting EXE on a clean Windows 10/11 machine before distributing it.
The installer is unsigned by default and may trigger SmartScreen warnings.
