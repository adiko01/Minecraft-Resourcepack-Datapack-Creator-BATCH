@echo off
color f0
title Data- and Resourcepack Creator %Version% %lang% %MCver% Recourcepack
if %MCver%==1.14 goto createRP1-14

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

echo Recourcepack erfolgreich erstellt
echo .

(
echo {
echo     "pack": {
echo         "pack_format": 4, 
echo         "description": "%packname% v%version% by %description%"
echo     }
echo }
)>"%packname%"\pack.mcmeta

echo Recourcepack erfolgreich erstellt
echo .
echo.
echo Danke fuer das verwenden dieses Skriptes.
pause
exit