@echo off
color f0
title Data- and Resourcepack Creator %Version% %lang%

:English
echo Should a Datapack or a Recourcepack be created?
echo ===================================================
echo.
echo [D] : Datapack
echo [R] : Recourcepack
echo.
choice /C DR /M "D /R : "
if %ERRORLEVEL% == 0 goto English
if %ERRORLEVEL% == 1 set Pack==DP
if %ERRORLEVEL% == 2 set Pack==RP
echo.
echo.
echo Please select the Minrcraft Version
echo ===================================================
echo.
echo [1.14] : Minecraft Version 1.14.*
echo.
set MCver=0
set /p MCver="Minercraft Version : "
echo.
if %MCver% == 1.14 set MCver=1.14
echo.
set /p packname=Please Enter Datapack Name: 
set /p filesystem=Please Enter Datapack Name again without spaces or special characters: 
set /p description=Please Enter Author Name: 
set /p version=Please Enter Pack Version:

if %Pack%==DP goto DP
if %Pack%==RP goto RP

:DP
call system/DataPack-Maker-DP-Ordner.bat

:RP
call system/DataPack-Maker-RP-Ordner.bat