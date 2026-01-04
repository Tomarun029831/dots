# configuration files
## Set Environment Variables
```nushell
setx XDG_CONFIG_HOME ~/.config/
setx NVIM_APPNAME nvim
setx GLAZEWM_CONFIG_PATH ~/.config/glazewm/config.yaml
setx WEZTERM_CONFIG_FILE ~/.config/wezterm/wezterm.lua
```

## Automatic Proxy Switcher with [Nushell](https://github.com/nushell/nushell) in Windows11
Set up a Task Scheduler event trigger for
Microsoft-Windows-NetworkProfile/Operational (Event ID: 10000),
then execute the following command:
```nushell
nu ~/.config/nushell/proxy/switchProxy.nu
```

## C# LSP Works on neovim In Unity
### Install .NET Framework 4.7.1 Developer Pack
* **ダウンロード:** [Microsoft公式サイト](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net471) から **Developer Pack** を入手してインストール。

### Install OmniSharp (v1.38.2)
* **ダウンロード:** [OmniSharp Roslyn v1.38.2](https://www.google.com/search?q=https://github.com/OmniSharp/omnisharp-roslyn/releases/tag/v1.38.2) から `omnisharp-win-x64.zip` を取得。
* **配置場所:** `~\Documents\Library\omnisharp-win-x64`
---

```powershell
Get-ChildItem -Path "C:\Users\<Username>\Documents\Library\omnisharp-win-x64" -Recurse | Unblock-File
```

---

```lua
return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        opts.servers = opts.servers or {}

        local omnisharp_bin = "~/Documents/Library/omnisharp-win-x64/OmniSharp.exe"

        -- INFO: For Unity CSharp
        opts.servers.omnisharp = {
            cmd = {
                omnisharp_bin,
                "--languageserver",
                "--hostPID",
                tostring(vim.fn.getpid()),
            },
            settings = {
                MsBuild = {
                    LoadProjectsOnDemand = false,
                },
                RoslynExtensionsOptions = {
                    enableDecompilationSupport = true,
                },
            },
            -- enable_roslyn_analyzers = true,
            -- organize_imports_on_format = true,
            -- enable_import_completion = false,
            -- root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
        }
    end,
}

```

1. **Edit > Preferences > External Tools** を開く。
2. **External Script Editor** を `Visual Studio Code` (または VS 2019) に設定。
3. **Generate .csproj files for:** のチェックボックスを**すべてオン**にする。
4. **Regenerate project files** ボタンをクリック。


## CLI Setup for [quarto-nvim](https://github.com/quarto-dev/quarto-nvim) Working with [molten-nvim](https://github.com/benlubas/molten-nvim) Using [uv](https://github.com/astral-sh/uv) (Python project manager) in [Nushell](https://github.com/nushell/nushell)
```nushell
# required modules
winget install --id=Posit.Quarto
winget install --id=astral-sh.uv 

uv add pynvim ipykernel
overlay use .venv\Scripts\activate
python -m ipykernel install --user --name=<project-name>
deactivate
# optional modules
uv add cairosvg
uv add pnglatex
uv add plotly
uv add kaleido
uv add pyperclip
uv add nbformat
uv add pillow
```
