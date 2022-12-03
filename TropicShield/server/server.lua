local acloaded = true
local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

RegisterCommand("loadplayers", function(source, args, rawCommand)
    local xPlayers = ESX.GetExtendedPlayers()
    if source > 0 then
        if IsPlayerAceAllowed(source, 'TropicShield.loadplayers') then 
            for _, xPlayer in pairs(xPlayers) do
                xPlayer.triggerEvent("TropicShield:loadPlayers")
            end
        end
    else
        for _, xPlayer in pairs(xPlayers) do
            xPlayer.triggerEvent("TropicShield:loadPlayers")
        end
    end
end)

SetConvarServerInfo("TropicShield", "TropicShield Serverprotecion | by TropicLife Roleplay")

AddEventHandler('onResourceStart', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    local d = LoadResourceFile(GetCurrentResourceName(), "config/clientconfig.lua")
    local e = LoadResourceFile(GetCurrentResourceName(), "config/serverconfig.lua")
    local f = LoadResourceFile(GetCurrentResourceName(), "config/webhooks.lua")
    if acloaded == true then
        if not d or d == "" then
            print("^4[TropicShield | System]:^1 Server Configs fehlen!!^7")
            StopResource(GetCurrentResourceName())
            return false
        else
            print[[^4
  _______              _       _____ _     _      _     _ 
 |__   __|            (_)     / ____| |   (_)    | |   | |
    | |_ __ ___  _ __  _  ___| (___ | |__  _  ___| | __| |
    | | '__/ _ \| '_ \| |/ __|\___ \| '_ \| |/ _ \ |/ _` |
    | | | | (_) | |_) | | (__ ____) | | | | |  __/ | (_| |
    |_|_|  \___/| .__/|_|\___|_____/|_| |_|_|\___|_|\__,_|
                | |                                       
                |_|                                       
                ]]
            print("[TropicShield | System] Loaded all Configs Sucessfully")
            print("[TropicShield | AD] Tropiclife Discord --> https://discord.gg/tropiclife^7")
            banlistregenerator()
        end
        acloaded = true
    end
end)

for k, v in pairs(TropicShield_SV.SecuredJobEvents) do
	RegisterServerEvent(v.eventName)
	AddEventHandler(v.eventName, function(playerID)
		local src = source
		local SRC = source
		local xPlayer = ESX.GetPlayerFromId(source)
		local job = xPlayer.job.name
		local whitelist = v.job
		if job ~= whitelist then
	        BanPlayer(source, "Job locked event execute detectet Event: " ..v.eventName.."")
            DropPlayer(source, ''..TropicShield_SV.Banmessage..'')
		end
	end)
end

RegisterNetEvent('senddc')
AddEventHandler('senddc', function(data)
    local ConnectWebhook = {
        {
            ["color"] = "16748836",
            ["title"] = "`TropicShield | Screenshot` \n\n<t:".. math.floor(tonumber(os.time())) ..":R>",

        }
    }
    PerformHttpRequest(TropicShield_SV.ScreenshotWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "TropicShield", embeds = ConnectWebhook}), {["Content-Type"] = "application/json"})
end)

------------------------------Connect/ Disconnect Logs----------------------------------------------

AddEventHandler('playerDropped', function(reason)
    local identifier = "Not Found"
    local license   = "Not Found"
    local liveid    = "Not Found"
    local xblid     = "Not Found"
    local discord   = "Not Found"
    local playerip = "Not Found"
      local serverName = GetConvar("sv_hostname")
      local hostname = GetConvar("sv_projectName")
    local target    = id
    local duree     = 0
    local permanent = 0
    local name = GetPlayerName(source)
    
    if true then
          local sourceplayername = source
            for k,v in ipairs(GetPlayerIdentifiers(source))do
              if string.sub(v, 1, string.len("steam:")) == "steam:" then
                identifier = v
              elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
              elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
              elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xblid  = v
              elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
              elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                playerip = v
              end
            end
    
      local disconnectlog = {
            {
                ["color"] = "16748836",
                ["title"] = "**Disconnect Logs**",
                ["description"] = "Player: **"..name.."  ** \n\nLicense: **"..license.."** \n\nDiscord: **"..discord.."** \n\nLive: **"..liveid.."** \n\nXBL: **"..xblid.."**\n\nIP: **"..playerip.."**\n\n Identifier: **"..identifier.."** \n\nReason: ```"..reason.."```",
                ["thumbnail"] = {
                    url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png"
                },
                ["footer"] = {
                    ["text"] = "TropicShield | "..os.date("%x %X %p"),
                },
            }
        }
    
    PerformHttpRequest(TropicShield.ConnectWebhook, function(err, text, headers) end, 'POST', json.encode({username = "TropicShield", embeds = disconnectlog}), { ['Content-Type'] = 'application/json' }) end
end, false)
    
    
    AddEventHandler('playerConnecting', function()
    local identifier = "Not Found"
    local license   = "Not Found"
    local liveid    = "Not Found"
      local serverName = GetConvar("sv_hostname")
      local hostname = GetConvar("sv_projectName")
    local xblid     = "Not Found"
    local discord   = "Not Found"
    local playerip = "Not Found"
    local reason    = "Not Found"
    local name = GetPlayerName(source)
    
    if true then
          local sourceplayername = source
            for k,v in ipairs(GetPlayerIdentifiers(source))do
              if string.sub(v, 1, string.len("steam:")) == "steam:" then
                identifier = v
              elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
              elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
              elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xblid  = v
              elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
              elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                playerip = v
                            end
                          end
    
      
          
              local logt = {
          {
              ["color"] = "1769216",
              ["title"] = "**Connect Logs**",
              ["description"] = "Player: **"..name.."** \n\nLicense: **"..license.."** \n\nDiscord: **"..discord.."** \n\nLive: **"..liveid.."** \n\nXBL: **"..xblid.."**\n\nIP: **||"..playerip.."||**\n\nIdentifier: **"..identifier.."**\n\n **",
              ["thumbnail"] = {
                  url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png"
                  },
                  ["footer"] = {
                  ["text"] = "TropicShield | "..os.date("%x %X %p"),
                  },
          }
      }
    
      local logt1 = {
          {
              ["color"] = "1769216",
              ["title"] = "**Connect Logs [Global]**",
              ["description"] = "Server Hostname:** " .. serverName .. "\n\n**Server Project Name:** " .. hostname .. "\n\nPlayer: **"..name.."** \n\nLicense: **"..license.."** \n\nDiscord: **"..discord.."** \n\nLive: **"..liveid.."** \n\nXBL: **"..xblid.."**\n\nIP: **||"..playerip.."||**\n\nIdentifier: **"..identifier.."**",
              ["thumbnail"] = {
                  url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png"
                  },
                  ["footer"] = {
                  ["text"] = "TropicShield | "..os.date("%x %X %p"),
                  },
          }
      }
    
    
      PerformHttpRequest(TropicShield.ConnectWebhook, function(err, text, headers) end, 'POST', json.encode({username = "TropicShield", embeds = logt}), { ['Content-Type'] = 'application/json' }) end
end, false)

-- Start/Stop Event
AddEventHandler("onResourceStart", function()
    if cool then return end
    cool = true
    local startEmbed = {
        {
            ["color"] = "2123412",
            ["title"] = "TropicShield",
            ["description"] = "TropicShield has been started successfully\n\n Version: ",
            ["thumbnail"] = {
            url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png"
            },
            ["footer"] = {
            ["text"] = "TropicShield | "..os.date("%x %X %p"),
            },
        }
    }
  
    PerformHttpRequest(TropicShield.MainWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "TropicShield", embeds = startEmbed}), {["Content-Type"] = "application/json"})
    Wait(20000)
    cool = false
end)

---------------------------
-- START OF MULTICOMMAND --
---------------------------

RegisterCommand("ts", function(source, args, rawCommand)
    local arg = args[1]
    if source ~= 0 then
        print(source, "Hat versucht einen AC Command zu benutzen")
    else
        if not arg then 
            print("^4[TropicShield]^7 ^3benutze ts help, um mehr zu erfahren^7")
        end
        if arg == "help" then
            print("^4[TropicShield]^7 ^3Commands: TropicShield reload, TropicShield anticipher, TropicShield unban^7")
        elseif arg == "reload" then 
            GetBans()
            print("^4[TropicShield]^7 ^3Banlist wurde reloaded^7")
        elseif arg == "anticipher" then 
            anticipher(0)
        elseif arg == "banlistreg" then
            print("^4[TropicShield]^7 > ^3Checking Banlist...^7")
            banlistregenerator()
        elseif arg == "unban" then
            if args[2] then
                UnbanPlayer(args[2])
            else
                print("^4[TropicShield]:^1 Falsche BanID^7")
            end
        else
            print("^4[TropicShield]:^1 Unbekannter Command^7")
        end
    end
end, true)


-----------------------------------
-- EXTRA FUNCTIONS FOR INSTALLER --
-----------------------------------

local charset = {}    
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

function string.random(length)
  math.randomseed(os.time())
  if length >  0 then
    return string.random(length - 1) .. charset[math.random(1, #charset)]
  else
    return ""
  end
end

-- Installer
function installer(source)
    count = 0
    skip = 0
    count = 0
    count = math.random(9,20)
    myfile = string.random(count)
    if source == 0 then
        local randomtextfile = myfile .. "clienteye.lua"
        _antiinjection = LoadResourceFile(GetCurrentResourceName(), "eye.TropicShield")
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            _resourcemanifest = LoadResourceFile(_resname, "__resource.lua")
            _resourcemanifest2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if _resname == GetCurrentResourceName() or string.find(_resname, 'lightning_') then
                skip = skip + 1
            else
                if _resourcemanifest then
                    Wait(100)
                    if string.find(_resourcemanifest, 'clienteye') then
                        print("^5[TropicShield]^7 ^2Skipped >> ".._resname.."^7")
                    else
                        _toadd = _resourcemanifest .. "\n\nclient_script '" .. randomtextfile .. "'"
                        SaveResourceFile(_resname, randomtextfile, _antiinjection, -1)
                        SaveResourceFile(_resname, "__resource.lua", _toadd, -1)
                        print("^5[TropicShield]^7 ^2Installed >> ".._resname.."^7")
                        count = count + 1
                    end
                elseif _resourcemanifest2 then
                    Wait(100)
                    if string.find(_resourcemanifest2, 'clienteye') then
                        print("^5[TropicShield]^7 ^2Skipped >> ".._resname.."^7")
                    else
                        _toadd = _resourcemanifest2 .. "\n\nclient_script '" .. randomtextfile .. "'"
                        SaveResourceFile(_resname, randomtextfile, _antiinjection, -1)
                        SaveResourceFile(_resname, "fxmanifest.lua", _toadd, -1)
                        print("^5[TropicShield]^7 ^2Installed >> ".._resname.."^7")
                        count = count + 1
                    end
                else
                    skip = skip + 1
                end
            end
        end
        print("^5[TropicShield]^7 ^2Successfully installed ^5TropicShield^7 into " .. count .. " Resources.^7")
        print("^5[TropicShield]^7 To uninstall use: TropicShield uninstall " .. gsub:randomtextfile('.lua', ''))
    end
end

-- Uninstaller
function uninstaller(source, args)
    if source == 0 then
        count = 0
        skip = 0
        
        local filetodelete = args .. ".lua"
        randomtextfile = "\n\nclient_script '" .. filetodelete .. "'"
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            resourcefile = LoadResourceFile(_resname, "__resource.lua")
            resourcefile2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if resourcefile then
                if string.find(resourcefile, randomtextfile) then
                    _toadd = resourcefile:gsub(randomtextfile, '')
                    _toremove = GetResourcePath(_resname).."/"..filetodelete
                    SaveResourceFile(_resname, "__resource.lua", _toadd, -1)
                    Wait(100)
                    os.remove(_toremove)
                    print("^5[TropicShield]^7: ^1Removed >>  ".._resname.."^7")
                    count = count + 1
                else
                    skip = skip + 1
                end
            elseif resourcefile2 then
                if string.find(resourcefile2, randomtextfile) then
                    _toadd = resourcefile2:gsub(randomtextfile, '')
                    _toremove = GetResourcePath(_resname).."/"..filetodelete
                    SaveResourceFile(_resname, "fxmanifest.lua", _toadd, -1)
                    Wait(100)
                    os.remove(_toremove)
                    print("^5[TropicShield]^7: ^1Removed >>  ".._resname.."^7")
                    count = count + 1
                end
            else
                skip = skip + 1
            end
        end
        print("^5[TropicShield]^7: ^2We have uninstalled the main module from your resources.^7")
    end
end

-- UNINSTALL all
function uninstallerall(source, args)
    if source == 0 then
        count = 0
        skip = 0
        
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            resourcefile = LoadResourceFile(_resname, "__resource.lua")
            resourcefile2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if resourcefile then
                if resourcefile2 then
                    if string.find(resourcefile2, 'resource_manifest_version') then
                        _toremove = GetResourcePath(_resname).."/fxmanifest.lua"
                        Wait(100)
                        os.remove(_toremove)
                    elseif string.find(resourcefile, 'fx_version') then
                        _toremove = GetResourcePath(_resname).."/__resource.lua"
                        Wait(100)
                        os.remove(_toremove)
                    end
                end
            else
                skip = skip + 1
            end
        end
        print("^5[TropicShield]^7: ^2We have uninstalled the main module from your resources.^7")
    end
end

-- ANTI CIPHER
function anticipher()
    print("^4[TropicShield]^7 > ^2Anti Backdoor wurde gestartet^7")
    runcipher(0)
end

complicatedresourced = {}
skippedresources = {}
infectedresourced = {}
local res = GetCurrentResourceName()
    function runcipher(source)
        count = 0
        skip = 0
          if source == 0 then
              for resources = 0, GetNumResources() - 1 do
                  local _resname = GetResourceByFindIndex(resources)
                    if string.find(_resname, res) or string.find(_resname, "lightning") or string.find(_resname, "TropicShield") then
                        Wait(1000)
                        print("^4[TropicShield]^7 > ^2Scan finished^7")              
                        Wait(1500)
                        print("^4[TropicShield]^7 > ^2Keine Backdoor gefunden^7")
                        return
                      end
                  local num = GetNumResourceMetadata(_resname, 'server_script')
                  if num >  0 then
                      for i = 0, num-1 do
                          local file = GetResourceMetadata(_resname, 'server_script', i)
                          checkresource = LoadResourceFile(_resname, file)
                              if string.find(file, "*") then
                                      skip = skip + 1
                                      table.insert(complicatedresourced, {resource = _resname})
                                      scanfiles = scandir(GetResourcePath(string.gsub(_resname, '//', "/")))
                                      getfolders = getFolders(GetResourcePath(string.gsub(_resname, '//', "/")))
                                      resourcename = _resname
                                      for i,k in pairs(scanfiles) do
                                          if GetFileExtension(k) ~= nil then
                                              scaninfectedresourced = {}
                                              checkresource = readAll(GetResourcePath(resourcename) .. "/" .. k)
                                              if type(checkresource) ~= 'boolean' then
                                                  if checkresource ~= nil then
                                                      local name = "nicht gefunden"
                                                      local found = false
                                                      local stringfound = false
                                                      if string.find(checkresource, 'cipher-panel') then
                                                          stringfound = "cipher-panel"
                                                          name = "[CIPHER BACKDOOR]\nCheck 1"
                                                          found = true
                                                      elseif string.find(checkresource, 'Enchanced_Tabs') then
                                                          stringfound = "Enchanced_Tabs"
                                                          name = "[CIPHER BACKDOOR]\nCheck 2"
                                                          found = true
                                                      elseif string.find(checkresource, 'helperServer') then
                                                          stringfound = "helperServer"
                                                          name = "[CIPHER BACKDOOR]\nCheck 4"
                                                          found = true
                                                      elseif string.find(checkresource, 'ketamin.cc') then
                                                          stringfound = "ketamin.cc"
                                                          name = "[CIPHER BACKDOOR]\nCheck 6"
                                                          found = true
                                                      elseif string.find(checkresource, '\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65') then
                                                          stringfound = "\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65"
                                                          name = "[CIPHER BACKDOOR]\nCheck 7"
                                                          found = true
                                                      elseif string.find(checkresource, '\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63') then
                                                          stringfound = "\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63"
                                                          name = "[CIPHER BACKDOOR]\nCheck 7"
                                                          found = true
                                                      end
                                              
                                                      if found then
                                                          table.insert(infectedresourced, {resource = resourcename .. '/' .. k, name = name, stringfound = stringfound})
                                                      end
                                                  end
                                              end
                                          end
                                      end
      
                              else
                                  if checkresource ~= nil and resourcename ~= 'monitor' then
                                      count = count + 1
                                      local name = "nicht gefunden"
                                      local found = false
                                      local stringfound = false
                                      if type(checkresource) ~= 'boolean' then
                                              if string.find(checkresource, 'cipher-panel') then
                                                  stringfound = "cipher-panel"
                                                  name = "[CIPHER BACKDOOR]\nCheck 1"
                                                  found = true
                                              elseif string.find(checkresource, 'Enchanced_Tabs') then
                                                  stringfound = "Enchanced_Tabs"
                                                  name = "[CIPHER BACKDOOR]\nCheck 2"
                                                  found = true
                                              elseif string.find(checkresource, 'helperServer') then
                                                  stringfound = "helperServer"
                                                  name = "[CIPHER BACKDOOR]\nCheck 4"
                                                  found = true
                                              elseif string.find(checkresource, 'ketamin.cc') then
                                                  stringfound = "ketamin.cc"
                                                  name = "[CIPHER BACKDOOR]\nCheck 6"
                                                  found = true
                                              elseif string.find(checkresource, '\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65') then
                                                  stringfound = "\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65"
                                                  name = "[CIPHER BACKDOOR]\nCheck 7"
                                                  found = true
                                              elseif string.find(checkresource, '\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63') then
                                                  stringfound = "\x6b\x65\x74\x61\x6d\x69\x6e\x2e\x63\x63"
                                                  name = "[CIPHER BACKDOOR]\nCheck 7"
                                                  found = true
                                              end
                                              if found then
                                                  table.insert(infectedresourced, {resource = _resname .. '/' .. file, name = name, stringfound = stringfound})
                                              end
                                          end
                                  end
                          end
                      end
                  else
                      local file = GetResourceMetadata(_resname, 'server_script', 0)
                  end
              end

              Wait(1000)
              print("^4[TropicShield]^7 >  ^2Backdoor Scan fetig^7")
              Wait(1000)
              print("^4[TropicShield]^7 >  ^2No Backdoor found.^7")
      
      
              string2 = ""
              for i,k in pairs(infectedresourced) do
              string2 = string2 .. '\n+ ' .. k.resource .. " --> Search for: [" .. k.stringfound .. "]"
              end
      
              string3 = ""
              for i,k in pairs(skippedresources) do
                  string3 = string3 .. '\n+ ' .. k.resource
              end
          
      
              if string2 ~= "" then
                  print("^4[TropicShield]^7 >  ^1>>  REPORT <<^7")
                  print("^4[TropicShield]^7 !! ^1BACKDOOR WURDE GEFUNDEN - SERVER WIRD SICH IN 5 SEKUNDEN STOPPEN^7 !!")
                  print("^4[TropicShield]^7 !! ^1BITTE ERSETZT ALLE DIESE FILES MIT DEM ORIGINALEN ODER LÖSCHE SIE^7 !!")
                  print("^4[TropicShield]^7 >  ^1>>  " .. string2 .. "" .. string3 .. " <<^7")
                  print("^1", string2, "^7")
                  Wait(5000)
                  os.exit()
              end
        end
    end

-------------------------------
-- INSTALLER EXTRA FUNCTIONS --
-------------------------------

-- ScanDir
function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "'..directory..'" /b'):lines() do
        i = i + 1
        t[i] = filename
    end
    return t
end

-- getFolders
function getFolders(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('dir "'..directory..'" /b /ad')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

-- readAll
function readAll(file)
    local f = io.open(file, "rb")
    if f then
        local content = f:read("*a")
        f:close()
        return content
    else
        return false
    end
end

-- GetFileExtension
function GetFileExtension(url)
    return url:match("^.+(%..+)$")
end

function banlistregenerator()
    local o = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local p = json.decode(o)
    if not o or o == "" then
        SaveResourceFile(GetCurrentResourceName(), "banlist.json", "{}", -1)
        print("^4[TropicShield]^7 > ^1Banlist ist fehlerhaft^7")
        Wait(250)
        print("^4[TropicShield]^7 > ^3Generating new banlist.json^7")
        Wait(500)
        print("^4[TropicShield]^7 > ^2Generated banlist.json^7")
    elseif not p then
            SaveResourceFile(GetCurrentResourceName(), "banlist.json", "{}", -1)
            p = {}
            print("^4[TropicShield]^7 > ^1Banlist ist fehlerhaft^7")
            Wait(500)
            print("^4[TropicShield]^7 > ^3Generating new banlist.json^7")
            Wait(500)
            print("^4[TropicShield]^7 > ^2Generated banlist.json^7")
    else
        print("^4[TropicShield | Banlist] Banlist ist intakt^7")
    end
end

-- ANOTHER CHARSET
local Charset = {}
for i = 65, 90 do
    table.insert(Charset, string.char(i))
end

-- FUNCTION FOR CHARSET
for i = 97, 122 do
    table.insert(Charset, string.char(i))
end

-- RANDOM LETTER
RandomLetter = function(length)
    if length >  0 then
        return RandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    end
    return ""
end

-- TABCONTAINS
function tabcontains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

----------------------------
-- END OF EXTRA FUNCTIONS --
----------------------------

-------------------------
-- END OF MULTICOMMAND --
-------------------------

RegisterNetEvent("TropicShield:CheckJumping")
AddEventHandler("TropicShield:CheckJumping", function()
    if IsPlayerUsingSuperJump(source) and tonumber(source) then
        TriggerClientEvent("TropicShield:superJump", source)
    end
end)

-- TropicShield Ban
RegisterNetEvent('aramsamsam:ban')
AddEventHandler('aramsamsam:ban', function(id, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    if IsPlayerAceAllowed(source, 'TropicShield.Bypass') then return end

    local id = source;
    local ids = ExtractIdentifiers(id);
    local steam = ids.steam:gsub("steam:", "");
    local steamDec = tostring(tonumber(steam,16));
    steam = "https://steamcommunity.com/profiles/" .. steamDec;
    local gameLicense = ids.license;
    local discord = ids.discord;
    TriggerClientEvent("aramsamsam:screenshot", source)
    Wait(700)
    BanPlayer(id, reason)
    Wait(2000)
    DropPlayer(id, 'TropicShield - Du wurdest vom AC gebannt! Grund: ' .. reason)
end)

-- Ban Functions 
function ExtractIdentifiers(src)
  
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
  
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.sub(id, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(id, 9)
            identifiers.discord = "<@" .. discordid .. ">"
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        elseif string.find(id, "license2") then
            identifiers.hwid = id
        end
    end
  
    return identifiers
  end
  
  function BanPlayer(src, reason) 
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    local ids = ExtractIdentifiers(src);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    local playerhwid = ids.hwid
    local banData = {};
    banData['ID'] = "" .. getNewBanID() .. "";
    banData['ip'] = "NONE SUPPLIED";
    banData['reason'] = reason;
    banData['license'] = "NONE SUPPLIED";
    banData['steam'] = "NONE SUPPLIED";
    banData['xbl'] = "NONE SUPPLIED";
    banData['live'] = "NONE SUPPLIED";
    banData['discord'] = "NONE SUPPLIED";
    banData['hwid'] = GetPlayerToken(src);
    if ip ~= nil and ip ~= "nil" and ip ~= "" then 
        banData['ip'] = tostring(ip);
    end
    if playerLicense ~= nil and playerLicense ~= "nil" and playerLicense ~= "" then 
        banData['license'] = tostring(playerLicense);
    end
    if playerSteam ~= nil and playerSteam ~= "nil" and playerSteam ~= "" then 
        banData['steam'] = tostring(playerSteam);
    end
    if playerXbl ~= nil and playerXbl ~= "nil" and playerXbl ~= "" then 
        banData['xbl'] = tostring(playerXbl);
    end
    if playerLive ~= nil and playerLive ~= "nil" and playerLive ~= "" then 
        banData['live'] = tostring(playerXbl);
    end
    if playerDisc ~= nil and playerDisc ~= "nil" and playerDisc ~= "" then 
        banData['discord'] = tostring(playerDisc);
    end
    if playerhwid ~= nil and playerhwid ~= "nil" and playerhwid ~= "" then 
        banData['hwid'] = tostring(playerhwid);
    end
    
    local ids = ExtractIdentifiers(src);
    local playerIP = ids.ip or 'NaN'
    local playerSteam = ids.steam or 'NaN'
    local serverName = GetConvar("sv_hostname")
    local hostname = GetConvar("sv_projectName")
    local playerLicense = ids.license or 'NaN'
    local playerXbl = ids.xbl or 'NaN'
    local playerLive = ids.live or 'NaN'
    local playerDisc = ids.discord or 'NaN'
    local playerhwid = ids.hwid or 'NaN'
    local hwid = GetPlayerToken(src)
    local ban = isBanned(src);
    local source = source
    cfg[tostring(GetPlayerName(src))] = banData;
    SaveResourceFile(GetCurrentResourceName(), "banlist.json", json.encode(cfg, { indent = true }), -1)
    print("^4[TropicShield]^7 ^1".. GetPlayerName(src) .." wurde wegen " .. reason .. " gebannt. BanId: ^7".. banData['ID'])
    local banEmbed = {
        {
            ["color"] = "16711680",
            ["title"] = "TropicShield Player was banned",
            ["description"] = "**__Server Infos:__** \n\n"
            .."**Reason:** " .. reason .. "\n\n"
            .."**Server ID:** " .. src .. "\n\n"
            .. "**__Player Identifiers:__** \n\n"
            .. "**Username:** " .. GetPlayerName(src) .. "\n\n"
            .. "**Steam:** " .. playerSteam .. "\n\n"
            .. "**License:** " .. playerLicense .. "\n\n"
            .. "**Discord:** " .. playerDisc .. "\n\n"
            .. "**IP : **||" ..playerIP.. "|| \n\n",
            ["thumbnail"] = {
                url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png"
                },
                ["footer"] = {
                ["text"] = "TropicShield "..os.date("%x %X %p"),
                },
        }
    }
    PerformHttpRequest(TropicShield.BanWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "TropicShield", embeds = banEmbed}), {["Content-Type"] = "application/json"})
end



function getNewBanID()
    local upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local numbers = "0123456789"
    local characterSet = upperCase .. numbers

    local keyLength = 8
    local output = ""

    for	i = 1, keyLength do
        local rand = math.random(#characterSet)
        output = output .. string.sub(characterSet, rand, rand)
    end

    return (output)
end

RegisterCommand('acunban', function(source, args, rawCommand)
    local source = source;
    if (source <= 0) then
        -- Console unban
        if #args == 0 then 
            -- Not enough arguments
            print("Nicht alles angegegeben")
            return; 
        end
        local banID = args[1];
        if banID ~= nil then
            local playerName = UnbanPlayer(banID);
            if playerName then
                print('Unbanned Verification-ID: ' ..playerName)
            else 
                -- Not a valid ban ID
                print("Keine BanId gefunden")
            end
        end
        return;
    end 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if #args == 0 then 
            return; 
        end
        local banID = args[1];
        if banID ~= nil then 
            -- Is a valid ban ID 
            local playerName = UnbanPlayer(banID);
            print('Unbanned Verification-ID: ' ..playerName)
            if playerName then
            else 
            end
        else 
        end
    end
end)

RegisterCommand('screenshot', function(source, args, rawCommand, playerid)
    local source = source;
    if (source <= 0) then
        -- Console unban
        if #args == 0 then 
            -- Not enough arguments
            return; 
        end
        local playerid = args[1];
        if tonumber(playerid) ~= nil then

            TriggerClientEvent("aramsamsam:screenshot2", playerid)

            else 
                -- Not a valid ban ID
            end
        
        return;
    end 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if #args == 0 then 
            return; 
        end
        local banID = args[1];
        if banID ~= nil then 
            -- Is a valid ban ID 

            print('Took Screenshot: ' ..playerid)
            if playerName then
            else 
            end
        else 
        end
    end
end)

function UnbanPlayer(banID)
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    for k, v in pairs(cfg) do 
        local id = v['ID'];
        if id == banID then 
            local name = k;
            cfg[k] = nil;
            SaveResourceFile(GetCurrentResourceName(), "banlist.json", json.encode(cfg, { indent = true }), -1)
            print('^4[TropicShield] ^2Spieler wurde entbannt^7')
            return name;
        end
    end
    print("^4[TropicShield] ^3Es wurde kein Spieler mit dieser BanID gefunden^7")
    return false;
end 

function isBanned(source)
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    local ids = ExtractIdentifiers(source);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
    for k, v in pairs(cfg) do 
        local reason = v['reason']
        local id = v['ID']
        local ip = v['ip']
        local license = v['license']
        local steam = v['steam']
        local xbl = v['xbl']
        local live = v['live']
        local discord = v['discord']
        if tostring(ip) == tostring(playerIP) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(license) == tostring(playerLicense) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(steam) == tostring(playerSteam) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(xbl) == tostring(playerXbl) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(live) == tostring(playerLive) then return { ['banID'] = id, ['reason'] = reason } end;
        if tostring(discord) == tostring(playerDisc) then return { ['banID'] = id, ['reason'] = reason } end;
    end
    return false;
end

function GetBans()
    local config = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
    local cfg = json.decode(config)
    return cfg;
  end
  
local function OnPlayerConnecting(name, setKickReason, deferrals)
    
    deferrals.defer();
    deferrals.update('[TropicShield] - Checking Banlist');
    local src = source;
    local banned = false;
    local ban = isBanned(src);
    Wait(400);
    if ban then 
        -- They are banned 
        local reason = ban['reason'];
        local printMessage = nil;
        if string.find(reason, "[TropicShield] - ") then 
            printMessage = "" 
        else 
            printMessage = "[TropicShield] - " 
        end 
        print("^4[TropicShield] ^1" .. GetPlayerName(src) .. " hat versucht dem Server zu joinen, ist aber gebannt. Grund: " .. reason .." ^7[" ..ban['banID'].. "]");
        -- deferrals.done(printMessage .. "(BAN ID: " .. ban['banID'] .. ") " .. reason);
        deferrals.done("\nTropicShield\n\n" ..TropicShield_SV.Banmessage.. "\n\nBan ID: [" ..ban['banID'].. "]\n\nGrund: " ..reason.. "")
        banned = true;
        CancelEvent();
        return;
    end
    if not banned then 
        deferrals.done();
    end
end
  
AddEventHandler('playerConnecting', function (playerName,setKickReason, deferrals)

    print("^4[TropicShield]^7 Spieler ^4" ..playerName.. "^7 is ^4connecting^7")
	local identifier = "N/A"
	local license   = "N/A"
	local liveid    = "N/A"
	local xblid     = "N/A"
	local discord   = "N/A"
	local playerip = "N/A"
	local reason    = "N/A"
	local name = GetPlayerName(source)


    local sourceplayername = source
    for k,v in ipairs(ExtractIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifier = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
    end

		local ConnectWebhook = {
        {
            ["color"] = "16748836",
            ["title"] = "`TropicShield | Connect Logs`",
            ["description"] = "Player: **"..name.."** \nLicense: **"..license.."** \nDiscord: **"..discord.."** \nlive: **"..liveid.."** \nXBL: **"..xblid.."**\nIP: **"..playerip.."**\n identifier: **"..identifier.."** \n\n<t:".. math.floor(tonumber(os.time())) ..":R>",
	        ["footer"] = {
                ["text"] = "TropicShield",
            },
        }
    }
    PerformHttpRequest(TropicShield.ConnectWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "TropicShield", embeds = ConnectWebhook}), {["Content-Type"] = "application/json"})

end
end)

AddEventHandler("playerConnecting", OnPlayerConnecting)




-- Anti Particles
CreateThread(function()
    particlesSpawned = {}
    vehiclesSpawned = {}
    pedsSpawned = {}
    objectsSpawned = {}
    while true do
        Wait(20000) -- augment/lower this if you want.
        particlesSpawned = {}
        vehiclesSpawned = {}
        pedsSpawned = {}
        objectsSpawned = {}
    end
end)

AddEventHandler('ptFxEvent', function(sender, data)
    if TropicShield_SV.AntiParticles ~= true then return end
    local _source = sender
    particlesSpawned[_source] = (particlesSpawned[_source] or 0) + 1
    if particlesSpawned[_source] > TropicShield_SV.AntiParticlesLimit then
        CancelEvent()
            if TropicShield_SV.AntiParticlesBan then
                BanPlayer(sender, 'Particles detected')
                DropPlayer(sender, 'TropicShield - Banned | Grund: Particles detected')
            end
            if TropicShield_SV.AntiParticlesKick then
                DropPlayer(sender, 'TropicShield - Kicked | Grund: Particles detected')
            end
    end
end)

-- Anti JailAll
RegisterServerEvent(TropicShield_SV.AntiJailEvent)
AddEventHandler(TropicShield_SV.AntiJailEvent, function(target)
    if TropicShield_SV.AntiJailAll ~= true then return end
	if target == -1 then
		CancelEvent()
            if TropicShield_SV.AntiJailAllBan then
                BanPlayer(source, 'Jailall detected')
                DropPlayer(source, 'TropicShield - Banned | Grund: Jailall detected')
            end
            if TropicShield_SV.AntiJailAllKick then
                DropPlayer(source, 'TropicShield - Kicked | Grund: Jailall detected')
            end
	end
end)

-- Anti CommunityServiceAll
RegisterServerEvent(TropicShield_SV.AntiCommunityServiceEvent)
AddEventHandler(TropicShield_SV.AntiCommunityServiceEvent, function(players)
    if TropicShield_SV.AntiCommunityServiceAll ~= true then return end
	if players == -1 then
		CancelEvent()
            if TropicShield_SV.AntiCommunityServiceAllBan then
                BanPlayer(source, 'CommunityServiceAll detected')
                DropPlayer(source, 'TropicShield - Banned | Grund: CommunityServiceAll detected')
            end
            if TropicShield_SV.AntiCommunityServiceAllKick then
                DropPlayer(source, 'TropicShield - Kicked | Grund: CommunityServiceAll detected')
            end
	end
end)


RegisterServerEvent("anticheese:SetComponentStatus")
AddEventHandler("anticheese:SetComponentStatus", function(players)
    if TropicShield_SV.AntiAntiCheese ~= true then return end
    CancelEvent()
    BanPlayer(source, 'Anti AntiCheese')
    DropPlayer(source, ''..TropicShield_SV.Banmessage..'')
end)

-- Max Value
CreateThread(function()
    for i, v in pairs(TropicShield_SV.MaxValuedEvents) do
        local svevent = i
        local maxvalue = TropicShield_SV.MaxValuedEvents[i].maxvalue
        RegisterServerEvent(svevent)
        AddEventHandler(svevent, function(args1, args2, args3, args4)
            if args1 ~= nil and args1 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1.."]`")
                DropPlayer(source, ''..TropicShield_SV.Banmessage..'')
            elseif args2 ~= nil and args2 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1, args2.."]`")
                DropPlayer(source, ''..TropicShield_SV.Banmessage..'')
            elseif args3 ~= nil and args3 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1, args2, args3.."]`")
                DropPlayer(source, ''..TropicShield_SV.Banmessage..'')
            elseif args4 ~= nil and args4 > maxvalue then
                BanPlayer(source, "This player executed `"..svevent.."` with "..maxvalue.." value `["..args1, args2, args3, args4.."]`")
                DropPlayer(source, ''..TropicShield_SV.Banmessage..'')
            end
        end)
    end
    end)
    CreateThread(function()
        local EVENTS = {}
        local isSpamTrigger = false
        if TropicShield_SV.AntiSpamTrigger then
            for i = 1, #TropicShield_SV.AntiSpamTriggerList do
                local TNAME  =  TropicShield_SV.AntiSpamTriggerList[i].EVENT
                local MTIME  =  TropicShield_SV.AntiSpamTriggerList[i].MAX_TIME
                RegisterNetEvent(TNAME)
                AddEventHandler(TNAME, function()
                    local SRC = source
                    if EVENTS[TNAME] == nil then
                        EVENTS[TNAME] = {
                            count = 1,
                            time = os.time()
                        }
                    else
                        EVENTS[TNAME].count = EVENTS[TNAME].count + 1
                    end
                        if EVENTS[TNAME].count > MTIME then
                            local distime = os.time() - EVENTS[TNAME].time
                            if distime >= 10 then
                                EVENTS[TNAME].count = 1
                            else
                                isSpamTrigger = true
                            end
                            if GetPlayerName(source) and isSpamTrigger then
                                CancelEvent()
                                BanPlayer(source, "Event Limit\n\n" ..TNAME.. "\n\n")
                                DropPlayer(source, ''..TropicShield_SV.Banmessage..'')
                            end
                        end
                end)
            end
        end
    end)


-- Anti Dpemote all
RegisterServerEvent(TropicShield_SV.AntiDpemoteEvent)
AddEventHandler(TropicShield_SV.AntiDpemoteEvent, function(players)
    if TropicShield_SV.AntiDpemoteAll ~= true then return end
        if players == -1 then
            CancelEvent()
            if TropicShield_SV.AntiDpemoteAllBan then
                BanPlayer(source, 'Dpemote All detected')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.AntiDpemoteAllKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)

-- Anti Policejob exploit
RegisterServerEvent(TropicShield_SV.AntiPolicejobEventHandcuff)
AddEventHandler(TropicShield_SV.AntiPolicejobEventHandcuff, function(players)
    if TropicShield_SV.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if TropicShield_SV.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (handcuff)')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)
RegisterServerEvent(TropicShield_SV.AntiPolicejobEventPutInVehicle)
AddEventHandler(TropicShield_SV.AntiPolicejobEventPutInVehicle, function(players)
    if TropicShield_SV.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if TropicShield_SV.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (put in vehicle)')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)
RegisterServerEvent(TropicShield_SV.AntiPolicejobEventOutVehicle)
AddEventHandler(TropicShield_SV.AntiPolicejobEventDrag, function(players)
    if TropicShield_SV.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if TropicShield_SV.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (kick out of vehicles)')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)

RegisterServerEvent(TropicShield_SV.AntiPolicejobEventDrag)
AddEventHandler(TropicShield_SV.AntiPolicejobEventDrag, function(players)
    if TropicShield_SV.AntiPolicejobExploits ~= true then return end
        if players == -1 then
            CancelEvent()
            if TropicShield_SV.AntiPolicejobExploitsBan then
                BanPlayer(source, 'Police Exploit detected (drag)')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.AntiPolicejobExploitsKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)

RegisterServerEvent(TropicShield_SV.AntiCarryExploitEvent)
AddEventHandler(TropicShield_SV.AntiCarryExploitEvent, function(players)
    if TropicShield_SV.AntiCarryExploit ~= true then return end
        if players == -1 then
            CancelEvent()
            if TropicShield_SV.AntiCarryExploitBan then
                BanPlayer(source, 'Carry Exploit detected')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.AntiCarryExploitKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)

RegisterServerEvent(TropicShield_SV.DiscordBotExploit)
AddEventHandler(TropicShield_SV.DiscordBotExploit, function(name,reason)
    if TropicShield_SV.DiscordBotExploit ~= true then return end
    if name == "Absolute Menu" or reason == "1337" then
            if TropicShield_SV.DiscordBotExploitBan then
                BanPlayer(source, ' DiscordBot Exploit detected')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.DiscordBotExploitKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)

RegisterServerEvent(TropicShield_SV.PickupExploitEvent)
AddEventHandler(TropicShield_SV.PickupExploitEvent, function(pickup)
    if TropicShield_SV.PickupExploit ~= true then return end
    if type(pickup) ~= "number" then
            if TropicShield_SV.PickupExploitBan then
                BanPlayer(source, 'Pickup Exploit detected')
                DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
            end
            if TropicShield_SV.PickupExploitKick then
                DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
            end
    end
end)




-- Anti Kashacters
RegisterServerEvent(TropicShield_SV.KashacterEvent)
AddEventHandler(TropicShield_SV.KashacterEvent, function(query)
if TropicShield_SV.Kashacter ~= true then return end
     if (string.find(query or "","permission_level") or -1 > -1) or (string.find(query or "","TRUNCATE TABLE") or -1 > -1) or (string.find(query or "","DROP TABLE") or -1 > -1) or (string.find(query or "","UPDATE users") or -1 > -1) then
        if TropicShield_SV.KashacterBan then
            BanPlayer(source, 'Kashacter SQL Injection detected')
            DropPlayer(source, ''..TropicShield_SV.BanMessage..'')
        end
        if TropicShield_SV.KashacterKick then
            DropPlayer(source, ''..TropicShield_SV.KickMessage..'')
        end
end
end)

-- Anti Explosion
AddEventHandler('explosionEvent', function(sender, ev)
    if TropicShield_SV.AntiExplosion ~= true then return end
    if IsPlayerAceAllowed(sender, 'TropicShield.Bypass') then return end
    local ids = ExtractIdentifiers(sender);
    local playerIP = ids.ip;
    local playerSteam = ids.steam;
    local playerLicense = ids.license;
    local playerXbl = ids.xbl;
    local playerLive = ids.live;
    local playerDisc = ids.discord;
	local explsionEmbed = {
        {
            ["color"] = "15105570",
            ["title"] = "Explosion",
            ["description"] = "**Name: **"..GetPlayerName(sender).."**\n ID: **"..sender.."**\n Type: **"..ev.explosionType.." \n**Warning: Type 31/29 Eulen ** **\n Discord: **"..playerDisc.."**\n FiveM: **"..playerLicense.."**\n Steam: **"..playerSteam.."\n You can find explosion Types here: https://wiki.rage.mp/index.php?title=Explosions \n\n<t:".. math.floor(tonumber(os.time())) ..":R>",
        }
    }
    PerformHttpRequest(TropicShield.ExplosionWebhook, function(error, texto, cabeceras) end, "POST", json.encode({username = "TropicShield", embeds = explsionEmbed}), {["Content-Type"] = "application/json"})
    for _, v in ipairs(TropicShield_SV.BlacklistedExplosions) do
        if ev.explosionType == v then
            CancelEvent()
            if TropicShield_SV.AntiExplosionBan == true then
                BanPlayer(sender, 'Tried to spawn Blacklisted Explosion, Type: ' ..ev.explosionType)
                DropPlayer(sender, 'TropicShield - Banned | Grund: Versucht eine Explosion zu spawnen. Typ: ' ..ev.explosionType)
            end
            if TropicShield_SV.AntiExplosionKick == true then
                DropPlayer(sender, 'TropicShield - Kicked | Grund: Versucht eine Explosion zu spawnen. Typ: ' ..ev.explosionType)
            end
        end
    end
end)	    

-- Anti Kick Player out of Vehicle
AddEventHandler("clearPedTasksEvent", function(sender, data)
    if TropicShield_SV.AntiRemoveFromCar then
        if IsPlayerAceAllowed(sender, 'TropicShield.Bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Spieler aus dem Auto gekickt')
	    DropPlayer(sender, 'TropicShield - Banned | Grund: Spieler aus dem Auto gekickt')
    end
end)

-- Anti Remove Weapon of other Players
AddEventHandler('removeWeaponEvent', function(sender, data)
    if TropicShield_SV.AntiRemoveWeapon then
        if IsPlayerAceAllowed(sender, 'TropicShield.Bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Removed Weapon')
        DropPlayer(sender, 'TropicShield - Banned | Grund: Weapon removed')
    end
end)

-- Anti Give Weapon of other Players
AddEventHandler('giveWeaponEvent', function(sender, data)
    if TropicShield_SV.AntiGiveWeapon then
        if IsPlayerAceAllowed(sender, 'TropicShield.Bypass') then return end
        CancelEvent()
        BanPlayer(sender, 'Versucht Waffe zu geben')
        DropPlayer(sender, 'TropicShield - Banned | Grund: Versucht Waffe zu geben') 
    end
end)

-- Anti Entity
AddEventHandler('entityCreating', function(entity)
    local owner = GetEntityOwner(entity)
    local model = GetEntityModel(entity)
    local entitytype = GetEntityPopulationType(entity)
    if entitytype == 0 then
        if TropicShield_SV.EntityObject then
            CancelEvent()
        end
    end
end)

function GetEntityOwner(entity)
    if (not DoesEntityExist(entity)) then 
        return nil 
    end
    local owner = NetworkGetEntityOwner(entity)
    if (GetEntityPopulationType(entity) ~= 7) then return nil end
    return owner
end

AddEventHandler("entityCreating",  function(entity)
    local owner = GetEntityOwner(entity)
    local model = GetEntityModel(entity)
    if (owner ~= nil and owner > 0) then
        if IsPlayerAceAllowed(owner, 'TropicShield.Bypass') then return end

        if GetEntityType(entity) == 1 then
            if TropicShield_SV.EntityPed == true then
                local _source = owner
                pedsSpawned[_source] = (pedsSpawned[_source] or 0) + 1
                if pedsSpawned[_source] > TropicShield_SV.EntityPedLimit then
                    if TropicShield_SV.Entity then
                        CancelEvent()
                    end
                    if TropicShield_SV.EntityBan then
                        BanPlayer(owner, 'Ped Limit')
                        DropPlayer(owner, 'TropicShield - Banned | Grund: Ped Limit') 
                    end
                    if TropicShield_SV.EntityKick then
                        DropPlayer(owner, 'TropicShield - Kicked | Grund: Ped Limit') 
                    end
                end 
            end
        end

        if GetEntityType(entity) == 2 then
            if TropicShield_SV.EntityVehicle == true then
                local _source = owner
                vehiclesSpawned[_source] = (vehiclesSpawned[_source] or 0) + 1
                if vehiclesSpawned[_source] > TropicShield_SV.EntityVehicleLimit then
                    if TropicShield_SV.Entity then
                        CancelEvent()
                    end
                    if TropicShield_SV.EntityBan then
                        BanPlayer(owner, 'Vehicle Limit')
                        DropPlayer(owner, 'TropicShield - Banned | Grund: Vehicle Limit') 
                    end
                    if TropicShield_SV.EntityKick then
                        DropPlayer(owner, 'TropicShield - Kickec | Grund: Vehicle Limit') 
                    end
                end 
            end
        end

    end
end)

CreateThread(function()
    while TropicShield_SV.BlacklistedEvents do
        Wait(1000)
        for i, event in ipairs(TropicShield_SV.BlacklistedEventsList) do
            RegisterNetEvent(event)
            AddEventHandler(event, function()
                if IsPlayerAceAllowed(source, 'TropicShield.Bypass') then return end
                CancelEvent()
                if TropicShield_SV.BlacklistedEventsBan then
                    BanPlayer(source, 'Triggered Blacklisted Event: ' ..event)
                    DropPlayer(source, 'TropicShield - Banned | Grund: Triggered Blacklisted Event ' .. event) 
                end
                if TropicShield_SV.BlacklistedEventsKick then
                    DropPlayer(source, 'TropicShield - Kicked | Grund: Triggered Blacklisted Event ' .. event)
                end
            end)
        end
    end
end)

RegisterServerEvent("aramsamsam:screenshot2")
AddEventHandler("aramsamsam:screenshot2", function(a)
    for fg, fh in ipairs(GetPlayerIdentifiers(source)) do
        if not fh:match("discord") then
        else
        end
      end
    PerformHttpRequest(TropicShield.ScreenshotWebhook, function(a, b, c)
    end, "POST", json.encode({
        username = "TropicShield",
        embeds = {
          {
            author = {
              name = "TropicShield AntiCheat",
              url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png",
              icon_url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png"
            },
            image = {url = a},
            color = "16711680",
            title = "Blacklisted Key",
            description = 
               "**__Server Infos:__** \n\n"
            .. "**Server ID:** " .. source .. "\n\n"
            .. "**__Player Identifiers:__** \n\n"
            .. "**Username:** " .. GetPlayerName(source) .. "\n\n"
            .. "**Steam:** " .. GetPlayerIdentifiers(source)[1] .. "\n\n"
            .. "**Fivem:** " .. GetPlayerIdentifiers(source)[2] .."\n\n"
            .. "**Discord:** " .. GetPlayerIdentifiers(source)[3] .."\n\n"
            .. "**HWID:** " .. GetPlayerIdentifiers(source)[4] .. "\n\n"
            .. "**IP:** " .. GetPlayerIdentifiers(source)[5] .. "\n\n",
            ["thumbnail"] = {
                url = "https://cdn.discordapp.com/attachments/1016375947093610556/1018549157776072744/tl_blau.png"
                },
                ["footer"] = {
                ["text"] = "TropicLife | "..os.date("%x %X %p"),
                },
          }
        }
      }), {
        ["Content-Type"] = "application/json"
      })
    end)

    function doesPlayerHavePerms(a, b)
        for fh, fj in ipairs(b) do
          if IsPlayerAceAllowed(a, fj) then
            return true
          end
        end
        return false
      end
