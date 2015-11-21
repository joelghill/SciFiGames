--[[
	Joel Hill
	joel.hill.87@gmail.com
	September 26th, 2015
]]

require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")
require("player")

currentLevel = 1
player = nil
level = nil

--[[
	This function is called exactly once at the beginning of the game.
	Any assets you need (images, sounds, etc) should be loaded here.
]]
function love.load()
	print("GAME LOADING......") -- this is printed on the console that opens in another window.
	loadCurrentLevel()
	player = newPlayer(level)
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

	if love.keyboard.isDown( 'd' ) then
		moveRight(player, dt)
	end

	if love.keyboard.isDown( 'a' ) then
		moveLeft(player, dt)
	end

	if love.keyboard.isDown( 'w' ) then
		jump(player, dt)
	end
	
	if love.keyboard.isDown( 'n' ) then
		onLevelEnd()
	end

	gravity(player, dt)

end

function newPlayer(level)
	p= {
		x = level.startX, 
		y = level.startY, 
		img = nil, 
		walk = 128, 
		jump = 288,
		accel = 725, 
		ySpeed = 0, 
		xSpeed = 0,
		width = 0,
		height = 0
	}
	p.img = love.graphics.newImage("Images/guy.png")
	p.width = p.img:getWidth()
	p.height = p.img:getHeight()
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
	if hasNextLevel() then
		loadNextLevel()
	end
		
end

function loadCurrentLevel()
	level = Levels[currentLevel]
	if level ~= nil then
		LoadLevel(level)
		player = newPlayer(level)
	end
end

function hasNextLevel()
	return currentLevel <= table.getn(Levels)
end

function loadNextLevel()
	currentLevel = currentLevel + 1
	loadCurrentLevel()
end




