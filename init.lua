-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.relativenumber = true

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-vitest")({}),
  },
})

local dap = require("dap")
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = 8123,
  executable = {
    command = "node",
    args = { "/path/to/vscode-js-debug/out/src/vsDebugServer.js", "8123" },
  },
}
require("CopilotChat").setup({
  model = "grok-code-fast-1",
})

require("CopilotChat").setup({
  prompts = {
    Test = {
      prompt = "Write a comprehensive test suite for the following code, including edge cases and mocking. use pytest with mocker for mocking.",
      system_prompt = "You are a senior software engineer specializing in testing, specialized in python, javascript and React. With a focus on RAPID implementations",
      model = "grok-code-fast-1",
      -- Add other options like model, temperature, etc., if needed
    },
  },
})
