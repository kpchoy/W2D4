require 'byebug'

#time complexity is O(n^2)
def my_slow_min(list)
  list.each do |el|
    min = true 
    list.each do |el2|
      min = false if el2 < el 
      
    end 
    return el if min 
  end 
end 
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# puts my_slow_min(list)


#time complexity is O(n)
def my_min(list)
  min = list.first
  list.each do |el|
    min = el if el < min 
  end  
  min 
end 

# puts my_min(list)


def phase1_largest_contiguous_subsum(list)
  subarr = []
  list.each_index do |idx|
    (idx...list.length).each do |idx2|
      subarr << list[idx..idx2]
    end 
  end 
  
  sums = subarr.map { |sub| sub.reduce(:+)  }.max 
  
end 

# list = [5, 3, -7]
# p phase1_largest_contiguous_subsum(list)

def phase2_largest_contiguous_subsum(list)
  subarr = []
  list.each_index do |idx|
    subarr << list[idx..-1]
    subarr << [list[idx]] unless list[idx] == list[-1]
    if idx == list.length - 1
      subarr << list[0..-2] 
    end
  end

  sums = subarr.map { |sub| sub.reduce(:+)  }.max 

end

def phase2_largest_contiguous_subsum(list)
  idx = 1
  largest = list.first
  counter = list.first
  while idx < list.length
    counter = 0 if counter < 0
    counter += list[idx]
    largest = counter if counter > largest
    idx += 1
  end
  largest
end    

list = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
p phase2_largest_contiguous_subsum(list)
p phase2_largest_contiguous_subsum(list2)
p phase2_largest_contiguous_subsum(list3)