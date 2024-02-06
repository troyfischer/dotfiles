local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    dependencies = {
      -- project management
      {
        "ahmedkhalf/project.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
          require("project_nvim").setup(opts)
          require("telescope").load_extension("projects")
        end,
        keys = {
          { "<leader>pp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
          { "<leader>pf", Util.telescope("files"), desc = "Find Files (root dir)" },
          { "<leader>p.", Util.telescope("files"), desc = "Find Files (root dir)" },
        },
      },
    },
  },
}
