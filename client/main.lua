local QBCore = exports['qb-core']:GetCoreObject()

--------
--DOOR--
--------

RegisterNetEvent('mz-usbhacks:client:usbhacksdoor', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
	local success = exports['qb-lock']:StartLockPickCircle(5, 8) --StartLockPickCircle(1,10) 1= how many times, 30 = time in seconds
	if success then
		TriggerServerEvent('qb-doorlock:server:updateState', Config.usbhacksdoor, false, false, false, true)
		if Config.NotifyType == 'qb' then
			QBCore.Functions.Notify("The door will auto lock in 120 seconds.", "info", 3500)
		elseif Config.NotifyType == "okok" then
			exports['okokNotify']:Alert("BACKUP LOCK", "The door will auto lock in 120 seconds.", 3500, "info")
		end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	else
		if Config.NotifyType == 'qb' then
			QBCore.Functions.Notify("Access denied.", "error", 3500)
		elseif Config.NotifyType == "okok" then
			exports['okokNotify']:Alert("UNAUTHORISED", "Access denied...", 3500, "error")
		end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	end
end)

--------------------
--TARGET FUNCTIONS--
--------------------

CreateThread(function()
    exports['qb-target']:AddBoxZone("usbhacksdoor", vector3(-70.13, 6254.07, 31.09), 1.4, 0.4, {
        name = "usbhacksdoor",
        heading = 33,
        debugPoly = false,
        minZ = 28.49,
        maxZ = 32.49,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-usbhacks:client:usbhacksdoor",
                icon = 'fas fa-trash',
                label = 'Unlock door'
            },
        },
        distance = 1.2,
     })
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("usbhacks_trigger", vector3(-67.16, 6253.49, 31.09), 0.8, 1.2, {
        name = "usbhacks_trigger",
        heading = 33,
        debugPoly = false,
        minZ = 27.69,
        maxZ = 31.69,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-usbhacks:client:StartHackBlankUSB",
                icon = 'fas fa-laptop',
                label = 'Hack USB (Level 0)'
            },
			{
                type = "client",
                event = "mz-usbhacks:client:StartHackBlankUSB_Tier1",
                icon = 'fas fa-laptop',
                label = 'Hack USB (Level 1)' 
            },
			{
                type = "client",
                event = "mz-usbhacks:client:StartHackBlankUSB_Tier2",
                icon = 'fas fa-laptop',
                label = 'Hack USB (Level 2)' 
            },
			{
                type = "client",
                event = "mz-usbhacks:client:StartHackBlankUSB_Tier3",
                icon = 'fas fa-laptop',
                label = 'Hack USB (Level 3)' 
            },
			{
                type = "client",
                event = "mz-usbhacks:client:StartHackBlankUSB_Tier4",
                icon = 'fas fa-laptop',
                label = 'Hack USB (Level 4)' 
            },
        },
        distance = 1.2,
     })
end)

-----------------------
--BLANK USB - LEVEL 0--
-----------------------

RegisterNetEvent('mz-usbhacks:client:StartHackBlankUSB')
AddEventHandler('mz-usbhacks:client:StartHackBlankUSB', function()
    QBCore.Functions.TriggerCallback('mz-usbhacks:server:HasBlankUSB', function(HasItemBlankUSB)
        if HasItemBlankUSB then
			TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
            QBCore.Functions.Progressbar("deliver_reycle_package", "Accessing Slaughterhouse database...", 5500, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
				TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerEvent("mhacking:show")
                TriggerEvent("mhacking:start", math.random(5, 5), 24, HackingSuccessBlankUSB)
            end)
        else
            local requiredItems = {
                [1] = {name = QBCore.Shared.Items["blankusb"]["name"], image = QBCore.Shared.Items["blankusb"]["image"]},
            }
			if Config.NotifyType == 'qb' then
            	QBCore.Functions.Notify('You need a Blank USB', "error", 3500)
			elseif Config.NotifyType == "okok" then
				exports['okokNotify']:Alert("NEED BLANK USB", "You need something to access the database...", 3500, "error")
			end
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
            Wait(2000)
			TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    end, {"blankusb"})
end)

function ExchangeSuccessBlankUSB()
		TriggerEvent('animations:client:EmoteCommandStart', {"kneel"})
		QBCore.Functions.Progressbar("deliver_reycle_package", "DOWNLOADING DATA...", math.random(10500, 13500), false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			local chance = 6
			local hackerchance = math.random(1, 10)
			if hackerchance > 8 then
				chance = 8
			elseif hackerchance < 9 and hackerchance > 6 then
				chance = 7
			else
				chance = 6
			end
			exports["mz-skills"]:UpdateSkill("Hacking", chance)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			Wait(1500)
			QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB', function(result)
		end)
	end)
end

function ExchangeFailBlankUSB()
	local chance = -6
	local hackerchance = math.random(1, 10)
	exports["mz-skills"]:UpdateSkill("Hacking", chance)
	if Config.NotifyType == 'qb' then
		QBCore.Functions.Notify('-6XP to Hacking', "error", 3500)
	elseif Config.NotifyType == "okok" then
		exports['okokNotify']:Alert("SKILLS", "-6XP to Hacking", 3500, "error")
	end
	Wait(200)
	QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeFailBlankUSB', function(result)
	end)
end

function HackingSuccessBlankUSB(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccessBlankUSB()
    else
		TriggerEvent('mhacking:hide')
		ExchangeFailBlankUSB()
	end
end

-----------------------
--BLANK USB - LEVEL 1--
-----------------------

RegisterNetEvent('mz-usbhacks:client:StartHackBlankUSB_Tier1')
AddEventHandler('mz-usbhacks:client:StartHackBlankUSB_Tier1', function()
    exports["mz-skills"]:CheckSkill("Hacking", 100, function(hasskill)
		if hasskill then
			QBCore.Functions.TriggerCallback('mz-usbhacks:server:HasBlankUSB_Tier1', function(HasItemBlankUSB_Tier1)
				if HasItemBlankUSB_Tier1 then
					TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
					QBCore.Functions.Progressbar("deliver_reycle_package", "Accessing Slaughterhouse database...", 5500, false, true, {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					}, {}, {}, {}, function() -- Done
						TriggerEvent('animations:client:EmoteCommandStart', {"c"})
						TriggerEvent("mhacking:show")
						TriggerEvent("mhacking:start", math.random(4, 4), 18, HackingSuccessBlankUSB_Tier1)
					end)
				else
					local requiredItems = {
						[1] = {name = QBCore.Shared.Items["blankusb"]["name"], image = QBCore.Shared.Items["blankusb"]["image"]},
					}
					if Config.NotifyType == 'qb' then
						QBCore.Functions.Notify('You need a Blank USB', "error", 3500)
					elseif Config.NotifyType == "okok" then
						exports['okokNotify']:Alert("NEED BLANK USB", "You need something to access the database...", 3500, "error")
					end
					TriggerEvent('inventory:client:requiredItems', requiredItems, true)
					Wait(2000)
					TriggerEvent('inventory:client:requiredItems', requiredItems, false)
				end
			end, {"blankusb"})
		else
			if Config.NotifyType == 'qb' then
				QBCore.Functions.Notify('You need more skill to attempt this (Need Level 1)', "error", 3500)
			elseif Config.NotifyType == "okok" then
				exports['okokNotify']:Alert("SKILLS", "You need more skill to attempt this (Need Level 1)", 3500, "error")
			end
		end
	end)
end)

function ExchangeSuccessBlankUSB_Tier1()
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel"})
        QBCore.Functions.Progressbar("deliver_reycle_package", "DOWNLOADING DATA...", math.random(10500, 13500), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local chance = 10
            local hackerchance = math.random(1, 10)
            if hackerchance > 8 then
                chance = 12
            elseif hackerchance < 9 and hackerchance > 6 then
                chance = 11
            else
                chance = 10
            end
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            exports["mz-skills"]:UpdateSkill("Hacking", chance)
            Wait(1500)
            QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier1', function(result)
        end)
    end)
end

function ExchangeFailBlankUSB_Tier1()
	local chance = -10
	local hackerchance = math.random(1, 10)
	exports["mz-skills"]:UpdateSkill("Hacking", chance)
	if Config.NotifyType == 'qb' then
		QBCore.Functions.Notify('-10XP to Hacking', "error", 3500)
	elseif Config.NotifyType == "okok" then
		exports['okokNotify']:Alert("SKILLS", "-10XP to Hacking", 3500, "error")
	end
	Wait(200)
    QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier1', function(result)
    end)
end

function HackingSuccessBlankUSB_Tier1(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccessBlankUSB_Tier1()
    else
        TriggerEvent('mhacking:hide')
        ExchangeFailBlankUSB_Tier1()
    end
end

-----------------------
--BLANK USB - LEVEL 2--
-----------------------

RegisterNetEvent('mz-usbhacks:client:StartHackBlankUSB_Tier2')
AddEventHandler('mz-usbhacks:client:StartHackBlankUSB_Tier2', function()
	exports["mz-skills"]:CheckSkill("Hacking", 200, function(hasskill)
		if hasskill then
			QBCore.Functions.TriggerCallback('mz-usbhacks:server:HasBlankUSB_Tier2', function(HasItemBlankUSB_Tier2)
				if HasItemBlankUSB_Tier2 then
					TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
					QBCore.Functions.Progressbar("deliver_reycle_package", "Accessing Slaughterhouse database...", 5500, false, true, {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					}, {}, {}, {}, function() -- Done
						TriggerEvent('animations:client:EmoteCommandStart', {"c"})
						TriggerEvent("mhacking:show")
						TriggerEvent("mhacking:start", math.random(4, 4), 15, HackingSuccessBlankUSB_Tier2)
					end)
				else
					local requiredItems = {
						[1] = {name = QBCore.Shared.Items["blankusb"]["name"], image = QBCore.Shared.Items["blankusb"]["image"]},
					}
					if Config.NotifyType == 'qb' then
						QBCore.Functions.Notify('You need a Blank USB', "error", 3500)
					elseif Config.NotifyType == "okok" then
						exports['okokNotify']:Alert("NEED BLANK USB", "You need something to access the database...", 3500, "error")
					end
					TriggerEvent('inventory:client:requiredItems', requiredItems, true)
					Wait(2000)
					TriggerEvent('inventory:client:requiredItems', requiredItems, false)
				end
			end, {"blankusb"})
		else
			if Config.NotifyType == 'qb' then
				QBCore.Functions.Notify('You need more skill to attempt this (Need Level 2)', "error", 3500)
			elseif Config.NotifyType == "okok" then
				exports['okokNotify']:Alert("SKILLS", "You need more skill to attempt this (Need Level 2)", 3500, "error")
			end
		end
	end)
end)

function ExchangeSuccessBlankUSB_Tier2()
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel"})
        QBCore.Functions.Progressbar("deliver_reycle_package", "DOWNLOADING DATA...", math.random(10500, 13500), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local chance = 12
            local hackerchance = math.random(1, 10)
            if hackerchance > 8 then
                chance = 14
            elseif hackerchance < 9 and hackerchance > 6 then
                chance = 13
            else
                chance = 12
            end
            exports["mz-skills"]:UpdateSkill("Hacking", chance)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(1500)
            QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier2', function(result)
        end)
    end)
end

function ExchangeFailBlankUSB_Tier2()
    local chance = -12
    local hackerchance = math.random(1, 10)
    exports["mz-skills"]:UpdateSkill("Hacking", chance)
    if Config.NotifyType == 'qb' then
        QBCore.Functions.Notify('-12XP to Hacking', "error", 3500)
    elseif Config.NotifyType == "okok" then
        exports['okokNotify']:Alert("SKILLS", "-12XP to Hacking", 3500, "error")
    end
    Wait(200)
    QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier2', function(result)
    end)
end

function HackingSuccessBlankUSB_Tier2(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccessBlankUSB_Tier2()
    else
        TriggerEvent('mhacking:hide')
        ExchangeFailBlankUSB_Tier2()
    end
end

-----------------------
--BLANK USB - LEVEL 3--
-----------------------

RegisterNetEvent('mz-usbhacks:client:StartHackBlankUSB_Tier3')
AddEventHandler('mz-usbhacks:client:StartHackBlankUSB_Tier3', function()
    exports["mz-skills"]:CheckSkill("Hacking", 400, function(hasskill)
        if hasskill then
            QBCore.Functions.TriggerCallback('mz-usbhacks:server:HasBlankUSB_Tier3', function(HasItemBlankUSB_Tier3)
                if HasItemBlankUSB_Tier3 then
                    TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
                    QBCore.Functions.Progressbar("deliver_reycle_package", "Accessing Slaughterhouse database...", 5500, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerEvent("mhacking:show")
                        TriggerEvent("mhacking:start", math.random(3, 4), 13, HackingSuccessBlankUSB_Tier3)
                    end)
                else
                    local requiredItems = {
                        [1] = {name = QBCore.Shared.Items["blankusb"]["name"], image = QBCore.Shared.Items["blankusb"]["image"]},
                    }
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need a Blank USB', "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED BLANK USB", "You need something to access the database...", 3500, "error")
                    end
                    TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                    Wait(2000)
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                end
            end, {"blankusb"})
        else
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('You need more skill to attempt this (Need Level 3)', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("SKILLS", "You need more skill to attempt this (Need Level 3)", 3500, "error")
            end
        end
    end)
end)

function ExchangeSuccessBlankUSB_Tier3()
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel"})
        QBCore.Functions.Progressbar("deliver_reycle_package", "DOWNLOADING DATA...", math.random(10500, 13500), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local chance = 15
            local hackerchance = math.random(1, 10)
            if hackerchance > 8 then
                chance = 17
            elseif hackerchance < 9 and hackerchance > 6 then
                chance = 16
            else
                chance = 15
            end
            exports["mz-skills"]:UpdateSkill("Hacking", chance)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(1500)
            QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier3', function(result)
        end)
    end)
end

function ExchangeFailBlankUSB_Tier3()
    local chance = -15
    local hackerchance = math.random(1, 10)
    exports["mz-skills"]:UpdateSkill("Hacking", chance)
    if Config.NotifyType == 'qb' then
        QBCore.Functions.Notify('-15XP to Hacking', "error", 3500)
    elseif Config.NotifyType == "okok" then
        exports['okokNotify']:Alert("SKILLS", "-15XP to Hacking", 3500, "error")
    end
    Wait(200)
    QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier3', function(result)
    end)
end

function HackingSuccessBlankUSB_Tier3(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccessBlankUSB_Tier3()
    else
        TriggerEvent('mhacking:hide')
        ExchangeFailBlankUSB_Tier3()
    end
end

-----------------------
--BLANK USB - LEVEL 4--
-----------------------

RegisterNetEvent('mz-usbhacks:client:StartHackBlankUSB_Tier4')
AddEventHandler('mz-usbhacks:client:StartHackBlankUSB_Tier4', function()
    exports["mz-skills"]:CheckSkill("Hacking", 800, function(hasskill)
        if hasskill then
            QBCore.Functions.TriggerCallback('mz-usbhacks:server:HasBlankUSB_Tier4', function(HasItemBlankUSB_Tier4)
                if HasItemBlankUSB_Tier4 then
                    TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
                    QBCore.Functions.Progressbar("deliver_reycle_package", "Accessing Slaughterhouse database...", 5500, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerEvent("mhacking:show")
                        TriggerEvent("mhacking:start", math.random(3, 3), 11, HackingSuccessBlankUSB_Tier4)
                    end)
                else
                    local requiredItems = {
                        [1] = {name = QBCore.Shared.Items["blankusb"]["name"], image = QBCore.Shared.Items["blankusb"]["image"]},
                    }
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need a Blank USB', "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED BLANK USB", "You need something to access the database...", 3500, "error")
                    end
                    TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                    Wait(2000)
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                end
            end, {"blankusb"})
        else
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('You need more skill to attempt this (Need Level 4)', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("SKILLS", "You need more skill to attempt this (Need Level 4)", 3500, "error")
            end
        end
    end)
end)

function ExchangeSuccessBlankUSB_Tier4()
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel"})
        QBCore.Functions.Progressbar("deliver_reycle_package", "DOWNLOADING DATA...", math.random(10500, 13500), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local chance = 17
            local hackerchance = math.random(1, 10)
            if hackerchance > 8 then
                chance = 19
            elseif hackerchance < 9 and hackerchance > 6 then
                chance = 18
            else
                chance = 17
            end
            exports["mz-skills"]:UpdateSkill("Hacking", chance)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            Wait(1500)
            QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier4', function(result)
        end)
    end)
end

function ExchangeFailBlankUSB_Tier4()
    local chance = -17
    local hackerchance = math.random(1, 10)
    exports["mz-skills"]:UpdateSkill("Hacking", chance)
    if Config.NotifyType == 'qb' then
        QBCore.Functions.Notify('-17XP to Hacking', "error", 3500)
    elseif Config.NotifyType == "okok" then
        exports['okokNotify']:Alert("SKILLS", "-17XP to Hacking", 3500, "error")
    end
    Wait(200)
    QBCore.Functions.TriggerCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier4', function(result)
    end)
end

function HackingSuccessBlankUSB_Tier4(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccessBlankUSB_Tier4()
    else
        TriggerEvent('mhacking:hide')
        ExchangeFailBlankUSB_Tier4()
    end
end

-----------------
--BASE FUNCTION--
-----------------

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end