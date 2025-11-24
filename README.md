# patreon-download

Scripts auxiliares para facilitar o uso do [patreon-dl](https://github.com/patrickkfkan/patreon-dl) e baixar conteúdo do Patreon.

## 🙏 Créditos

Este projeto utiliza e depende do excelente trabalho de [@patrickkfkan](https://github.com/patrickkfkan) e seu projeto [patreon-dl](https://github.com/patrickkfkan/patreon-dl). Todos os créditos pela ferramenta principal de download vão para ele.

## 📋 Pré-requisitos

- **Node.js** v20+ instalado
- **patreon-dl** instalado globalmente:
  ```bash
  npm install -g patreon-dl
  ```
- **FFmpeg** (requerido para vídeos):

  ```bash
  # Windows (via Chocolatey)
  choco install ffmpeg

  # Windows (via winget)
  winget install FFmpeg

  # Linux
  sudo apt install ffmpeg

  # Mac
  brew install ffmpeg
  ```

## 🚀 Instalação

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/patreon-download.git
   cd patreon-download
   ```

2. (Opcional) Torne os scripts executáveis (Linux/Mac):
   ```bash
   chmod +x download.sh
   ```

## 📖 Como Usar

### Download Único

**Windows:**

```bash
download.bat "https://www.patreon.com/posts/exemplo-123456789"
```

**Linux/Mac:**

```bash
./download.sh "https://www.patreon.com/posts/exemplo-123456789"
```

### Download com Cookie (Conteúdo Patron-Only)

Para baixar conteúdo exclusivo de patrocinadores, você precisa do cookie de sessão:

1. Acesse https://www.patreon.com e faça login
2. Abra as Ferramentas de Desenvolvedor (F12)
3. Vá para a aba **Application** (Chrome) ou **Storage** (Firefox)
4. No menu lateral, clique em **Cookies** → `https://www.patreon.com`
5. Procure pelo cookie chamado `session_id`
6. Copie o **Value** completo

**Windows:**

```bash
download.bat "https://www.patreon.com/posts/exemplo-123456789" "SEU_COOKIE"
```

**Linux/Mac:**

```bash
./download.sh "https://www.patreon.com/posts/exemplo-123456789" "SEU_COOKIE"
```

### Download Múltiplo

1. Crie um arquivo `urls.txt` com uma URL por linha:

   ```txt
   https://www.patreon.com/posts/exemplo-123456789
   https://www.patreon.com/posts/outro-exemplo-987654321
   ```

2. Execute o script:

   ```bash
   # Windows
   download-multiple.bat "SEU_COOKIE"

   # Linux/Mac (se disponível)
   ./download-multiple.sh "SEU_COOKIE"
   ```

### Especificar Caminho do FFmpeg

Se o FFmpeg não estiver no PATH do sistema:

**Windows:**

```bash
download.bat "URL" "COOKIE" "C:\caminho\para\ffmpeg.exe"
```

**Linux/Mac:**

```bash
./download.sh "URL" "COOKIE" "/caminho/para/ffmpeg"
```

## 📁 Estrutura de Diretórios

O conteúdo será baixado na seguinte estrutura:

```
downloads/
    └── campaign/
        ├── campaign_info/
        └── posts/
            └── post 1/
                ├── post_info/
                ├── videos/
                ├── images/
                └── ...
```

## 🛠️ Opções Avançadas

### Usar patreon-dl Diretamente

Para mais opções, consulte a [documentação oficial do patreon-dl](https://github.com/patrickkfkan/patreon-dl):

```bash
patreon-dl --help
```

### Modo Dry-Run (Teste sem Baixar)

```bash
patreon-dl --dry-run -o "./downloads" "URL"
```

### Nível de Log

```bash
patreon-dl -l debug -o "./downloads" "URL"
```

## 📝 Formatos de URL Suportados

- Post único: `https://www.patreon.com/posts/exemplo-123456789`
- Posts do criador: `https://www.patreon.com/criador/posts`
- Coleção: `https://www.patreon.com/collection/123456`
- Produto: `https://www.patreon.com/criador/shop/produto-123456`

## 🔒 Segurança

- **Nunca compartilhe seu cookie de sessão**
- O cookie permite acesso à sua conta do Patreon
- Mantenha o arquivo `urls.txt` privado se contiver URLs de conteúdo exclusivo

## 📖 Documentação Adicional

- [Repositório oficial do patreon-dl](https://github.com/patrickkfkan/patreon-dl)
- [Como obter Cookie](https://github.com/patrickkfkan/patreon-dl/wiki/How-to-obtain-Cookie)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.

## 📄 Licença

Este projeto é fornecido como está. O patreon-dl é licenciado sob MIT License.

## ⚠️ Aviso Legal

Este projeto é apenas uma ferramenta auxiliar para o patreon-dl. Use com responsabilidade e respeite os termos de serviço do Patreon e os direitos autorais dos criadores de conteúdo.
