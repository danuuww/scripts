repeat task.wait() until game:IsLoaded()
local placeId = game.PlaceId
local BluuHub = {
    [9788848685] = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/09534ae3e8db9d623bef720f8270c4f5.lua"))()
    end,

    [93978595733734] = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/76f99941bc74264ef2d48991b5783f95.lua"))()
    end,

    [86096929771195] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/danuuww/scripts/refs/heads/main/9128727.lua"))()
    end,
}
local handler = BluuHub[placeId]
if not handler then
    return
end
local ok, err = pcall(handler)
if not ok then
end
