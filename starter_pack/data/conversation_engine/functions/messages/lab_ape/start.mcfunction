# always run by the NPC

# reset the boolean.
scoreboard players set bool CE_suc2 0
# if the player is already talking to this villager
    execute if entity @p[scores={CE_talking=1,lab_ape=1}] run scoreboard players set bool CE_suc2 1
    # make the tellraw the same as the last message so it repeats.
    execute if score bool CE_suc2 matches 1 as @p[scores={CE_talking=1,lab_ape=1}] run scoreboard players operation @s CE_trigger = @s CE_current_node

# unless there is already someone else talking to the villager  (note that 2 as boolean is also true) 
# TIP: turn the 2 into a 0 if you want multiple people to talk to the same npc at the same time
execute if entity @a[scores={lab_ape=1}] run scoreboard players set bool CE_suc2 2 
    execute if score bool CE_suc2 matches 2 run tellraw @p[scores={CE_talking=1}] {"text":"[someone is already talking to this NPC]","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"you'll have to wait your turn."}]}}
# else:

    # start the labrat conversation
    execute if score bool CE_suc2 matches 0 run scoreboard players set CE_mannager CE_group_00 1
    execute if score bool CE_suc2 matches 0 run scoreboard players set CE_mannager lab_ape 1

    # set the lab_ape score to 1 for the player.
    execute if score bool CE_suc2 matches 0 as @p[scores={CE_talking=1}] run scoreboard players set @s lab_ape 1



    # give the choises using the trigger command.
    execute if score bool CE_suc2 matches 0 run scoreboard players set @p[scores={lab_ape=1}] CE_trigger 1 

# set talking back to 0
scoreboard players set @p[scores={CE_talking=3}] CE_talking 0