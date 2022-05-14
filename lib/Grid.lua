
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

function Grid(info)
	local grid = {}
	
	for x = 0, info.w - 1 do
		grid[x] = {}
		for y = 0, info.h - 1 do
			grid[x][y] = {
				x = x;
				y = y;
				state = 0;
			}
		end
	end
	
	function grid:edges(w)
		for x = 0, w - 1 do
			for y = 0, info.h - 1 do
				grid[x][y].state = 1
				grid[info.w - 1 - x][y].state = 1
			end
		end
		for y = 0, w - 1 do
			for x = 0, info.h - 1 do
				grid[x][y].state = 1
				grid[x][info.h - 1 - y].state = 1
			end
		end
	end
	
	function grid:get(x, y)
		if self[x] then
			return self[x][y]
		end
	end
	
	-- function grid:getNearest()
	-- 	local queue = {}
	-- 	local done = {}
		
	-- 	local x = info.x
	-- 	local y = info.y
		
	-- 	local function add_queue(item)
	-- 		if item and not done[item] then
	-- 			done[item] = true
	-- 			queue[#queue + 1] = item
	-- 		end
	-- 	end
		
	-- 	local function check_sides(item)
	-- 		add_queue(self:get(item.x - 1, item.y))
	-- 		add_queue(self:get(item.x + 1, item.y))
	-- 		add_queue(self:get(item.x, item.y - 1))
	-- 		add_queue(self:get(item.x, item.y + 1))
	-- 	end
		
	-- 	local function check_corners(item)
	-- 		add_queue(self:get(item.x - 1, item.y - 1))
	-- 		add_queue(self:get(item.x - 1, item.y + 1))
	-- 		add_queue(self:get(item.x + 1, item.y - 1))
	-- 		add_queue(self:get(item.x + 1, item.y + 1))
	-- 	end
		
	-- 	queue[#queue + 1] = self[x][y]
		
	-- 	repeat
	-- 		-- check if found
	-- 		local best_dist = math.huge
	-- 		local best
	-- 		for i = 1, #queue do
	-- 			local v = queue[i]
	-- 			local d = ()
	-- 		end
	-- 	until true
		
		
	-- 	repeat
	-- 		local queue_new = {}
			
	-- 		check_sides()
	-- 		for i = 1, #queue do
	-- 			if queue[i].state == 1 then
	-- 				return queue[i]
	-- 			end
	-- 			queue[i] = nil
	-- 		end
	-- 		check_corners()
	-- 		for i = 1, #queue do
	-- 			if queue[i].state == 1 then
	-- 				return queue[i]
	-- 			end
	-- 			queue[i] = nil
	-- 		end
	-- 	until #queue == 0
	-- end
	
	-- function grid:getNearestDist()
	-- 	local item = self:getNearest()
	-- 	if not item then
	-- 		return
	-- 	end
	-- 	return ((info.x - item.x)^2 + (info.y - item.y)^2)^0.5
	-- end
	
	function grid:getNearestDist()
		if self[info.x][info.y].state == 1 then
			return 0
		end
		
		local best_d = math.huge
		local best
		
		for x = 0, info.w - 1 do
			for y = 0, info.h - 1 do
				if self[x][y].state == 1 then
					local d = ((info.x - x)^2 + (info.y - y)^2)^0.5
					if d < best_d then
						best_d = d
						best = self[x][y]
					end
				end
			end
		end
		
		return best_d
	end
	
	function grid:precalculate_temp()
		local queue = {}
		local done = {}
		local new_queue
		
		for x = 0, info.w - 1 do
			for y = 0, info.h - 1 do
				local item = self[x][y]
				if item.state == 1 then
					queue[#queue + 1] = item
					item.temp_dist = 0
				else
					item.temp_dist = math.huge
				end
			end
		end
		
		local function check(item, xoff, yoff)
			local target = self:get(item.x + xoff, item.y + yoff)
			if target and target.state == 0 then
				local temp_dist = item.temp_dist + (xoff^2 + yoff^2)^0.5
				if temp_dist < target.temp_dist then
					target.temp_dist = temp_dist
					if not done[target] then
						done[target] = true
						new_queue[#new_queue + 1] = target
					end
				end
			end
		end
		
		for wave = 1, math.huge do
			new_queue = {}
			
			for i = 1, #queue do
				local item = queue[i]
				
				check(item, -1, 0)
				check(item,  1, 0)
				check(item, 0, -1)
				check(item, 0,  1)
				
				check(item, -1, -1)
				check(item, -1,  1)
				check(item,  1, -1)
				check(item,  1,  1)
			end
			
			queue = new_queue
			
			if #queue == 0 then
				break
			end
		end
	end
	
	return grid
end
