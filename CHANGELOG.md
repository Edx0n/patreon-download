# Changelog

## [1.0.0] - 2024-11-23

### Adicionado

- Scripts helper para facilitar downloads do Patreon
  - `download.bat` - Script Windows para download único
  - `download.sh` - Script Linux/Mac para download único
  - `download-multiple.bat` - Script Windows para downloads múltiplos
- Documentação completa no README.md
- Guia rápido de uso
- Arquivo de exemplo `urls.txt.example` para downloads múltiplos
- `.gitignore` configurado para proteger informações pessoais
- Licença MIT

### Características

- Detecção automática do FFmpeg no PATH
- Suporte para downloads com e sem cookie
- Suporte para especificar caminho customizado do FFmpeg
- Scripts genéricos e reutilizáveis
- Documentação completa e exemplos

### Segurança

- `.gitignore` configurado para excluir:
  - Pasta `downloads/` com conteúdo baixado
  - Arquivos de banco de dados SQLite
  - Arquivos com URLs pessoais (`urls.txt`)
  - Arquivos de log e temporários
