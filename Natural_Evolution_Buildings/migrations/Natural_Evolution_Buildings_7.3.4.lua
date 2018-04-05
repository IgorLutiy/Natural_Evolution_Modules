
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	
	if technologies["bi_tech_bio_cannon"].researched then
		recipes["NE_rocket_turret"].enabled = true
		recipes["NE_rocket_turret"].reload()
	end

	
	
end
