INCLUDE ggj2020_functions.ink

// This lets you debug things, for example, we will have it go to the "start" knot from here
// When you want to test your other knots, change the point it goes to!
VAR debug = false
{debug:
->start
}

== debugKnot
>>THE DEBUG KNOT<<
Use this knot to go to any place you've written about, instead of ending.
+ [Start] ->start
+ [The Bone Zone]->the_bone_zone

// Example test story for GGJ2020

== start
// first place the story will go, put the 'choose your profession' stuff here
Probably write in second person, easiest to get into. Note - paragraphs are displayed separately.

So there's a "pause" between this and the above, and the below. This can also be disabled if you prefer.

* [Use brackets for options, that means the option text disappears (+1 Artifice)]
    ~artifice += 1
    Artifice +1!
* [Weaves are useful for short option lists (+1 Mettle)]
    ~mettle += 1
    Mettle +1!
* [Only use this method of setting a variable when you set its initial value (25 coins)]
    ~coins = 25
    Coins + 25!
- This is a gather, it means no matter what you picked above it goes back to this point.

You can now continue with more options. Let's try one with a skillcheck.

* [Pay your way out. Coins: {displayCheck(coins, 30)}]
    {resourceCheck(coins, 30, -5):
    You did it, despite not having enough money! Note that you now lost all your coin. I think I will make a UI element tell you this, so you might not need to mention it in the text. (Coins = 0).
    - else:
    Oh no, you failed, and lost 5 coins!
    }
* [Let's try a skill check! Mettle: {displayCheck(mettle, 1)}]
    {skillCheck(mettle, 1):
    In this case, if you have the skill, you always succeed.
    - else:
    ...and if you don't, you always fail!
    }
* {artifice > 0} [We only display this is you have at least one point of artifice]
    This was clearly the right choice, but you lost some mettle. Of course, you have no mettle, so using ~mettle -=1 would put you in the negative. Let's instead use alter, which is safe. You can use "alter(mettle)", 1) to add one as well.
    {alter(mettle, -1)}

- Another gather! All right, let's call this the end of the initial 'start' stuff - the next piece of story would run from the game, not this file, so we put it in a different knot below. This ends, and the text box disappears. Use \->DONE to end things (Inky will complain about it anyway).

// Instead of using done, we can also have you go to a debug knot so you can test things like multiple visits to the same place etc.
{debug:->debugKnot}

->DONE 

== the_bone_zone
So this place would be called to from the game, when you reach the bone zone. A bunch of things to keep in mind. This text would be shown every time.

{not question_time:
This text is shown before you've been to question time, so practically the first time you visit..
}

{the_bone_zone > 1:
This text only when you've visited at least once.
}
Remember you also need to divert to your local stitches. -> question_time

= question_time
If you want a recurring list of options, this is one way of doing it.

* [Options with an asterix are only shown once!!]
    {alter(coins, 25)} More coins (+25).
    -> question_time
+ [Sticky options. Can be used many times.]
    {alter(coins, 1)} You find a coin! (Coins +1)
    -> question_time
+ [Exit. You want this to be sticky!]
    -> leave_bone_zone

= leave_bone_zone
I would suggest having this as a stitch, so you can write some appropriate leaving stuff.

// Instead of using done, we can also have you go to a debug knot so you can test things like multiple visits to the same place etc.
{debug:->debugKnot}
->DONE
    
