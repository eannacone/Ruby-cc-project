class MasterMind
    @@turn_count = 0
    
    def initialize()
      puts "Enter the number of attempts you would like to have! Let's keep it under 13."
      @turn_total = gets.chomp
      puts "You have allowed yourself #{@turn_total} guesses."
    end
   
    def comp_generate()
      pieces = 0
      @@game_board = Array.new(4)
      until pieces == 4 
        @@game_board.push(rand(1..4))
        pieces += 1
      end
      puts @@game_board
    end
    
    def play_game()
      
    end
  end
  
  
  
  
  
  
  puts "Gametime! The game is mastermind, you must guess the four number combo using (1, 2, 3, 4). For example, the answer could be (1133)."
  
  
  new_game = MasterMind.new()
  new_game.comp_generate
  