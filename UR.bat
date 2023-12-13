ECHO OFF
CLS
:MENU
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
ECHO 1 - Unpack
ECHO 2 - Repack
ECHO 3 - Clear Unpacked Files
ECHO 4 - EXIT
ECHO.
SET /P M=Option:
IF %M%==1 GOTO UNPACK
IF %M%==2 GOTO REPACK
IF %M%==3 GOTO CLEAR
IF %M%==4 GOTO EOF

:UNPACK
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
ECHO 1 - Unpack system.img
ECHO 2 - Unpack vendor.img
ECHO 3 - Unpack system.img and vendor.img
ECHO 4 - Back
ECHO.
SET /P M=Option:
IF %M%==1 GOTO UNPACKSYSTEM
IF %M%==2 GOTO UNPACKVENDOR
IF %M%==3 GOTO UNPACKALL
IF %M%==4 GOTO MENU
GOTO MENU

:REPACK
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
ECHO 1 - Repack system.img
ECHO 2 - Repack vendor.img
ECHO 3 - Repack system.img and vendor.img
ECHO 4 - Back
ECHO.
SET /P M=Option:
IF %M%==1 GOTO REPACKSYSTEM
IF %M%==2 GOTO REPACKVENDOR
IF %M%==3 GOTO REPACKALL
IF %M%==4 GOTO MENU
GOTO MENU

:UNPACKSYSTEM
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
if exist bin\tmp rd /s /q bin\tmp
if exist editor rd /s /q editor
if not exist bin\tmp mkdir bin\tmp
if not exist editor mkdir editor

if exist system.img (
echo - Unpacking system.img
bin\windows\imgextractor system.img editor\system >nul 2>nul
)

set tmp=bin\tmp
if exist system_file_contexts move /y system_file_contexts editor\  >nul 2>nul
if exist system_fs_config move /y system_fs_config editor\  >nul 2>nul
if exist system move /y system editor\system2  >nul 2>nul

if exist editor\system (
echo - Unpack Done
echo.
)
if exist editor rd /s /q bin\tmp
pause
GOTO MENU

:UNPACKVENDOR
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
if exist bin\tmp rd /s /q bin\tmp
if exist editor rd /s /q editor
if not exist bin\tmp mkdir bin\tmp
if not exist editor mkdir editor

if exist vendor.img (
echo - Unpacking vendor.img
bin\windows\imgextractor vendor.img editor\vendor >nul 2>nul
)

set tmp=bin\tmp
if exist vendor_file_contexts move /y vendor_file_contexts editor\  >nul 2>nul
if exist vendor_fs_config move /y vendor_fs_config editor\  >nul 2>nul

if exist editor\system (
echo - Unpack Done
echo.
)
if exist editor rd /s /q bin\tmp
pause
GOTO MENU

:UNPACKALL
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
if exist bin\tmp rd /s /q bin\tmp
if exist editor rd /s /q editor
if not exist bin\tmp mkdir bin\tmp
if not exist editor mkdir editor

if exist system.img (
echo - Unpacking system.img
bin\windows\imgextractor system.img editor\system >nul 2>nul
)

if exist vendor.img (
echo - Unpacking vendor.img
bin\windows\imgextractor vendor.img editor\vendor >nul 2>nul
)

set tmp=bin\tmp
if exist system_file_contexts move /y system_file_contexts editor\  >nul 2>nul
if exist vendor_file_contexts move /y vendor_file_contexts editor\  >nul 2>nul
if exist system_fs_config move /y system_fs_config editor\  >nul 2>nul
if exist vendor_fs_config move /y vendor_fs_config editor\  >nul 2>nul
if exist system move /y system editor\system2  >nul 2>nul

if exist editor\system (
echo - Unpack Done
echo.
)
if exist editor rd /s /q bin\tmp
pause
GOTO MENU

:REPACKSYSTEM
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
if not exist editor\system (
echo - Please unpack a system.img first !!!
pause
GOTO MENU
)

if exist bin\tmp rd /s /q bin\tmp
mkdir bin\tmp

set /p systemsize=<"editor\system_size.txt"
echo - Repack system
bin\windows\make_ext4fs -L system -T -1 -S editor\system_file_contexts -C editor\system_fs_config -l %systemsize% -a system new_system.img editor\system\ >nul
)

if exist new_system.img echo - system.img has been repacked

pause
GOTO MENU

:REPACKVENDOR
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
if not exist editor\vendor (
echo - Please unpack vendor.img first !!!
pause
GOTO MENU
)

if exist bin\tmp rd /s /q bin\tmp
mkdir bin\tmp

echo - Repack vendor
set /p vendorsize=<"editor\vendor_size.txt"
bin\windows\make_ext4fs -L vendor -T -1 -S editor\vendor_file_contexts -C editor\vendor_fs_config -l %vendorsize% -a vendor new_vendor.img editor\vendor\ >nul

if exist new_vendor.img echo - vendor.img has been repacked
pause
GOTO MENU

:REPACKALL
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
if not exist editor\system (
echo - Please unpack system.img first !!!
pause
GOTO MENU
)

if exist bin\tmp rd /s /q bin\tmp
mkdir bin\tmp

set /p systemsize=<"editor\system_size.txt"
echo - Repacking system.img
bin\windows\make_ext4fs -L system -T -1 -S editor\system_file_contexts -C editor\system_fs_config -l %systemsize% -a system new_system.img editor\system\ >nul
)

if exist new_system.img echo - system.img has been repacked

if not exist editor\system (
echo - Please unpack vendor.img first !!!
pause
GOTO MENU
)

echo - Repacking vendor.img
set /p vendorsize=<"editor\vendor_size.txt"
bin\windows\make_ext4fs -L vendor -T -1 -S editor\vendor_file_contexts -C editor\vendor_fs_config -l %vendorsize% -a vendor new_vendor.img editor\vendor\ >nul

if exist new_vendor.img echo - vendor.img has been repacked
pause
GOTO MENU

:CLEAR
cls
ECHO.
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
set /P "=____ __  __  ____   _____ ____ ___ _____ ___  ____    _____ ___   ___  _     " < NUL & echo/
set /P "=|_ _|  \/  |/ ___| | ____|  _ \_ _|_   _/ _ \|  _ \  |_   _/ _ \ / _ \| |    " < NUL & echo/
set /P "=-| || |\/| | |  _  |  _| | | | | |  | || | | | |_) |   | || | | | | | | |    " < NUL & echo/
set /P "=-| || |  | | |_| | | |___| |_| | |  | || |_| |  _ <    | || |_| | |_| | |___ " < NUL & echo/
set /P "=|___|_|  |_|\____| |_____|____/___| |_| \___/|_| \_\   |_| \___/ \___/|_____|" < NUL & echo/
set /P "=/////////////////////////////////////////////////////////////////////////////" < NUL & echo/
ECHO.
echo - Removing Files
rmdir /s /Q editor
echo - Done
pause
GOTO MENU