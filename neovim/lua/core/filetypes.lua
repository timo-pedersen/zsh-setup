-- lua/core/filetypes.lua
vim.filetype.add({
    extension = {
        xaml = "xml",
        csproj = "xml",
        props = "xml",
        targets = "xml",
    },
})

vim.treesitter.language.register("bash", "zsh")

