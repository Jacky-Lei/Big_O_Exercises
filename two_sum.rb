def bad_two_sum?(arr, target_sum) ##O(n**2)
  arr.each_with_index do |el, idx|
    arr.each_with_index do |el2, idx2|
      return true if (idx != idx2) && (el + el2 == target_sum)
    end
  end
  false
end

def bsearch(sorted, target) ## O(log(n))
  return nil if sorted.empty?
  mid_i = sorted.length / 2
  if sorted[mid_i] == target
    mid_i
  elsif target < sorted[mid_i]
    bsearch(sorted.take(mid_i), target)
  else
    rest = bsearch(sorted.drop(mid_i + 1), target)
    return nil if rest.nil?
    mid_i + rest + 1
  end
end

def okay_two_sum?(arr, target_sum) ## O(n) together with bsearch makes O n(log(n))
  arr.sort!.each_with_index do |el, idx|
    if el != target_sum - el
      result = bsearch(arr, target_sum - el)
      return true if result
    end
  end
  false
end

def good_two_sum?(arr, target_sum) ## O(n)
  nums = Hash.new { |h,k| h[k] = 0 }
  arr.each do |el|
    nums[el] += 1
  end
  arr.each do |el|
    return true if (el != target_sum - el) && (nums[target_sum - el] == 1)
  end
  false
end
