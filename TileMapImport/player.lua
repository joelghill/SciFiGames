require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")

function checkLeft(player)
	if map[math.ceil((player.y)/16)][math.ceil((player.x-1)/16)] == 0 and
	map[math.ceil((player.y+player.height-1)/16)][math.ceil((player.x-1)/16)] == 0 then
		return true
	end
end

function checkRight(player)
	if map[math.ceil((player.y+1)/16)][math.ceil((player.x+17)/16)] == 0 and
	map[math.ceil((player.y+player.height-1)/16)][math.ceil((player.x+player.width+1)/16)] == 0 then
		return true
	end
end

function checkDown(player)
	if map[math.ceil((player.y+player.height)/16)][math.ceil((player.x+1)/16)] == 0 and
	map[math.ceil((player.y+player.height)/16)][math.ceil((player.x+player.width-1)/16)] == 0 then
		return true
	end
end

function checkUp(player)
	if map[math.ceil((player.y-1)/16)][math.ceil((player.x)/16)] == 0 and
	map[math.ceil((player.y-1)/16)][math.ceil((player.x+player.width-1)/16)] == 0 then
		return true
	end
end

function moveLeft (player, dt)

	if checkLeft(player) then

		player.x = player.x - player.walk*dt

	else

		offset = player.x - math.ceil(player.x/16)*16

		if offset > 1 then
			player.x = player.x + offset
		end

	end	

end

function moveRight (player, dt)

	if checkRight(player) then

		player.x = player.x + player.walk*dt

	else

		offset = player.x - math.ceil(player.x/16)*16

		if offset > 1 then
			player.x = player.x - offset
		end

	end	

end

function moveDown (player, dt)

	player.y = player.y + player.ySpeed*dt

	if checkDown(player) then

		--player.y = player.y + player.ySpeed*dt
		player.ySpeed = player.ySpeed + player.accel

	elseif player.ySpeed > 0 then

		offset = player.y - math.floor(player.y/16)*16
		player.ySpeed = 0

		if offset > 0 then
			player.y = player.y - offset + 1
		end

	end	

end

function moveUp (player, dt)

	if checkDown(player) then

	else

		player.y = player.y
		player.ySpeed = -player.jump

	end	

end
