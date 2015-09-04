def anagram_generator(letters) ## O(n!)
  return letters if letters.length == 1
  result = []
  letters.each_with_index do |letter, idx|
    remainder_strs = anagram_generator(letters[0...idx]+letters[idx+1..-1])
    remainder_strs.each do |str|
      result << letter + str
    end
  end
  result
end

def anagram1(original, target)
  anagram_generator(original.split('')).include?(target)
end

def anagram2(original, target) ##O(n**2) maybe O(n**3)
  o_array = original.split("")
  t_array = target.split("")

  o_array.each_with_index do |oletter, oidx|
    idx = t_array.find_index(oletter)
    t_array.delete_at(idx)
    # t_array.each_with_index do |tletter, tidx|
    #   if oletter == tletter
    #     t_array.delete_at(tidx) # O(n)
    #     break
    #   end
    #   return false if tidx == t_array.length - 1
    # end
  end

  t_array.empty?
end

def anagram3(original, target)  ## n*log(n)
  original.split("").sort == target.split("").sort
end

def anagram4(original, target) ##O(n)
  orig_hash = Hash.new(0)
  targ_hash = Hash.new(0)
  original.split('').each do |letter|
    orig_hash[letter] += 1
  end
  target.split('').each do |letter|
    targ_hash[letter] += 1
  end
  orig_hash == targ_hash
end

def anagram5(original, target)
  diff_hash = Hash.new(0)
  original.split('').each do |letter|
    diff_hash[letter] += 1
  end
  target.split('').each do |letter|
    diff_hash[letter] -= 1
  end
  diff_hash.values.all? {|v| v == 0}
end
