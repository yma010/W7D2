require "byebug"
# Given an array, and a window size w, find the maximum range (max - min) within a set of w elements.

# Let's say we are given the array [1, 2, 3, 5] and a window size of 3. Here, there are only two cases to consider:

#  In the first case, the difference between the max and min elements of the window is two (3 - 1 == 2).
#  In the second case, that difference is three (5 - 2 == 3). 
#  We want to write a function that will return the larger of these two differences.

# One approach to solving this problem would be:

  # Initialize a local variable current_max_range to nil.
  # Iterate over the array and consider each window of size w. For each window:
    # Find the min value in the window.
    # Find the max value in the window.
    # Calculate max - min and compare it to current_max_range. Reset the value of current_max_range if necessary.
    # Return current_max_range.
  # Implement this approach in a method, max_windowed_range(array, window_size). Make sure your code passes the following test cases:



def naive_range(arr, window)
	current_max_range = nil
	return arr if arr.length < window + 1

    # arr.each do |ele|
    # 	windowed_range = 

    # end

    left = arr.take(window)
	right = arr.drop(window)
	# p left
	# p right
    left_range = left.max - left.min
    # debugger
	right_range = right.max - right.min
	if left_range > right_range
		return left
	else
		naive_range(right, window)
	end

end

def naive_range(arr, window)
    max_range = arr[0...window].max - arr[0...window].min
    current_max_slice = nil
    largest_window = arr[0...window]

	(0.. arr.length-window).each do |start|
		#debugger
        curr_window = arr[start...start+window]
        current_max_slice = curr_window.max - curr_window.min #integer
        if current_max_slice > max_range #integer > integer
            max_range = current_max_slice 
            largest_window = curr_window
        end
    end
    largest_window
end

p naive_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p naive_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p naive_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p naive_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8