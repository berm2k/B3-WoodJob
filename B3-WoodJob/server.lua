-- https://discord.gg/2mNts9zxdn في حين مواجهة اي مشاكل بالسكربت يرجى فتح تذكرة برمجية 

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","damn_lenhador")

local reward = {1,3}
local preco_venda = 20
RegisterServerEvent('damn_lenhador:cutTree')
AddEventHandler('damn_lenhador:cutTree', function()
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"farm.legal"}) then
		TriggerClientEvent('damn_lenhador:cutTree', source)
	else
      	TriggerClientEvent('chatMessage', source, '', {255,192,203}, "انت لست بحطاب.", {255, 255, 255, 0.5,'',100,0,0, 0.5}, "Hit", "RESPAWN_SOUNDSET")
    end
end)

RegisterServerEvent('damn_lenhador:rewardWood')
AddEventHandler('damn_lenhador:rewardWood', function()
	local user_id = vRP.getUserId({source})
	local rndMin,rndMax = table.unpack(reward)
	local rndResult = math.random(rndMin, rndMax)
	if vRP.hasPermission({user_id,"farm.legal"}) then
		local new_weight = vRP.getInventoryWeight({user_id})+vRP.getItemWeight({"ljmadeira"})
		if new_weight <= vRP.getInventoryMaxWeight({user_id}) then
			vRP.giveInventoryItem({user_id,"ljmadeira",rndResult,false})
			TriggerClientEvent('chatMessage', source, '', {255,192,203}, "تلقيت "..rndResult.." خشب.", {255, 255, 255, 0.5,'',0, 100, 0, 0.50})
		else
			TriggerClientEvent('chatMessage', source, '', {255,192,203}, "الحقيبة مكتملة", {255, 255, 255, 0.5,'',100,0,0, 0.5})
		end
	else
      	TriggerClientEvent('chatMessage', source, '', {255,192,203}, "انت لست بحطاب.", {255, 255, 255, 0.5,'',100,0,0, 0.5}, "Hit", "RESPAWN_SOUNDSET")
    end
end)

RegisterServerEvent('damn_lenhador:enableProcess')
AddEventHandler('damn_lenhador:enableProcess', function()
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"farm.legal"}) then
		TriggerClientEvent('damn_lenhador:enableProcess', source)
	else
      	TriggerClientEvent('chatMessage', source, '', {255,192,203}, "انت لست بحطاب.", {255, 255, 255, 0.5,'',100,0,0, 0.5}, "Hit", "RESPAWN_SOUNDSET")
    end
end)

RegisterServerEvent('damn_lenhador:processWood')
AddEventHandler('damn_lenhador:processWood', function()
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"farm.legal"}) then
		if vRP.tryGetInventoryItem({user_id,"ljmadeira",1,true}) then
			vRP.giveMoney({user_id,preco_venda})
		end
	else
      	TriggerClientEvent('chatMessage', source, '', {255,192,203}, "انت لست بحطاب.", {255, 255, 255, 0.5,'',100,0,0, 0.5}, "Hit", "RESPAWN_SOUNDSET")
    end
end)

-- Updates
        print("^4"..GetCurrentResourceName() .."^7 is on the ^2newest ^7version!^7")