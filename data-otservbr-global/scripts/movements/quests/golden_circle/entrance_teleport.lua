local destination = {
	[25047] = {
		newPos = Position(32807, 31657, 8),
		storage = Storage.ForgottenKnowledge.AccessDeath,
		effect = CONST_ME_MORTAREA,
	},
	[25048] = {
		newPos = Position(32325, 32089, 7),
		storage = Storage.ForgottenKnowledge.AccessDeath,
		effect = CONST_ME_MORTAREA,
	}
}

local entranceTeleport = MoveEvent()

function entranceTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = destination[item.itemid]
	if not teleport then
		return
	end
	if item.itemid == 10840 then
		if player:getStorageValue(Storage.ForgottenKnowledge.AccessLast) < 1 then
			if
				player:getStorageValue(Storage.ForgottenKnowledge.LadyTenebrisKilled) >= 1
				and player:getStorageValue(Storage.ForgottenKnowledge.LloydKilled) >= 1
				and player:getStorageValue(Storage.ForgottenKnowledge.ThornKnightKilled) >= 1
				and player:getStorageValue(Storage.ForgottenKnowledge.DragonkingKilled) >= 1
				and player:getStorageValue(Storage.ForgottenKnowledge.HorrorKilled) >= 1
				and player:getStorageValue(Storage.ForgottenKnowledge.TimeGuardianKilled) >= 1
			then
				player:setStorageValue(Storage.ForgottenKnowledge.AccessLast, 1)
			end
		end
	end
	if player:getStorageValue(teleport.storage) >= 1 then
		position:sendMagicEffect(teleport.effect)
		player:teleportTo(teleport.newPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	else
		if item.itemid == 10840 then
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the permission to use this portal.")
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
		local pos = position
		pos.y = pos.y + 2
		player:teleportTo(pos)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the permission to use this portal.")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		pos.y = pos.y - 2
		pos:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

entranceTeleport:type("stepin")
entranceTeleport:aid(24873)
entranceTeleport:register()
