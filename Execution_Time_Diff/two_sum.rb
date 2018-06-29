# O(n^2)
def bad_two_sum?(array, target)
  array.each_index do |idx|
    (idx+1...array.length).each do |idx2|
      return true if array[idx] + array[idx2] == target 
    end 
  end 
  false
end 

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
def merge_sort(array)
  return array if array.length <= 1 
  mid = array.length / 2
  sorted_left = merge_sort(array.take(mid))
  sorted_right = merge_sort(array.drop(mid))
  
  merge(sorted_left, sorted_right)
   
end 

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first < right.first 
      merged << left.shift 
    else 
      merged << right.shift 
    end 
  end  
  
  merged + left + right 
end 

def bsearch(arr, target)
  return nil if arr.length < 1
  
  mid = arr.length/2
  if arr[mid] == target
    mid
  elsif arr[mid] > target
    bsearch(arr.take(mid), target)
  else
    right = bsearch(arr.drop(mid + 1), target)
    right.nil? ? nil : right + mid + 1
  end
end

def okay_two_sums?(arr, target)
  sorted = merge_sort(arr)
  sorted.each_with_index do |el, idx|
    sorted_dup = sorted.dup 
    sorted_dup[idx] = 1.0 / 0.0 
    return true unless bsearch(sorted_dup, target - el).nil?
    
  end 
  false 
end


arr = [0, 1, 5, 7]
p okay_two_sums?(arr, 6) # => should be true
p okay_two_sums?(arr, 10) # => should be false