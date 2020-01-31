INCLUDE ccg_globals.ink
INCLUDE ccg_descriptions.ink


VAR debug = false

{debug: ->caravan_ambush_spot}
=== start ===
// This is the knot the inkwriter auto-starts if no other knot is given
->briefing

=== briefing ===
~setBackground(base)
As you emerge from the workshop, you immediately feel a chill run through you. The world is awash in grey, the sun hidden behind the clouds. Finishing the {link("descriptions.golem", "golem")} took you all night.

You find {link("descriptions.laura", "Laura")} waiting outside, already decked up in combat gear. You notice immediately she looks a little more fidgety than usual, although as soon as she sees you she tries to hide it.

{say(Laura)}"Hey. Is it done?"

* ["It is. Did something happen?"]Laura sighs. ->report
* ["It's done"]->golem
=report
    {say(Laura)} "The supplies we sent to the {link("descriptions.plemje", "Plemje")} - you know, the food and medicine - never arrived. Just got the report now."

"The transport golems?" You ask. Bandits who knew what they were doing could steal supplies; but supplies could be replaced. The golems less so.

{say(Laura)} "That's the weird part. They're just...missing."

* ["Fuck."]
    The transport golems were valuable. Laura nods emphathetically. "Emilija has the details."
* ["Missing?"]
    You frown. "That has to mean {link("descriptions.swarm", "Swarmers")}." Laura shrugs. "Maybe. Emilija has the details."
{go_to_emilija:
->->
}
-{not golem: 
* ["Want to see the golem first?"]
She smiles. "Bring it out, commander."
->golem
}
* ["Let's go find her then."]->go_to_emilija


=golem
You nod, and step aside to let the golem through. It lumbers out, straightening to its full height once outside. People stop around the camp to stare at it, some with more awe than others. Laura looks it up and down with a critical eye.

{say(Laura)} "Sweet sickle arms."

* ["You mean <i>sick</i> sickle arms. It's a harvest golem after all."]
Laura rolls her eyes at you, but can't help but smile.{alterLike(Laura, 1)}
* ["They're really sharp too. Had to be extra careful to make sure the no-harm protocol works."]
"Yes, good. Wouldn't want it accidentally 'harvesting' a bunch of kids." She grimaces.

- {not report:
She still looks uncomfortable.
* ["Hey, did something happen?"]->report
* ["Let's get going.] ->go_to_emilija
 - else:
 {say(Laura)}"Anyway. Emilija and Gregor are waiting." She still looks fidgety.
 * ["Let's go."]->go_to_emilija
 }

= go_to_emilija
#changeportrait
{briefing.golem: 
The golem makes to follow, until you command it to stop and return to the workshop. <>
- else:
You can sense the golem wanting to follow you, but you wordlessly order it to stay in the workshop. <>
}
You don't need it for the briefing.

The camp is bustling, even so early in the morning. Most nod at you as you pass by. Some smile. Some stare openly. You try to ignore them.

{not briefing.report:
As you walk, Laura's fidgeting becomes more pronounced, until she blurts out:->report->

"Let's go find her then."->emilija
- else:
-> emilija
}  
= emilija
You cross the courtyard and enter into the golem-built command centre; a fancy name for what is essentially a roof over their head to keep the paper maps dry. Inside, you find the two other members of your crew: {link("descriptions.emilija", "Emilija")} and {link("descriptions.gregor", "Gregor")}.
    
    As you enter, they both look up. You can see Emilija, especially, looks sour.
    
    {say(Emilija)}"Did you hear? I bet it was {link("descriptions.jadzia", "Jadzia")}."
    
    * (agree)[Agree.]
    "They're the largest band of brigands in the area. And they're not afraid of Golems." You sigh, rubbing your eyes. {alterLike(Emilija, 1)}
    * (disagree)[Disagree]
    "She made a deal, and I don't believe she'd break it. Not for such a modest haul." Jadzia is above all a pragmatist.
    * (swarmers)["It was swarmers"]
     "No. The transport golems are missing. Only swarmers destroy the golems." Although 'destroy' is perhaps too kind a word. 'Infect' more like.
    * ["We don't know that."]->disagree

- {agree:
"We can't give her the golem now." Emilija pressed. "It would make us look weak."
- else: 
Emilija looks unconvinced. "We don't know she didn't. If we give her the golem, we'll look like fools."
}

You look at the others. Laura folds her arms, looking like she wants to say something. Gregor looks, as he often does, vaguely confused.

* ["What do you think, Gregor?"]
{say(Gregor)}He looks a bit uncomfortable for a moment. "Why do we need to give anyone golems in the first place? Can't we just keep them?"

{say(Laura)}Before you have time to say anything, Laura interjects. "The golems help people, and that's what we're here to do. Help people."

Gregor frowns.

* ["Laura? Input?"]

{say(Laura)}"I say we go to the site and check it out. See what it looks like. We've got a rough location."

* ["You're right, Emilija"]
"We can give it to the Plemje instead - to make up for the missing supplies."{alterLike(Emilija, 1)}

- "Anyway. We can see what the situation is like in the field." You subtly change the tone of your voice. "Everybody packed and ready?"

{say(Emilija)} "Ready, Commander."

{say(Laura)} "Yup."

{say(Gregor)} "I'm ready."

You take a deep breath. "Then let's get going."
    
->DONE


=== caravan_ambush_spot ===
~setBackground(forest)
{say(Emilija)} "So this is the last location the transport golems reported?"

It is an unassuming patch of overgrown former urbanity. The asphalt still visible here and there through the grass is patchwork; a few bare-boned ruins struggle to stand against the encroaching forest.

{say(MC)} "Spread out. Try to find any sign of what happened. Tracks, remains, bullet casings..."

{say(Laura)} "On it."

Your team disperses.->gather

=gather
{link("caravan_chat", "Ping")}

* -> continue
* [Find Emilija]
You find her some ways down the road, inspecting a set of muddy prints. You can immediately tell they belong to your flat-footed transport golems.

{say(Emilija)} "These are the last prints I can find. They look normal. No panic mode." She stands up, grimacing slightly. "They don't continue after this patch of asphalt. So they definitely disappeared here."

{briefing.emilija.agree:
She sighs. "It's possible we're wrong. This looks almost too clean for Jadzia."
- else: "You might've been right. This looks too clean for Jadzia - or any bandit."
}
->gather
* [Find Laura]
Laura is crouching in the middle of the area. When she sees you approach, she stands up, holding something in her hand.

{say(Laura)} "Calcified smartmatter. Must have been chipped off during the attack." She shows it to you. It is inert, robbed of the complicated molecular structure that made it smart. Now it was just like any other dumb matter.

{say(MC)} "One would think there'd be more."

{say(Laura)}Laura nods glumly.
->gather

* [Find Gregor]
You find Gregor standing in front of one of the ruined buildings, staring at it. A quick glance at it tells you little of what it once was. Perhaps a small kiosk of some kind?

{say(Gregor)} "What was this used for?"

{say(MC)} "It looks like it might have been a kiosk. For selling things." There were gaping big windows. A counter covered in moss. The roof was missing; probably it had been covered in smartmatter solar cells, long since cannibalized by Swarmers.

{say(Gregor)} "I wish I could've seen it."

** ["Forget about the past, Gregor. Focus on the future."]
{say(MC)}
Gregor sighs.
{say(Gregor)} "It's just so sad, that's all."

->nopast
** ["I'm afraid you might've been underwhelmed."]
{say(MC)} You remember what your own parents told you growing up. Consumption for the sake of consumption. Mindless adherence to apocalyptic greed. 

->nopast

** ["Me too."] ->quiet

** [Say nothing]->quiet

-(nopast)
{say(MC)}"Don't get caught up in the past. We can't change it."

Gregor seems to think about that for a second, then nods. {say(Gregor)} "Right."
->gather

-(quiet)
{say(MC)} You quietly watch the ruin for a few moments, until you pat Gregor's shoulder.

"Let's get back to it."

{say(Gregor)} "Huh? Oh, yeah. Let's!"
->gather

=continue
You gather everyone back at the center of the area.

{say(MC)} "It looks like a Swarmer attack. Too quick for them to send out a distress signal." You nod at Laura. "They blobbed them, infected them, and took them away - supplies and all."

{say(Emilija)} "I don't like it." The old soldier frowns, resting her hands in her combat vest pockets. "It feels too much like an ambush for Swarmers."

You all look at each other, quietly acknowledging your collective fear.

{say(Laura)} "...we can't know for sure yet. It could just have been bad luck. Or very smart bandits."

{say(MC)} "Either way, I think we can conclude this wasn't a supply run by Jadzia. So let's get moving." You give Emilija a pointed look. She shrugs, looking away.

->DONE