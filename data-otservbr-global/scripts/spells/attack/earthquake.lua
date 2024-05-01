local secondCombat = Combat()
secondCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
secondCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 10)
	return -min, -max
end

secondCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 10)
	return -min, -max
end

function spellCallback(param)
	local creature = Creature(param.cid)
	if not creature then
		return true
	end

	local tile = Tile(Position(param.pos))
	if tile then
		local creatureTop = tile:getTopCreature()
		if not creatureTop then
			return true
		end
		
		if creatureTop:getId() ~= creature:getId()
			secondCombat:execute(
		end
	end
end

function onTargetTile(cid, pos)
	local param = {}
	param.cid = cid
	param.pos = pos
	param.count = 0
	spellCallback(param)
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(250)
spell:name("Tectonic Shift")
spell:words("exevo gran mas tera")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_WRATH_OF_NATURE)
spell:level(55)
spell:mana(700)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("arch druid;true")
spell:register()




function spellCallback(cid, position, count)
	if Creature(cid) then
		if count > 0 or math.random(0, 1) == 1 then
			position:sendMagicEffect(CONST_ME_HITBYFIRE)
			doAreaCombat(cid, COMBAT_FIREDAMAGE, position, 0, -100, -100, CONST_ME_EXPLOSIONHIT)
		end

		if count < 5 then
			count = count + 1
			addEvent(spellCallback, math.random(1000, 4000), cid, position, count)
		end
	end
end

function onTargetTile(creature, position)
	spellCallback(creature:getId(), position, 0)
end

local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE5X5))
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end