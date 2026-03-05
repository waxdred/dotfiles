return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
			highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
			show_stop_reason = true, -- show stop reason when stopped for exceptions
			commented = false, -- prefix virtual text with comment string
			only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
			all_references = false, -- show virtual text on all all references of the variable (not only definitions)
			clear_on_continue = false,
			virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

			-- experimental features:
			all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
			virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
			virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
		})

		require("dapui").setup()
		dap.adapters.delve = function(callback, config)
			if config.mode == "remote" and config.request == "attach" then
				callback({
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or "38697",
				})
			else
				callback({
					type = "server",
					port = "${port}",
					executable = {
						command = "dlv",
						args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
						detached = vim.fn.has("win32") == 0,
					},
				})
			end
		end

		-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
		dap.configurations.go = {
			{
				type = "delve",
				name = "go run .",
				request = "launch",
				program = "${workspaceFolder}/main.go",
			},
			{
				type = "delve",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			-- works with go.mod packages and sub packages
			{
				type = "delve",
				name = "Runner ECG-exporter",
				request = "launch",
				program = "${workspaceFolder}/cmd/main.go",
				args = { "-machine", "Dicom", "-f", "../../learning/dicom/testdata/1.dcm", "--display", "-d" },
			},
			-- exporter xml args:  go run cmd/main.go -machine MindrayFn3a04Ecg -f /Volumes/Signal/ECG/Mindray/MIN00001/PAT/2025092310360090/12lead_data_v1
			{
				type = "delve",
				name = "Runner ECG-exporter xml",
				request = "launch",
				program = "${workspaceFolder}/cmd/main.go",
				args = {
					"-machine",
					"MindrayFn3a04EcgFoo",
					"-f",
					"/Volumes/Signal/ECG/Mindray/MIN00002/PAT/12lead_data_v1",
				},
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, {})
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F1>", dap.continue, {})
		vim.keymap.set("n", "<F2>", dap.step_into, {})
		vim.keymap.set("n", "<F3>", dap.step_over, {})
		vim.keymap.set("n", "<F4>", dap.step_out, {})
		vim.keymap.set("n", "<F5>", dap.step_back, {})
		vim.keymap.set("n", "<F6>", dap.restart, {})
	end,
}
