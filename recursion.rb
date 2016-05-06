class RecursiveChallenge
  def append_down_from(arr, num=0)
    return [0] if num <= 0
    [num] + append_down_from(arr, num-1)
  end

  def reverse(array)
    return [array.first] if array.length == 1
    [array.last] + reverse(array[0, array.length-1])
  end

  def total_count_negative_integers(array)
    return 0 if array.length == 0
    if(array.length == 1)
      array[0]>=0 ? 0 : 1
    else
      negative = array[-1]>=0 ? 0 : 1
      total_count_negative_integers(array[0, array.length-1]) + negative
    end
  end

  def reverse_string(string)
    return string[0] if string.length <= 1
    string[-1] + reverse_string(string[0, string.length-1])
  end

  def factorial(num)
    return num if num <= 1
    factorial(num-1) * num
  end

  def powers(num, power)
    return 1 if power == 0
    powers(num, power-1) * num
  end

  def multiply(num_a, num_b)
    return 0 if num_b == 0
    return num_a if num_b == 1
    multiply(num_a, num_b - 1) + num_a
  end

  def fibs_rec(num)
    return num-1 if num <= 2
    fibs_rec(num-2) + fibs_rec(num-1)
  end

  def merge_sort(arr)
    return arr if arr.length == 1
    a = arr[0...arr.length/2]
    b = arr[arr.length/2..-1]
    a = merge_sort(a)
    b = merge_sort(b)
    merge(a, b)
  end

  def merge(arr_a, arr_b)
    merged = []
    while(arr_a.length > 0 && arr_b.length > 0)
      arr_a.first >= arr_b.first ? merged.push(arr_b.shift) : merged.push(arr_a.shift)
    end

    while(arr_a.length > 0 )
      merged.push(arr_a.shift)
    end

    while(arr_b.length > 0 )
      merged.push(arr_b.shift)
    end
    merged
  end
end

test = RecursiveChallenge.new