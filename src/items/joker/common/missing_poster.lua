-- #region UTILITY CODE. KEEP THE SAME ACROSS ALL JOKERS OR I WILL FUCKING KILL YOU
local mistiutils = require('mistiutils')
-- #endregion

local enable = true

--- @type SMODS.Joker
local j = {
	key = "missing_poster",
	config = { extra = { mult = 8 } },
	loc_vars = function(self, info_queue, card)
		local stg = card.ability.extra
		return { vars = { stg.mult } }
	end,
	blueprint_compat = true,
	rarity = 1,
	cost = 5,
	calculate = function(self, card, context)
		local suits = mistiutils.get_suits(G.play.cards)
		if context.individual and context.cardarea == G.hand and context.other_card:is_face() and not mistiutils.is_any_of_these_suits(context.other_card, suits) and not context.other_card.debuff and not context.end_of_round then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}

return enable and j or nil
