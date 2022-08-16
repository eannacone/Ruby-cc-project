def substrings(word, dictionary)
    # Create empty hash to store searched word and counter for tally
    new_hash = {}
    count = 0
    low_word = word.downcase

    # iterate over dictionary and scan for items that have pieces to match the input (low-word)

    for i in dictionary
      matches = low_word.scan(i).length
      new_hash[i] = matches unless matches == 0
    end

    # return the new_hash

    puts new_hash
end 


dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
substrings("below", dictionary)










