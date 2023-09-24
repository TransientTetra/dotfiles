return {
  "Civitasv/cmake-tools.nvim",
  config = function(_, _)
    require("cmake-tools").setup {
      cmake_build_directory = "cmake_build_${variant:buildType}",
    }
  end,
}
