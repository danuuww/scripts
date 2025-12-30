repeat task.wait() until game:IsLoaded()
local placeId = game.PlaceId
local BluuHub = {}
function BluuHub:GetConfig()
    local id = placeId
    if id == 9788848685 then
        return {
            name = "Indo Hangout",
            kind = "l",
            key  = "09534ae3e8db9d623bef720f8270c4f5"
        }
    elseif id == 93978595733734 then
        return {
            name = "Violence District",
            kind = "l",
            key  = "76f99941bc74264ef2d48991b5783f95"
        }
    elseif id == 86096929771195 then
        return {
            name = "Indo Beach",
            kind = "g",
            key  = "danuuww/scripts/refs/heads/main/9128727.lua"
        }
    end
end
local cfg = BluuHub:GetConfig()
if not cfg then
    return
end
local url
if cfg.kind == "l" then
    url = "https://api.luarmor.net/files/v3/loaders/" .. cfg.key .. ".lua"
elseif cfg.kind == "g" then
    url = "https://raw.githubusercontent.com/" .. cfg.key
else
    return
end
local ok, src = pcall(function()
    return game:HttpGet(url)
end)
if not ok then
    return
end
local fn, err = loadstring(src)
if not fn then
    return
end
local success, runtimeErr = pcall(fn)
if not success then
end
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "BluuHub",
        Text  = (cfg.name or "Game") .. " script loaded!",
        Duration = 5
    })
end)
