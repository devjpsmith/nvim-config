local mason_servers = require('lsp.mason_servers')
local servers = {}
for i = 1, #mason_servers do
    servers[i] = mason_servers[i]
end

-- installing separatly to handle older Ruby
table.insert(servers, 'solargraph')
return servers
