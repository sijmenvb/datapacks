# run as the player

# this function ends the conversation with a npc

# stop the labrat conversation
scoreboard players set CE_mannager CE_group_00 0
scoreboard players set CE_mannager lab_rat 0

# reset the last node 
scoreboard players set @s CE_current_node 0
# also reset the trigger
scoreboard players set @s CE_trigger 0

# set lab_rat score of player that was talking to this villager back to 0
scoreboard players set @s lab_rat 0

say [ended the converstaion]