local sort = require("sort")
local misc = require("misc")

local reverse
local mergeSort = false
local quickSort = false
local randomizedQuickSort = false

misc.clear_terminal()
io.write("Введіть рядок чисел розділених пробілом > ")
local input = io.read()

while true do
	misc.clear_terminal()
	print("Оберіть порядок сортування:")
	print("1. Сортувати за зростанням")
	print("2. Сортувати за спаданням")
	print()
	io.write(" > ")

	local answer = io.read()
	if answer == "1" then
		reverse = false
		break
	end
	if answer == "2" then
		reverse = true
		break
	end
end
misc.clear_terminal()

while true do
	misc.clear_terminal()
	print("Оберіть алгоритм сортування:")
	print("1. Merge sort")
	print("2. Quick sort")
	print("3. Randomized quick sort")
	print()
	io.write(" > ")

	local answer = io.read()
	if answer == "1" then
		mergeSort = true
		break
	end
	if answer == "2" then
		quickSort = true
		break
	end
	if answer == "3" then
		randomizedQuickSort = true
		break
	end
end
misc.clear_terminal()

local arr = misc.split(input, " ")

io.write("Оригінальний масив: ")
for i = 1, #arr do
	io.write(arr[i], " ")
end
print()

if mergeSort then
	sort.merge_sort(arr, 1, #arr, reverse)
end
if quickSort then
	sort.quick_sort(arr, 1, #arr, reverse)
end
if randomizedQuickSort then
	sort.randomized_quick_sort(arr, 1, #arr, reverse)
end

io.write("Відсортований масив: ")
for i = 1, #arr do
	io.write(arr[i], " ")
end

print()
io.read()
