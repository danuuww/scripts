repeat task.wait() until game:IsLoaded()
local placeId = game.PlaceId
local BluuHub = {}
function BluuHub:GetConfig()
    local id = placeId
    if id == 9788848685 then
        return {
            name = "Indo Hangout",
            r    = "l",
            k    = "09534ae3e8db9d623bef720f8270c4f5"
        }
    elseif id == 93978595733734 then
        return {
            name = "Violence District",
            r    = "l",
            k    = "76f99941bc74264ef2d48991b5783f95"
        }
    elseif id == 86096929771195 then
        return {
            name = "Indo Beach",
            r    = "g",
            k    = "danuuww/scripts/refs/heads/main/9128727.lua"
        }
    end
end
local cfg = BluuHub:GetConfig()
if not cfg then
    return
end
local url
if cfg.r == "l" then
    url = "https://api.luarmor.net/files/v3/loaders/" .. cfg.k .. ".lua"
elseif cfg.r == "g" then
    url = "https://raw.githubusercontent.com/" .. cfg.k
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
task.spawn(function()
    Notify("BluuHub", (cfg.name or "Game") .. " script loaded!", 8)
    task.wait(5)
    Notify("BluuHub", "Join our Discord for updates!", 6)
end)
