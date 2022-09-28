class MasterMind
    @@turn_count = 0
    
    def initialize()
      puts "Enter the number of attempts you would like to have! Let's keep it under 13."
      @turn_total = gets.chomp
      puts "You have allowed yourself #{@turn_total} guesses."
    end
   
    def comp_generate()
      pieces = 0
      @@game_board = Array.new(4).compact()
      until pieces == 4 
        @@game_board.push(rand(1..4))
        pieces += 1
      end
      puts @@game_board
      choice()
    end
  
    def choice()
      @guess = []
      puts "Lets make a guess! Enter each number individually"
      g1 = gets.chomp
      @guess.push(g1)
      g2 = gets.chomp
      @guess.push(g2)
      g3 = gets.chomp
      @guess.push(g3)
      g4 = gets.chomp
      @guess.push(g4)
      @real_guess = @guess.map(&:to_i)
      puts "Your guess is #{@real_guess}."
      @@turn_count += 1
      check_match
    end
  
    def check_match()
      while @@turn_count.to_i <= @turn_total.to_i
        if @real_guess == @@game_board
          puts "You guessed correctly, game over you win!"
        else
          puts "Incorrect. Try again!"
          choice()
        end
      end
      puts "Game over, you've used up all of your guesses! You Lose!"
      
    end
    
    def play_game()
      
    end
  end
  
  
  
  
  
  
  puts "Gametime! The game is mastermind, you must guess the four number combo using (1, 2, 3, 4). For example, the answer could be (1133)."
  
  
  new_game = MasterMind.new()
  new_game.comp_generate
  