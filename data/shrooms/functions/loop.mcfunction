###################################
########## Loop Function ##########
###################################

##### Shroomie #####

effect give @e[tag=Invisible] invisibility 1 1 true

execute as @e[tag=Shroomie,type=wolf] at @s store result entity @e[tag=Shroomie,type=armor_stand,limit=1,sort=nearest] Rotation[0] float 1 run data get entity @s Rotation[0]

execute as @e[type=item,nbt={Item:{tag:{shroomie_dead:1b}}}] at @s run function shrooms:shroomie/death

execute at @e[tag=Shroomie,type=wolf,nbt={Sitting:1b}] as @e[tag=Shroomie,type=armor_stand,sort=nearest,limit=1] as @s[nbt={ArmorItems:[{},{},{},{id:"minecraft:honeycomb",tag:{CustomModelData:2220801}}]}] run item replace entity @s armor.head with honeycomb{CustomModelData:2220802}
execute at @e[tag=Shroomie,type=wolf,nbt={Sitting:0b}] as @e[tag=Shroomie,type=armor_stand,sort=nearest,limit=1] as @s[nbt={ArmorItems:[{},{},{},{id:"minecraft:honeycomb",tag:{CustomModelData:2220802}}]}] run item replace entity @s armor.head with honeycomb{CustomModelData:2220801}


##### Shroomer #####

execute as @e[nbt={Item:{id:"minecraft:brown_mushroom_block",Count:64b}}] at @s as @e[nbt={Item:{id:"minecraft:mushroom_stem",Count:64b}},sort=nearest,limit=1,distance=..1] at @s as @e[nbt={Item:{id:"minecraft:totem_of_undying"}},sort=nearest,limit=1] at @s run function shrooms:shroomer/summon

execute as @e[tag=Shroomer,type=vindicator] run data modify entity @s Rotation[1] set value 0f

execute as @e[type=item,nbt={Item:{tag:{shroomer_dead:1b}}}] at @s run function shrooms:shroomer/death



##### Right Click Triggers #####


execute as @a[scores={shrooms.rclick=1..},nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{ctc:{id:'shroomie', from:'hexuar:shroomified'}}}}] at @s run function shrooms:shroomie/summon
execute as @a[scores={shrooms.rclick=1..}] run scoreboard players set @s shrooms.rclick 0
