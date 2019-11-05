@echo off
color f0
title Datapack Creator v1.0.0
echo Datapack Creator v1.0.0
echo.
:Auswahlmenu
echo Sprache / Langue
echo.
echo Auswahlmenue
echo ===========
echo.
echo [De] : Deutsch
echo [En] : English
echo.

set lang=0
set /p lang="De / En : "

if %lang%==De goto Deutsch
if %lang%==En goto English
goto fail
echo.
break
:Deutsch
set /p packname=Bitte Paketnamen eingeben: 
set /p filesystem=Bitte den Paketnamen eingeben ohne Leerzeichen und Sonderzeichen: 
set /p description=Bitte den Autohrnamen eingeben: 
set /p version=Bitte die Versionsnummer eingeben: 
goto create
:English
set /p packname=Please Enter Datapack Name: 
set /p filesystem=Please Enter Datapack Name again without spaces or special characters: 
set /p description=Please Enter Author Name: 
set /p version=Please Enter Pack Version: 
goto create
:create
mkdir Datapacks
cd Datapacks
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

cd "%packname%"
(
echo {
echo     "pack": {
echo         "pack_format": 1, 
echo         "description": "%packname% v%version% by %description%"
echo     }
echo }
)>pack.mcmeta

cd data\minecraft\tags\functions
(
echo {
echo     "values": [
echo         "%filesystem%:tick"
echo     ]
echo }
)>tick.json
(
echo {
echo     "values": [
echo         "%filesystem%:load"
echo     ]
echo }
)>load.json
cd ..\..\..
cd %filesystem%\functions
break>load.mcfunction
break>tick.mcfunction
break>template.mcfunction
cd ..\..\..
if %lang%==De goto Deutsch2
if %lang%==En goto English2
:Deutsch2
cd "%packname%"\data\%filesystem%\recipes
(
echo Erklärungen zu den neuen Rezepten ab Minecraft Version 1.12 findet ihr hier https://minecraft-de.gamepedia.com/Rezeptdaten
echo Erstelle passende Rezept JSONs auf https://crafting.thedestruc7i0n.ca/
)>README.txt
cd ..\..\..
goto end
:English2
cd "%packname%"\data\%filesystem%\recipes
(
echo A Help for this new 1.13 function can find you here https://minecraft.gamepedia.com/Recipe
echo Create custom recipes on https://crafting.thedestruc7i0n.ca/
)>README.txt
cd ..\..\..
goto end
:end
cls
echo Datapack '%packname%' Created!
pause
