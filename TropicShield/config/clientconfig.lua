TropicShield_CL = {}

TropicShield_CL.Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["INSERT"] = 121
}


-- Menu Detection
TropicShield_CL.OnScreenMenuDetectionScreenshotWebhook = 'https://discord.com/api/webhooks/997939217646751844/8O6Hca5YfSySZHndT7cU_CUbiiWEsEFkFuoxBa6RFJxTx2sarbwJyWMqiKrDIAJ8PSdM'

--> Funktioniert
-- Anti Super Jump
TropicShield_CL.SuperJump = true


--Anti Infinity Stamina
TropicShield_CL.AntiInfiniteStamina = false

-- Some Basics
TropicShield_CL.DetectTimer = 1000

TropicShield_CL.AntiArmorHack = true
TropicShield_CL.MaxArmor = 100


--> Funktioniert
--Anti Noclip + fly in vehicle
TropicShield_CL.AntiFlyAroundInVehicle = false
TropicShield_CL.AntiNoClip = true
TropicShield_CL.WhitelistedNoClipCoordsDistance = 10
TropicShield_CL.WhitelistedNoClipCoords = {
    {name = "DNZ Shop", coords = vector3(-1654.748, -3132.528, 36.4242)}
}

--> Funktioniert
-- Anti Plate Changer
TropicShield_CL.AntiVehicleplatechange = true

-- Anti NUIDevtools
TropicShield_CL.AntiNuiDevtools = false

-- Anti Damage Modifier
TropicShield_CL.AntiDamageModifier = true

-- Anti WeaponPickup
TropicShield_CL.AntiWeaponPickup = true

-- Anti remove from car
TropicShield_CL.AntiRemoveFromCar = false -- Anti Remove Other Players of Vehicle

-- Anti Injection
TropicShield_CL.AntiInjection = true -- Detects Injcetions of most Mod Menus       

--> Funktioniert
-- Spectate
TropicShield_CL.AntiSpectate = true -- Anti Spectate

--> Funktioniert
-- ModMenu detection
TropicShield_CL.OnScreenMenuDetection = false
TropicShield_CL.OSMDCheckingTime = 30000 -- Checks for screen menus every 30 secs (Recommended to leave this right here otherwise you'll get a lot of lag and high CPU usage)
TropicShield_CL.BlacklistedMenuWords = { -- (OnScreenMenuDetection) Words to check
	"fallout", "godmode", "Godmode", "god mode", "modmenu", "esx money", "give armor", "Aim Lock","Aimbot", "Troll", "trigger", "triggerbot", "rage bot", "ragebot", "rapidfire", "fuck server", "freecam", "execute", "superjump", "noclip", "hack", "super run",
	"lynx", "absolute", "ckgangisontop", "lumia1", "ISMMENU", "HydroMenu", "TAJNEMENUMenu", "rootMenu", "Outcasts666", "WaveCheat", "NacroxMenu", "MarketMenu", "topMenu", "FlexSkazaMenu", "SidMenu", "Crown", "Lynx8", "LynxEvo", "Maestro",
	"Tiago", "Brutan", "redEngine", "Unex", "Eulen", "HamMafia", "HamHaxia", "Dopamine", "Dopameme", "redMENU", "falcon", "Desudo", "Onion", "explode", "Ciao", "Anticheat", "Tapatio", "Particle", "Malossi", "Nisi", "ATG", "RedStonia",
	"Chocohax", "Inyection", "Inyected", "Dumper", "LUA Executor", "Executor", "Skid", "HoaX", "inSec", "Reaper", "Event Blocker", "Cheats", "Cheat", "Destroyer", "Spectate", "Wallhack", "Exploit", "triggers", "crosshair", "Explosive",
	"Alokas66", "Hacking System!", "Infinity", "Online Players", "Destroy Menu", "Self Menu", "Server IP", "Teleport To", "Give Single Weapon", "Airstrike Player", "Taze Player", "Toga", "Magneto"
}

-- Anti ExplosionBullet
TropicShield_CL.AntiExplosionBullet = true

--> Funktioniert
-- Vision
TropicShield_CL.AntiVision = true  -- Anti Vision | If you are using a Helicopter with Camera and Visions it should be true 
TropicShield_CL.AntiNightVision = true     --  You get banned in an helicopter
TropicShield_CL.AntiThermalVision = true   --  You get banned in an helicopter

-- Anti NightVisionV2
TropicShield_CL.AntiThermalVisionNew = false  -- You dont get banned in an helicopter
TropicShield_CL.AntiNightVisionNew = false     --You dont get banned in an helicopter

--> Funktioniert
-- Anti GodMode
TropicShield_CL.AntiGodMode1 = true
TropicShield_CL.AntiGodMode2 = true
TropicShield_CL.AntiGodMode3 = false


-- Weapon Modifications
TropicShield_CL.AntiInfiniteAmmo = true -- checks if player has infinite ammo

--> Funktioniert
-- Anti Teleport
TropicShield_CL.AntiTeleport = false -- Anti Teleport

--> Funktioniert
-- Anti Invisible
TropicShield_CL.AntiInvisible = false
TropicShield_CL.WhitelistedInvisCoordsDistance = 10
TropicShield_CL.WhitelistedInvisCoords = {
    {name = "DNZ Shop", coords = vector3(-1654.748, -3132.528, 36.4242)}
}

--Anti Tiny ped
TropicShield_CL.AntiTinyPed = true

--Speed Hack 
TropicShield_CL.AntiSpeedHack = true
TropicShield_CL.SpeedMax = 80

-- Anti Stopper
TropicShield_CL.AntiStopper = false -- Disables stopping cheater from stopping other scripts. YOU ARE NOT ALLOWED TO START/STOP/RESTART/ENSURE ANY SCRIPT, ELSE EVERYONE GETS BANNED!
TropicShield_CL.AntiStarter = false -- Disables stopping cheater from starting other scripts. YOU ARE NOT ALLOWED TO START/STOP/RESTART/ENSURE ANY SCRIPT, ELSE EVERYONE GETS BANNED!
-- I Recommend AntiStarter because it Detects the Most Executor!
TropicShield_CL.WhitelistedResources = {

    "esx_status",
    "esx_service"

}


-- Vehicle Modifcations
TropicShield_CL.VehicleGodMode = true -- TYPE 2
TropicShield_CL.VehiclePowerIncrease = true -- TYPE 3
TropicShield_CL.VehicleSpeedHack = true -- TYPE 5
TropicShield_CL.AntiVehicleSpeedHackNew = true -- Type 6
TropicShield_CL.AntiCarInvisible = true
TropicShield_CL.AntiVehicleModifiers = false -- Sometimes here can happen some fail bans. Test it with an tuned Car.
TropicShield_CL.AntiRadar = true -- Mini Map Karte 

-- BlacklistedKey
TropicShield_CL.BlacklistedKey = true
TropicShield_CL.BlacklistedKeyScreenshot = true
TropicShield_CL.BlacklistedKeyKick = true
TropicShield_CL.BlacklistedKeyList = {
	{id = "INSERT", value = 121},
}


--> Funktioniert
-- Weapons
TropicShield_CL.BlacklistedWeapons = true -- Do you want Blacklisted Weapons?
TropicShield_CL.BlacklistedWeaponsBan = true -- Do you want to ban them?
TropicShield_CL.BlacklistedWeaponsList = { -- List of Blacklisted Weapons
    "WEAPON_RAYPISTOL", -- Atomizer
    "WEAPON_APPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_CERAMICPISTOL",
    -- SMGs
    "WEAPON_RAYCARBINE", -- Unholy Hellbringer
    "WEAPON_SMG_MK2",
    -- Shotguns
    "WEAPON_SWEEPERSHOTGUN", -- Sweeper
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_MUSKET",
    -- Snipers
    "WEAPON_HEAVYSNIPER", -- Heavy Sniper
    "WEAPON_HEAVYSNIPER_MK2", -- Heavy Sniper MK2
    "WEAPON_MARKSMANRIFLE", -- Marks Man Rifle
    "WEAPON_MARKSMANRIFLE_MK2", -- Marksman Rifle MK2
    -- Heavy
    --"WEAPON_RPG", -- RPG
    "WEAPON_GRENADELAUNCHER", --Grenade Launcher
    "WEAPON_GRENADELAUNCHER_SMOKE", -- Smoke Grenade Launcher
    "WEAPON_MINIGUN", -- MiniGun
    "WEAPON_FIREWORK", -- Firework Launcher
    "WEAPON_RAILGUN", -- Railgun
    "WEAPON_HOMINGLAUNCHER", -- Homing Launcher
    "WEAPON_COMPACTLAUNCHER", -- Compact Launcher
    "WEAPON_RAYMINIGUN", -- Widowmaker
    -- Throwables
    "WEAPON_STICKYBOMB", -- Sticky Bomb
    "WEAPON_PROXMINE", --  Proximity Mine
    "WEAPON_PIPEBOMB", -- Pipe Bomb
    "WEAPON_BZGAS",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_GRENADE"
}

--> Funktioniert
-- Vehicles
TropicShield_CL.BlacklistedVehicles = true -- Do you want Blacklisted Vehicles ?
TropicShield_CL.BlacklistedVehiclesBan = true -- Do you want to ban them?
TropicShield_CL.BlacklistedVehiclesList = { -- List of Blacklisted Vehicles 
    'RHINO',
    'AKULA',
    'SAVAGE',
    'HUNTER',
    'BUZZARD',
    'BUZZARD2',
    'ANNIHILATOR',
    'VALKYRIE',
    'HYDRA',
    'APC',
    'Trailersmall2',
    'Lazer',
    'oppressor',
    'mogul',
    'barrage',
    'Khanjali',
    'volatol',
    'chernobog',
    'avenger',
    'stromberg',
    'nightshark',
    'besra',
    'babushka ',
    'starling',
    'insurgent',
    'cargobob',
    'cargobob2',
    'cargobob3',
    'cargobob4',
    'caracara',
    'deluxo',
    'menacer',
    'scramjet',
    'oppressor2',
    'revolter',
    'viseris',
    'savestra',
    'thruster',
    'ardent',
    'dune3',
    'tampa3',
    'halftrack',
    'nokota',
    'strikeforce',
    'bombushka',
    'molotok',
    'pyro',
    'ruiner2',
    'limo2',
    'technical',
    'technical2',
    'technical3',
    'jb700w',
    'blazer5',
    'insurgent3',
    'boxville5',
    'bruiser',
    'bruiser2',
    'bruiser3',
    'brutus',
    'brutus2',
    'brutus3',
    'cerberus',
    'cerberus2',
    'cerberus3',
    'dominator4',
    'dominator5',
    'dominator6',
    'impaler2',
    'impaler3',
    'impaler4',
    'imperator',
    'imperator2',
    'imperator3',
    'issi4',
    'issi5',
    'issi6',
    'monster3',
    'monster4',
    'monster5',
    'scarab',
    'scarab2',
    'scarab3',
    'slamvan4',
    'slamvan5',
    'slamvan6',
    'zr380',
    'zr3802',
    'zr3803',
    'alphaz1',
    'avenger2',
    'blimp',
    'blimp2',
    'blimp3',
    'cargoplane',
    'cuban800',
    'dodo',
    'duster',
    'howard',
    'jet',
    'luxor',
    'luxor2',
    'mammatus',
    'microlight',
    'miljet',
    'nimbus',
    'rogue',
    'seabreeze',
    'shamal',
    'stunt',
    'titan',
    'tula',
    'velum',
    'velum2',
    'vestra'
}

TropicShield_CL.AntiInfiniteStamina = true -- Crasht Sometimes

TropicShield_CL.Menyoo = true

-- Anti Ai        (You need to configurate you demage when you are using Script that can influence the damage. )

TropicShield_CL.AntiInfiniteAmmo = true -- should work lol

TropicShield_CL.AntiDamageModifier = true -- Detects if a player tries to modify his damage or defence value
TropicShield_CL.AntiDamageChanger = true -- Detects if a player tries to modify his damage or defence value

TropicShield_CL.WeaponExplosiveCheck = true -- Detects if a player tries to explosive bullt 

TropicShield_CL.WeaponDamages = {
	[-1357824103] = { damage = 34, name = "AdvancedRifle"}, -- AdvancedRifle
    [453432689] = { damage = 26, name = "Pistol"}, -- Pistol
    [1593441988] = { damage = 27, name = "CombatPistol"}, -- CombatPistol
    [584646201] = { damage = 28, name = "APPistol"}, -- APPistol
    [-1716589765] = { damage = 51, name = "Pistol50"}, -- Pistol50
    [-1045183535] = { damage = 160, name = "Revolver"}, -- Revolver
    [-1076751822] = { damage = 28, name = "SNSPistol"}, -- SNSPistol
    [-771403250] = { damage = 40, name = "HeavyPistol"}, -- HeavyPistol
    [137902532] = { damage = 34, name = "VintagePistol"}, -- VintagePistol
    [324215364] = { damage = 21, name = "MicroSMG"}, -- MicroSMG
    [736523883] = { damage = 22, name = "SMG"}, -- SMG
    [-270015777] = { damage = 23, name = "AssaultSMG"}, -- AssaultSMG
    [-1121678507] = { damage = 22, name = "MiniSMG"}, -- MiniSMG
    [-619010992] = { damage = 27, name = "MachinePistol"}, -- MachinePistol
    [171789620] = { damage = 28, name = "CombatPDW"}, -- CombatPDW
    [487013001] = { damage = 58, name = "PumpShotgun"}, -- PumpShotgun
    [2017895192] = { damage = 40, name = "SawnoffShotgun"}, -- SawnoffShotgun
    [-494615257] = { damage = 32, name = "AssaultShotgun"}, -- AssaultShotgun
    [-1654528753] = { damage = 14, name = "BullpupShotgun"}, -- BullpupShotgun
    [984333226] = { damage = 117, name = "HeavyShotgun"}, -- HeavyShotgun
    [-1074790547] = { damage = 30, name = "AssaultRifle"}, -- AssaultRifle
    [-2084633992] = { damage = 32, name = "CarbineRifle"}, -- CarbineRifle
    [-1063057011] = { damage = 32, name = "SpecialCarbine"}, -- SpecialCarbine
    [2132975508] = { damage = 32, name = "BullpupRifle"}, -- BullpupRifle
    [1649403952] = { damage = 34, name = "CompactRifle"}, -- CompactRifle
    [-1660422300] = { damage = 40, name = "MG"}, -- MG
    [2144741730] = { damage = 45, name = "CombatMG"}, -- CombatMG
    [1627465347] = { damage = 34, name = "Gusenberg"}, -- Gusenberg
    [100416529] = { damage = 101, name = "SniperRifle"}, -- SniperRifle
    [205991906] = { damage = 216, name = "HeavySniper"}, -- HeavySniper
    [-952879014] = { damage = 65, name = "MarksmanRifle"}, -- MarksmanRifle
    [1119849093] = { damage = 30, name = "Minigun"}, -- Minigun
    [-1466123874] = { damage = 165, name = "Musket"}, -- Musket
    [911657153] = { damage = 1, name = "StunGun"}, -- StunGun
    [1198879012] = { damage = 10, name = "FlareGun"}, -- FlareGun
    [-598887786] = { damage = 220, name = "MarksmanPistol"}, -- MarksmanPistol
    [1834241177] = { damage = 30, name = "Railgun"}, -- Railgun
    [-275439685] = { damage = 30, name = "DoubleBarrelShotgun"}, -- DoubleBarrelShotgun
    [-1746263880] = { damage = 81, name = "Double Action Revolver"}, -- Double Action Revolver
    [-2009644972] = { damage = 30, name = "SNS Pistol Mk II"}, -- SNS Pistol Mk II
    [-879347409] = { damage = 200, name = "Heavy Revolver Mk II"}, -- Heavy Revolver Mk II
    [-1768145561] = { damage = 32, name = "Special Carbine Mk II"}, -- Special Carbine Mk II
    [-2066285827] = { damage = 33, name = "Bullpup Rifle Mk II"}, -- Bullpup Rifle Mk II
    [1432025498] = { damage = 32, name = "Pump Shotgun Mk II"}, -- Pump Shotgun Mk II
    [1785463520] = { damage = 75, name = "Marksman Rifle Mk II"}, -- Marksman Rifle Mk II
    [961495388] = { damage = 40, name = "Assault Rifle Mk II"}, -- Assault Rifle Mk II
    [-86904375] = { damage = 33, name = "Carbine Rifle Mk II"}, -- Carbine Rifle Mk II
    [-608341376] = { damage = 47, name = "Combat MG Mk II"}, -- Combat MG Mk II
    [177293209] = { damage = 230, name = "Heavy Sniper Mk II"}, -- Heavy Sniper Mk II
    [-1075685676] = { damage = 32, name = "Pistol Mk II"}, -- Pistol Mk II
    [2024373456] = { damage = 25, name = "SMG Mk II"} -- SMG Mk II
}