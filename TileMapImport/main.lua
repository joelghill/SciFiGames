--[[
	Joel Hill
	joel.hill.87@gmail.com
	September 26th, 2015
]]

require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")
require("player")

guy = {x = 1, y = 1, img = nil, walk = 64, jump = 164, accel = 5, ySpeed = 0, xSpeed = 0}
number = 0

--[[
	This function is called exactly once at the beginning of the game.
	Any assets you need (images, sounds, etc) should be loaded here.
]]
function love.load()
	print("GAME LOADING......") -- this is printed on the console that opens in another window.
	LoadLevel(Levels[1]) 		-- found in map.lua. Loads images for level.
	--print(KillTiles["1"])
	x, y = getIndex(1,1)
	print(map[x][y])
	--print("Tile 1 is worth "..PointTiles[1] .. " points!")
	--print("Tile 2 is worth "..PointTiles[2] ..  " points!")
	guy.img = love.graphics.newImage("Images/guy.png")
end


--[[
	Draw an image that was loaded in love.load 
	(putting love.graphics.newImage in love.draw would cause the image to be reloaded every frame, 
	which would cause issues).
]]
function love.draw()
	DrawLevel()		-- map.lua. Draws all images loaded when LoadLevel was called.
	love.graphics.draw(guy.img, guy.x, guy.y)
	love.graphics.print(number,0, 40)
	love.graphics.print(guy.y,0, 0)
	love.graphics.print(guy.x,0, 20)
end

function love.update(dt)

	number = map[math.ceil((guy.y)/16)][math.ceil((guy.x+17)/16)]

	if love.keyboard.isDown( 'd' ) then
		moveRight(guy, dt)
	end

	if love.keyboard.isDown( 'a' ) then
		moveLeft(guy, dt)
	end

	if love.keyboard.isDown( 's' ) then
		moveDown(guy, dt)
	end

	if love.keyboard.isDown( 'w' ) then
		moveUp(guy, dt)
	end

	moveDown(guy, dt)

end
