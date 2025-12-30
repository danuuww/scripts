local BluuHub = {
    [9788848685] = {
        Name = "Indo Hangout",
        Url  = "loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/09534ae3e8db9d623bef720f8270c4f5.lua"))()"
    },
    [93978595733734] = {
        Name = "Violence District",
        Url  = "loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/76f99941bc74264ef2d48991b5783f95.lua"))()"
    },
    [86096929771195] = {
        Name = "Indo Beach",
        Url  = "loadstring(game:HttpGet("https://raw.githubusercontent.com/danuuww/scripts/refs/heads/main/9128727.lua"))()"
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
    return
end
local fn, err = loadstring(res)
if not fn then
    return
end
fn()
