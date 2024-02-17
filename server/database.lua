RegisterNetEvent("onResourceStart")
AddEventHandler("onResourceStart", function (name)
    if name == GetCurrentResourceName() then
        CreateThread(function ()
            local firsResponse = MySQL.transaction.await({[[
                CREATE TABLE IF NOT EXISTS `items` (
                    `name` varchar(50) NOT NULL,
                    `label` varchar(50) NOT NULL,
                    `weight` int(11) NOT NULL DEFAULT 1,
                    `rare` tinyint(4) NOT NULL DEFAULT 0,
                    `can_remove` tinyint(4) NOT NULL DEFAULT 1
                )
            ]]})
            if not firsResponse then
                print("^1Lo script non è riuscito ad interfacciarsi correttamente con il database^0")
            else

                for _, i in ipairs(Config.items) do
                    local doesItemExist = MySQL.rawExecute.await(
                        "SELECT 'name' FROM `items` WHERE `label` = ?", {i.label}
                    )

                    if json.encode(doesItemExist) == "[]" then
                        local itemCreated = MySQL.insert.await(
                            "INSERT INTO `items` (name, label, weight) VALUES (?, ?, ?)", { i.itemName, i.label, i.weight }
                        )

                        if itemCreated then
                            print("^2Succesfully created item "..i.label.."^0")
                        end
                    end
                end
            end
        end)
    end
end)