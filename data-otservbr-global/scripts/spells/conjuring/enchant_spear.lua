local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3277, 7367, 1, CONST_ME_MAGIC_GREEN)
end

spell:name("Enchant Spear")
spell:words("exeta con")
spell:group("support")
spell:vocation("paladin;true", "royal paladin;true", "holy paladin;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ENCHANT_SPEAR)
spell:id(110)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(45)
spell:mana(350)
spell:soul(3)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
