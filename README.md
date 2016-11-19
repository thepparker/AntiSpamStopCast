Simple addon to prevent cancelling of fresh spell casts when mashing the button while still allowing other spells to cancel (i.e. frostbolt spam cancel into counterspell). This is most useful for users with a higher latency that can utilize stop casting to increase their spell cast frequency, by preventing time wastage during the span that the server has finished the cast but the client has not.

# To use:

Simply replace your existing /script SpellStopCasting() with something similar to the following:

/script AntiSpamStopCast:ASSpellStopCasting("Shadow Bolt(Rank 1)", 1.0)

Where the first text (quoted) is a unique name for this cancel (so the addon will only block stop casts with the same name), and the number is the period (in seconds) that stop casts should be blocked for

In other words, you can spam your button as much as you want within X seconds at the end of the cast without fear of cancelling the next cast. Note that spamming while out of range will trigger the timer, and if you continue to spam once in range it may potentially cancel your cast. Still a far cry better than plain stop casting, which would cancel it too, albeit with certainty.

The period should be about twice your latency and a little more for some leeway. The spell cast time should also be considered.

eg. If you had 300ms (ideally constant, no spiking - unrealistic) and you blocked for 600ms (0.6 seconds), you would almost always cancel your cast again by mashing since only 0.3 seconds (+- some fraction of a second due to network spikes) would be covered during the actual cast.

On the other hand, if you blocked for say 2 seconds, you'd well and truly cover a large portion of the cast. However, if the cast time is a 1.5 or 1s cast, you'd most likely be unable to cancel the end of the cast since it will be finished before the blocking period is over.
