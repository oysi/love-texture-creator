
if not love then
	os.execute("lovec " .. arg[0]:match("(.+)[/\\]+.-[/\\]+"))
	return
end

function Bar(info, totalw, w, flat)
	Map(info, function()
		local t = 1 - math.abs(info.yt*2 - 1)
		
		local xt = 0.5 - (1 - (1 - t)^2) / 20
		
		local px = xt*(info.w - 1)
		
		local dist = math.abs(info.x - px)
		
		local dt = 1 - dist/(w/2) * totalw/info.w
		
		if dt <= 0 then
			return 0, 0, 0, 0
		else
			local c
			if (flat) then
				c = 0.75 + 0.25*dt^0.5
			else
				c = 0.5 + 0.5*dt^0.5
			end
			-- local c = 0.25 + 0.75*dt^0.5
			-- if (flat) then
			-- 	c = 1;
			-- end
			local a = math.max(dt - 0.1, 0)*10
			return c, c, c, a
		end
	end)
end
