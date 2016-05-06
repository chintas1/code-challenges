require 'pry'
class Challenge

  def calculate_max_subarray(arr)
    max_sum = arr.first
    curr_sum = arr.first
    start_index = 0
    end_index = 0
    counter = 1
    hit_net_neg = arr.first <= 0 if arr.first

    while(counter < arr.length)
      if(arr[counter] > curr_sum + arr[counter])
        curr_sum = arr[counter]
      else
        curr_sum += arr[counter]
      end

      if(curr_sum > max_sum)
        max_sum = curr_sum
        if(hit_net_neg)
          start_index = counter
          end_index = counter
        else
          end_index = counter
        end
        hit_net_neg = false
      end
      hit_net_neg ||= curr_sum <= 0
      counter+=1
    end
    arr[start_index..end_index] 
  end
  

  # def calculate_max_subarray(arr)
  #   subsets=[]
  #   max_sum = nil
  #   max_sum_start_index = 0
  #   max_sum_end_index = 0
  #   start_index = 0
  #   while(start_index < arr.length)
  #     end_index = arr.length-1
  #     while(end_index >= start_index)
  #       sum = arr[start_index..end_index].reduce(:+)
  #       if(max_sum.nil? || sum>max_sum)
  #         max_sum = sum
  #         max_sum_start_index = start_index
  #         max_sum_end_index = end_index
  #       end
  #       end_index-=1
  #     end
  #     start_index+=1
  #   end
  #   arr[max_sum_start_index..max_sum_end_index]
  # end
end

test = Challenge.new
arr = [-2, -3, 4, -1, -2, 1, 5, -3]
p test.calculate_max_subarray(arr)