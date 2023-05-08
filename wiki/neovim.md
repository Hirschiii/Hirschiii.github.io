---
title: Neovim Wiki
layout: wiki
type: wiki
author: Niklas von Hirschfeld
date: 2023-05-02
categories: []
lastmod: 2023-05-02
tags: []
comments: true
---

# Plan:

1. EInleitung
    1. Markdown flavor 
    2. Mit Link zu primaerquelle
2. Paketmanager
3. Spacevim vs from scratch
    1. Was fuer Module
    2. Conclusion macht das sin?
    1. common markdown
4. Markdown echtzeit HTML
    1. Syntax
    2. Html Kann man links folgen
5. Pandoc
    1. Extension
    2. Template

# Einleitung

Neovim ist ein erweiterbarer Vim-basierter Texteditor.

Neovim kann mit Vimscript v1 und Lua konfiguriert und erweitert werden,
wobei Lua empfohlen wird.

## Markdown flavor

Es gibt verschiedene sog. Markdown flavor. Das sind einfach
verschieden arten von Syntax und Features. Es gibt einmal
den Standartisierten "Common Markdown". Diese Syntax wurden 
einmal als grundlage eingefuehrt so das andere "flavors" darauf
aufbauen. Manche unterstuetzen zum beispiel "Mathe Bloecke", andere
"Mermaid" (fuer Diagramme).

- [Hier ein Vergleich von verschiedenen Markdownflavors](https://gist.github.com/vimtaai/99f8c89e7d3d02a362117284684baa0f)

# Paketmanager

## Lazy-vim

### Features

- Nice UI
- Automatic caching
- Automatic bytecode compilation of Lua modules
- Automatic lazy-loading
- Automatically install missing Plugins
- Async execution
- Automatic compiling
- Generates helptages in case they are missing
- you can use local plugins
- Profiling tool to optimize performance
- Automatic check for updates
- Commit, branch, tag, version support

### Requirements

- Neovim **>=0.8.0**
- Git **>=2.19.0**

### Installation

Add this code to your `init.lua` to bootstrap **lazy.nvim:**

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
```

To add Plugins insert them like below:

```lua
require("lazy").setup(plugins, opts)
```

- **plugins**: this should be a `table` or a `string`
- **opts**: further [configuration](https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration) **(optional)**

For Example:

```lua
require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})
```
## Voundle

## Packer

## vim-plug

## Dein.vim

- [GitHub](https://github.com/Shougo/dein.vim)

## Manual

# Spacevim vs Scratch



# Links

- [Neovim Elixir alchemist](https://github.com/slashmili/alchemist.vim)
