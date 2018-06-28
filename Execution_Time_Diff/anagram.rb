def first_anagram?(str1, str2)
  result = []
  
  str1.chars.permutation.to_a.each do |word|
    result << word.join
  end
  result.include?(str2)
end

def second_anagram?(str1, str2)
  string1 = str1.chars
  string2 = str2.chars
  string1.each_index do |idx1|
    string2.each_index do |idx2|
      if string1[idx1] == string2[idx2]
        string1[idx1] = ""
        string2[idx2] = ""
      end
    end
  end
  string1.join.empty? && string2.join.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end


# def fourth_anagram?(str1, str2)
#   hash1 = Hash.new(0)
#   hash2 = Hash.new(0)
# 
#   str1.chars.each do |el|
#     hash1[el] += 1
#   end
# 
#   str2.chars.each do |el|
#     hash2[el] += 1
#   end
# 
#   # hash1.each do |k, v|
#   #   return false unless v == hash2[k]
#   # end
#   # true
# 
#   hash1 == hash2
# end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new { |h,k| h[k] = [0,0] }
  
  str1.chars.each do |el|
    hash1[el][0] += 1
  end
  
  str2.chars.each do |el|
    hash1[el][1] += 1
  end
  
  hash1.each do |k, v|
    return false unless v[0] == v[1]
  end
  true

end
p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")