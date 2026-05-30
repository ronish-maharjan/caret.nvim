# caret.nvim
simple utility plugin for sharing code easily.

---

## Features

* Floating scratch buffer
* Upload text to paste.rs
* Shareable URL returned directly in the buffer
* Simple and lightweight
* No external dependencies other than `curl`

---

## Requirements

* Neovim >= 0.10
* `curl`

---

## Installation

### lazy.nvim

```lua
{
    "ronish-maharjan/caret.nvim",
    opts = {},
}

```

### Setup

```lua
require("caret").setup({
    width = 80,
    height = 10,
    border = "rounded",
    title = "caret",
    title_pos = "center"
})
```

All configuration is optional.

---

## Usage

Plugin have exposed the command **Caret** use it for key binding

Open Caret:

```vim
:Caret
```

A floating scratch buffer will appear.

Type or paste any text you want to share.

### Keymaps

| Key    | Action                             |
| ------ | ---------------------------------- |
| `<CR>` | Upload buffer contents to paste.rs |
| `q`    | Close Caret                        |

After uploading, the buffer contents will be replaced with the generated URL.


## Custom Keybinding

You can create your own keybinding for opening Caret:

```lua
vim.keymap.set("n", "<leader>cp", "<cmd>Caret<CR>", {
    desc = "Open Caret",
})
```

---

## License

MIT
> This Plugin uses Paste.rs for sharing the text





