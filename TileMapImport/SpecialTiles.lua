

damageTiles = {}
damageTiles[1] = 100;


pointTiles = {}
pointTiles[1] = 400
pointTiles[13] = 100

finishLevel = 14

function isKillTile(index)
	return damageTiles[index] > 0;
end

function getDamage(index)
	return damageTiles[index]
end

function getPoints(index)
	return pointTiles[index] 
end

function isEndOfLevel(index)
	return index == finishLevel
end






