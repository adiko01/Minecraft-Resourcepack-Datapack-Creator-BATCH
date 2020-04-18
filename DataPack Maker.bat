@echo off
color f0
set Version=v2.0.0
title Data- and Resourcepack Creator %Version%
echo Data- and Resourcepack Creator %Version%
echo.
:Auswahlmenu
echo Sprache / Langue
echo.
echo Waehle / Choice
echo ============
echo.
echo [De] : Deutsch
echo [En] : English
echo.

set lang=0
set /p lang="De / En : "
echo.

if %lang%==De goto Deutsch
if %lang%==En goto English
goto fail
:fail
echo. 
echo Da ist wohl etwas schiefgelaufen. Bitte Versuche es erneut.
echo Someting went wrong, please retry.
echo. 
goto Auswahlmenu
:Deutsch
echo .
echo Deutsch ist gewaehlt
echo .
echo .
call system/DataPack-Maker-DE.bat
:Englisch