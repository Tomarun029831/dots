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
Regenerate the `.sln` and `.csproj` files with vscode in a Unity project  
Edit>Preferences>External Tools

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
