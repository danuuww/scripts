if not game:IsLoaded() then
    game.Loaded:Wait()
end
local maps = {
    [9788848685] = {
        name = "Indo Hangout",
        src  = "https://api.jnkie.com/api/v1/luascripts/public/785e36b33106815df64d8e9208ff6de539b4757334acba4b2841a865152be866/download",
    },
    [93978595733734] = {
        name = "Violence District",
        src  = "https://api.jnkie.com/api/v1/luascripts/public/a36e9f225d56989d1a9e9d10e6b710c0a54ceffabf059c023de22bc7d162e224/download",
    },
    [8356562067] = {
        name = "Indo Voice",
        src  = "https://api.jnkie.com/api/v1/luascripts/public/fee4a5bfe9b22ec9c414634fa0f252295c4be21112c72b21580cbf2e1fb800fe/download",
    },
    [83369512629707] = {
        name = "Sawah Indo",
        src  = "https://api.jnkie.com/api/v1/luascripts/public/3f119fab2afde545efe7cd5f3224765bd03f454f9d0d801bb9fd9327417fb703/download",
    },
    [130342654546662] = {
        name = "Sambung Kata",
        src  = "https://api.jnkie.com/api/v1/luascripts/public/fea3eeccd1fab9b7e49b1ad06605484816db5867bf8d38c0877b4d3cd9f7a23e/download",
    },
    [120189115846709] = {
        name = "TTK",
        src  = "https://api.jnkie.com/api/v1/luascripts/public/7705c7b3eb250c61dd00392fd74ff5fa70b6bfb47064dd2063d404fb89dd81f8/download",
    },
}
local modules = {
    {
        name = "Piano",
        src  = "https://api.jnkie.com/api/v1/luascripts/public/dd652c29ef363a54f55ed5399cef7a80e5069b005b2c30239a72a09fba673c2c/download",
        skip = {
            [9788848685]      = true, -- HG
            [93978595733734]  = true, -- VD
            [8356562067]      = true, -- IDV
            [83369512629707]  = true, -- Sawah Indo
            [130342654546662] = true, -- Sambung Kata
            [120189115846709] = true, -- TTK
        },
    },
}
local place = game.PlaceId
local function boot(name, src)
    local ok, body = pcall(game.HttpGet, game, src)
    if not ok then
        return warn("[BluuHub] " .. name .. " fetch failed: " .. tostring(body))
    end
    local chunk, err = loadstring(body)
    if not chunk then
        return warn("[BluuHub] " .. name .. " compile error: " .. tostring(err))
    end
    task.spawn(function()
        --task.wait(3)
        local okRun, runErr = pcall(chunk)
        if not okRun then
            warn("[BluuHub] " .. name .. " runtime error: " .. tostring(runErr))
        end
    end)
end
task.wait(3.5)
local current = maps[place]
if current then
    boot(current.name, current.src)
end
for _, mod in ipairs(modules) do
    if not mod.skip[place] then
        --task.wait(1)
        boot(mod.name, mod.src)
    end
end
