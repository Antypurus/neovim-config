require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { 
	  "c", 
	  "cpp", 
	  "rust", 
	  "python", 
	  "lua",
	  "bash",
	  "cmake",
	  "cuda",
	  "devicetree",
	  "git_rebase",
	  "gitattributes",
	  "gitcommit",
	  "gitignore",
	  "glsl",
	  "hlsl",
	  "json",
	  "latex",
	  "make",
	  "markdown",
	  "markdown_inline",
	  "passwd",
	  "regex",
	  "yaml",
	  "vim", 
	  "help", 
	  "query" 
  },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}