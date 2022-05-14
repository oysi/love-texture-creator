
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

Map(info, function()
	if math.abs(info.xd) >= 0.5 or math.abs(info.yd) >= 0.5 then
		return 1, 1, 1, 1
	else
		return 0, 0, 0, 0
	end
end)

return imagedata
