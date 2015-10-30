--[[
	Joel Hill
	joel.hill.87@gmail.com
	September 26th, 2015
]]

require("map")			-- we need map.lua and everything in it, so this line makes that happen!
require("levels")		-- we also need to know about the levels we've written. They're in levels.lua
require("SpecialTiles")

--[[
	This function is called exactly once at the beginning of the game.
	Any assets you need (images, sounds, etc) should be loaded here.
]]
function love.load()
	print("GAME LOADING......") -- this is printed on the console that opens in another window.
	LoadLevel(Levels[1]) 		-- found in map.lua. Loads images for level.
	--print(KillTiles["1"])
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
end
