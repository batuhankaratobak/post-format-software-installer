!include "MUI2.nsh"
!include "LogicLib.nsh"

Name "Dosemealti Belediyesi Yazilim Paketi"
Caption "Dosemealti Belediyesi - Kurulum Sihirbazi"
OutFile "Dosemealti_Belediyesi_Installer.exe"
InstallDir "$PROGRAMFILES\Dosemealti Belediyesi\Hazir Format"
RequestExecutionLevel admin
ShowInstDetails show
BrandingText "Hazirlayan: Batuhan Karatobak | Dosemealti Belediyesi"

VIProductVersion "1.1.0.0"
VIAddVersionKey "ProductName" "Dosemealti Belediyesi Yazilim Paketi"
VIAddVersionKey "CompanyName" "Dosemealti Belediyesi"
VIAddVersionKey "FileDescription" "Format sonrasi temel yazilim kurulum paketi"
VIAddVersionKey "FileVersion" "1.1"
VIAddVersionKey "LegalCopyright" "Copyright 2026 Dosemealti Belediyesi"

!ifndef LICENSE_FILE
  !define LICENSE_FILE "LICENSE_DEMO.txt"
!endif

!ifndef ICON_FILE
  !define ICON_FILE "dosbel.ico"
!endif

!ifndef WELCOME_BITMAP
  !define WELCOME_BITMAP "kapak.bmp"
!endif

!define MUI_ABORTWARNING
!define MUI_ICON "${ICON_FILE}"
!define MUI_UNICON "${ICON_FILE}"
!define MUI_WELCOMEFINISHPAGE_BITMAP "${WELCOME_BITMAP}"
!define MUI_WELCOMEPAGE_TITLE "Dosemealti Belediyesi Yazilim Yukleyicisi"
!define MUI_WELCOMEPAGE_TEXT "Bu sihirbaz, format sonrasi gerekli temel yazilimlari kurmak icin hazirlanmistir.$\r$\n$\r$\nDevam etmeden once acik programlari kapatmaniz onerilir."
!define MUI_COMPONENTSPAGE_TEXT_TOP "Kurmak istediginiz yazilimlari secin."
!define MUI_DIRECTORYPAGE_TEXT_TOP "Secilen kurulum dosyalarinin kopyalanacagi klasoru secin."
!define MUI_FINISHPAGE_TITLE "Kurulum Tamamlandi"
!define MUI_FINISHPAGE_TEXT "Secilen yazilimlar icin kurulum islemi tamamlandi."

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${LICENSE_FILE}"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "Turkish"

Var InstallExitCode

!macro InstallBundledApp APP_NAME APP_FILE APP_ARGS
  DetailPrint "${APP_NAME} dosyasi kopyalaniyor..."
  SetOutPath "$INSTDIR\Installers"
  File "${APP_FILE}"

  DetailPrint "${APP_NAME} kurulumu baslatiliyor..."
  ClearErrors
  ExecWait '"$INSTDIR\Installers\${APP_FILE}" ${APP_ARGS}' $InstallExitCode

  ${If} ${Errors}
    DetailPrint "${APP_NAME} baslatilamadi."
  ${ElseIf} $InstallExitCode != 0
    DetailPrint "${APP_NAME} kurulum cikis kodu: $InstallExitCode"
  ${Else}
    DetailPrint "${APP_NAME} kurulumu tamamlandi."
  ${EndIf}
!macroend

Section "Adobe Reader" SEC_ADOBE
  !insertmacro InstallBundledApp "Adobe Reader" "AdobeReader.exe" "/sAll /rs /rps /msi EULA_ACCEPT=YES"
SectionEnd

Section "AnyDesk" SEC_ANYDESK
  !insertmacro InstallBundledApp "AnyDesk" "AnyDesk.exe" ""
SectionEnd

Section "ArkSigner" SEC_ARKSIGNER
  !insertmacro InstallBundledApp "ArkSigner" "Arksigner.exe" ""
SectionEnd

Section "Google Chrome" SEC_CHROME
  !insertmacro InstallBundledApp "Google Chrome" "ChromeSetup.exe" "/silent /install"
SectionEnd

Section "Mozilla Firefox" SEC_FIREFOX
  !insertmacro InstallBundledApp "Mozilla Firefox" "FirefoxSetup.exe" "-ms"
SectionEnd

Section -PostInstall
  SetOutPath "$INSTDIR"
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

LangString DESC_ADOBE ${LANG_TURKISH} "PDF dosyalari icin Adobe Acrobat Reader kurulumunu baslatir."
LangString DESC_ANYDESK ${LANG_TURKISH} "Uzak destek icin AnyDesk kurulumunu baslatir."
LangString DESC_ARKSIGNER ${LANG_TURKISH} "E-imza islemleri icin ArkSigner kurulumunu baslatir."
LangString DESC_CHROME ${LANG_TURKISH} "Google Chrome tarayicisini kurar."
LangString DESC_FIREFOX ${LANG_TURKISH} "Mozilla Firefox tarayicisini kurar."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_ADOBE} $(DESC_ADOBE)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_ANYDESK} $(DESC_ANYDESK)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_ARKSIGNER} $(DESC_ARKSIGNER)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_CHROME} $(DESC_CHROME)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_FIREFOX} $(DESC_FIREFOX)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Section "Uninstall"
  Delete "$INSTDIR\Installers\AdobeReader.exe"
  Delete "$INSTDIR\Installers\AnyDesk.exe"
  Delete "$INSTDIR\Installers\Arksigner.exe"
  Delete "$INSTDIR\Installers\ChromeSetup.exe"
  Delete "$INSTDIR\Installers\FirefoxSetup.exe"
  RMDir "$INSTDIR\Installers"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir "$INSTDIR"
SectionEnd
