
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

local pad = 8

Map(info, function()
	local c = 0.6 + 0.1*(1 - math.abs(info.yd)^2)
	return c, c, c, 1
end)

return imagedata
