if vim.g.vscode then
    return {}
end

local getPythonPath = function()
    local config_path = vim.fn.getcwd() .. "/pyrightconfig.json"
    if vim.fn.filereadable(config_path) == 1 then
        local f = io.open(config_path, "r")
        if f then
            local content = f:read("*a")
            f:close()
            local ok, decoded = pcall(vim.fn.json_decode, content)
            if ok and decoded.pythonPath then
                return decoded.pythonPath
            end
        end
    end
    -- INFO: For uv(python project manager)
    local venv_exe = vim.fn.getcwd() .. "/.venv/Scripts/python.exe"
    if vim.fn.executable(venv_exe) == 1 then
        return venv_exe
    end
    -- default
    return "python"
end
vim.g.python3_host_prog = getPythonPath()

-- HACK: Normal
return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        opts.servers = opts.servers or {}

        -- INFO: For CSharp
        local omnisharp_bin = vim.fn.expand("~/Documents/Library/omnisharp-win-x64/OmniSharp.exe")
        opts.servers.omnisharp = {
            cmd = {
                omnisharp_bin,
                "--languageserver",
                "--hostPID",
                tostring(vim.fn.getpid()),
            },
            settings = {
                MsBuild = {
                    LoadProjectsOnDemand = false,
                },
                RoslynExtensionsOptions = {
                    enableDecompilationSupport = true,
                },
            },
            -- enable_roslyn_analyzers = true,
            -- organize_imports_on_format = true,
            -- enable_import_completion = false,
            -- root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
        }

        -- INFO: For python
        opts.servers.pyright = {
            settings = {
                python = {
                    pythonPath = getPythonPath(),
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace",
                    },
                },
            },
        }
        opts.servers.ruff = {
            init_options = {
                settings = {
                    interpreter = { python_exe },
                },
            },
        }
    end,
}

-- -- HACK: Vue
-- return {
--     "neovim/nvim-lspconfig",
--     event = { "BufReadPre", "BufNewFile" },
--     opts = function(_, opts)
--         opts.servers = opts.servers or {}
--     end,
--     config = function()
--         local vue_language_server_path = vim.fn.expand("$MASON/packages")
--             .. "/vue-language-server"
--             .. "/node_modules/@vue/language-server"
--         local vue_plugin = {
--             name = "@vue/typescript-plugin",
--             location = vue_language_server_path,
--             languages = { "vue" },
--             configNamespace = "typescript",
--         }
--         local vtsls_config = {
--             settings = {
--                 vtsls = {
--                     tsserver = {
--                         globalPlugins = {
--                             vue_plugin,
--                         },
--                     },
--                 },
--             },
--             filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
--         }
--
--         local vue_ls_config = {
--             settings = {
--                 vue = {
--                     suggest = {
--                         componentNameCasing = "preferKebabCase",
--                         propNameCasing = "preferKebabCase",
--                     },
--                 },
--             },
--             on_init = function(client)
--                 client.handlers["tsserver/request"] = function(_, result, context)
--                     local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
--                     if #clients == 0 then
--                         vim.notify(
--                             "Could not found `vtsls` lsp client, vue_lsp would not work without it.",
--                             vim.log.levels.ERROR
--                         )
--                         return
--                     end
--                     local ts_client = clients[1]
--
--                     local param = unpack(result)
--                     local id, command, payload = unpack(param)
--                     ts_client:exec_cmd({
--                         title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
--                         command = "typescript.tsserverRequest",
--                         arguments = {
--                             command,
--                             payload,
--                         },
--                     }, { bufnr = context.bufnr }, function(_, r)
--                         local response_data = { { id, r.body } }
--                         ---@diagnostic disable-next-line: param-type-mismatch
--                         client:notify("tsserver/response", response_data)
--                     end)
--                 end
--             end,
--         }
--         -- nvim 0.11 or above
--         vim.lsp.config("vtsls", vtsls_config)
--         vim.lsp.config("vue_ls", vue_ls_config)
--         vim.lsp.enable({ "vtsls", "vue_ls" })
--     end,
-- }

-- -- HACK: Arduino
-- return {
--     "neovim/nvim-lspconfig",
--     opts = function(_, opts)
--         opts.servers = opts.servers or {}
--     end,
--     config = function(_, opts)
--         local lspconfig = require("lspconfig")
--
--         -- Arduino Language Server のセットアップ
--         if
--             not vim.tbl_contains(
--                 vim.tbl_map(
--                     function(client)
--                         return client.name
--                     end,
--                     vim.lsp.get_clients() -- 起動済みLSP
--                 ),
--                 "arduino_language_server"
--             )
--         then
--             lspconfig.arduino_language_server.setup({
--                 cmd = {
--                     "arduino-language-server",
--                     "-cli-config",
--                     vim.fn.expand("$USERPROFILE") .. "\\AppData\\Local\\Arduino15\\arduino-cli.yaml",
--                     "-fqbn",
--                     "esp32:esp32:esp32",
--                     "-cli",
--                     "arduino-cli",
--                     "-clangd",
--                     "clangd",
--                 },
--                 filetypes = { "arduino" },
--             })
--         end
--     end,
-- }
