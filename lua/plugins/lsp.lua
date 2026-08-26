return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {},
            },

            {
                "mason-org/mason-lspconfig.nvim",
            },

            -- Completion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },

        config = function()
            -----------------------------------------------------------
            -- CAPABILITIES
            -----------------------------------------------------------

            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            -- Se aplica a todos los LSP
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -----------------------------------------------------------
            -- DIAGNOSTICS
            -----------------------------------------------------------

            vim.diagnostic.config({
                virtual_text = true,
                severity_sort = true,
                underline = true,

                float = {
                    border = "rounded",
                    source = true,
                    header = "",
                    prefix = "",
                },

                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚 ",
                        [vim.diagnostic.severity.WARN] = "󰀪 ",
                        [vim.diagnostic.severity.INFO] = "󰋽 ",
                        [vim.diagnostic.severity.HINT] = "󰌶 ",
                    },
                },
            })

            -----------------------------------------------------------
            -- LUA
            -----------------------------------------------------------

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },

                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },

                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },

                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -----------------------------------------------------------
            -- TYPESCRIPT
            -----------------------------------------------------------

            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })

            -----------------------------------------------------------
            -- ANGULAR
            -----------------------------------------------------------

            vim.lsp.config("angularls", {
                capabilities = capabilities,
            })

            -----------------------------------------------------------
            -- ESLINT
            -----------------------------------------------------------

            vim.lsp.config("eslint", {
                capabilities = capabilities,
            })

            -----------------------------------------------------------
            -- HTML
            -----------------------------------------------------------

            vim.lsp.config("html", {
                capabilities = capabilities,
            })

            -----------------------------------------------------------
            -- CSS / SCSS
            -----------------------------------------------------------

            vim.lsp.config("cssls", {
                capabilities = capabilities,
            })

            -----------------------------------------------------------
            -- EMMET
            -----------------------------------------------------------

            vim.lsp.config("emmet_language_server", {
                capabilities = capabilities,

                filetypes = {
                    "html",
                    "htmlangular",
                    "css",
                    "scss",
                    "javascriptreact",
                    "typescriptreact",
                },
            })

            -----------------------------------------------------------
            -- PYTHON
            -----------------------------------------------------------

            vim.lsp.config("pyright", {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "basic",
                        },
                    },
                },
            })

            -----------------------------------------------------------
            -- MASON
            -----------------------------------------------------------

            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- Neovim
                    "lua_ls",

                    -- Angular / TypeScript
                    "angularls",
                    "ts_ls",
                    "eslint",

                    -- Web
                    "html",
                    "cssls",
                    "emmet_language_server",

                    -- Otros lenguajes que utilizas
                    "intelephense",
                    "clangd",
                    "pyright",
                },

                automatic_enable = true,
            })

            -----------------------------------------------------------
            -- LSP ATTACH / KEYMAPS
            -----------------------------------------------------------

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = {
                        buffer = event.buf,
                        silent = true,
                    }

                    -- Información
                    vim.keymap.set(
                        "n",
                        "K",
                        vim.lsp.buf.hover,
                        vim.tbl_extend("force", opts, {
                            desc = "LSP Hover",
                        })
                    )

                    -- Navegación
                    vim.keymap.set(
                        "n",
                        "gd",
                        vim.lsp.buf.definition,
                        vim.tbl_extend("force", opts, {
                            desc = "Ir a definición",
                        })
                    )

                    vim.keymap.set(
                        "n",
                        "gD",
                        vim.lsp.buf.declaration,
                        vim.tbl_extend("force", opts, {
                            desc = "Ir a declaración",
                        })
                    )

                    vim.keymap.set(
                        "n",
                        "gi",
                        vim.lsp.buf.implementation,
                        vim.tbl_extend("force", opts, {
                            desc = "Ir a implementación",
                        })
                    )

                    vim.keymap.set(
                        "n",
                        "gr",
                        vim.lsp.buf.references,
                        vim.tbl_extend("force", opts, {
                            desc = "Referencias",
                        })
                    )

                    -- Signature help
                    vim.keymap.set(
                        "n",
                        "gs",
                        vim.lsp.buf.signature_help,
                        vim.tbl_extend("force", opts, {
                            desc = "Firma función",
                        })
                    )

                    vim.keymap.set(
                        "i",
                        "<C-k>",
                        vim.lsp.buf.signature_help,
                        vim.tbl_extend("force", opts, {
                            desc = "Firma función",
                        })
                    )

                    ---------------------------------------------------
                    -- REFACTOR
                    ---------------------------------------------------

                    vim.keymap.set(
                        "n",
                        "<F2>",
                        vim.lsp.buf.rename,
                        vim.tbl_extend("force", opts, {
                            desc = "Renombrar símbolo",
                        })
                    )

                    vim.keymap.set(
                        { "n", "v" },
                        "<F4>",
                        vim.lsp.buf.code_action,
                        vim.tbl_extend("force", opts, {
                            desc = "Code actions",
                        })
                    )

                    ---------------------------------------------------
                    -- FORMAT
                    ---------------------------------------------------

                    vim.keymap.set(
                        "n",
                        "<F3>",
                        function()
                            require("conform").format({
                                async = true,
                                lsp_fallback = true,
                            })
                        end,
                        vim.tbl_extend("force", opts, {
                            desc = "Formatear archivo",
                        })
                    )

                    ---------------------------------------------------
                    -- DIAGNOSTICS
                    ---------------------------------------------------

                    vim.keymap.set(
                        "n",
                        "gl",
                        vim.diagnostic.open_float,
                        vim.tbl_extend("force", opts, {
                            desc = "Mostrar diagnóstico",
                        })
                    )

                    vim.keymap.set(
                        "n",
                        "[d",
                        vim.diagnostic.goto_prev,
                        vim.tbl_extend("force", opts, {
                            desc = "Diagnóstico anterior",
                        })
                    )

                    vim.keymap.set(
                        "n",
                        "]d",
                        vim.diagnostic.goto_next,
                        vim.tbl_extend("force", opts, {
                            desc = "Diagnóstico siguiente",
                        })
                    )
                end,
            })

            -----------------------------------------------------------
            -- COMPLETION
            -----------------------------------------------------------

            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require(
                "luasnip.loaders.from_vscode"
            ).lazy_load()

            vim.opt.completeopt = {
                "menu",
                "menuone",
                "noselect",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                window = {
                    completion =
                        cmp.config.window.bordered(),

                    documentation =
                        cmp.config.window.bordered(),
                },

                formatting = {
                    fields = {
                        "abbr",
                        "kind",
                        "menu",
                    },

                    format = function(entry, item)
                        local menus = {
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        }

                        item.menu =
                            menus[entry.source.name]
                            or "[" .. entry.source.name .. "]"

                        return item
                    end,
                },

                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                        priority = 1000,
                    },

                    {
                        name = "luasnip",
                        priority = 750,
                    },

                    {
                        name = "path",
                        priority = 500,
                    },

                    {
                        name = "buffer",
                        keyword_length = 3,
                        priority = 250,
                    },
                }),

                mapping = cmp.mapping.preset.insert({
                    ---------------------------------------------------
                    -- ABRIR COMPLETION
                    ---------------------------------------------------

                    ["<C-Space>"] =
                        cmp.mapping.complete(),

                    ---------------------------------------------------
                    -- CONFIRMAR
                    ---------------------------------------------------

                    ["<CR>"] =
                        cmp.mapping.confirm({
                            select = true,
                        }),

                    ---------------------------------------------------
                    -- DOCUMENTACIÓN
                    ---------------------------------------------------

                    ["<C-f>"] =
                        cmp.mapping.scroll_docs(4),

                    ["<C-u>"] =
                        cmp.mapping.scroll_docs(-4),

                    ---------------------------------------------------
                    -- SIGUIENTE ITEM / SNIPPET
                    ---------------------------------------------------

                    ["<Tab>"] =
                        cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif
                                luasnip.expand_or_jumpable()
                            then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end, {
                            "i",
                            "s",
                        }),

                    ---------------------------------------------------
                    -- ITEM ANTERIOR
                    ---------------------------------------------------

                    ["<S-Tab>"] =
                        cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, {
                            "i",
                            "s",
                        }),

                    ---------------------------------------------------
                    -- CERRAR
                    ---------------------------------------------------

                    ["<C-e>"] =
                        cmp.mapping.abort(),
                }),
            })
        end,
    },
}
