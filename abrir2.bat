@echo off
title Downloader Toolbox
setlocal

REM ===== CONFIGURAÇÕES =====
set DOWNLOAD_DIR=downloads
set ZIP_FILE=wget.zip

set URL_WGET=https://raw.githubusercontent.com/Jpatr1k/app/refs/heads/main/wget.zip
set URL_EXE=https://raw.githubusercontent.com/Jpatr1k/app/refs/heads/main/toolbox.updater.x64.exe
set URL_CONFIG=https://raw.githubusercontent.com/Jpatr1k/app/refs/heads/main/toolbox.updater.x64.config

REM ===== CRIAR PASTA =====
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"
cd "%DOWNLOAD_DIR%"

REM ===== DOWNLOAD COM VERIFICAÇÃO =====

if not exist "wget.zip" (
    echo Baixando wget.zip...
    powershell -Command "Invoke-WebRequest '%URL_WGET%' -OutFile 'wget.zip'"
) else (
    echo wget.zip já existe, pulando download.
)

if not exist "toolbox.updater.x64.exe" (
    echo Baixando toolbox.updater.x64.exe...
    powershell -Command "Invoke-WebRequest '%URL_EXE%' -OutFile 'toolbox.updater.x64.exe'"
) else (
    echo toolbox.updater.x64.exe já existe, pulando download.
)

if not exist "toolbox.updater.x64.config" (
    echo Baixando toolbox.updater.x64.config...
    powershell -Command "Invoke-WebRequest '%URL_CONFIG%' -OutFile 'toolbox.updater.x64.config'"
) else (
    echo toolbox.updater.x64.config já existe, pulando download.
)

REM ===== EXTRAIR ZIP (SE AINDA NÃO EXISTIR A PASTA) =====
if not exist "wget.exe" (
    echo Extraindo wget.zip...
    tar -xf wget.zip
) else (
    echo wget já extraído.
)

REM ===== EXECUTAR EXE =====
echo Abrindo toolbox.updater.x64.exe...
start "" "%~dp0downloads\toolbox.updater.x64.exe"
endlocal
exit
