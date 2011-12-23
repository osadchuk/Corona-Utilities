local Utilities = require("com.ludicroussoftware.Utilities")

local testObject = display.newRect( 10, 10, 100, 100 )
testObject:setFillColor(128, 0, 0)

local function tListener(self, event)
	print("table listener", event.phase)
end

local function fListener(event)
	print("function listener", event.phase)
end

--
-- demo code for hasEventListener
--

-- create table listener
testObject.touch = tListener
testObject:addEventListener("touch", testObject)
-- create function listener
testObject:addEventListener("touch", fListener)

-- test for function listener
local hasFunctionListener = Utilities.hasEventListener(testObject, "touch", fListener)
print("has function listener", hasFunctionListener)

-- test for table listener
local hasTableListener = Utilities.hasEventListener(testObject, "touch", testObject)
print("has table listener", hasTableListener)

-- third argument is optional. If you want to find out if the object
-- has ANY listener for the event in question, don't pass in the
-- third parameter. E.g., test for any enterFrame event listener:
local hasEnterFrameListener = Utilities.hasEventListener(testObject, "enterFrame")
print("has enterFrame listener", hasEnterFrameListener)

--
-- demo code for table.shuffle
--

-- create a table for shuffling
local myTable = {}
for i = 1, 15 do
	myTable[i] = i
end

-- seed the random number generator and shuffle the table
math.randomseed(os.time())
print(table.concat(myTable, ", "))
Utilities.shuffleTable(myTable)
print(table.concat(myTable, ", "))