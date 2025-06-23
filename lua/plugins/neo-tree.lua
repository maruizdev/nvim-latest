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
                width = 45,
                mappings = {
                },
            },
            event_handlers = {

                {
                    event = "file_opened",
                    handler = function(file_path)
                        require("neo-tree.command").execute({ action = "close" })
                    end
                },

            }

        })
    end,

}
