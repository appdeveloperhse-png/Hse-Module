# HSE Management System — Windows installer

This repository packages the HSE Management System desktop application for Windows 10/11 (64-bit).

## Download the installer

1. Open the repository's **Releases** page.
2. Open the latest release.
3. Download `HSE_Management_System_Setup_<version>.exe`.
4. Run the installer and follow the setup wizard.

You do not need to install Python, PySide6, PyInstaller, or Inno Setup to use a published installer.

## Build and publish automatically from GitHub

The workflow at `.github/workflows/windows-installer.yml` builds the app on a Windows GitHub Actions runner and creates the setup EXE. It also applies the version from the release tag to the app's About screen and installer metadata.

### Publish a release

After uploading these repository files to GitHub:

```powershell
git add .
git commit -m "Add Windows installer build"
git push origin main

git tag v1.4.19
git push origin v1.4.19
```

Pushing a `v*` tag triggers the Windows build. When it succeeds, GitHub automatically publishes a Release containing the setup EXE. The release page is then the single place users download the installer from.

You can also run the workflow manually from **GitHub → Actions → Build Windows installer → Run workflow**. That produces a downloadable Actions artifact; it does not publish a Release unless you push a version tag.

## Build locally on Windows (optional)

For developers only:

1. Install Python 3.11 64-bit.
2. Install Inno Setup 6.
3. Run `build_windows.bat`.
4. Open `installer/HSE_Management_System.iss` in Inno Setup Compiler and click **Compile**.
5. The installer is written to `installer_output/`.

## Data storage and uninstall

The app stores its database and user files in:

`%LOCALAPPDATA%\HSE Management System`

The installer does not put the database in the program installation directory. The Inno Setup script intentionally does not remove the user's data folder during uninstall. Back up operational data before major updates and test upgrades/restores on a copy first.

## Versioning

Update `APP_VERSION` in `main.py` and `MyAppVersion` in `installer/HSE_Management_System.iss` when preparing a new release. For tag builds, the workflow sets the installer version from the tag (for example `v1.4.20` becomes `1.4.20`). Keep the application version and release tag aligned.

## Important release checks

- Build is x64 and targets Windows 10/11.
- Test the installer on a clean Windows machine before production use.
- Test observations, incidents, audits, CAPA, PTW, training, attachments, reports, backup and restore.
- Test an upgrade over a previous version and confirm existing records remain.
- The installer is not code-signed by default. Windows SmartScreen may show an unknown-publisher warning. Use a trusted code-signing certificate for public/commercial distribution.
