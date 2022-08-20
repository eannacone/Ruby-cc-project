def stock_picker(stock_prices)
    holder = stock_prices[0]
    holder_i = 0

    profit = 0
    days = [0, 0]

    stock_prices.each_with_index do |p, i|
        if p < holder
            holder = p
            holder_i = i
            next
        end
        
        if p - holder > profit
            profit = p - holder
            days = [holder_i, i]
        end
    end
    puts "The day to buy to maximize profits is #{days[0]} and the day to
    sell to maximize profits is #{days[1]}."
    puts "The total profit will be $#{profit}.00."

end




stock_prices = [17,3,6,9,15,8,6,1,10]
stock_picker(stock_prices)