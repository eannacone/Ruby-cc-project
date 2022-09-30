class MasterMind
    @@turn_count = 0
    
    def initialize()
      puts "Enter the number of attempts you would like to have! Let's keep it under 13."
      @turn_total = gets.chomp
      if @turn_total.to_i > 12
        puts "Please enter a number of attempts smaller than 13."
        initialize()
      else
        puts "You have allowed yourself #{@turn_total} guesses."
        comp_generate()
      end
    end
   
    def comp_generate()
      pieces = 0
      @@game_board = Array.new(4).compact()
      until pieces == 4 
        @@game_board.push(rand(1..4))
        pieces += 1
      end
      # puts @@game_board
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
      if @@turn_count.to_i < @turn_total.to_i && @real_guess == @@game_board
        puts "You guessed correctly, game over you win!"
      elsif @@turn_count.to_i < @turn_total.to_i && @real_guess != @@game_board
        puts "Incorrect. Try again! You have used #{@@turn_count} of #{@turn_total} guesses."
        choice()
      else
        puts "Incorrect. You have used #{@@turn_count} of #{@turn_total} guesses. Game over, you lost!"
        play_again?()
      end
    end
    
    def play_again?()
      puts "Shall we play another match?"
      answer = gets.chomp.capitalize
      if answer == "Yes"
        @@turn_count = 0
        initialize()
      else
        puts "Application terminate......"
      end
    end
  end
  
  
  
  
  
  
  puts "Gametime! The game is mastermind, you must guess the four number combo using (1, 2, 3, 4). For example, the answer could be (1133)."
  
  
  new_game = MasterMind.new()
  new_game.initialize()
  