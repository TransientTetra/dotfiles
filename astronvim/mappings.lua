-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>]"] = { "<cmd>bnext<cr>", desc = "Next tab" },
    ["<leader>["] = { "<cmd>bprev<cr>", desc = "Previous tab" },
    ["<C-/>"] = { "gcc", desc = "Toggle line comment", remap = true },

    ["<leader>B"] = { name = "󱌣 Build" },
    ["<C-b>"] = { "<cmd>CMakeBuild all<cr>", desc = "Build all" },
    ["<leader>Bb"] = { "<cmd>CMakeBuild all<cr>", desc = "Build all" },
    ["<leader>BB"] = { "<cmd>CMakeBuild<cr>", desc = "Build selected target" },
    ["<leader>Bc"] = { "<cmd>CMakeGenerate<cr>", desc = "CMake configure" },
    ["<leader>Bt"] = { "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select build target" },
    ["<leader>BT"] = { "<cmd>CMakeSelectBuildType<cr>", desc = "Select build type" },
    ["<leader>BC"] = { "<cmd>CMakeClean<cr>", desc = "Clean" },
    ["<leader>Br"] = { "<cmd>CMakeRun<cr>", desc = "Run" },
    ["<leader>Bd"] = { "<cmd>CMakeDebug<cr>", desc = "Debug" },
    ["<leader>BS"] = { "<cmd>CMakeStop<cr>", desc = "Stop" },
    ["<leader>S"] = false,
    ["<leader>Sl"] = false,
    ["<leader>Ss"] = false,
    ["<leader>Sd"] = false,
    ["<leader>Sf"] = false,
    ["<leader>S."] = false,
    ["<leader>s"] = { name = "󱂬 Session" },
    ["<leader>sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" },
    ["<leader>ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" },
    ["<leader>sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" },
    ["<leader>sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" },
    ["<leader>sb"] = { "<cmd>SessionManager! load_session<cr>", desc = "Browse sessions" },
    ["<leader>s."] = { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<C-/>"] = { "gc", desc = "Toggle line comment", remap = true },
  },
  i = {
    ["<C-h>"] = { "<left>", desc = "Move cursor left" },
    ["<C-j>"] = { "<down>", desc = "Move cursor down" },
    ["<C-k>"] = { "<up>", desc = "Move cursor up" },
    ["<C-l>"] = { "<right>", desc = "Move cursor right" },
  },
}
