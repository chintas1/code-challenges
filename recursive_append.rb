class Challenge
  def append_down_from(arr, num=0)
    return [0] if num <= 0
    [num] + append_down_from(arr, num-1)
  end
end

test = Challenge.new
p test.append_down_from([], 0)