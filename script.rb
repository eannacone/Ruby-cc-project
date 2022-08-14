def caesar_cipher (convert, shift=0)
    broken_down = []
    numerical_conv = []
    num_shift = []
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
      num_shift.push(b + shift)
    end

    
  
    puts "Your word to convert is '#{convert}'"
    puts "Broken down word by letter is #{broken_down}"
    puts "Letters to numeric is #{numerical_conv}" 
    puts "New numerical values are #{num_shift}"
end

caesar_cipher('string', 5)













