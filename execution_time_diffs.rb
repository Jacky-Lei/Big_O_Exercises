def my_min(arr)   ## O(n!) complexity
  arr.each_index do |idx|
    arr.each_index do |idx2|
      break if (idx != idx2) && arr[idx] > arr[idx2]
      return arr[idx] if idx2 == arr.length - 1 #if 2nd loop goes thru to the end, then that means
    end
  end
end

def my_min2(arr)    ## O(n) complexity
  min = arr.first
  arr.each { |el| min = el if el <= min }
  min
end

def subsets(list)
  subsets = [[]]
  list.each do |el|
    new_subsets = []
    subsets.each do |subset|
      new_subsets << (subset + [el])
    end
    subsets.concat(new_subsets)
  end
  subsets
end

def largest_contiguous_subsum(list) ## O(n**3)
  subsets = []
  start = 0
  list.length.times do |start| #n
    (start...list.length).each do |finish| #n
      subsets << list[start..finish] #n # O(n**3) memory
    end
  end
  max = subsets.first
  subsets.each do |subset|
    subset_sum = subset.inject(&:+)
    max = subset_sum if subset_sum > max.inject(&:+)
  end
  max
end

def largest_contiguous_subsum2(list) ## O(n) time and O(1) space
  accum = 0
  max = nil
  list.length.times do |i|
    accum += list[i]
    max = accum if max.nil? || accum > max
    accum = 0 if accum < 0
  end
  max
end
