
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

Map(info, function()
	local c = 8/255
	return c, c, c, 1
end)


return imagedata
