# 🚀 Guia Rápido - Download do Vídeo

## Passo 1: Instalar FFmpeg (se ainda não tiver)

```bash
# Opção 1: Via Chocolatey
choco install ffmpeg

# Opção 2: Via winget
winget install FFmpeg
```

## Passo 2: Obter Cookie (se necessário)

Se o vídeo for conteúdo patron-only:

1. Acesse https://www.patreon.com e faça login
2. Pressione F12 → Aba Application → Cookies → `https://www.patreon.com`
3. Copie o valor do cookie `session_id`

## Passo 3: Baixar o Vídeo

### Opção A: Usando o Script Helper (Windows)

```bash
# Conteúdo público
download.bat "https://www.patreon.com/posts/exemplo-123456789"

# Conteúdo patron-only (substitua SEU_COOKIE)
download.bat "https://www.patreon.com/posts/exemplo-123456789" "SEU_COOKIE"
```

### Opção B: Comando Direto

```bash
# Conteúdo público
patreon-dl -o "./downloads" "https://www.patreon.com/posts/exemplo-123456789"

# Conteúdo patron-only
patreon-dl -c "SEU_COOKIE" -o "./downloads" "https://www.patreon.com/posts/exemplo-123456789"
```

## 📍 Onde Encontrar o Vídeo Baixado?

O vídeo será salvo em:

```
downloads/campaign/posts/[nome-do-post]/videos/
```

## ⚠️ Problemas Comuns

### Erro: "FFmpeg not found"

- Instale o FFmpeg (veja Passo 1)
- Ou especifique o caminho: `patreon-dl -f "C:\caminho\ffmpeg.exe" ...`

### Erro: "Cookie invalid" ou "Access denied"

- Verifique se o cookie está correto
- Certifique-se de estar logado no Patreon
- O cookie pode ter expirado (obtenha um novo)

### Erro: "No posts found"

- Verifique se a URL está correta
- Se for conteúdo patron-only, certifique-se de ter acesso com sua conta

## 💡 Dica

Para testar sem baixar:

```bash
patreon-dl --dry-run -o "./downloads" "URL_AQUI"
```
