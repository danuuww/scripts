local BluuHub = {
    [9788848685] = {
        Name = "Indo Hangout",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/785e36b33106815df64d8e9208ff6de539b4757334acba4b2841a865152be866/download"
    },
    [93978595733734] = {
        Name = "Violence District",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/a36e9f225d56989d1a9e9d10e6b710c0a54ceffabf059c023de22bc7d162e224/download"
    },
    [8356562067] = {
        Name = "Indo Voice",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/fee4a5bfe9b22ec9c414634fa0f252295c4be21112c72b21580cbf2e1fb800fe/download"
    },
    [83369512629707] = {
        Name = "Sawah Indo",
        Url = "https://api.jnkie.com/api/v1/luascripts/public/3f119fab2afde545efe7cd5f3224765bd03f454f9d0d801bb9fd9327417fb703/download"
    },
    [130342654546662] = {
        Name = "Sambung Kata",
        Url = "https://api.jnkie.com/api/v1/luascripts/public/fea3eeccd1fab9b7e49b1ad06605484816db5867bf8d38c0877b4d3cd9f7a23e/download"
    },
}
local placeId = game.PlaceId
local cfg = BluuHub[placeId]
if not cfg then
    return
end
local ok, res = pcall(function()
    return game:HttpGet(cfg.Url)
end)
if not ok then
    warn("[BluuHub] HttpGet failed:", res)
    return
end
local fn, err = loadstring(res)
if not fn then
    warn("[BluuHub] loadstring error:", err)
    return
end
task.wait(3)
local okRun, runErr = pcall(fn)
if not okRun then
    warn("[BluuHub] script runtime error:", runErr)
end
