// GLOBAL GAME JAM 2020 FUNCTIONS ET AL FILE

VAR testskill = 2
VAR artifice = 2
VAR insight = 1
VAR mettle = 4
VAR candour = 5
VAR theurgy = 1
VAR coins = 25

===function skillCheck(ref skill, requiredskill)===
~temp success = false
~temp percentageNeeded = (skill*100) / requiredskill
{skill >= requiredskill:
    ~percentageNeeded = 100
    ~success = true
- else:
    ~temp randomValue = RANDOM(1,100)
        {randomValue <= percentageNeeded:
            ~success = true
        }
    }
{success:
    <color=green>Success! ({percentageNeeded} %)</color>
- else:
    <color=red>Failure! ({percentageNeeded} %)</color>
}
~return success

===function resourceCheck(ref resource, requiredResources, resourcesLost)===
~temp success = skillCheck(resource, requiredResources)
{success: {alterValue(resource, -requiredResources, 0, 1000)} | {alterValue(resource, resourcesLost, 0, 1000)}}

===function displayCheck(ref skill, requiredskill)===
~temp chanceOfSuccess = (skill*100) / requiredskill
Chance of Success: <>
{chanceOfSuccess > 60:
<color=green><>
- else:
{chanceOfSuccess < 30:
<color=red><>
- else:
<color=yellow><>
}
}
{chanceOfSuccess}</color> %

===function alterValue(ref value, newvalue, min, max) ===
~temp finalValue = value + newvalue
{finalValue > max:
    ~value = max
- else: 
    {finalValue < min: 
    ~value = min
- else:
    ~value = value + newvalue
    }
}

=== function print_num(x) ===
// print_num(45) -> forty-five
{ 
    - x >= 1000:
        {print_num(x / 1000)} thousand { x mod 1000 > 0:{print_num(x mod 1000)}}
    - x >= 100:
        {print_num(x / 100)} hundred { x mod 100 > 0:and {print_num(x mod 100)}}
    - x == 0:
        zero
    - else:
        { x >= 20:
            { x / 10:
                - 2: twenty
                - 3: thirty
                - 4: forty
                - 5: fifty
                - 6: sixty
                - 7: seventy
                - 8: eighty
                - 9: ninety
            }
            { x mod 10 > 0:<>-<>}
        }
        { x < 10 || x > 20:
            { x mod 10:
                - 1: one
                - 2: two
                - 3: three
                - 4: four        
                - 5: five
                - 6: six
                - 7: seven
                - 8: eight
                - 9: nine
            }
        - else:     
            { x:
                - 10: ten
                - 11: eleven       
                - 12: twelve
                - 13: thirteen
                - 14: fourteen
                - 15: fifteen
                - 16: sixteen      
                - 17: seventeen
                - 18: eighteen
                - 19: nineteen
            }
        }
}