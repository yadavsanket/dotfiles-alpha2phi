local M = {}

local generic_opts_any = {noremap = true, silent = true}

local generic_opts = {
    insert_mode = generic_opts_any,
    normal_mode = generic_opts_any,
    visual_mode = generic_opts_any,
    visual_block_mode = generic_opts_any,
    command_mode = generic_opts_any,
    term_mode = {silent = true}
}

local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c"
}

local keymappings = {
    insert_mode = {
        ["jk"] = "<Esc>",
        ["<M-j>"] = "<Esc>:m .+1<CR>==gi",
        ["<M-k>"] = "<Esc>:m .-2<CR>==gi",
        [","] = ",<c-g>u",
        ["."] = ".<c-g>u",
        ["!"] = "!<c-g>u",
        ["?"] = "?<c-g>u"
    },
    normal_mode = {
        ["<C-l>"] = "<Cmd>noh<CR>",
        ["<C-w><C-o>"] = "<Cmd>MaximizerToggle!<CR>",
        ["<M-left>"] = "<C-w>>",
        ["<M-right>"] = "<C-w><",
        ["<M-up>"] = "<C-w>+",
        ["<M-down"] = "<C-w>-",
        ["<M-j>"] = ":m .+1<CR>==",
        ["<M-k>"] = ":m .-2<CR>==",
        ["Y"] = "y$",
        ["<S-h>"] = "<Cmd>bp<Cr>",
        ["<S-l>"] = "<Cmd>bn<Cr>",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
        ["J"] = "mzJ`z",
        ["<expr> j"] = "(v:count > 1 ? \"m'\" . v:count : '') . 'j'",
        ["<expr> k"] = "(v:count > 1 ? \"m'\" . v:count : '') . 'k'",
        ["s"] = "<Plug>(easymotion-overwin-f)"
        -- [";"] = ":"
    },
    visual_mode = {
        ["<"] = "<gv",
        [">"] = ">gv",
        ["J"] = ":m '>+1<CR>gv=gv",
        ["K"] = ":m '<-2<CR>gv=gv"
        -- [";"] = ":"
    },
    term_mode = {
        ['<C-w><C-o>'] = '<C-\\><C-n> :MaximizerToggle!<CR>',
        ['<C-h>'] = '<C-\\><C-n><C-w>h',
        ['<C-j>'] = '<C-\\><C-n><C-w>j',
        ['<C-k>'] = '<C-\\><C-n><C-w>k',
        ['<C-l>'] = '<C-\\><C-n><C-w>l',
        ['jk'] = '<C-\\><C-n>'
    },
    command_mode = {
        ["<C-j>"] = {
            'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
            {expr = true, noremap = true}
        },
        ["<C-k>"] = {
            'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
            {expr = true, noremap = true}
        },
        ["w!!"] = "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"
    }
}

function M.set_keymaps(mode, key, val)
    local opt = generic_opts[mode] and generic_opts[mode] or generic_opts_any
    if type(val) == "table" then
        opt = val[2]
        val = val[1]
    end
    vim.api.nvim_set_keymap(mode, key, val, opt)
end

function M.map(mode, keymaps)
    mode = mode_adapters[mode] and mode_adapters[mode] or mode
    for k, v in pairs(keymaps) do M.set_keymaps(mode, k, v) end
end

function M.setup()
    for mode, mapping in pairs(keymappings) do M.map(mode, mapping) end
end

return M
