local ok, dap = pcall(require, 'dap')
if not ok then
    return
end

local dap_py
ok, dap_py = pcall(require, 'dap-python')
if not ok then
    return
end

local python_prefix = '/usr'
local python_bin = '/bin/python3'

if vim.fn.executable('pyenv') == 1 then
    local out = vim.fn.systemlist({ 'pyenv', 'prefix' })

    if vim.v.shell_error == 0 and type(out[1]) == 'string' then
        -- nvim-dap-python uses `os.getenv("VIRTUAL_ENV")`
        python_prefix = out[1]
        vim.env.VIRTUAL_ENV = out[1]
    end
end

dap_py.setup(python_prefix .. python_bin)
dap_py.test_runner = python_prefix .. '/bin/pytest'

local function getpid()
    local pid = require('dap.utils').pick_process({ filter = 'python' })
    if type(pid) == 'thread' then
        -- returns a coroutine.create due to it being run from fzf-lua ui.select
        -- start the coroutine and wait for `coroutine.resume` (user selection)
        coroutine.resume(pid)
        pid = coroutine.yield(pid)
    end

    return pid
end

table.insert(dap.configurations.python, 4, {
    type = 'python',
    request = 'attach',
    name = 'Attach to process',
    connect = function()
        -- https://github.com/microsoft/debugpy/#attaching-to-a-running-process-by-id
        local port = 5678
        local pid = getpid()
        local out = vim.fn.systemlist({
            python_prefix .. python_bin,
            '-m',
            'debugpy',
            '--listen',
            'localhost:' .. tostring(port),
            '--pid',
            tostring(pid),
        })
        assert(vim.v.shell_error == 0, table.concat(out, '\n'))
        return { port = port }
    end,
})
