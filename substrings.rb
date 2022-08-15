def substrings(word, dictionary)
    # Create empty hash to store searched word and counter for tally
    new_hash = {}
    count = 0

    # iterate through the dictionary and pull the words that match 
    # the input word
    # if match == true, add word to new dictionary and increase count 
    # by 1 each instance

    for i in dictionary
      if i.include?(word)
        count += 1
        new_hash[word] = count
      end
    end

    # return the new_hash

    puts new_hash
end 


dictionary = ['true', 'loot', 'loot', 'plough', 'triple', 'sloot', 'presloot']
substrings('loot', dictionary)











