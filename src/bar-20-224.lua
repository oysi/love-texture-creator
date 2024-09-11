
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

Bar(info, 224, 20)

return imagedata
