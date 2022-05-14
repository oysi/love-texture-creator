
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

function Info(imagedata)
	local info = {}
	
	info.imagedata = imagedata
	
	info.w = imagedata:getWidth()
	info.h = imagedata:getHeight()
	
	return info
end
