<h1 align="center">
  paprika.nvim
</h1>

<p align="center">
A remix of Komau by ntk148v. This iteration adds a bit more color while still keeping the minimal feel of komau.<br/>
</p>

| Dark                                                                                                                                      | Light                                                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://raw.githubusercontent.com/nim-sam/paprika.nvim/master/screenshots/paprika-dark.png" alt="dark" /> | <img src="https://raw.githubusercontent.com/nim-sam/paprika.nvim/master/screenshots/paprika-light.png" alt="light" /> |

## Installation

Easily configure the colorscheme using Lazy. Light and Dark modes are automatically set based on system style.

``` lua
return {
    {
        "nim-sam/paprika.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("paprika")
        end,
    },
}
```

