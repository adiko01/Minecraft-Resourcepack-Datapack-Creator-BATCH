@echo off
color f0
title Data- and Resourcepack Creator v1.1.0
echo Data- and Resourcepack Creator v1.1.0
echo.
set count==1
:Auswahlmenu
echo Sprache / Langue
echo.
echo Auswahlmenue
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
echo Irgend etwas ist schiefgelaufen. Bitte Probiere erneut.
echo Someting went wrong, please retry.
echo. 
goto Auswahlmenu

:Deutsch
echo Soll ein Datapack oder ein Resourcepack erstellt werden?
echo ===================================================
echo.
choice /C DR /M "Druecke D fuer ein Datapack oder R fuer ein Resourcepack"
if %ERRORLEVEL% == 0 goto Deutsch
if %ERRORLEVEL% == 1 set Pack==DP
if %ERRORLEVEL% == 2 set Pack==RP
echo.
echo.
echo Soll das Pack fuer Minecraft Version 1.14.* sein?
echo ===================================================
echo.
choice /C JN /M "Drueke J fuer Ja oder N fuer Nein"
if %ERRORLEVEL% == 0 goto Deutsch
if %ERRORLEVEL% == 1 set MCver==1.14
echo.
set /p packname=Bitte Paketnamen eingeben: 
set /p filesystem=Bitte den Paketnamen eingeben ohne Leerzeichen und Sonderzeichen: 
set /p description=Bitte den Autornamen eingeben: 
set /p version=Bitte die Versionsnummer eingeben: 
goto create

:English
echo Should a Datapack or a Resourcepack would be created?
echo ===================================================
echo.
choice /C DR /M "Press D for Datapack or R for Resourcepack"
if %ERRORLEVEL% == 0 goto English
if %ERRORLEVEL% == 1 set Pack==DP
if %ERRORLEVEL% == 2 set Pack==RP
echo.
echo.
echo Should the Pack for Minecraft Version 1.14.* ?
echo ===================================================
echo.
choice /C YN /M "Press Y for Yes or N for No"
if %ERRORLEVEL% == 0 goto English
if %ERRORLEVEL% == 1 set MCver==1.14
echo.
set /p packname=Please Enter Datapack Name: 
set /p filesystem=Please Enter Datapack Name again without spaces or special characters: 
set /p description=Please Enter Author Name: 
set /p version=Please Enter Pack Version:  
goto create

:create
if %count%==1 if %Pack%==DP if %MCver%==1.14 goto createDP1-14
if %count%==1 if %Pack%==RP if %MCver%==1.14 goto createRP1-14
if %count%==2 if %Pack%==DP if %MCver%==1.14 if %lang%==De goto createDP1-14De
if %count%==2 if %Pack%==RP if %MCver%==1.14 if %lang%==De goto createRP1-14De
if %count%==2 if %Pack%==DP if %MCver%==1.14 if %lang%==En goto createDP1-14En
if %count%==2 if %Pack%==RP if %MCver%==1.14 if %lang%==En goto createRP1-14En

:createDP1-14
mkdir "datapacks"
cd "datapacks"
mkdir "%packname%"
mkdir "%packname%"\data

mkdir "%packname%"\data\minecraft
mkdir "%packname%"\data\%filesystem%

mkdir "%packname%"\data\minecraft\advancements
mkdir "%packname%"\data\minecraft\loot_tables
mkdir "%packname%"\data\minecraft\recipes
mkdir "%packname%"\data\minecraft\tags
mkdir "%packname%"\data\minecraft\tags\functions

mkdir "%packname%"\data\%filesystem%\advancements
mkdir "%packname%"\data\%filesystem%\functions
mkdir "%packname%"\data\%filesystem%\loot_tables
mkdir "%packname%"\data\%filesystem%\recipes
mkdir "%packname%"\data\%filesystem%\structures
mkdir "%packname%"\data\%filesystem%\tags

(
echo {
echo     "pack": {
echo         "pack_format": 1, 
echo         "description": "%packname% v%version% by %description%"
echo     }
echo }
)>"%packname%"\pack.mcmeta

(
echo {
echo     "values": [
echo         "%filesystem%:tick"
echo     ]
echo }
)>"%packname%"\data\minecraft\tags\functions\tick.json
(
echo {
echo     "values": [
echo         "%filesystem%:load"
echo     ]
echo }
)>"%packname%"\data\minecraft\tags\functions\load.json

break>"%packname%"\data\%filesystem%\functions\load.mcfunction
break>"%packname%"\data\%filesystem%\functions\tick.mcfunction
break>"%packname%"\data\%filesystem%\functions\template.mcfunction
set count==2
:createDP1-14De
(
echo Erklärungen zu den neuen Rezepten ab Minecraft Version 1.12 findet ihr hier https://minecraft-de.gamepedia.com/Rezeptdaten
echo Erstelle passende Rezept JSONs auf https://crafting.thedestruc7i0n.ca/
)>"%packname%"\data\%filesystem%\recipes\README.txt
goto finish-De
:createDP1-14En
(
echo A Help for this new 1.13 function can find you here https://minecraft.gamepedia.com/Recipe
echo Create custom recipes on https://crafting.thedestruc7i0n.ca/
)>"%packname%"\data\%filesystem%\recipes\README.txt
goto finish-En

:createRP1-14
mkdir "recourcepacks"
cd "recourcepacks"
mkdir "%packname%"
mkdir "%packname%"\assets

mkdir "%packname%"\assets\minecraft
mkdir "%packname%"\assets\minecraft\blockstates
mkdir "%packname%"\assets\minecraft\font
mkdir "%packname%"\assets\minecraft\lang
mkdir "%packname%"\assets\minecraft\models
mkdir "%packname%"\assets\minecraft\shaders
mkdir "%packname%"\assets\minecraft\sounds
mkdir "%packname%"\assets\minecraft\texts
mkdir "%packname%"\assets\minecraft\textures

mkdir "%packname%"\assets\realms
mkdir "%packname%"\assets\realms\lang
mkdir "%packname%"\assets\realms\textures

mkdir "%packname%"\assets\%filesystem%
mkdir "%packname%"\assets\%filesystem%\sounds

(
echo {
echo     "pack": {
echo         "pack_format": 4, 
echo         "description": "%packname% v%version% by %description%"
echo     }
echo }
)>"%packname%"\pack.mcmeta

set count==2

:createRP1-14De
goto finish-De
:createRP1-14En
goto finish-En

:finish-De
pause
exit
:finish-En
pause
exit
