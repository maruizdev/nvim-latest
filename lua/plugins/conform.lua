return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            html = {
                "prettier",
            },
            htmlangular = {
                "prettier",
            },
            css = {
                "prettier",
            },
            scss = {
                "prettier",
            },
            javascript = {
                "prettier",
            },
            javascriptreact = {
                "prettier",
            },
            typescript = {
                "prettier",
            },
            typescriptreact = {
                "prettier",
            },
            json = {
                "prettier",
            },
            yaml = {
                "prettier",
            },
        },

        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },
    },
}
