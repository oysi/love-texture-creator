
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

local grid = Grid(info)

grid:edges(12)

local highest_dist = 0

Map(info, function()
	local dist_x = 1 - math.abs(info.xd)
	local dist_y = 1 - math.abs(info.yd)
	
	local dist = math.min(dist_x, dist_y)
	
	if dist > highest_dist then
		highest_dist = dist
	end
	
	return 0, 0, 0, 0
end)

Map(info, function()
	local t = 0
	
	local dist_x = 1 - math.abs(info.xd)
	local dist_y = 1 - math.abs(info.yd)
	
	local dist = math.min(dist_x, dist_y)/highest_dist
	
	t = (1 - dist)^3 * 0.5
	
	return 0, 0, 0, t
end)


return imagedata
