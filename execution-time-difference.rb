require "byebug"
#Phase I
def my_min(list)
	min = 0
	
	list.each do |idx|
		list.each do |jdx|
			if idx > min && jdx > min
				min = min
			elsif idx < min && jdx > min
				min = idx
			elsif idx > min && jdx < min
				min = jdx
			else
				next
			end
        end
    end
    min
end
# O(n^2)
# O(1) space complexity because only 3 variables are being created which only hold one ele each

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

#Phase II
def my_min(list)
    min = list[0]

    list.each do |ele| 
        case min <=> ele
        when 1
            min = ele
        when 0
            next
        when -1
            min = min 
        end
    end

    min
end
#O(n)
#O(1)
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

#Phase I

def largest_contiguous_subsum(list)
    sub_arr = []
    
    (0...list.length).each do |idx|
        (idx...list.length).each do |jdx|
            sub_arr << list[idx..jdx]
        end
    end

    sub_arr.map! {|ele| ele.sum}.max
end

#O(n^3) <--wrong time complexity (don't have to add constant, keep biggest n term)
    #revision: O(n^3) line56: splicing adds another n operation n^2 * n = O(N^3)
#o(n) space complexity 
    # space complexity is actually O(n!)

#Phase II

def largest_contiguous_subsum(list)
    max_sum = list[0]
	temp_sum = list[0]
	debugger
    #0(n) #note: only n^2 if nested
    
    return list.max if list.all? { |ele| ele < 0 } 
    #need to add O(1) return case
    # Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum.

    list_2 = list.drop(1)
    list_2.each do |ele|
		temp_sum = [ele, temp_sum + ele].max #O(1) operation, should refactor 
        #temp_sum = ele = 4, temp_sum = 1+3, [4, 8].max
        # [3, -7]
        #[3, 5 + 3] = > 3, 8 = > 8 max = 5
        #[-7, 8 - 7] => 1, 1 = > 1 max = 8
        max_sum = temp_sum if temp_sum > max_sum
	end
	
	max_sum
end
#O(n)


list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

 list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])