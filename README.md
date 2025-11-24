# patreon-download

Helper scripts to facilitate the use of [patreon-dl](https://github.com/patrickkfkan/patreon-dl) and download content from Patreon.

## 🙏 Credits

This project uses and depends on the excellent work of [@patrickkfkan](https://github.com/patrickkfkan) and his [patreon-dl](https://github.com/patrickkfkan/patreon-dl) project. All credits for the main download tool go to him.

## 📋 Prerequisites

- **Node.js** v20+ installed
- **patreon-dl** installed globally:
  ```bash
  npm install -g patreon-dl
  ```
- **FFmpeg** (required for videos):

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

## 🚀 Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/Edx0n/patreon-download.git
   cd patreon-download
   ```

2. (Optional) Make scripts executable (Linux/Mac):
   ```bash
   chmod +x download.sh
   ```

## 📖 Usage

### Single Download

**Windows:**

```bash
download.bat "https://www.patreon.com/posts/example-123456789"
```

**Linux/Mac:**

```bash
./download.sh "https://www.patreon.com/posts/example-123456789"
```

### Download with Cookie (Patron-Only Content)

To download exclusive patron content, you need the session cookie:

1. Visit https://www.patreon.com and log in
2. Open Developer Tools (F12)
3. Go to the **Application** tab (Chrome) or **Storage** tab (Firefox)
4. In the sidebar, click **Cookies** → `https://www.patreon.com`
5. Look for the cookie named `session_id`
6. Copy the complete **Value**

**Windows:**

```bash
download.bat "https://www.patreon.com/posts/example-123456789" "YOUR_COOKIE"
```

**Linux/Mac:**

```bash
./download.sh "https://www.patreon.com/posts/example-123456789" "YOUR_COOKIE"
```

### Multiple Downloads

1. Create a `urls.txt` file with one URL per line:

   ```txt
   https://www.patreon.com/posts/example-123456789
   https://www.patreon.com/posts/another-example-987654321
   ```

2. Run the script:

   ```bash
   # Windows
   download-multiple.bat "YOUR_COOKIE"

   # Linux/Mac (if available)
   ./download-multiple.sh "YOUR_COOKIE"
   ```

### Specify FFmpeg Path

If FFmpeg is not in your system PATH:

**Windows:**

```bash
download.bat "URL" "COOKIE" "C:\path\to\ffmpeg.exe"
```

**Linux/Mac:**

```bash
./download.sh "URL" "COOKIE" "/path/to/ffmpeg"
```

## 📁 Directory Structure

Content will be downloaded in the following structure:

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

## 🛠️ Advanced Options

### Use patreon-dl Directly

For more options, see the [official patreon-dl documentation](https://github.com/patrickkfkan/patreon-dl):

```bash
patreon-dl --help
```

### Dry-Run Mode (Test without Downloading)

```bash
patreon-dl --dry-run -o "./downloads" "URL"
```

### Log Level

```bash
patreon-dl -l debug -o "./downloads" "URL"
```

## 📝 Supported URL Formats

- Single post: `https://www.patreon.com/posts/example-123456789`
- Creator posts: `https://www.patreon.com/creator/posts`
- Collection: `https://www.patreon.com/collection/123456`
- Product: `https://www.patreon.com/creator/shop/product-123456`

## 🔒 Security

- **Never share your session cookie**
- The cookie provides access to your Patreon account
- Keep the `urls.txt` file private if it contains URLs for exclusive content

## 📖 Additional Documentation

- [Official patreon-dl repository](https://github.com/patrickkfkan/patreon-dl)
- [How to obtain Cookie](https://github.com/patrickkfkan/patreon-dl/wiki/How-to-obtain-Cookie)

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or pull requests.

## 📄 License

This project is provided as-is. patreon-dl is licensed under MIT License.

## ⚠️ Legal Notice

This project is just a helper tool for patreon-dl. Use responsibly and respect Patreon's terms of service and content creators' copyrights.
