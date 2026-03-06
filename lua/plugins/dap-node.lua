return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
  },

  -- DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Mason DAP manager
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "js-debug-adapter" }, -- key point
        automatic_installation = true,
      })
    end,
  },

  -- vscode-js debug bridge
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap", "mason-org/mason.nvim" },
    config = function()
      require("dap-vscode-js").setup({
        debugger_cmd = { "js-debug-adapter" },
        adapters = {
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "node-terminal",
          "pwa-extensionHost",
        },
      })

      local dap = require("dap")

      -- Explicit pwa-node adapter with port
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "js-debug-adapter",
          args = { "${port}" },
        },
      }

      dap.adapters["pwa-chrome"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "js-debug-adapter",
          args = { "${port}" },
        },
      }

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file",
            program = "${file}",
            ---@diagnostic disable-next-line: undefined-global
            cwd = vim.fn.getcwd(),
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            ---@diagnostic disable-next-line: undefined-global
            cwd = vim.fn.getcwd(),
          },
          {
            type = "pwa-chrome",
            request = "attach",
            name = "Attach React (Chrome, select port)",
            program = "${file}",
            ---@diagnostic disable-next-line: undefined-global
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            port = function()
              return tonumber(vim.fn.input("Select Chrome debug port: ", "9222"))
            end,
            webRoot = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
