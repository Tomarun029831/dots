# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 🚀 CLI Fast SetUp

```pwsh
# PowerShell Installation
Start-Process -Wait winget -ArgumentList `
  "install --id Microsoft.PowerShell -e --silent --accept-package-agreements --accept-source-agreements"

pwsh -NoLogo -NoProfile -Command @'
$allPackages = @(
    # DevTools
    "Git.Git",
    "JesseDuffield.lazygit",
    "junegunn.fzf",
    "sharkdp.fd",
    "BurntSushi.ripgrep.MSVC",
    "JernejSimoncic.Wget",

    # Terminal Emulator & Fonts
    "DEVCOM.JetBrainsMonoNerdFont",
    "Alacritty.Alacritty",

    # Node.js
    "OpenJS.NodeJS.LTS",

    # Neovim
    "Neovim.Neovim",

    # Chocolatey
    "Chocolatey.Chocolatey"
)

$scriptBlock = {
    param($pkg)
    try {
        Start-Process -Wait winget -ArgumentList `
          "install --id $pkg -e --silent --accept-package-agreements --accept-source-agreements"
        Write-Host "$pkg installed."
    } catch {
        Write-Host "$pkg installation failed: $_"
    }
}

$allPackages | ForEach-Object -Parallel $scriptBlock -ThrottleLimit 4

# ------------------------
# Neovim, Alacritty clone
# ------------------------
git clone https://github.com/Tomarun029831/AlacrittySettings "$env:APPDATA\alacritty"
Remove-Item -Recurse -Force "$env:APPDATA\alacritty\.git"

git clone https://github.com/Tomarun029831/NeovimSettings.git "$env:LOCALAPPDATA\nvim"
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim\.git"

# ------------------------
# LuaRocks / MinGW admin installation
# ------------------------
Start-Process -Wait powershell -Verb RunAs -ArgumentList '-Command', @'
choco upgrade chocolatey;
choco install LuaRocks -y;
choco install mingw -y;
'@

# ------------------------
# npm global install cz-git
# ------------------------
npm install -g cz-git

$configPath = Join-Path $env:APPDATA "lazygit\config.yml"

$configContent = @"
os:
  editPreset: 'nvim'

customCommands:
  - command: npx czg
    context: files
    subprocess: true
    key: c
  - command: npx czg ai
    context: files
    subprocess: true
    key: C
"@

Set-Content -Path $configPath -Value $configContent -Encoding UTF8


Write-Host "CLI Fast Setup Finished"

'@
```

# C# LSP Works In Unity
Regenerate the `.sln` and `.csproj` files with vscode in a Unity project

# CLI Setup for [quarto-nvim](https://github.com/quarto-dev/quarto-nvim) Working with [molten-nvim](https://github.com/benlubas/molten-nvim) Using [uv](https://github.com/astral-sh/uv) (Python project manager) in [Nushell](https://github.com/nushell/nushell)
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
