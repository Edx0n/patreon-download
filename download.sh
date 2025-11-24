#!/bin/bash
# Script helper para baixar conteúdo do Patreon
# Uso: ./download.sh [URL] [COOKIE_OPCIONAL]

# Verificar se a URL foi fornecida
if [ -z "$1" ]; then
    echo "Erro: URL não fornecida"
    echo "Uso: ./download.sh [URL] [COOKIE_OPCIONAL] [FFMPEG_PATH_OPCIONAL]"
    echo "Exemplo: ./download.sh \"https://www.patreon.com/posts/exemplo-123456789\""
    exit 1
fi

URL="$1"
COOKIE="$2"
FFMPEG_PATH="$3"
OUTPUT_DIR="downloads"

# Criar diretório de saída se não existir
mkdir -p "$OUTPUT_DIR"

echo "========================================"
echo "Patreon Downloader"
echo "========================================"
echo "URL: $URL"
echo "Diretório de saída: $OUTPUT_DIR"
echo "========================================"
echo ""

# Verificar se cookie foi fornecido
if [ -z "$COOKIE" ]; then
    echo "Baixando sem cookie (conteúdo público)..."
    if [ -z "$FFMPEG_PATH" ]; then
        patreon-dl -o "$OUTPUT_DIR" "$URL" --no-prompt
    else
        patreon-dl -f "$FFMPEG_PATH" -o "$OUTPUT_DIR" "$URL" --no-prompt
    fi
else
    echo "Baixando com cookie (conteúdo patron-only)..."
    if [ -z "$FFMPEG_PATH" ]; then
        patreon-dl -c "$COOKIE" -o "$OUTPUT_DIR" "$URL" --no-prompt
    else
        patreon-dl -f "$FFMPEG_PATH" -c "$COOKIE" -o "$OUTPUT_DIR" "$URL" --no-prompt
    fi
fi

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "Download concluído!"
    echo "Conteúdo salvo em: $OUTPUT_DIR"
    echo "========================================"
else
    echo ""
    echo "========================================"
    echo "Erro durante o download"
    echo "========================================"
    exit 1
fi

