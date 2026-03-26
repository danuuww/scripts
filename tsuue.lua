local BluuHub = {
    [9788848685] = {
        Name = "Indo Hangout",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/f465882f1c354ad44d67077d02fa58b4246fa62a667aeb32daf47ddcdb369d14/download"
    },
    [93978595733734] = {
        Name = "Violence District",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/54e5af0e98bee1d19f9097400643462f8545229d66d0812fa5bf175e7b892649/download"
    },
    [8356562067] = {
        Name = "Indo Voice",
        Url  = "https://api.jnkie.com/api/v1/luascripts/public/0784588f42c63319ca87492557153e884c055b593352525ba5d44a3edb0164f2/download"
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
