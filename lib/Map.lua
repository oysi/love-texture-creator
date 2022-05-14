
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

function Map(info, func)
	info.imagedata:mapPixel(function(x, y, r, g, b, a)
		-- core
		info.x = x
		info.y = y
		info.r = r
		info.g = g
		info.b = b
		info.a = a
		
		-- secondary
		info.xt = x/(info.w - 1)
		info.yt = y/(info.h - 1)
		
		-- tertiary
		info.xd = (info.xt - 0.5)*2
		info.yd = (info.yt - 0.5)*2
		
		-- return
		return func()
	end)
end
