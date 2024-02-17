AddEventHandler("onResourceStart", function (resourceName)
    print(resourceName)
    if Config.resourceName == resourceName or resourceName == GetCurrentResourceName() then
        for _, i in ipairs(Config.items) do
            CreateThread(function ()
                while true do
                    Wait(100)
                    if exports.ox_inventory:GetItemCount(i.itemName, nil, nil) > 0 then
                        
                        SendNUIMessage({
                            transactionType     = "startMusic",
                            transactionFile     = i.sound,
                            transactionVolume   = i.volume
                        })
                        --print("You have the item "..i.label)
                    else
                        SendNUIMessage({
                            transactionType     = "stopMusic",
                            transactionFile     = i.sound
                        })
                        --print("dropped")
                    end
                end
            end)
        end
    end
end)