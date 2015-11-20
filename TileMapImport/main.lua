--[[
	Joel Hill
	joel.hill.87@gmail.com
	September 26th, 2015
]]

require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")

guy = {x = 100, y = 100, img = nil}

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

function moveLeft (player, dt)

	if(map[math.ceil((guy.x-1)/16)][math.ceil((guy.y)/16)] <= 1) and guy.x > 1 then

		guy.x = guy.x - 10*dt

	end	

end

--[[
	Draw an image that was loaded in love.load 
	(putting love.graphics.newImage in love.draw would cause the image to be reloaded every frame, 
	which would cause issues).
]]
function love.draw()
	DrawLevel()		-- map.lua. Draws all images loaded when LoadLevel was called.
	love.graphics.draw(guy.img, guy.x, guy.y)
end

function love.update(dt)

	moveLeft(guy, dt)

end
