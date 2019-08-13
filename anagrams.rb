require "byebug"
#Phase I
p "Phase 1"

def first_anagram?(str1, str2)
    anagrams = str1.split("").permutation.to_a #o(n!)
    anagrams.any? do |word| #o(n)
        word.join("") == str2
    end
end
# WRONG ==> Time complexity O(n) 
# UDPATED=> TIME COMPLEXITY O(n!) any time we use permutations we are using a factorial time complexity
# Space complexity O(n!)

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
p "============"
p "Phase 2"


#Phase II

def second_anagram?(str1, str2)
    arr1, arr2 = str1.split(""), str2.split("")
    arr1.each_with_index do |char, idx|
        j = arr2.find_index(char) 
        return false if j.nil?
        arr2.delete_at(j)
        
    end
    arr2.empty?
end
# Time complexity O(N^2)
# Space complexity # O(N) 

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p "============"
p "Phase 3"
#Phase 3 

# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
# The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram?(str1, str2)
  arr1, arr2 = str1.split(""), str2.split("")
  arr1.sort == arr2.sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
# Time complexity O(n log n )  (sorting method)
# Space complexity O(n) ??

p "============"
p "Phase 4"
# Phase 4 

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each 
# letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.

# Discuss the time complexity of your solutions together, then call over your TA to look at them.


def fourth_anagram?(str1, str2)
	count = Hash.new(0) #BONUS (one hash)

	#O(n)
	str1.each_char { |char| count[char] += 1 }
	str2.each_char { |char| count[char] -= 1 }
    
	count.values.all?(&:zero?) #o(n)

end
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# Time Complexity : O(N) == O(3N)
# Space Complexity : O(1)
	# due to each_char creating single char keys - max amount of keys would be 26 .:. O(1)