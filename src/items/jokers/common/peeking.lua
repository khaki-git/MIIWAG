-- #region UTILITY CODE. KEEP THE SAME ACROSS ALL JOKERS OR I WILL FUCKING KILL YOU
local mistiutils = require("mistigris.mistiutils")
-- #endregion

local enable = true

--- @type SMODS.Joker
local j = {
	key = "peeking",
	blueprint_compat = true,
	config = { extra = { threshold = 0.6, mult_bonus = 8 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_bonus, card.ability.extra.threshold * 100 } }
	end,
	rarity = 1,
	cost = 5,
	calculate = function(self, card, context)
		if
			 context.joker_main
			 and to_big(G.GAME.chips) / to_big(G.GAME.blind.chips) < to_big(card.ability.extra.threshold)
		then
			return {
				mult = card.ability.extra.mult_bonus,
			}
		end
	end,
}

return enable and j or nil
