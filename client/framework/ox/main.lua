if not Framework.Ox() then return end

local Ox = require '@ox_core.lib.init'
local player = Ox.GetPlayer()
Framework.PlayerData = nil

-- Functions

RegisterNetEvent("ox:setActiveCharacter", function(character)
    if character.isNew then
        return InitializeCharacter(Framework.GetGender(true))
    end

    InitAppearance()
end)

RegisterNetEvent("ox:playerLoaded", function()
    print("illenium: ox:playerLoaded function")
    Framework.PlayerData = player
    --@todos
end)

RegisterNetEvent("ox:setGroup", function(group, grade)
    print("illenium: ox:setGroup function")
    Framework.PlayerData.job = group
    client.job = group
    client.gang = group
end)

function Framework.GetPlayerGender()
    print("illenium: GetPlayerGender function", player.get('gender') == 'female' and 'Female' or 'Male')
    return player.get('gender') == 'female' and 'Female' or 'Male'
end

function Framework.UpdatePlayerData()
    print("Illenium: update player data")
    local data = player.getGroups()
    Framework.PlayerData = player
    client.job = data
    client.gang = data
    client.citizenid = Framework.PlayerData.charId
    for index, value in pairs(client.job) do
        client.job.name = index
        client.job.grade = value
    end
end

function Framework.HasTracker() return false end

function Framework.CheckPlayerMeta()
    print("Illenium: check player meta")
    return LocalPlayer.state.isDead or IsPedCuffed(cache.ped)
end

function Framework.IsPlayerAllowed(charId)
    print("illenium: is player allowed")
    return charId == player.charId
end

function Framework.GetRankInputValues()
    print("Get rank input values")
end

function Framework.GetJobGrade()
    print("get job grade")
    return 4
end

function Framework.GetGangGrade()
    print("get gang grade")
    return 4
end

function Framework.CachePed()
    print("cache ped")
end

function Framework.RestorePlayerArmour()
    return nil
end
