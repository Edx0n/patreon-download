@echo off
REM Script para baixar múltiplos vídeos do Patreon
REM Uso: download-multiple.bat [COOKIE_OPCIONAL] [FFMPEG_PATH_OPCIONAL]
REM URLs devem ser fornecidas no arquivo urls.txt (uma por linha)

setlocal enabledelayedexpansion

set "OUTPUT_DIR=downloads"
set "COOKIE=%~1"
set "FFMPEG_PATH=%~2"
set "URLS_FILE=urls.txt"

REM Se FFmpeg não foi fornecido, tentar encontrar no PATH
if "%FFMPEG_PATH%"=="" (
    where ffmpeg >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        set "FFMPEG_PATH=ffmpeg"
    ) else (
        REM Tentar caminho padrão do winget (ajuste conforme necessário)
        if exist "%LOCALAPPDATA%\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.0.1-full_build\bin\ffmpeg.exe" (
            set "FFMPEG_PATH=%LOCALAPPDATA%\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.0.1-full_build\bin\ffmpeg.exe"
        )
    )
)

REM Verificar se arquivo de URLs existe
if not exist "%URLS_FILE%" (
    echo Erro: Arquivo %URLS_FILE% nao encontrado
    echo Crie um arquivo urls.txt com uma URL por linha
    exit /b 1
)

REM Criar diretório de saída se não existir
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo ========================================
echo Patreon Downloader - Multiplos Videos
echo ========================================
if not "%FFMPEG_PATH%"=="" echo FFmpeg: %FFMPEG_PATH%
echo Diretorio de saida: %OUTPUT_DIR%
if not "%COOKIE%"=="" echo Cookie: Configurado
echo Arquivo de URLs: %URLS_FILE%
echo ========================================
echo.

set "SUCCESS=0"
set "FAILED=0"
set "COUNT=0"

REM Ler URLs do arquivo
for /f "usebackq delims=" %%U in ("%URLS_FILE%") do (
    REM Ignorar linhas vazias e comentários
    echo %%U | findstr /r "^[^#]" >nul
    if !ERRORLEVEL! EQU 0 (
        set /a COUNT+=1
        echo.
        echo [%COUNT%] Baixando: %%U
        echo ----------------------------------------
        
        if "%COOKIE%"=="" (
            if "%FFMPEG_PATH%"=="" (
                patreon-dl -o "%OUTPUT_DIR%" "%%U" --no-prompt
            ) else (
                patreon-dl -f "%FFMPEG_PATH%" -o "%OUTPUT_DIR%" "%%U" --no-prompt
            )
        ) else (
            if "%FFMPEG_PATH%"=="" (
                patreon-dl -c "%COOKIE%" -o "%OUTPUT_DIR%" "%%U" --no-prompt
            ) else (
                patreon-dl -f "%FFMPEG_PATH%" -c "%COOKIE%" -o "%OUTPUT_DIR%" "%%U" --no-prompt
            )
        )
        
        if !ERRORLEVEL! EQU 0 (
            set /a SUCCESS+=1
            echo [OK] Download concluido
        ) else (
            set /a FAILED+=1
            echo [ERRO] Falha no download
        )
        echo.
        timeout /t 2 /nobreak >nul
    )
)

echo ========================================
echo Resumo Final
echo ========================================
echo Total: %COUNT% videos
echo Sucesso: %SUCCESS%
echo Falhas: %FAILED%
echo ========================================
echo Conteudo salvo em: %OUTPUT_DIR%
echo ========================================

endlocal
