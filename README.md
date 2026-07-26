# Post-Format Software Installer

An NSIS-based Windows installer project prepared to standardize post-format software setup for municipality computers.

The project was originally created for Döşemealtı Municipality to make the internal post-format workflow easier. In the existing workflow, application installers were carried on a portable drive and installed manually after Windows reinstallations. This project brings those installers together under a single selectable setup wizard.

## Author

Prepared and developed by **Batuhan Karatobak** for the software deployment needs of Döşemealtı Municipality.

## Purpose

The installer helps technical staff install required applications after a computer has been formatted or reinstalled.

Instead of manually searching for each setup file, the technician can open one installer, select the applications needed for that computer or department, and start the installation flow from a single interface.

Example use cases:

- Adobe Reader for PDF viewing.
- AnyDesk for remote support.
- ArkSigner for e-signature workflows.
- Google Chrome or Mozilla Firefox for browser needs.

This makes it possible to install different application combinations depending on department needs instead of forcing the same package onto every computer.

## Privacy and Repository Scope

This repository is prepared as a safe public or private GitHub project skeleton.

For privacy, licensing, and security reasons, the following files are intentionally not included in the repository:

- Third-party installer files: `*.exe`, `*.msi`
- Built installer output: `Dosemealti_Belediyesi_Installer.exe`
- Official municipality visual assets: `dosbel.ico`, `kapak.png`, `kapak.bmp`
- Internal license text used for private builds: `lisans.txt`

These files should remain local and should not be pushed to GitHub.

The public repository includes `LICENSE_DEMO.txt` as a safe placeholder license page for demos, videos, and repository previews. It does not contain internal institutional terms.

## Where to Put Local Assets

The repository does not include official images or installer binaries. This does not mean the project is incomplete.

When building the installer locally, place the required visual assets in the project root with these filenames:

```text
dosbel.ico
kapak.png
kapak.bmp
```

Place the application installers in the same folder:

```text
AdobeReader.exe
AnyDesk.exe
Arksigner.exe
ChromeSetup.exe
FirefoxSetup.exe
```

These local files are ignored by `.gitignore` and are used only for private/internal builds.

For a private institutional build, use the internal license file by passing a custom license file to NSIS:

```powershell
makensis /DLICENSE_FILE=lisans.txt installer_script.nsi
```

For a public demo or video recording, use the default demo license:

```powershell
makensis installer_script.nsi
```

If you want to use neutral demo visuals instead of official assets, pass alternative local files during compilation:

```powershell
makensis /DICON_FILE=demo.ico /DWELCOME_BITMAP=demo.bmp installer_script.nsi
```

## Project Structure

Main NSIS script:

```text
installer_script.nsi
```

Additional documentation:

```text
PROJECT_NOTES.md
```

Each application is defined as a separate NSIS component. During setup, the user can select only the applications needed for the target computer.

## Build

NSIS must be installed on Windows.

Build command:

```powershell
makensis installer_script.nsi
```

Expected output:

```text
Dosemealti_Belediyesi_Installer.exe
```

## Video Demo Guidance

For public videos or portfolio sharing, use demo or placeholder assets instead of official logos, internal license text, or real institution-specific files.

Recommended video flow:

- Show the GitHub repository and README.
- Explain that real installers and official assets are intentionally excluded.
- Add local placeholder files for the build.
- Build the installer with NSIS.
- Open the installer and show the welcome, demo license, and component selection pages.
- Avoid showing internal license text, official documents, credentials, device names, network paths, or real production machines.

## Test Checklist

- [ ] The NSIS build completes successfully.
- [ ] The generated installer opens on Windows.
- [ ] The license page is displayed.
- [ ] The component selection page is displayed.
- [ ] Selected applications run only once.
- [ ] `Uninstall.exe` is created after installation.

## Note

This repository shares the project structure and source script only. Real installer files, official visual assets, and internal license documents should stay outside the repository.
