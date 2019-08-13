require "colorize"
require "byebug"
# Phase I: Brute Force
puts "Phase I"
def bad_two_sum?(arr, target)
    (0...arr.length - 1).each do |i| # 0(n)
        (i + 1 ... arr.length-1).each do |j|
            return true if target == arr[i] + arr[j]
        end
    end
    false
end

# Time complexity: O(n^2)
# Space complexity: O(1)

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
puts "====================".red
puts "Phase 2"

# Hint: (There are a couple ways to solve this problem once it's sorted. One way involves using 
# a very cheap algorithm that can only be used on sorted data sets. What are some such algorithms you know?)
def ok_two_sum?(arr, target)
    sorted_arr = arr.sort! #O(n log n)
    # p arr.bsearch()
    i = 0 
    j = sorted_arr.length - 1

    while i < j
      sum = sorted_arr[i] + sorted_arr[j]
      if target == sum
        return true
      else
        i += 1
      end
    end
    false
end 

# dont need to reimplement binary search, already built in

#Time complexity O(nlog(n))
#Space complexity O(n)
arr = [0, 1, 5, 7]
p ok_two_sum?(arr, 7) # => should be true
p ok_two_sum?(arr, 10) # => should be false
puts "====================".blue
puts "Phase 3"

#Phase 3 

# Hash Map
# Finally, it's time to bust out the big guns: a hash map. Remember, a hash map has O(1) #set and O(1) #get, 
# so you can build a hash out of each of the n elements in your array in O(n) time. That hash map prevents you 
# from having to repeatedly find values in the array; now you can just look them up instantly.

# See if you can solve the two_sum? problem in linear time now, using your hash map.

# Once you're finished, make sure you understand the time complexity of your solutions and
# then call over your TA and show them what you've got. Defend to them why each of your solutions has the time 
# complexity you claim it does.

def hashmap_two_sum?(arr, target)
    # raise "Target must be greater than 0" if target == 0
	two = {} #O(n)
	#arr = [0, 1, 5, 7]
	# debugger
	arr.each do |ele| #O(n)
		return true if two[target - ele]
        two[ele] = true
    end
 
	#debugger	
	# two.each_key do |key|
	# 	return true if two[target - key] && target-key != key
    #     #new_sum = target - key
        
	# end
	false
end

# Time Complexity: O(n)
# Space Complexity: O(n)

arr = [25, 0, 1, 5, 7]
p hashmap_two_sum?(arr, 26) # => should be true
p hashmap_two_sum?(arr, 10) # => should be false

# def hash_four_sum(arr, target)
#     four = {}

#     arr.each {|ele| four[ele] = true}
# end