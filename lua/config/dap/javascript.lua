local dap = require("dap")

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",

    executable = {
        command = "node",
        args = {
            vim.fn.stdpath("data")
                .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
        },
    },
}

local js_based_languages = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
}

for _, language in ipairs(js_based_languages) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Vitest file",

            cwd = "${workspaceFolder}",

            runtimeExecutable = "pnpm",

            runtimeArgs = {
                "test",
                "--",
                "${file}",
                "--no-file-parallelism",
            },

            console = "integratedTerminal",

            sourceMaps = true,

            skipFiles = {
                "<node_internals>/**",
                "node_modules/**",
            },
        },
    }
end
