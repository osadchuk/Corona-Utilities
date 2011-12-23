--[[
	Copyright 2011 Darren Osadchuk
	Licensed under the MIT license
	
	A number of Corona SDK utility functions
	
--]]

local Utilities = {}

--[[ hasEventListener(self, event, callback)

	Test for the presence of function or table listeners.
	
	Parameters:
	
	self (required)		- object to be checked.
	event (required)	- (string) name of the event to look for
	callback (optional)	- (function or table) the object to be called when the event occurs.
						To check for a function listener, pass a reference to the function.
						To check for a table listener, pass the table.

--]]

function Utilities.hasEventListener(self, event, callback)
	if not event or type(event) ~= "string" then
		print("Second argument must be the name of an event")
		return
	end
	if not callback then
		local exists = (self._functionListeners and self._functionListeners[event]) or (self._tableListeners and self._tableListeners[event])
		if exists then
			return true
		else
			return false
		end
	end
	local listenerTable
	if self == callback then
		listenerTable = "_tableListeners"
	else
		listenerTable = "_functionListeners"
	end
	--
	-- Check if any listeners exist
	if not self[listenerTable] then
		return false
	end

	-- Check if listeners for the event in question exist
	if not self[listenerTable][event] then
		return false
	end

	-- Check for the specific callback function
	for i, v in pairs(self[listenerTable][event]) do
		if v == callback then
			return true
		end
	end

	-- Listeners exist, but not calling the function passed in
	return false
end

--[[ table.shuffle(t)

	Shuffle the elements of an indexed array using
	Fisher-Yates algorithm. Performs an 'in-place'
	shuffle, overwriting the previous order of the
	table.
	
	Parameters:
	
	t (required)		- table to be shuffled.

--]]

function Utilities.shuffleTable(t)
	assert(t, "table.shuffle() expected a table, got nil")
	local iterations = #t
	local j
	for i = iterations, 2, -1 do
		j = math.random(i)
		t[i], t[j] = t[j], t[i]
	end
end

return Utilities