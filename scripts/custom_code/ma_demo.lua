-- flyaround ships are ships which perform a diamond shaped flyaround on creation

-- the behaviour itself is not amazing, but we achieve it in a very flexible way
-- instead of having hardcoded events which call eachother, we can define an array of
-- positions to fly to

flyaround_proto = {
	wait_start = -1
};

flyaround_proto.checkpoints = {
	{0, 0, 0},
	{0, 0, 2000}, -- +z (toward 180)
	{2000, 0, 0}, -- +x (toward 090)
	{0, 0, -2000}, -- -z
	{-2000, 0, 0}, -- -x
	{
		position = {0, 0, 0},
		action = function (caller)
			flyaround_proto.wait_start = caller:tick();
		end,
		finished = function (caller)
			return caller:tick() >= flyaround_proto.wait_start + 10; -- wait 10 ticks this time before advancing
		end
	},
	{
		action = function (caller) -- no pos given, just an action
			print("action only!");
		end
	},
	{
		position = {500, 0, 0},
		action = function(caller)
			print("That's all folks!");
			caller:spawnShip("kus_multiguncorvette", caller:position()); -- spawn a new one
			caller:HP(0); -- die
		end
	}
};

function flyaround_proto:update()
	if (self:tick() == 1) then -- on first tick, begin queue
		self:moveActionQueue(self.checkpoints);
	end
end

-- add it to multiguns, random choice
modkit.compose:addShipProto("kus_multiguncorvette", flyaround_proto);