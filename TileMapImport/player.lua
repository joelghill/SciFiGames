require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")

function onScreen ()

	if player.x > 1 and 
	player.x + player.width + 1 < getPixelWidth() and
	player.y+player.height < getPixelHeight() and
	player.y > 1 then
		
		return true
	else
		return false
	end

end

-- Returns the highest tile number on the player's left edge
function checkLeft(player)
	if onScreen () then
		top = map[math.ceil((player.y)/16)][math.ceil((player.x-1)/16)]
		bottom = map[math.ceil((player.y+player.height-1)/16)][math.ceil((player.x-1)/16)]
	else
		return 0
	end
	
	if top > bottom then
		return top
	else
		return bottom
	end

end

-- Returns the highest tile number on the player's right edge
function checkRight(player)

	if onScreen () then
		love.graphics.print(getPixelWidth(),0,0)
		top = map[math.ceil((player.y+1)/16)][math.ceil((player.x+player.width+1)/16)]
		bottom = map[math.ceil((player.y+player.height-1)/16)][math.ceil((player.x+player.width+1)/16)]
	else
		return 0
	end
	
	if top > bottom then
		return top
	else
		return bottom
	end

end

function checkDown(player)
	
	if onScreen () then
		right = map[math.ceil((player.y+player.height)/16)][math.ceil((player.x+2)/16)]
		left = map[math.ceil((player.y+player.height)/16)][math.ceil((player.x+player.width-2)/16)]
	elseif player.y+player.height < love.graphics.getHeight() then
		return 0
	else
		onPlayerDie()
		return 0
	end
	
	if right > left then
		return right
	else
		return left
	end
end

function checkUp(player)
if onScreen () then
	y1 = math.ceil((player.y-1)/16)
	x1 = math.ceil((player.x)/16)
	y2 = math.ceil((player.y-1)/16)
	x2 = math.ceil((player.x+player.width-1)/16)
	left = map[y1][x1]
	right = map[y2][x2]
end	
	if right > left then
		return right
	else
		return left
	end

end

function noCollideLeft()

	if checkLeft(player) == 0 or
		checkLeft(player) == 21 or
		checkLeft(player) == 24 then
			return true
	else
		return false
	end
end

function moveLeft (player, dt)

	if noCollideLeft() then

		player.x = player.x - player.walk*dt

	else

		offset = player.x - math.ceil(player.x/16)*16

		if offset > 0 then
			player.x = player.x + offset + 2
		end

	end	

end

function noCollideRight()

	if checkRight(player) == 0 or
		checkRight(player) == 21 or
		checkRight(player) == 24 then
			return true
	else
		return false
	end
end

function moveRight (player, dt)

	if noCollideRight() then

		player.x = player.x + player.walk*dt

	else

		offset = player.x - math.ceil(player.x/16)*16

		if offset > 1 then
			player.x = player.x - offset
		end

	end	

end

function noCollideDown()

	if checkDown(player) == 0 or
		checkDown(player) == 21 or
		checkDown(player) == 24 then
			return true
	else
		return false
	end
end

function gravity (player, dt)

	player.y = player.y + player.ySpeed*dt

	if noCollideDown() then

		--player.y = player.y + player.ySpeed*dt
		player.ySpeed = player.ySpeed + player.accel*dt

	else--if player.ySpeed > 0 then

		offset = (player.y + player.height ) - math.floor((player.y + player.height )/16)*16
		player.ySpeed = 0

		if offset > 1 then
			player.y = player.y - offset 
		end

	end	

end

function jump (player, dt)

	if noCollideDown() then

	else

		player.y = player.y
		player.ySpeed = -player.jump

	end	

end
