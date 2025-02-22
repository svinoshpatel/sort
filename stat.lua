local sort = require("sort")
local misc = require("misc")

local ith = false
local min = false
local max = false
local mid = false
local answer
local element

misc.clear_terminal()
io.write("Введіть рядок чисел розділених пробілом > ")
local input = io.read()

while true do
	misc.clear_terminal()
	print("Пошку порядкових статистик:")
	print("1. Знайти i-ту порядкову статистику")
	print("2. Знайти мінімальне значення")
	print("3. Знайти максимальне значення")
	print("4. Знайти медіану")
	print()
	io.write(" > ")

	answer = io.read()
	if answer == "1" then
		ith = true
		break
	end
	if answer == "2" then
		min = true
		break
	end
	if answer == "3" then
		max = true
		break
	end
	if answer == "4" then
		mid = true
		break
	end
end
misc.clear_terminal()

local arr = misc.split(input, " ")
local output = table.concat(arr, " ")

if ith then
	while true do
		misc.clear_terminal()
		print("Оберіть елемент за індексом [1-" .. #arr .. "]:")
		print()
		io.write(" > ")
		answer = io.read()
		if tonumber(answer) >= 1 and tonumber(answer) <= #arr then
			break
		end
	end
	misc.clear_terminal()
	element = sort.randomized_select(arr, 1, #arr, tonumber(answer))
end
if min then
	element = sort.randomized_select(arr, 1, #arr, 1)
end
if max then
	element = sort.randomized_select(arr, 1, #arr, #arr)
end
if mid then
		local lowerMedian = sort.randomized_select(arr, 1, #arr, #arr / 2)
	if #arr % 2 == 0 then
		local upperMedian = sort.randomized_select(arr, 1, #arr, #arr / 2 + 1)
		element = (upperMedian + lowerMedian) / 2
	else
		element = lowerMedian
	end
end

io.write("Масив: " .. output)
print()

io.write("Знайдений елемент: " .. element)


print()
io.read()
