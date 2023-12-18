local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(0, 21470, 3, CONST_ME_MAGIC_BLUE)
end

spell:name("Arrow Call")
spell:words("exevo infir con")
spell:group("support")
spell:vocation("paladin;true", "royal paladin;true", "holy paladin;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ARROW_CALL)
spell:id(176)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(1)
spell:mana(10)
spell:soul(1)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
