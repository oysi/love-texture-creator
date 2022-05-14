
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

local grid = Grid(info)

grid:edges(12)

local highest = -math.huge
local lowest = math.huge

grid:precalculate_temp()

local high_temp_dist = 0

for x = 0, info.w - 1 do
	for y = 0, info.h - 1 do
		local item = grid[x][y]
		if item.temp_dist > high_temp_dist then
			high_temp_dist = item.temp_dist
		end
	end
end

Map(info, function()
	local t = 0
	
	local temp_dist = grid[info.x][info.y].temp_dist
	
	if temp_dist == 0 then
		t = 1
	else
		t = (1 - temp_dist/high_temp_dist)^2*0.5
	end
	
	return 0, 0, 0, t
end)


return imagedata
