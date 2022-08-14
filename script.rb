def caesar_cipher (convert, shift=0)
    broken_down = []
    numerical_conv = []
  
    # break down string by letter
    for i in convert.split('') do
      broken_down.push(i)
    end
  
    # convert letters to numerals
    broken_down.each do |a|
      numerical_conv.push(a.ord)
    end
    puts "Your word to convert is '#{convert}'"
    puts "Broken down word by letter is #{broken_down}"
    puts "Letters to numeric is #{numerical_conv}" 
end

caesar_cipher('string', 0)













