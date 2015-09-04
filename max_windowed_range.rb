def naive_window_range(arr, window_size) ## O(n * w)
  max = nil
  (arr.length - window_size + 1).times do |start| #n
    sub_arr = arr[start...start + window_size] #not n because start + window_size is based on start
    range = sub_arr.max - sub_arr.min #w because w is an input as well, and gets squared because
    # the window moves w times and min/max has complexity of w so it gets squared, but relative to
    # n, it's so small so just put w
    if max.nil? || range > max
      max = range
    end
  end
  max
end
