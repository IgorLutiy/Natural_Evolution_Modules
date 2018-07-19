if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.NE_Difficulty = settings.startup["NE_Difficulty"].value

------------------------------------------------------------------------------------------


local ne_mega_tint_1 = {r=0, g=0, b=0, a=0.85}	-- Black
local ne_mega_tint_2 = {r=1, g=0, b=0, a=0.5} -- Red
local ne_scale = 3

-- Loot - Only apply is Leet is enabled.	
if settings.startup["NE_Alien_Artifacts"].value == true then
	mega_loot = 
		{
			{
			  item = "alien-artifact",
			  count_min = math.floor(3/NE_Enemies.Settings.NE_Difficulty),
			  count_max = math.floor(5/NE_Enemies.Settings.NE_Difficulty),
			}
		}
else
	mega_loot = {}
end
	
------------------------- Units --------------------

	--- Megladon Biter
	NE_Megladon_Unit = table.deepcopy(data.raw.unit["ne-biter-base-unit"])
    NE_Megladon_Unit.name = "ne-biter-megladon"
	NE_Megladon_Unit.collision_box = {{-0.8, -0.8}, {0.8, 0.8}}
	NE_Megladon_Unit.selection_box = {{-2.4, -2.7}, {2.75, 0.5}}
	NE_Megladon_Unit.drawing_box = {{-5.0, -5.5}, {5.0, 2.5}}
    NE_Megladon_Unit.max_health = 15000 + (5000 * NE_Enemies.Settings.NE_Difficulty)
	NE_Megladon_Unit.healing_per_tick = 0 -- Does not heal (negative currently does not work)
	NE_Megladon_Unit.loot = mega_loot	
	NE_Megladon_Unit.min_pursue_time = 50 * 60  -- v 10 * 60
    NE_Megladon_Unit.max_pursue_distance = 200  -- v 50
	NE_Megladon_Unit.vision_distance = 100 -- v 30
    NE_Megladon_Unit.movement_speed = 0.3 -- v 0.17,
    NE_Megladon_Unit.distance_per_frame = 0.5 -- v0.2,
	NE_Megladon_Unit.corpse = "ne-megladon-corpse"
	NE_Megladon_Unit.attack_parameters = NE_Biter_Melee_Single_Attack(
						{
							range = 2,
                            cooldown = 35,
							damage_modifier = NE_Enemies.Settings.NE_Difficulty,
                            damage_amount_1 = 1, -- Will update to all attacks later in code
							damage_type_1 = "physical",
                            scale = ne_scale,
                            tint1 = ne_mega_tint_1,
							tint2 = ne_mega_tint_2,
							sound = 1.5
						})
	NE_Megladon_Unit.run_animation = ne_biter_run_animation(ne_scale, ne_mega_tint_1, ne_mega_tint_2)
	NE_Megladon_Unit.localised_name = {"entity-name.ne-biter-megladon"}
	NE_Megladon_Unit.localised_description = {"entity-description.ne-biter-megladon"}
    
	data:extend{NE_Megladon_Unit}

	
	---- Corpses

	NE_Biter_Megladon_Unit_Corpse = table.deepcopy(data.raw.corpse["small-biter-corpse"])
    NE_Biter_Megladon_Unit_Corpse.name = "ne-megladon-corpse"
	NE_Biter_Megladon_Unit_Corpse.selection_box = {{-2.4, -2.7}, {2.75, 0.5}}
	NE_Biter_Megladon_Unit_Corpse.animation = ne_biter_die_animation(ne_scale, ne_mega_tint_1, ne_mega_tint_2)
    
	data:extend{NE_Biter_Megladon_Unit_Corpse}






  
