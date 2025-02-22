local sort = {}

local function merge(arr, left, mid, right, reverse)
	local n1 = mid - left + 1
	local n2 = right - mid
	local leftArr = {}
	local rightArr = {}

	for i = 1, n1 do
		leftArr[i] = arr[left + i - 1]
	end
	for j = 1, n2 do
		rightArr[j] = arr[mid + j]
	end

	local i, j, k = 1, 1, left

	while i <= n1 and j <= n2 do
		if (not reverse and leftArr[i] <= rightArr[j]) or (reverse and leftArr[i] >= rightArr[j]) then
			arr[k] = leftArr[i]
			i = i + 1
		else
			arr[k] = rightArr[j]
			j = j + 1
		end
		k = k + 1
	end

	while i <= n1 do
		arr[k] = leftArr[i]
		i = i + 1
		k = k + 1
	end
	while j <= n2 do
		arr[k] = rightArr[j]
		j = j + 1
		k = k + 1
	end
end

function sort.merge_sort(arr, left, right, reverse)
	if left >= right then
		return
	end

	local mid = math.floor((left + right) / 2)
	sort.merge_sort(arr, left, mid, reverse)
	sort.merge_sort(arr, mid + 1, right, reverse)
	merge(arr, left, mid, right, reverse)
end

local function partition(arr, low, high, reverse)
	local pivot = arr[low]
	local i = low - 1
	local j = high + 1

	while true do
		if reverse then
			repeat
				i = i + 1
			until arr[i] <= pivot
			repeat
				j = j - 1
			until arr[j] >= pivot
		else
			repeat
				i = i + 1
			until arr[i] >= pivot
			repeat
				j = j - 1
			until arr[j] <= pivot
		end

		if i >= j then
			return j
		end
		arr[i], arr[j] = arr[j], arr[i]
	end
end

function sort.quick_sort(arr, low, high, reverse)
	if low >= high then
		return
	end

	local j = partition(arr, low, high, reverse)
	sort.quick_sort(arr, low, j, reverse)
	sort.quick_sort(arr, j + 1, high, reverse)
end

local function randomized_partition(arr, low, high, reverse)
	local randIndex = math.random(low, high)
	arr[low], arr[randIndex] = arr[randIndex], arr[low]
	return partition(arr, low, high, reverse)
end

function sort.randomized_quick_sort(arr, low, high, reverse)
	if low >= high then
		return
	end

	local j = randomized_partition(arr, low, high, reverse)
	sort.randomized_quick_sort(arr, low, j, reverse)
	sort.randomized_quick_sort(arr, j + 1, high, reverse)
end

function sort.randomized_select(arr, low, high, element)
	if low == high then
		return arr[low]
	end
	local pivot = randomized_partition(arr, low, high, false)
	local k = pivot - low + 1
	if element == k then
		return arr[pivot]
	elseif element < k then
		return sort.randomized_select(arr, low, pivot - 1, element)
	else
		return sort.randomized_select(arr, pivot + 1, high, element - k)
	end
end

return sort
