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

## Cmake LSP (cmake-language-server) Works on Neovim with Mason
## Install cmake-language-server via Mason
```nu
# If a version conflict occurs (e.g., ImportError: cannot import name 'LanguageServer' from 'pygls.server'), run the following command in your terminal to fix it:
C:\Users\<Username>\AppData\Local\nvim-data\mason\packages\cmake-language-server\venv\Scripts\pip install "pygls<1.4.0"
```

## C# LSP Works on neovim In Unity
### In Unity
    1. **Edit > Preferences > External Tools** を開く。
    2. **External Script Editor** を `Visual Studio Code` (または VS 2019) に設定。
    3. **Generate .csproj files for:** のチェックボックスを**すべてオン**にする。
    4. **Regenerate project files** ボタンをクリック。
## In Neovim
    1. Install [roslyn-language-server](https://github.com/dotnet/roslyn) with [Mason](https://github.com/mason-org/mason.nvim)
    2. Execute below command
            winget install --id=Microsoft.DotNet.SDK.10

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
