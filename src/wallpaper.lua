
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

local e = 2.71828182845904523536
local pi = math.pi

local imagedata = love.image.newImageData(3840, 2160)

local info = Info(imagedata)

local canvas = love.graphics.newCanvas(3840, 2160)

local w = 3840
local h = 2160

love.graphics.setCanvas(canvas)

love.graphics.setColor(0, 0, 0)
love.graphics.rectangle("fill", 0, 0, w, h)

-- love.graphics.setColor(0, 1, 0)
-- love.graphics.rectangle("fill", 0, h - 48*2, w, 48*2)

-- love.graphics.rectangle("fill", w/2 - 100, h/2 - 100, 200, 200)

-- love.graphics.rectangle("fill", 0, 0, 100, 100)

love.graphics.setCanvas()

return canvas:newImageData()

-- Map(info, function()
-- 	if true then
-- 		return math.random(), math.random(), math.random(), 1
-- 	end
	
-- 	local xmin = 20*2
-- 	local xmax = (info.w - 1) - 20*2
-- 	local x = info.x - xmin
-- 	local xt = x/(xmax - xmin)
	
-- 	local ymin = 20*2
-- 	local ymax = (info.h - 1) - 20*2
-- 	local y = (info.h - 1 - info.y) - xmin
-- 	local yt = y/(xmax - xmin)
	
	
	
-- 	local x = info.x - 20
	
-- 	local ymin = 48*2 + 20*2
-- 	local ymax = 1080*2 - 20*2
-- 	local yt = ((info.h - 1 - info.y) - ymin)/(ymax - 1 - ymin)
	
-- 	local xmin = 20*2
-- 	local xmax = info.w - 20*2
-- 	local xt = (info.x - xmin)/(xmax - 1 - xmin)
	
-- 	local gray_dist = math.min(math.abs(xt*100), math.abs(yt*100), math.abs(1 - xt)*100, math.abs(1 - yt)*100)
-- 	local t = 1 - gray_dist/4
-- 	if t > 0 then
-- 		return t, t, t, 1
-- 	end
	
-- 	if (xt >= 0 and xt <= 1) and (yt >= 0 and yt <= 1) then
-- 		return 0, 0, 0, 1
-- 	else
-- 		return 0, 0, 0, 1
-- 	end
	
	
	
-- 	if true then
-- 		if xt == 1 then
-- 			return 1, 1, 0, 1
-- 		elseif xt == 0 then
-- 			return 1, 0, 1, 1
-- 		end
-- 		if xt >= 0 and xt <= 1 then
-- 			return 1, 1, 1, 1
-- 		else
-- 			return 0, 0, 0, 1
-- 		end
-- 	end
	
-- 	local y = (e^info.xt - 1)/(e - 1)
-- 	local dif = math.abs((1 - (-0.1 + 1.2*info.yt)) - y)
	
-- 	local t = 1/dif
	
-- 	local c = t*0.05*0.05
	
-- 	return c, c, c, 1
-- end)

-- return imagedata
