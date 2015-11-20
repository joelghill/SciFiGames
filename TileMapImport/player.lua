require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")

function checkLeft(player)
	if map[math.ceil((player.y)/16)][math.ceil((player.x-1)/16)] == 0 and
	map[math.ceil((player.y+15)/16)][math.ceil((player.x-1)/16)] == 0 then
		return true
	end
end

function checkRight(player)
	if map[math.ceil((player.y)/16)][math.ceil((player.x+17)/16)] == 0 and
	map[math.ceil((player.y+15)/16)][math.ceil((player.x+17)/16)] == 0 then
		return true
	end
end

function checkDown(player)
	if map[math.ceil((player.y+16)/16)][math.ceil((player.x)/16)] == 0 and
	map[math.ceil((player.y+16)/16)][math.ceil((player.x+15)/16)] == 0 then
		return true
	end
end

function checkUp(player)
	if map[math.ceil((player.y-1)/16)][math.ceil((player.x)/16)] == 0 and
	map[math.ceil((player.y-1)/16)][math.ceil((player.x+15)/16)] == 0 then
		return true
	end
end

function moveLeft (player, dt)

	if checkLeft(player) then

		player.x = player.x - 64*dt

	else

		player.x = math.ceil(player.x)

	end	

end

function moveRight (player, dt)

	if checkRight(player) then

		player.x = player.x + 64*dt

	else

		player.x = math.ceil(player.x)

	end	

end

function moveDown (player, dt)

	if checkDown(player) then

		player.y = player.y + player.ySpeed*dt
		player.ySpeed = player.ySpeed + 0.1

	else

		offset = player.y - math.floor(player.y/16)*16
		player.ySpeed = 0
		player.y = player.y - offset

	end	

end

function moveUp (player, dt)

	if checkUp(player) and player.ySpeed == 0 then

		player.ySpeed = player.jump

	else

		--player.y = math.ceil(player.y)

	end	

end
