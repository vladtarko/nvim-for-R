# Based on the 'Quarto Nvim Kickstarter'

<https://github.com/jmbuhr/quarto-nvim-kickstarter>

**Added more R-specific packages**, particularly:

- `jamespeapen/Nvim-R`
- `jalvesaq/cmp-nvim-r`

Companion to <https://github.com/quarto-dev/quarto-nvim>.

This requires Neovim >= **v0.9.0** (https://github.com/neovim/neovim/releases/tag/stable)

## Videos

Check out this playlist for a full guide and walkthrough:
https://youtube.com/playlist?list=PLabWm-zCaD1axcMGvf7wFxJz8FZmyHSJ7

## Setup

Clone this repo into `~/.config/nvim/` or copy-paste just the parts you like.

If you already have your own configuration, check out `lua/plugins/quarto.lua`
for the configuration of all plugins directly relevant to your Quarto experience.

This configuration can make use of a "Nerd Font" for icons and symbols.
Download one here: <https://www.nerdfonts.com/> and set it as your terminal font.

### Unix, Linux Installation

```bash
git clone https://github.com/jmbuhr/quarto-nvim-kickstarter.git ~/.config/nvim
```

### Windows Powershell Installation

```bash
git clone https://github.com/jmbuhr/quarto-nvim-kickstarter.git "$env:LOCALAPPDATA\nvim"
```

The telescope file finder uses `fzf` for fuzzy finding via the [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim) extension.
It will automatically install `fzf`, but needs some requirements which are not pre-installed on Windows.
Check out the previous link for those (or comment out the extension in `./lua/plugins/ui.lua`).

Now you are good to go!

## Updating

Certain updates to plugins may leave behind unused plugin data. If this configuration produces an error on startup, try removing those first, allowing the lazy.nvim package manager to recreate the correct plugin structure:

```bash
rm -r ~/.local/share/nvim
rm -r ~/.local/state/nvim
```

## Links to the plugins

Some of the plugins included are:

- <https://github.com/folke/lazy.nvim>
- <https://github.com/jpalardy/vim-slime>
- <https://github.com/neovim/nvim-lspconfig>
- <https://github.com/nvim-treesitter/nvim-treesitter>
- <https://github.com/hrsh7th/nvim-cmp>
  - <https://github.com/hrsh7th/cmp-nvim-lsp>
  - <https://github.com/hrsh7th/cmp-buffer>
  - <https://github.com/hrsh7th/cmp-path>
  - <https://github.com/hrsh7th/cmp-calc>
  - <https://github.com/hrsh7th/cmp-emoji>
  - <https://github.com/f3fora/cmp-spell>
  - <https://github.com/kdheepak/cmp-latex-symbols>
  - <https://github.com/jc-doyle/cmp-pandoc-references>
- <https://github.com/L3MON4D3/LuaSnip>
  - <https://github.com/saadparwaiz1/cmp_luasnip>
  - <https://github.com/rafamadriz/friendly-snippets>
