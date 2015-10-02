
--Level is initially defined as an empty table
Level = {}

--This function is added to the table
-- Returns a new level instance with a tilemap table and image path
Level.New = function(map, path)
	local self = {}
	self.tilemap = map
	self.imagePath = path
	return self
end
