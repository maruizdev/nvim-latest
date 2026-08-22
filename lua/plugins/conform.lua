return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
