local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_BLEEDING)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Cure Bleeding")
spell:words("exana kor")
spell:group("healing")
spell:vocation("druid;true", "elder druid;true", "arch druid;true", "knight;true", "elite knight;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_CURE_BLEEDING)
spell:id(144)
spell:cooldown(6000)
spell:groupCooldown(1000)
spell:level(45)
spell:mana(30)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:isPremium(true)
spell:register()
