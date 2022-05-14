
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(1920, 1080)

local info = Info(imagedata)
local grid = Grid(info)

local function rectangle(x, y, w, h)
end

Map(info, function()
	local block = grid:get(info.x, info.y)
	if block.state == 1 then
		return 1, 1, 1, 1
	else
		return 0, 0, 0, 1
	end
end)

return imagedata
