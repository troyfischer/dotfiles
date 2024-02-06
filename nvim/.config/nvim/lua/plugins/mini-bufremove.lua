return {
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bk", function() require("mini.bufremove").delete(0, false) end, desc = "Kill Buffer" },
      { "<leader>bK", function() require("mini.bufremove").delete(0, true) end, desc = "Kill Buffer (Force)" },
    },
  }
}
