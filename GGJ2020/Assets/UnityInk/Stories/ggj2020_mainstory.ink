INCLUDE ggj2020_functions.ink
->start

== start
#changebackground #spawn.background.church #play.earthquake
An Un-God has emerged from the cthonic bowls of the city, ripping apart the sacred halls of the Church of Marrow, and breaking the seal of the Sacred Dead which kept the unquiet hordes at bay.

The city is in a state of panic. 

Is it a sign? Is it the end of days? Is it that pesky heretical cult trying to wake up the Elder Gods again?

Without the seal, the city lies defenceless, and none shall be safe until the Church is re-sanctified, and the seal reforged. 

You have been tasked with overseeing the repairs. 

But in order to do that, you'll need to convince everyone to work together.

*[Easier said than done.]-> professions

== professions

You are the Arbiter, but before that you were...

*[a Hunter.]
Many things in the underground needed hunting. And not all hunting was after food.
~mettle = 4
~insight = 3
~artifice = 2
~candour = 1
~theurgy = 0
*[an Academic.]
You spent most of your time behind a cushy desk at the Osseus University, learning all there is to know about the Boneworks.
~mettle = 0
~insight = 4
~artifice = 3
~candour = 2
~theurgy = 1
*[an Inquisitor.]
You are the one who asked the pointed questions. Uncovered the heretics, the cultists, the un-godly believers.
~mettle = 1
~insight = 0
~artifice = 4
~candour = 3
~theurgy = 2
*[a Warrior Cleric.]
You trained with the finest warriors of the clergy, honing your deadly arts in service of the Church. ‘So that the sleeping gods may never wake. Amen.’
~mettle = 2
~insight = 1
~artifice = 0
~candour = 4
~theurgy = 3
*[a Necromancer.]
Someone needs to make sure the dead stay dead. And skeletons make for excellent manual laborers.
~mettle = 3
~insight = 2
~artifice = 1
~candour = 0
~theurgy = 4

- But there was always something extraordinary about you. A reason you caught the Arbiters’ attention.

* [You aren’t averse to spilling a little blood]
You were a duellist, exceptionally skilled with a blade. You carved out a reputation for yourself through violence, and those who knew you learned to fear your name.
~mettle += 1
* [You learned to survive at an early age.]
An urchin, you were forced to make your own way in the world, and that made you cunning. You learned to observe others, and used the knowledge you gleaned to your own advantage.
~insight += 1
* [You were always a liar.]
Able to deceive and manipulate. You played the people around you as though they were strings on a harp, using charm and half-truths to get what you wanted. 
~artifice += 1
* [You grew up in a big family.]
You had more sisters, brothers, uncles, aunts, grandmothers and grandfathers than you could shake a stick at. And somehow you ended up being the lubricant that kept the whole thing together.
~candour += 1
* [You were born with magic.]
Where most must study for decades to foster the spark of magic, to you it came at an early age. ‘Born one foot in the Nether’, you were never in danger of being bullied on the schoolyard.
~theurgy +=1

- But your past is behind you now; it is forbidden to refer to an Arbiter’s background, on pain of death. It remains a part of you, but it is not you. Not any more.

*[You have a job to do.] Time is of the essence. ->intro

= intro

The Church of the Marrow stands before you - or at least what's left of it. 

When the Un-God breached the earth, it brought down most of the east wing with it.

The creature now lolls amidst the remains, a somnolent worm, its maw lined with concentric rings of translucent teeth. 

As you watch a Nun from the Mellliferous Order of Mercy strides forth and impales the beasts single albescent eye with her sword. The creature shudders, then grows still. 

You look away. 

Your business lies elsewhere - for now.

*[Keep walking.] ->church

== church
 
Bone-dust drifts through the air like snow, filtered through the light of the jagged fibula that arch precariously overhead.

The Priest is waiting for you in the remains of the apsis, his lips moving in quiet prayer as he genuflects before the shattered altar. 

*[You cough politely to alert him of your presence.]
*[You wait for him to finish his prayers, listening for interesting morsels he might divulge.]
*[You tap him on the shoulder, interrupting his worship. After all you're very busy and important, and you don't have all day.]

-“Arbiter!” The Priest exclaims, and rushes forward to shake your hand. “Glad to make your acquaintance.”

*[”Likewise.”]
*[Naturally.”]
*[“Charmed, I’m sure. ”]

-Together you inspect the damage that has been wrought by the great beast. Shattered bones lie everywhere, empty skulls glowering at them accusingly as they pass.
->breach_help

= breach_help

*[Ask him how the seal was broken.]->breach
*[Ask him if there’s any way you can assist the Church with repairs.]->help

= help
“Well now that you mention it--”

*[“--there is the matter of the Intercostal Brotherhood.”]->engineers

*[“--the Church does have a problem that could use a more delicate touch.”]->heresy

= engineers
The priest goes on to describe the great saga of the Intercostal Brotherhood of Engineers, and how they refuse to listen to reason.

“It’s their JOB to repair this sort of thing, but they flat out refuse to lift a finger. I don’t suppose you could find a way to convince them to assist us once more with the repairs to the Church?”->breach_help

= heresy

“It’s those filthy heretics with their filthy notions.” The priest explains. “They’re on the rampage, stirring up public sentiment against the holy orders, making unreasonable demands, distributing their sordid little pamphlets.” He shudders in what you only assume is abject horror.

“Perhaps you could poke around a little? Find a way to...silence, them?” He smiles knowingly.->breach_help

= breach

“The seal is meant to keep the Undead and the Other from breaching the city walls, so why did it fail now?”

The priest sighs, and wipes his brow. “My superiors have numerous ideas on the subject. It’s possible the beast managed to find a weakness in the spell, and merely exploited it. Or perhaps heretics were involved. But for my own part, I’m not so sure.”->options
=options
*[Ask him about the worm.]->the_worm_itself
*[Ask him about the heretics.]->those_pesky_heretics
*[Ask him about his own suspicions.]->discord_and_disarray
*[You think you have enough information to go on.]->endconversation
= the_worm_itself
“The truth of the matter,’ he tells you with some reluctance, ‘is that the worm itself could never have breached the threshold of the city on its own.”

“The ancient magic that binds us is too ancient, too complex. No, the great beast merely revealed what was already broken.
->options

= those_pesky_heretics

“Heretics?” You ask, somewhat amused. You’ve seen their pamphlets around the city and hardly credit them as a threat.

The priest clearly senses your disbelief.

“Oh they are quite dangerous, I assure you.” He says. “But I suspect this is beyond even their dark learning. No, the cause lies elsewhere.”

He almost seems disappointed.
->options
= discord_and_disarray

“What do you think is the true cause?”

The Priest shuffles his feet, uncomfortable in the face of your open scrutiny.

“I suspect the city itself is the cause. The ancient magics that bound the seal together where based on the strength of the city itself, and the ties that bind us all together. It’s no secret that there has been much discord of late - neighbour fighting with neighbour, religious disagreements, strife and hardship throughout the city.”

“In truth I suspect this to be the root cause. It’s our fault. We are the ones who broke the seal.”
->options

=endconversation
You promise to return once you’ve made some progress. #changebackground
->DONE

==church_of_the_marrow
The Church of the Marrow stands before you - or at least what's left of it.
->DONE
==atheneum
Before you stands the chaotic home of the heretics, printing presses aflutter.
->DONE
==palace
The very walls seem to creak with the weight of years.
->DONE
==cenotaph
Cenotaph of the Sleepless God - a monument bound in heavy chains.
->DONE
==necropolis
The home of the unsleeping dead.
->DONE
==apiary
The place is abuzz.
->DONE

