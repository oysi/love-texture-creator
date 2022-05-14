
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

local pad = 8

Map(info, function()
	local c
	if info.y < pad then
		c = 1
	elseif info.y >= info.h - pad then
		c = 0.6
	else
		local t = (info.y - pad)/(info.h - pad*2 - 1)
		c = 0.9 - 0.2*t
	end
	return c, c, c, 1
end)

return imagedata
