local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()
local packer = require("packer")
packer.init({git = {clone_timeout = 2000}})
packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "nyoom-engineering/oxocarbon.nvim",
        config = function()
            vim.cmd.colorscheme "oxocarbon"
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end,
        config = function()
            require'nvim-treesitter.configs'.setup {
                auto_install = true,
                highlight = {enable = true}
            }
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = {text = '+'},
                    change = {text = '~'},
                    delete = {text = '_'},
                    topdelete = {text = '‾'},
                    changedelete = {text = '~'}
                }
            }
        end
    }
    use {
        'numToStr/Comment.nvim',
        event = "InsertEnter",
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = function()
            require("nvim-tree").setup {
                view = {
                    side = "right",
                    mappings = {
                        custom_only = false,
                        list = {
                            {
                                key = {"l", "<CR>", "o"},
                                action = "edit",
                                mode = "n"
                            }, {key = "h", action = "close_node"},
                            {key = "C", action = "cd"}
                        }
                    }
                },
                renderer = {
                    indent_markers = {enable = false},
                    icons = {
                        webdev_colors = false,
                        show = {
                            file = false,
                            folder = false,
                            folder_arrow = false,
                            git = false
                        }
                    }
                }
            }
        end
    }
    use {
        'ibhagwan/fzf-lua',
        cmd = "FzfLua",
        config = function()
            require('fzf-lua').setup {winopts = {split = 'belowright new'}}
        end
    }
    use {
        'akinsho/toggleterm.nvim',
        cmd = {'ToggleTerm', 'TermExec'},
        config = function()
            require("toggleterm").setup {
                winbar = {
                    enabled = false,
                    name_formatter = function(term)
                        return term.name
                    end
                }
            }
        end
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
-- Compile
packer.compile()
