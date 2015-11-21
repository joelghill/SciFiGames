require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")

-- Returns the highest tile number on the player's left edge
function checkLeft(player)
	top = map[math.ceil((player.y)/16)][math.ceil((player.x-1)/16)]
	bottom = map[math.ceil((player.y+player.height-1)/16)][math.ceil((player.x-1)/16)]
	
	if top > bottom then
		return top
	else
		return bottom
	end

end

-- Returns the highest tile number on the player's right edge
function checkRight(player)
	top = map[math.ceil((player.y+1)/16)][math.ceil((player.x+17)/16)]
	bottom = map[math.ceil((player.y+player.height-1)/16)][math.ceil((player.x+player.width+1)/16)]
	
	if top > bottom then
		return top
	else
		return bottom
	end

end

function checkDown(player)
	right = map[math.ceil((player.y+player.height)/16)][math.ceil((player.x+1)/16)]
	left = map[math.ceil((player.y+player.height)/16)][math.ceil((player.x+player.width-1)/16)]
	
	if right > left then
		return right
	else
		return left
	end
end

function checkUp(player)
	left = map[math.ceil((player.y-1)/16)][math.ceil((player.x)/16)]
	right = map[math.ceil((player.y-1)/16)][math.ceil((player.x+player.width-1)/16)]
	
	if right > left then
		return right
	else
		return left
	end
	
end

function moveLeft (player, dt)

	if checkLeft(player) == 0 then

		player.x = player.x - player.walk*dt

	else

		offset = player.x - math.ceil(player.x/16)*16

		if offset > 1 then
			player.x = player.x + offset
		end

	end	

end

function moveRight (player, dt)

	if checkRight(player) == 0 then

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

	if checkDown(player) == 0 then

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

	if checkDown(player) == 0 then

	else

		player.y = player.y
		player.ySpeed = -player.jump

	end	

end
