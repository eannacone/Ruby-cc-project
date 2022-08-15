def caesar_cipher (convert, shift=0)
    broken_down = []
    numerical_conv = []
    num_shift = []
    final = []
    # break down string by letter
    for i in convert.split('') do
      broken_down.push(i)
    end
  
    # convert letters to numerals
    broken_down.each do |a|
      numerical_conv.push(a.ord)
    end

    # shift numerals to new values
    numerical_conv.each do |b|
        if b + shift >= 60 && b + shift <= 122
            num_shift.push(b + shift)
        elsif b + shift >= 122 && b + shift <= 184
            b = b - 26
            num_shift.push(b + shift) 
        elsif b + shift < 65 && b + shift > 40
            b = b + 26
            num_shift.push(b + shift) 
        end
    end

    # translate new numerals to letters
    num_shift.each do |c|
      final.push(c.chr)
    end
  
    puts "Your word to convert is '#{convert}'"
    puts "Broken down word by letter is #{broken_down}"
    puts "Letters to numeric is #{numerical_conv}" 
    puts "New numerical values are #{num_shift}"
    puts "Final product with shifted characters is #{final}"
end

caesar_cipher('zebra', 5)













