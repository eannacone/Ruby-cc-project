require 'csv'

class TicTac
  # Intiate game with some text of the basic rules   
  def intialize()
    puts "Let's play a game of hangman! The word I choose will be between 5 and 12 letters long."
    puts "How many guesses would you like to have? Lets keep it under 18!"
    @@guess_total = gets.chomp
    puts "You have allowed yourself #{@@guess_total} guesses. Let's begin."
    computer_choice()
  end

  # query list in .csv file for random word, make sure it fits the 
  # parameters given in TOP, greater than 4, less than 13   
  def computer_choice()
    @@game_word = ''
    full_list = []
    list = File.readlines('list.csv')
    list.each do |word|
      full_list.push(word)
    end
    @@comp_choice = full_list.sample
    if @@comp_choice.length > 4 && @@comp_choice.length < 13
        @@game_word = @@comp_choice
        puts @@comp_choice
    else
        computer_choice()
    end
    create_board()
    player_guess()    
  end

  # Create the gameboard, change letters to asterisks   
  def create_board()
    @@dashes = ''
    tally = 0
    until tally == @@game_word.length do
      @@dashes << '*'
      tally += 1
    end
    puts "The gameboard is displayed below" 
    puts @@dashes
  end

  # Add player guessing ability
  def player_guess()
    puts "Make a guess, one letter please"
    @@guess = gets.chomp!
    if @@guess.length < 2  
      puts "Your guess is #{@@guess}"
      board_response()
    else  
      puts "Guess length must be one letter!"
      player_guess()
    end
  end

  # Adjust the board according to the inputted guess 
  def board_response()
    puts @@comp_choice
    puts @@guess
    if @@game_word.include?(@@guess) 
      @@dashes.sub!('*', @@guess)
      puts @@dashes
    else
      puts "That letter is not in the word, try again!"
      player_guess()       
    end
  end

  # Keep track of total number of guesses
  def counter()
  end

end


game = TicTac.new()
game.intialize



