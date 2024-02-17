fx_version "cerulean"
game "gta5"

author "Brodino"

shared_scripts {
    "config.lua",
}

client_scripts {
    "client/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/*",
}

ui_page("html/index.html")

files {
    "html/index.html",
    "html/sounds/*",
}