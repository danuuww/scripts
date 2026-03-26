local BluuHub = {
    [9788848685] = {
        Name = "Indo Hangout",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/be431fd37bdf8102faafbf86acb436f1221bae68855a0b5e854486bbdee17f3e/download"
    },
    [93978595733734] = {
        Name = "Violence District",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/54e5af0e98bee1d19f9097400643462f8545229d66d0812fa5bf175e7b892649/download"
    },
    [86096929771195] = {
        Name = "Indo Beach",
        Url  = "https://raw.githubusercontent.com/danuuww/scripts/refs/heads/main/9128727.lua"
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

local okRun, runErr = pcall(fn)
if not okRun then
    warn("[BluuHub] script runtime error:", runErr)
end
