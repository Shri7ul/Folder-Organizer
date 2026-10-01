@echo off
setlocal EnableExtensions
title Downloads Organizer

:: ============================================================
:: Downloads Organizer
:: Organizes files based on their extensions.
:: The folder containing this script will be organized.
:: ============================================================

cd /d "%~dp0"

set "SELF=%~nx0"

:: ------------------------------------------------------------
:: File Categories
:: ------------------------------------------------------------

call :MOVE_FILES "Videos" mp4 mkv avi mov wmv flv webm 3gp m4v
call :MOVE_FILES "Photos" jpg jpeg png gif bmp webp heic svg ico
call :MOVE_FILES "Documents" pdf doc docx xls xlsx csv ppt pptx odt ods odp
call :MOVE_FILES "Text Files" txt md log rtf
call :MOVE_FILES "Music" mp3 wav aac flac m4a ogg wma
call :MOVE_FILES "Archives" zip rar 7z tar gz bz2 xz
call :MOVE_FILES "Apps" exe msi apk
call :MOVE_FILES "Code" py js ts jsx tsx java c cpp h hpp cs go rs php html css json xml
call :MOVE_FILES "Fonts" ttf otf woff woff2
call :MOVE_FILES "Torrents" torrent

:: ------------------------------------------------------------
:: Move remaining files to Others
:: ------------------------------------------------------------

if not exist "Others" md "Others"

for %%F in (*) do (
    if /I not "%%~nxF"=="%SELF%" (
        if /I not "%%~xF"==".crdownload" (
            if /I not "%%~xF"==".part" (
                if /I not "%%~xF"==".tmp" (
                    if not exist "Others\%%~nxF" (
                        move "%%F" "Others\" >nul
                    )
                )
            )
        )
    )
)

echo.
echo ============================================================
echo                 ORGANIZATION COMPLETE
echo ============================================================
echo.
echo Folder: %CD%
echo.
echo Files have been organized successfully.
echo.
pause
exit /b


:: ============================================================
:: Function: MOVE_FILES
:: Usage: call :MOVE_FILES "Folder Name" extension1 extension2 ...
:: ============================================================

:MOVE_FILES

set "TARGET=%~1"
shift

:EXTENSION_LOOP

if "%~1"=="" exit /b

if exist "*.%~1" (

    if not exist "%TARGET%" (
        md "%TARGET%"
    )

    for %%F in ("*.%~1") do (
        if not exist "%TARGET%\%%~nxF" (
            move "%%F" "%TARGET%\" >nul
        )
    )
)

shift
goto EXTENSION_LOOP