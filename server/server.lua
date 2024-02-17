ESX = exports["es_extended"]:getSharedObject()

for _, i in ipairs(Config.items) do
    ESX.RegisterUsableItem(i.itemName, function (source)
        TriggerClientEvent("dpemote:playemote", source, "book")
    end)
end

------------------------------------------------------------------------------------------------------------