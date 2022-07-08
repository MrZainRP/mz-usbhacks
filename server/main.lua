local QBCore = exports['qb-core']:GetCoreObject()

-----------------------
--BLANK USB - LEVEL 0--
-----------------------

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeFailBlankUSB', function(source, cb)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Failed to access the Slaughterhouse mainframe.", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK FAILED!", "Failed to access the Slaughterhouse mainframe.", 3500, 'success')
        end
    end
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('QBCore:Notify', src, "Slaughterhouse Mainframe Accessed", "success", 4000)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        Citizen.Wait(1000)
        local src = source
        local ply = QBCore.Functions.GetPlayer(src)          
        local luck2 = math.random(1, 100)
        if luck2 < 35 then
            Player.Functions.AddItem(QBCore.Shared.Items["cryptostick"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add", 1)
        elseif luck2 > 34 and luck2 < 60 then
            Player.Functions.AddItem(QBCore.Shared.Items["trojan_usb"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["trojan_usb"], "add", 1)
        elseif luck2 > 59 and luck2 < 79 then
            Player.Functions.AddItem(QBCore.Shared.Items["usb1"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb1"], "add", 1)
        elseif luck2 > 78 and luck2 < 96 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb2"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb2"], "add", 1)
        elseif luck2 > 95 and luck2 < 100 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb3"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb3"], "add", 1)
        elseif luck2 == 100 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb4"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb4"], "add", 1)
        end
        Wait(400)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, 'Data successfully uploaded to USB...', 'success', 3500)  
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK SUCCESSFUL", "Data successfully uploaded to USB...", 3500, 'success')
        end        	
    end
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeFailBlankUSB')
AddEventHandler('mz-usbhacks:server:ExchangeFailBlankUSB', function()
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeFailBlankUSB)')
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeSuccessBlankUSB')
AddEventHandler('mz-usbhacks:server:ExchangeSuccessBlankUSB', function(LuckChance)
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeSuccessBlankUSB)')
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:HasBlankUSB', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("blankusb")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-----------------------
--BLANK USB - LEVEL 1--
-----------------------

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier1', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Failed to access the Slaughterhouse mainframe.", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK FAILED!", "Failed to access the Slaughterhouse mainframe.", 3500, 'success')
        end
    end
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier1', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('QBCore:Notify', src, "Slaughterhouse Mainframe Accessed", "success", 4000)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        Citizen.Wait(1000)
        local src = source
        local ply = QBCore.Functions.GetPlayer(src)          
        local luck2 = math.random(1, 100)
        if luck2 < 25 then
            Player.Functions.AddItem(QBCore.Shared.Items["cryptostick"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add", 1)
        elseif luck2 > 24 and luck2 < 50 then
            Player.Functions.AddItem(QBCore.Shared.Items["trojan_usb"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["trojan_usb"], "add", 1)
        elseif luck2 > 49 and luck2 < 72 then
            Player.Functions.AddItem(QBCore.Shared.Items["usb1"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb1"], "add", 1)
        elseif luck2 > 71 and luck2 < 91 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb2"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb2"], "add", 1)
        elseif luck2 > 90 and luck2 < 99 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb3"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb3"], "add", 1)
        elseif luck2 == 99 or luck2 == 100 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb4"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb4"], "add", 1)
        end
        Wait(400)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, 'Data successfully uploaded to USB...', 'success', 3500)  
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK SUCCESSFUL", "Data successfully uploaded to USB...", 3500, 'success')
        end                
    end
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeFailBlankUSB_Tier1')
AddEventHandler('mz-usbhacks:server:ExchangeFailBlankUSB_Tier1', function()
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeFailBlankUSB_Tier1)')
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier1')
AddEventHandler('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier1', function(LuckChance)
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeSuccessBlankUSB_Tier1)')
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:HasBlankUSB_Tier1', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("blankusb")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-----------------------
--BLANK USB - LEVEL 2--
-----------------------

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier2', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Failed to access the Slaughterhouse mainframe.", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK FAILED!", "Failed to access the Slaughterhouse mainframe.", 3500, 'success')
        end
    end
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier2', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('QBCore:Notify', src, "Slaughterhouse Mainframe Accessed", "success", 4000)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        Citizen.Wait(1000)
        local src = source
        local ply = QBCore.Functions.GetPlayer(src)          
        local luck2 = math.random(1, 100)
        if luck2 < 19 then
            Player.Functions.AddItem(QBCore.Shared.Items["cryptostick"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add", 1)
        elseif luck2 > 17 and luck2 < 43 then
            Player.Functions.AddItem(QBCore.Shared.Items["trojan_usb"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["trojan_usb"], "add", 1)
        elseif luck2 > 42 and luck2 < 69 then
            Player.Functions.AddItem(QBCore.Shared.Items["usb1"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb1"], "add", 1)
        elseif luck2 > 68 and luck2 < 89 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb2"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb2"], "add", 1)
        elseif luck2 > 88 and luck2 < 98 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb3"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb3"], "add", 1)
        elseif luck2 == 98 or luck2 == 99 or luck2 == 100 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb4"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb4"], "add", 1)
        end
        Wait(400)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, 'Data successfully uploaded to USB...', 'success', 3500)  
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK SUCCESSFUL", "Data successfully uploaded to USB...", 3500, 'success')
        end                
    end
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeFailBlankUSB_Tier2')
AddEventHandler('mz-usbhacks:server:ExchangeFailBlankUSB_Tier2', function()
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeFailBlankUSB_Tier2)')
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier2')
AddEventHandler('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier2', function(LuckChance)
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeSuccessBlankUSB_Tier2)')
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:HasBlankUSB_Tier2', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("blankusb")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-----------------------
--BLANK USB - LEVEL 3--
-----------------------

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier3', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Failed to access the Slaughterhouse mainframe.", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK FAILED!", "Failed to access the Slaughterhouse mainframe.", 3500, 'success')
        end
    end
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier3', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('QBCore:Notify', src, "Slaughterhouse Mainframe Accessed", "success", 4000)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        Citizen.Wait(1000)
        local src = source
        local ply = QBCore.Functions.GetPlayer(src)          
        local luck2 = math.random(1, 100)
        if luck2 < 15 then
            Player.Functions.AddItem(QBCore.Shared.Items["cryptostick"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add", 1)
        elseif luck2 > 14 and luck2 < 38 then
            Player.Functions.AddItem(QBCore.Shared.Items["trojan_usb"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["trojan_usb"], "add", 1)
        elseif luck2 > 37 and luck2 < 66 then
            Player.Functions.AddItem(QBCore.Shared.Items["usb1"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb1"], "add", 1)
        elseif luck2 > 65 and luck2 < 88 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb2"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb2"], "add", 1)
        elseif luck2 > 87 and luck2 < 97 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb3"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb3"], "add", 1)
        elseif luck2 == 97 or luck2 == 98 or luck2 == 99 or luck2 == 100 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb4"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb4"], "add", 1)
        end
        Wait(400)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, 'Data successfully uploaded to USB...', 'success', 3500)  
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK SUCCESSFUL", "Data successfully uploaded to USB...", 3500, 'success')
        end                
    end
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeFailBlankUSB_Tier3')
AddEventHandler('mz-usbhacks:server:ExchangeFailBlankUSB_Tier3', function()
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeFailBlankUSB_Tier3)')
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier3')
AddEventHandler('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier3', function(LuckChance)
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeSuccessBlankUSB_Tier3)')
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:HasBlankUSB_Tier3', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("blankusb")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-----------------------
--BLANK USB - LEVEL 4--
-----------------------

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeFailBlankUSB_Tier4', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Failed to access the Slaughterhouse mainframe.", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK FAILED!", "Failed to access the Slaughterhouse mainframe.", 3500, 'success')
        end
    end
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier4', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("blankusb")
    if ItemData ~= nil then
        Player.Functions.RemoveItem("blankusb", 1)
        TriggerClientEvent('QBCore:Notify', src, "Slaughterhouse Mainframe Accessed", "success", 4000)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["blankusb"], "remove")
        Citizen.Wait(1000)
        local src = source
        local ply = QBCore.Functions.GetPlayer(src)          
        local luck2 = math.random(1, 100)
        if luck2 < 8 then
            Player.Functions.AddItem(QBCore.Shared.Items["cryptostick"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add", 1)
        elseif luck2 > 7 and luck2 < 27 then
            Player.Functions.AddItem(QBCore.Shared.Items["trojan_usb"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["trojan_usb"], "add", 1)
        elseif luck2 > 26 and luck2 < 58 then
            Player.Functions.AddItem(QBCore.Shared.Items["usb1"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb1"], "add", 1)
        elseif luck2 > 57 and luck2 < 83 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb2"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb2"], "add", 1)
        elseif luck2 > 82 and luck2 < 95 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb3"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb3"], "add", 1)
        elseif luck2 > 94 then 
            Player.Functions.AddItem(QBCore.Shared.Items["usb4"].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["usb4"], "add", 1)
        end
        Wait(400)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, 'Data successfully uploaded to USB...', 'success', 3500)  
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "HACK SUCCESSFUL", "Data successfully uploaded to USB...", 3500, 'success')
        end                
    end
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeFailBlankUSB_Tier4')
AddEventHandler('mz-usbhacks:server:ExchangeFailBlankUSB_Tier4', function()
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeFailBlankUSB_Tier4)')
end)

RegisterServerEvent('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier4')
AddEventHandler('mz-usbhacks:server:ExchangeSuccessBlankUSB_Tier4', function(LuckChance)
    QBCore.Functions.BanInjection(source, 'mz-usbhacks (ExchangeSuccessBlankUSB_Tier4)')
end)

QBCore.Functions.CreateCallback('mz-usbhacks:server:HasBlankUSB_Tier4', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("blankusb")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)