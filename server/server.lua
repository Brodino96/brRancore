ESX = exports["es_extended"]:getSharedObject()

for _, i in ipairs(Config.items) do
    ESX.RegisterUsableItem(i.itemName, function ()
        print("Ho usato l'item "..i.label)
    end)
end

------------------------------------------------------------------------------------------------------------