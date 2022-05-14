
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local imagedata = love.image.newImageData(256, 256)

local info = Info(imagedata)

Map(info, function()
	local t = math.max(1 - (info.xd^2 + info.yd^2)^0.5, 0)
	if t == 0 then
		return 0, 0, 0, 0
	elseif t <= 0.25 then
		local c = t/0.25
		return c, c, c, c
	else
		local c = 1.0 - 0.1*t^2
		return c, c, c, 1
	end
end)

return imagedata
