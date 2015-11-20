
--Level is initially defined as an empty table
Level = {}

--This function is added to the table
-- Returns a new level instance with a tilemap table and image path
Level.New = function(map, path, startX, startY)
	local self = {}
	self.tilemap = map
	self.imagePath = path
	self.startX = startX
	self.startY = startY
	return self
end
