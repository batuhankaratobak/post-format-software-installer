# Project Notes

## Project Purpose

This project is an NSIS-based Windows installer prepared to make post-format software installation more organized, faster, and more consistent for municipality computers.

The original need came from the internal workflow at Döşemealtı Municipality. After formatting or reinstalling Windows, the required setup files were commonly carried on a portable drive and installed manually. This process could take time, cause missed installations, and create inconsistent software sets across computers.

The purpose of this installer is to simplify that workflow by collecting the required setup packages under one selectable installation wizard. Technical staff can choose the applications needed for a specific computer or department and start the installation process from a single tool.

## Author

This project was prepared and developed by **Batuhan Karatobak** for the needs of Döşemealtı Municipality.

## Usage Scenario

The application is designed for computers that have recently been formatted or reinstalled.

General flow:

1. The installer package is launched from a portable drive or an internal file location.
2. The setup wizard opens.
3. Required applications are selected from the component selection page.
4. Selected installer files are copied to the target directory.
5. Each selected setup file is launched.
6. The standard post-format software setup is completed more quickly.

This structure allows different departments to use different application combinations. For example, computers that need e-signature support can include ArkSigner, while a basic office computer may only need a browser and a PDF reader.

## Current Local Package Contents

The local/private package may include these installer files:

- `AdobeReader.exe`: Adobe Acrobat Reader installer for PDF viewing.
- `AnyDesk.exe`: AnyDesk installer for remote support.
- `Arksigner.exe`: ArkSigner installer for e-signature workflows.
- `ChromeSetup.exe`: Google Chrome installer.
- `FirefoxSetup.exe`: Mozilla Firefox installer.

Visual and helper files used in private builds:

- `dosbel.ico`: Installer icon file.
- `kapak.png`: Cover image for the installer interface.
- `kapak.bmp`: Bitmap version of `kapak.png` for NSIS Modern UI compatibility.
- `LICENSE_DEMO.txt`: Public-safe placeholder license text for demos and repository previews.
- `lisans.txt`: Internal license text used only for private builds.
- `installer_script.nsi`: Main NSIS installation script.

## Technical Structure

The main file is:

```text
installer_script.nsi
```

Each application is defined as a separate NSIS section. This allows the user to select only the applications required for the current computer instead of installing every bundled application.

Implemented improvements:

- The component selection flow uses the standard NSIS `MUI_PAGE_COMPONENTS` page.
- Each application is defined as a separate section.
- Each selected application is launched only once.
- `RequestExecutionLevel admin` was added for administrator privileges.
- Installer files are copied under `$INSTDIR\Installers`.
- `Uninstall.exe` generation was added.
- Installation progress messages were added with `DetailPrint`.
- The cover image was converted to BMP for NSIS compatibility.
- The script now uses `LICENSE_DEMO.txt` by default so public demos do not expose internal license text.

## Important Note

The current package does not download applications from the internet. It bundles local setup files into the installer and launches them based on the selected components.

To keep applications up to date, replace the following local files before building a new release:

- `AdobeReader.exe`
- `AnyDesk.exe`
- `Arksigner.exe`
- `ChromeSetup.exe`
- `FirefoxSetup.exe`

Chrome and Firefox installers may be web installers depending on the downloaded file. For computers without reliable internet access, offline installers are recommended.

## GitHub Sharing and Privacy

Only the source script, documentation, and project structure should be shared on GitHub.

The following files should not be committed because of security, licensing, and institutional privacy concerns:

- Third-party installer files: `AdobeReader.exe`, `AnyDesk.exe`, `Arksigner.exe`, `ChromeSetup.exe`, `FirefoxSetup.exe`
- Built installer output: `Dosemealti_Belediyesi_Installer.exe`
- Municipality logo and cover assets: `dosbel.ico`, `kapak.png`, `kapak.bmp`
- Internal license text: `lisans.txt`

These files stay in the local working folder but are not pushed to the repository. The `.gitignore` file is configured for this.

The absence of these files from GitHub does not mean the project is incomplete. They are intentionally excluded and should be added locally before building.

The repository includes `LICENSE_DEMO.txt` for public-safe demos. Private institutional builds can still use `lisans.txt` by passing it as the license file during NSIS compilation.

Local visual assets should be placed in the project root with these filenames:

```text
dosbel.ico
kapak.png
kapak.bmp
```

Local installer files should also be placed in the project root:

```text
AdobeReader.exe
AnyDesk.exe
Arksigner.exe
ChromeSetup.exe
FirefoxSetup.exe
```

This approach keeps the public repository focused on source code and documentation while keeping institutional assets, internal license text, and third-party binaries private.

## Build

NSIS must be installed on Windows.

Build command:

```powershell
makensis installer_script.nsi
```

Private build with internal license text:

```powershell
makensis /DLICENSE_FILE=lisans.txt installer_script.nsi
```

Public demo build with neutral local visuals:

```powershell
makensis /DICON_FILE=demo.ico /DWELCOME_BITMAP=demo.bmp installer_script.nsi
```

Expected output:

```text
Dosemealti_Belediyesi_Installer.exe
```

## Test Checklist

- [ ] The NSIS build completes successfully.
- [ ] The generated `Dosemealti_Belediyesi_Installer.exe` opens on Windows.
- [ ] The license page is displayed correctly.
- [ ] The component selection page is displayed.
- [ ] Adobe Reader starts when Adobe Reader is selected.
- [ ] AnyDesk starts when AnyDesk is selected.
- [ ] ArkSigner starts when ArkSigner is selected.
- [ ] Google Chrome starts when Chrome is selected.
- [ ] Mozilla Firefox starts when Firefox is selected.
- [ ] Multiple selected components each run only once.
- [ ] `Uninstall.exe` is created after installation.

## Public Video Demo Notes

For public videos, screenshots, or portfolio presentations, use only demo or placeholder materials.

Recommended recording flow:

1. Show the GitHub repository and README.
2. Explain that installer binaries, official assets, and internal license files are excluded from the repository.
3. Add local placeholder files for the build.
4. Compile the installer with NSIS.
5. Open the installer and show the welcome page, demo license page, and component selection page.

Avoid showing internal license text, official institutional documents, credentials, network paths, device names, or real production computers.

## Future Improvements

- Add predefined application profiles by department.
- Add profiles for departments such as IT, Financial Services, Public Works, or Records Office.
- Write successful and failed installation results to a log file.
- Store version and hash information for each installer.
- Add a helper tool to check for updated installer versions.
- Add support for pulling installers from an internal file server.
- Improve the installer interface with institution-specific branding when used in private builds.

## Project Note

This project was created as a practical setup package to make post-format software installation faster and more standardized. The core idea is to avoid manually searching through portable drive folders and instead collect the required installers under one municipality-oriented setup tool.
