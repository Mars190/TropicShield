TropicShield_SV = {}

TropicShield_SV.Servername = 'TropicLife' -- ServerName
TropicShield_SV.Banmessage = 'Du wurdest vom Anticheat gebannt!'
TropicShield_SV.KickMessage = 'Du wurdest vom Anticheat gekickt!'

-- Entitys
TropicShield_SV.Entity = true -- Deletes the object after limit
TropicShield_SV.EntityKick = false -- Kick player after limit ex. if i spawn 6 cars i will get kicked
TropicShield_SV.EntityBan = true -- Ban player after limit ex. if i spawn 6 cars i will get banned
-- The Limit will be reseted every 20 seconds --

--> Funktioniert
TropicShield_SV.EntityVehicle = true
TropicShield_SV.EntityVehicleLimit = 7

TropicShield_SV.EntityPed = true
TropicShield_SV.EntityPedLimit = 5

TropicShield_SV.EntityObject = true

-- Anti Weapon
TropicShield_SV.AntiGiveWeapon = false -- Anti Give Weapon to other Players
TropicShield_SV.AntiRemoveWeapon = false -- Anti Remove Weapon to other Players

-- Anti Particles
TropicShield_SV.AntiParticles = true
TropicShield_SV.AntiParticlesKick = false
TropicShield_SV.AntiParticlesBan = true
TropicShield_SV.AntiParticlesLimit = 5

-- Anti Jailall
TropicShield_SV.AntiJailAll = false -- Your jail Event needs to be esx-qalle-jail:jailPlayer
TropicShield_SV.AntiJailAllKick = true
TropicShield_SV.AntiJailAllBan = true
TropicShield_SV.AntiJailEvent = ""

-- BlacklistedEvents
TropicShield_SV.BlacklistedEvents = true
TropicShield_SV.BlacklistedEventsKick = true
TropicShield_SV.BlacklistedEventsBan = true
TropicShield_SV.BlacklistedEventsList = {
    'bringplayertome'
}

--SECURED EVENTS 
TropicShield_SV.SecuredJobEvents = {
    { eventName = "scoutspasti:jailPlayer", job = "police"},
}

TropicShield_SV.MaxValuedEvents = { -- This can catch money spamming, on a vulnarable event, and can easily catch other event executions like these. Maxvalue means, if a player triggers a mavalued event, with an argument which is higer then maxvalue, the anticheat will block it.
	["esx_garbagejob:pay"] = {maxvalue=1000},
	["esx_pizza:pay"] = {maxvalue=1000},
	["esx_ranger:pay"] = {maxvalue=1000},
	["esx_truckerjob:pay"] = {maxvalue=1000},
	["esx_slotmachine:sv:2"] = {maxvalue=1000},
	["AdminMenu:giveBank"] = {maxvalue=1000},
	["AdminMenu:giveCash"] = {maxvalue=1000},
	["LegacyFuel:PayFuel"] = {maxvalue=1000},
	["fuel:pay"] = {maxvalue=1000},
	["esx_society:billing"] = {maxvalue=100000}                               -- Do {maxvalue=-1} if you only will get banned on -1 trigger. Good for Police triggers ;D
}

TropicShield_SV.AntiSpamTrigger = true

TropicShield_SV.AntiSpamTriggerList = { -- This can catch money spamming, on a vulnarable event, and can easily catch other event executions like these. Maxvalue means, if a player triggers a mavalued event, with an argument which is higer then maxvalue, the anticheat will block it.
    { EVENT = "esx_policejob:handcuff",           MAX_TIME = 4  },
    { EVENT = "esx-qalle-hunting:reward",         MAX_TIME = 3  },
    { EVENT = "esx:giveInventoryItem",            MAX_TIME = 4  },
    { EVENT = "esx_billing:sendBill" ,            MAX_TIME = 3  },
    { EVENT = "esx_billing:sendBill" ,            MAX_TIME = 3  },
    { EVENT = "chatE3vent" ,                      MAX_TIME = 2  },
    { EVENT = "_chat:messageEntered3" ,           MAX_TIME = 2  },
    { EVENT = "playerDi3ed" ,                     MAX_TIME = 2  },
    { EVENT = "gcPhone:_internalAddMessage",      MAX_TIME = 4  },
    { EVENT = "gcPhone:tchat_channel",            MAX_TIME = 4  },
    { EVENT = "ServerValidEmote",                 MAX_TIME = 4  },
    { EVENT = "lester:vendita",                   MAX_TIME = 20 },
    { EVENT = "esx:confiscatePlayerItem",         MAX_TIME = 4  },
}

-- Anti CommunityServiceAll
TropicShield_SV.AntiCommunityServiceAll = false
TropicShield_SV.AntiCommunityServiceAllKick = true
TropicShield_SV.AntiCommunityServiceAllBan = true
TropicShield_SV.AntiCommunityServiceEvent = "" -- esx_communityservice:sendToCommunityService

-- AntiAntiCheese (Hydro Menu)
TropicShield_SV.AntiAntiCheese = true

-- AntiDpemoteAll
TropicShield_SV.AntiDpemoteAll = true
TropicShield_SV.AntiDpemoteAllKick = true
TropicShield_SV.AntiDpemoteAllBan = true
TropicShield_SV.AntiDpemoteEvent = "ServerEmoteRequest" -- ServerEmoteRequest


-- AntiPolicejobExploits
TropicShield_SV.AntiPolicejobExploits = true
TropicShield_SV.AntiPolicejobExploitsKick = true
TropicShield_SV.AntiPolicejobExploitsBan = true
TropicShield_SV.AntiPolicejobEventHandcuff = "esx_policejob:handcuff"
TropicShield_SV.AntiPolicejobEventPutInVehicle = "esx_policejob:putInVehicle"
TropicShield_SV.AntiPolicejobEventOutVehicle = "esx_policejob:OutVehicle"
TropicShield_SV.AntiPolicejobEventDrag = "esx_policejob:drag"

-- Anti Carry all
TropicShield_SV.AntiCarryExploit = true
TropicShield_SV.AntiCarryExploitKick = true
TropicShield_SV.AntiCarryExploitBan = true
TropicShield_SV.AntiCarryExploitEvent = "CarryPeople:sync" -- CarryPeople:sync

-- DiscordBotExploit
TropicShield_SV.DiscordBotExploit = true
TropicShield_SV.DiscordBotExploitKick = true
TropicShield_SV.DiscordBotExploitBan = true
TropicShield_SV.DiscordBotExploit = "DiscordBot:playerDied" -- DiscordBot:playerDied

-- PickupExploit
TropicShield_SV.PickupExploit = true
TropicShield_SV.PickupExploitKick = true
TropicShield_SV.PickupExploitBan = true
TropicShield_SV.PickupExploitEvent = "esx:onPickup" -- esx:onPickup

-- Kashacters Exploit
TropicShield_SV.Kashacter = true
TropicShield_SV.KashacterKick = true
TropicShield_SV.KashacterBan = true
TropicShield_SV.KashacterEvent = "kashactersS:DeleteCharacter" -- kashactersS:DeleteCharacter


-- Explosions
TropicShield_SV.AntiExplosion = true -- Disables Explosion
TropicShield_SV.AntiExplosionKick = true -- want to get banned?
TropicShield_SV.AntiExplosionBan = true -- want to get banned?
TropicShield_SV.BlacklistedExplosions = {  -- Blacklisted Explosions
    1,
    4, 
    25,
    29, 
    33, 
    35, 
    37, 
    38
}
