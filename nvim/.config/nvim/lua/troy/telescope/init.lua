SHOULD_RELOAD_TELESCOPE = true

local reloader = function()
    if SHOULD_RELOAD_TELESCOPE then
        RELOAD "telescope"
        RELOAD "troy.telescope.setup"
        RELOAD "troy.telescope.custom"
    end
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"

local set_prompt_to_entry_value = function(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    if not entry or not type(entry) == "table" then
        return
    end

    action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local _ = pcall(require, "nvim-nonicons")

local M = {}

function M.edit_neovim()
    local opts_with_preview, opts_without_preview

    opts_with_preview = {
        prompt_title = "~ dotfiles ~",
        shorten_path = false,
        cwd = "~/.config/nvim",
    }

    layout_strategy = "flex",
    layout_config = {
        width = 0.9,
        height
    }

