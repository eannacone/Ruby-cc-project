require 'csv'

class TicTac
 
  def intialize()
    puts "Let's play a game of hangman! The word I choose will be between 5 and 12 letters long."
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
  # Add player guessing ability
  def player_guess
    guess = gets.chomp
    if guess.length < 2  
      puts "Your guess is #{guess}"
    else  
      puts "Guess length must be one letter!"
      player_guess()
    end
  end
  # Create the gameboard, change letters to asterisks   
  def create_board()
    @@dashes = @@game_word.gsub!(/\S/, '*')
    puts @@dashes
  end




end


game = TicTac.new()
game.intialize



