
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local e = 2.71828182845904523536
local pi = math.pi

local W = 3840
local H = 2160

local imagedata = love.image.newImageData(W, H)

local info = Info(imagedata)

local canvas = love.graphics.newCanvas(W, H)

local function get_icon(i, j)
	local off_x = 22*2
	local off_y = 7*2
	
	local size_x = 32*2
	local size_y = 32*2
	
	local pad_x = 44*2
	local pad_y = 52*2
	
	return
		off_x + (size_x + pad_x)*(i - 1),
		off_y + (size_y + pad_y)*(j - 1),
		size_x,
		size_y
end

love.graphics.setCanvas(canvas)
local c = 8/255
love.graphics.clear(c, c, c, 1.00)

-- love.graphics.setColor(0, 0, 0, 1)
-- love.graphics.rectangle("fill", 0, 0, W, H)

love.graphics.setLineWidth(1)

local ICON_BORDER = 2

local grid = {
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0};
	{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0};
	{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0};
	{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1};
}

local grid = {
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0};
	{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0};
	{0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1};
}

for i = 1, 25 do
	for j = 1, 12 do
		local x, y, w, h = get_icon(i, j)
		-- if (i >= 4 and i <= 22 and j >= 4 and j <= 9)
		-- if i <= 3 or i >= 23 or j <= 3 or j >= 10 or (i >= 11 and i <= 15)
		-- or (i == 25 and j == 12)
		if grid[j][i] == 1 then
			-- love.graphics.rectangle("line", x, y, w, h)
			
			x = x - 2
			y = y - 2
			w = w + 4
			h = h + 4
			
			local c = 16/255
			love.graphics.setColor(c, c, c, 1)
			love.graphics.rectangle("fill", x, y, w, h)
			
			love.graphics.setColor(0.6, 0.6, 0.6, 1.0)
			love.graphics.rectangle("fill", x, y, ICON_BORDER, h)
			love.graphics.rectangle("fill", x, y, w, ICON_BORDER)
			
			love.graphics.setColor(0.4, 0.4, 0.4, 1.0)
			love.graphics.rectangle("fill", x + w - 2, y, ICON_BORDER, h)
			love.graphics.rectangle("fill", x, y + h - 2, w, ICON_BORDER)
		end
	end
end


local function print_shadow(text, x, y)
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.print(text, x + 2, y + 2)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.print(text, x, y)
end


-- Games
local x, y = get_icon(18, 3)

love.graphics.setNewFont("font/Roboto-Regular.ttf", 48)
print_shadow("Games", x, y - (48 + 52*2)/2)



-- Programs
local x, y = get_icon(18, 7)

love.graphics.setNewFont("font/Roboto-Regular.ttf", 48)
print_shadow("Programs", x, y - (48 + 52*2)/2)



-- Temp
local x, y = get_icon(3, 3)

love.graphics.setNewFont("font/Roboto-Regular.ttf", 48)
print_shadow("Temp", x, y - (48 + 52*2)/2)



-- Temp
-- local x, y = get_icon(19, 3)

-- love.graphics.setNewFont("font/Roboto-Regular.ttf", 48)
-- love.graphics.setColor(1, 1, 1, 1)
-- love.graphics.print("Temp", x, y - (48 + 52*2)/2)





-- love.graphics.setColor(0, 1, 0)
-- love.graphics.rectangle("fill", 0, h - 48*2, w, 48*2)

-- love.graphics.rectangle("fill", w/2 - 100, h/2 - 100, 200, 200)

-- love.graphics.rectangle("fill", 0, 0, 100, 100)

love.graphics.setCanvas()

return canvas:newImageData()
