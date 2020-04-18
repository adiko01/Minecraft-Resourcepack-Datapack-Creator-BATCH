@echo off
color f0
title Data- and Resourcepack Creator %Version% %lang%

:Deutsch
echo Soll ein Datapack oder ein Resourcepack erstellt werden?
echo ===================================================
echo.
echo [D] : Datapack
echo [R] : Recourcepack
echo.
choice /C DR /M "D /R : "
if %ERRORLEVEL% == 0 goto Deutsch
if %ERRORLEVEL% == 1 set Pack==DP
if %ERRORLEVEL% == 2 set Pack==RP
echo.
echo.
echo Bitte die Minecraft Version auswählen
echo ===================================================
echo.
echo [1.14] : Minecraft Version 1.14.*
echo.
set MCver=0
set /p MCver="Minercraft Version : "
echo.
if %MCver% == 1.14 set MCver=1.14
set /p packname=Bitte Paketnamen eingeben: 
set /p filesystem=Bitte den Paketnamen eingeben ohne Leerzeichen und Sonderzeichen: 
set /p description=Bitte den Autornamen eingeben: 
set /p version=Bitte die Versionsnummer eingeben: 

:DP
call system/DataPack-Maker-DP.bat
:RP
call system/DataPack-Maker-RP.bat