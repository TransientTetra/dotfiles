return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    defaults = {
      file_ignore_patterns = { ".git/" },
    },
  },
}
