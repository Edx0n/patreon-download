@echo off
REM Script helper para baixar conteúdo do Patreon
REM Uso: download.bat [URL] [COOKIE_OPCIONAL]

setlocal

REM Verificar se a URL foi fornecida
if "%~1"=="" (
    echo Erro: URL nao fornecida
    echo Uso: download.bat [URL] [COOKIE_OPCIONAL] [FFMPEG_PATH_OPCIONAL]
    echo Exemplo: download.bat "https://www.patreon.com/posts/exemplo-123456789"
    exit /b 1
)

set "URL=%~1"
set "COOKIE=%~2"
set "OUTPUT_DIR=downloads"
set "FFMPEG_PATH=%~3"

REM Se FFmpeg não foi fornecido, tentar encontrar no PATH ou usar variável de ambiente
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

REM Criar diretório de saída se não existir
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo ========================================
echo Patreon Downloader
echo ========================================
echo URL: %URL%
echo Diretorio de saida: %OUTPUT_DIR%
echo ========================================
echo.

REM Verificar se cookie foi fornecido
if "%COOKIE%"=="" (
    echo Baixando sem cookie (conteudo publico)...
    if "%FFMPEG_PATH%"=="" (
        patreon-dl -o "%OUTPUT_DIR%" "%URL%" --no-prompt
    ) else (
        patreon-dl -f "%FFMPEG_PATH%" -o "%OUTPUT_DIR%" "%URL%" --no-prompt
    )
) else (
    echo Baixando com cookie (conteudo patron-only)...
    if "%FFMPEG_PATH%"=="" (
        patreon-dl -c "%COOKIE%" -o "%OUTPUT_DIR%" "%URL%" --no-prompt
    ) else (
        patreon-dl -f "%FFMPEG_PATH%" -c "%COOKIE%" -o "%OUTPUT_DIR%" "%URL%" --no-prompt
    )
)

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo Download concluido!
    echo Conteudo salvo em: %OUTPUT_DIR%
    echo ========================================
) else (
    echo.
    echo ========================================
    echo Erro durante o download
    echo ========================================
    exit /b 1
)

endlocal

