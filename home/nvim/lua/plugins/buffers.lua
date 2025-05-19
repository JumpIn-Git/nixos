return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          buffers = {
            on_show = function()
              vim.cmd("stopinsert")
            end,
            win = {
              input = { keys = { ["d"] = "bufdelete" } },
              list = { keys = { ["d"] = "bufdelete" } },
            },
          },
        },
      },
    },
  },
}
