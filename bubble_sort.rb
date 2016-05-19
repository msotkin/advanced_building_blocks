def bubble_sort(arr)
	sorted = true
	while sorted
		sorted = false
		(arr.size-1).times do |i|
			if arr[i] > arr[i+1]
				arr[i], arr[i+1] = arr[i+1], arr[i]
				sorted = true
			end
		end
	end
	p arr
end

bubble_sort([4,3,78,2,0,2])
bubble_sort([54,78,2,34,654,9,87,3,111])


def bubble_sort_by(arr)
	counter = arr.size-1
	while counter > 0
		arr.each_index do |i|
			val = yield arr[i-1], arr[i]
			if val > 0
				arr[i-1], arr[i] = arr[i], arr[i-1]
			end
		end
		counter -= 1
	end
	p arr
end

bubble_sort_by(["hi","hello","hey"]) do |left, right|
	left.length - right.length
end