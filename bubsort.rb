def bubble_sort (list)
    # basecase, return list if it has one element or less
    return list if list.size <= 1
    swapped = true
    # while swapped is true keep swapping integers 
    while swapped do
        swapped = false
        0.upto(list.size-2) do |i|
            if list[i] > list[i+1]
                list[i], list[i+1] = list[i+1], list[i]
                swapped = true
            end
        end
    end
    puts list
end



bubble_sort([4,3,78,2,0,2])