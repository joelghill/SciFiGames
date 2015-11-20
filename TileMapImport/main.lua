--[[
	Joel Hill
	joel.hill.87@gmail.com
	September 26th, 2015
]]

require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")
require("player")


number = 0

currentLevel = 1
player = nil
level = nil

--[[
	This function is called exactly once at the beginning of the game.
	Any assets you need (images, sounds, etc) should be loaded here.
]]
function love.load()
	print("GAME LOADING......") -- this is printed on the console that opens in another window.
	level = Levels[currentLevel]
	LoadLevel(level) 		-- found in map.lua. Loads images for level.
	player = newPlayer(level)
	--print("Tile 1 is worth "..PointTiles[1] .. " points!")
	--print("Tile 2 is worth "..PointTiles[2] ..  " points!")
	
end


--[[
	Draw an image that was loaded in love.load 
	(putting love.graphics.newImage in love.draw would cause the image to be reloaded every frame, 
	which would cause issues).
]]
function love.draw()
	DrawLevel()		-- map.lua. Draws all images loaded when LoadLevel was called.
	drawPlayer()
end

function love.update(dt)

	number = map[math.ceil((player.y)/16)][math.ceil((player.x+17)/16)]

	if love.keyboard.isDown( 'd' ) then
		moveRight(player, dt)
	end

	if love.keyboard.isDown( 'a' ) then
		moveLeft(player, dt)
	end

	if love.keyboard.isDown( 's' ) then
		moveDown(player, dt)
	end

	if love.keyboard.isDown( 'w' ) then
		moveUp(player, dt)
	end
	
	if love.keyboard.isDown( 'n' ) then
		onLevelEnd()
	end

	moveDown(player, dt)

end

function newPlayer(level)
	p= {
		x = level.startX, 
		y = level.startY, 
		img = nil, 
		walk = 64, 
		jump = 164,
		 accel = 5, 
		 ySpeed = 0, 
		 xSpeed = 0
	}
	p.img = love.graphics.newImage("Images/guy.png")
	return p;
end

function drawPlayer()
	if player ~= nil then
		love.graphics.draw(player.img, player.x, player.y)
	end
end

function onPlayerDie()

end

function onLevelEnd()
	currentLevel = currentLevel + 1;
	level = Levels[currentLevel]
	if level ~= nil then
		LoadLevel(level)
		player = newPlayer(level)
	end
		
end



