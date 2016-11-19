Simple addon to prevent cancelling of fresh spell casts when mashing the button while still allowing other spells to cancel (i.e. frostbolt spam cancel into counterspell)

# To use:

Simply replace your existing /script SpellStopCasting() with something similar to the following:

/script AntiSpamStopCast:ASSpellStopCasting("Shadow Bolt(Rank 1)", 1.0)

Where the first text (quoted) is a unique name for this cancel (so the addon will only block stop casts with the same name), and the number is the period (in seconds) that stop casts should be blocked for.

In other words, you can spam your button as much as you want within X seconds at the end of the cast without fear of cancelling the next cast. Note that spamming while out of range will trigger the timer, and if you continue to spam once in range it may potentially cancel your cast. Still a far cry better than plain stop casting, which would cancel it too, albeit with certainty.
