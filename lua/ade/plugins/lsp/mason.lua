-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
-- local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
-- if not mason_null_ls_status then
--   return

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
  ensure_installed = {
    "ansiblels",
--		"autotools-language-server",
		"bashls",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"gopls",
--		"helmls",
    "html",
--		"jedi_language-server",
		"jsonls",
		"jqls",
    "lua_ls",
		"marksman",
		"quick_lint_js",
		"sqlls",
		"terraformls",
		"tflint",
		"vuels",
		"yamlls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

-- mason_null_ls.setup({
--   -- list of formatters & linters for mason to install
--   ensure_installed = {
--     "prettier", -- ts/js formatter
--     "stylua", -- lua formatter
--     "eslint_d", -- ts/js linter
--   },
--   -- auto-install configured formatters & linters (with null-ls)

