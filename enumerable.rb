module Enumerable

	def my_each
		for element in self
			yield(element)
		end
		return self
	end

	def my_each_with_index
		index = 0
		while index < self.size
			yield self[index], index
			index+=1
		end
		self
	end

	def my_select
		arr = []
		self.my_each{|element| arr << element if yield(element)==true}
		arr
	end

	def my_all?
		if block_given?
			self.my_each do |element|
				return false if yield(element)==false
			end
		else
			return false
		end
		return true
	end

	def my_any?
		if block_given?
			self.my_each do |element|
				return true if yield(element)==true
			end
		else
			return true
		end
		return false
	end

	def my_none?
		if block_given?
			self.my_each do |element|
				return false if yield(element)==true
			end
		else
			return false
		end
		return true
	end

	def my_count(item=nil)
		count = 0
		if item == nil && block_given?
			self.my_each do |element|
				count += 1 if yield(element)== true
			end
		elsif item == nil
			count = self.length
		else
			self.my_each do |element|
				count += 1 if element == item
			end
		end
		return count
	end

	def my_map
		arr = []
		self.my_each do |element|
			arr << yield(element)
		end
		return arr
	end

	def my_inject(var=nil)
		self.my_each do |element|
			if var == nil
				var = element
			else
				var = yield(var, element)
			end
		end
		return var
	end

	def my_map_proc(proc)
		arr = []
		self.to_a.my_each do |element|
			arr << proc.call(element)
		end
		return arr
	end

	def my_map_proc_or_bloc(proc=nil)
		arr = []
		if proc == nil && block_given?
			self.to_a.my_each do |element|
				arr << yield(proc.call(element))
			end
		elsif proc == nil
			self.to_a.my_each do |element|
				arr << proc.call(element)
			end
		end
		return arr
	end

end

def multiply_els(element)
	element.my_inject{|memo, element| memo * element}
	return element
end


