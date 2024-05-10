lua <<EOF

local wk = require("which-key")

wk.register({ 
    ["<leader>d"] = {
        name = "+debug dap",
        d = {"<cmd>lua require('dap').continue()<CR>", "Start/Continue Debug"},
        l = {"<cmd>lua require('dap').run_last()<CR>", "Run last"},
        b = {
            name = "+breakpoint",
            b = {"<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint"},
            c = {"<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear all Breakpoints"},
            s = {"<cmd>lua require('dap').set_breakpoint()<CR>", "Set Breakpoint"},
            l = {"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Log point message"},
        },
        i = {
            name = "+info",
            h = {"<cmd>lua require('dap.ui.widgets').hover()<CR>", "Info hover"},
            p = {"<cmd>lua require('dap.ui.widgets').preview()<CR>", "Info preview"},
        },
        s = {
            name = "+step",
            s = {"<cmd>lua require('dap').step_over()<CR>", "step over"},
            i = {"<cmd>lua require('dap').step_into()<CR>", "step into"},
            o = {"<cmd>lua require('dap').step_out()<CR>", "step out"},
            b = {"<cmd>lua require('dap').step_back()<CR>", "step back"},
        },
        f = {
            name = "+frames (layout)",
            f = {"<cmd>lua local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.frames)<CR>", "frames"},
            s = {"<cmd>lua local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<CR>", "scopes"},
        },
        u = {"<cmd>lua require('dapui').toggle()<CR>", "toggle UI"},
        x = {"<cmd>lua require('dap').terminate()<CR>", "Exit"},
        v = {"<cmd>lua require('dap.ext.vscode').load_launchjs()<CR>", "Load launch.json from .vscode folder"},
    }
})


local dap = require("dap")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local languages = {
    elixir = {
        adapters = {
            mix_task = {
                type = 'executable',
                command = '/usr/lib/elixir-ls/debugger.sh',
                args = {}
            }
        },
        configs = {
            {
                type = "mix_task",
                name = "mix_test",
                task = 'test',
                taskArgs = {"--trace"},
                request = "launch",
                startApps = true,
                projectDir = "${workspaceFolder}",
                requireFiles = {
                    "test/**/test_helper.exs",
                    "test/**/*_test.exs"
                }
            },
            {
                type = "mix_task",
                name = "phx.server",
                request = "launch",
                task = "phx.server",
                projectDir = "${workspaceFolder}"
            }
        }
    },
}

for name, config  in pairs(languages) do
    if config.adapters then
        for a_name, a_config in pairs(config.adapters) do
            dap.adapters[a_name] = a_config
        end
    end

    if config.configs then
        dap.configurations[name] = config.configs
        langs = config.additional_langs or {}
        for _, l in ipairs(langs) do
            dap.configurations[l] = config.configs
        end
    end
end


EOF

