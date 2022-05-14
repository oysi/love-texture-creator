
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]"))
	return
end

local force = false

print("Creating directories...")

love.filesystem.createDirectory("src_cache")
love.filesystem.createDirectory("lib_cache")

love.filesystem.createDirectory("png")
love.filesystem.createDirectory("tga")

print("Checking lib...")

for _, file in ipairs(love.filesystem.getDirectoryItems("lib")) do
	local code = love.filesystem.read("lib/" .. file)
	local cache = love.filesystem.read("lib_cache/" .. file)
	
	local func, err = loadstring(code)
	if not func then
		error(err)
	end
	func()
	
	if code ~= cache then
		print("Libraries have been changed, re-creating all textures...")
		love.filesystem.write("lib_cache/" .. file, code)
		force = true
	end
end

print("Checking src...")

local verified = {}

for _, file in ipairs(love.filesystem.getDirectoryItems("src")) do
	local name = file:sub(1, -5)
	local code = love.filesystem.read("src/" .. file)
	local cache = love.filesystem.read("src_cache/" .. file)
	
	if code ~= cache
	or force
	or not love.filesystem.getInfo("png/" .. name .. ".png")
	or not love.filesystem.getInfo("tga/" .. name .. ".tga")
	then
		local func, err = loadstring(code)
		if not func then
			error(err)
		end
		
		local t = os.clock()
		
		local imagedata = func()
		
		imagedata:encode("png", "png/" .. name .. ".png")
		imagedata:encode("tga", "tga/" .. name .. ".tga")
		
		love.filesystem.write("src_cache/" .. file, code)
		
		t = os.clock() - t
		
		print(name .. " done! (" .. string.format("%.0f ms", t*1000) .. ")")
	end
	
	verified[name] = true
end

for _, file in ipairs(love.filesystem.getDirectoryItems("png")) do
	if not verified[file:sub(1, -5)] then
		love.filesystem.remove("png/" .. file)
	end
end

for _, file in ipairs(love.filesystem.getDirectoryItems("tga")) do
	if not verified[file:sub(1, -5)] then
		love.filesystem.remove("tga/" .. file)
	end
end

os.execute('powershell "' .. arg[1] .. "\\open-explorer.ps1" .. '"')

print("Done!")

love.event.quit()
