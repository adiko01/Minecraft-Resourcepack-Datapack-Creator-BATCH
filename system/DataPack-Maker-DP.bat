@echo off
color f0
title Data- and Resourcepack Creator %Version% %lang% %MCver% Datapack
%lang%=%lang%
%MCver%=%MCver%
if %MCver%==1.14 goto createDP1-14

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

echo .
echo Datapack Ordnerstrucktur erfolgreich erstellt

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
if %lang%==De goto FileDe
if %lang%==En goto FileEn

:FileDe
echo Sprachunabhaenige Datein erstellt
(
echo Erklärungen zu den neuen Rezepten ab Minecraft Version 1.12 findet ihr hier https://minecraft-de.gamepedia.com/Rezeptdaten
echo Erstelle passende Rezept JSONs auf https://crafting.thedestruc7i0n.ca/
)>"%packname%"\data\%filesystem%\recipes\README.txt
echo Datapack Hilfsdatein erfolgreich erstellt
echo .
echo.
echo Danke fuer das verwenden dieses Skriptes.
pause
exit
:FileEn
echo Sprachunabhaenige Datein erstellt
(
echo A Help for this new 1.13 function can find you here https://minecraft.gamepedia.com/Recipe
echo Create custom recipes on https://crafting.thedestruc7i0n.ca/
)>"%packname%"\data\%filesystem%\recipes\README.txt
echo Datapack Hilfsdatein erfolgreich erstellt
echo .
echo.
echo Thanks for using this script.
pause
exit