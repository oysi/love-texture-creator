

if not love then
	print("lovec " .. arg[0]:match("(.+)[/\\]"))
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]"))
	return
end

--[==============================================[
	code
]==============================================]--

local force_new = false

function love.load(a, b)
	-- print("a")
	-- for i, v in pairs(a) do
	-- 	print(i, v)
	-- end
	-- print("b")
	-- for i, v in pairs(b) do
	-- 	print(i, v)
	-- end
end

require "./lib/Info"
require "./lib/Map"
require "./lib/Grid"
require "./lib/Bar"

print("Creating directories...")

love.filesystem.createDirectory("sources")
love.filesystem.createDirectory("textures")
love.filesystem.createDirectory("tga")

print("Checking lib...")

for _, file in ipairs(love.filesystem.getDirectoryItems("lib")) do
	local code = love.filesystem.read("lib/" .. file)
	local read = love.filesystem.read("sources/" .. file .. ".txt")
	if code ~= read then
		print("Libraries have been changed, re-creating all textures...")
		love.filesystem.write("sources/" .. file .. ".txt", code)
		force_new = true
	end
end

print("Checking...")
print("")

local files = love.filesystem.getDirectoryItems("src")

local verified = {}

for k, file in ipairs(files) do
	local func, err = love.filesystem.load("src/" .. file)
	if not func then
		error(err, 2)
	end
	
	local img_name = file:sub(1, -5) .. ".png"
	print("img_name", img_name)
	
	local code = love.filesystem.read("src/" .. file)
	local read = love.filesystem.read("sources/" .. file .. ".txt")
	
	local texture_file = love.filesystem.getInfo("textures/" .. img_name)
	
	print("texture_file", texture_file)
	
	if not texture_file or code ~= read or force_new then
		print(file .. " updating...")
		
		local t = os.clock()
		
		-- love.filesystem.remove("textures/" .. file:match("%d+") .. "*.png")
		
		local imagedata = func(file)
		
		-- imagedata:encode("png", file .. "_" .. imagedata:getWidth() .. "x" .. imagedata:getHeight() .. ".png")
		imagedata:encode("png", "textures/" .. img_name)
		imagedata:encode("tga", "tga/" .. file:sub(1, -5) .. ".tga")
		
		love.filesystem.write("sources/" .. file .. ".txt", code)
		
		t = os.clock() - t
		
		print(file .. " done! (" .. t .. "s)")
	end
	
	verified[img_name] = true
end

print("")
print("Checking done!")

print("Removing old textures...")

for k, file in ipairs(love.filesystem.getDirectoryItems("textures")) do
	if not verified[file] then
		print("Removing " .. "textures/" .. file .. "...")
		love.filesystem.remove("textures/" .. file)
	end
end

function love.update()
end

os.execute("explorer %appdata%\\LOVE\\love-texture-creator\\textures")

love.event.quit()

print("done!")
