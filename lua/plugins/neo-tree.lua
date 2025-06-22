return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x", -- asegúrate de usar la rama correcta
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                position = "left",
                width = 30,
                mappings = {
                },
            },

        })
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("CloseNeoTree", { clear = true }),
            callback = function()
                local bufname = vim.api.nvim_buf_get_name(0)
                local win_count = #vim.api.nvim_list_wins()
                if win_count > 1 and not string.match(bufname, "neo%-tree") then
                    require("neo-tree.command").execute({ action = "close" })
                end
            end,
        })
    end,

}
