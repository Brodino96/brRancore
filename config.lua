Config = {}

Config.resourceName = "ox_inventory"

-- This adds the items inside the database, ox_inventory will insert all items from the database in "ox_inventory/data/items.lua"
-- if you don't want an item anymore you will have to manually remove it from the db and the lua file, to remove the functions just
-- remove the corresponding line from the config
Config.items = {
    { label = "Libro del Rancore", itemName = "libro_rancore", weight = 1000, sound = "Koyaanisqatsi", volume = 1.0 },
}