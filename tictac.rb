class Game
    @@turn_count = 1
    @@winner = ''
  
    def initialize()
      puts 'Player 1 - enter your name!'
      @player_one_name = gets.chomp
      puts 'Player 2 - enter your name!'
      @player_two_name = gets.chomp
      @board = Array.new(3) {Array.new(3, '_')}
    end
  
    def display_board(board)
      puts '\r'
      puts '#{board[0][0]} | #{board[0][1]} | #{board[0][2]}'
      puts '#{board[1][0]} | #{board[1][1]} | #{board[1][2]}'
      puts '#{board[2][0]} | #{board[2][1]} | #{board[2][2]}'
      puts '\r'
    end

    def player_turn(turn)
        if turn.odd?
          player_choice(@player_one_name, 'O')
        else
          player_choice(@player_two_name, 'X')
        end
      end
    
      def player_choice(player, symbol)
        puts "#{player} please input your coordinates seperated by a space"
        input = gets.chomp
        input_array = input.split
        coord_one = input_array[0].to_i
        coord_two = input_array[1].to_i
    
        until input.match(/\s/) && coord_one.between?(0, 2) && coord_two.between?(0, 2) && @board[coord_one][coord_two] = '_'
          puts "Please enter valid coordinates for an empty space in the grid"
          input = gets.chomp
          input_array = input.split
          coord_one = input_array[0].to_i
          coord_two = input_array[1].to_i
        end
    
        add_to_board(coord_one, coord_two, symbol)
      end

      def add_to_board(coord_one, coord_two, symbol)
        @board[coord_one][coord_two] = symbol
        @@turn_count += 1
      end
    
      def three_across
        @board.each do |i|
          if i.all? { |j| j == 'X' }
            @@winner = 'O'
            @@turn_count = 10
          elsif i.all? { |j| j == 'O' }
            @@winner = 'X'
            @@turn_count = 10
          else
            nil
          end
        end
      end
    
      def three_down
        flat = @board.flatten
        flat.each_with_index do |v, i|
          if v == 'X' && flat[i + 3] == 'X' && flat[i + 6] =='X'
            @@winner = 'X'
            @@turn_count = 10
          elsif v == 'O' && flat[i + 3] == 'O' && flat[i + 6] =='O'
            @@winner = 'O'
            @@turn_count = 10
          else
            nil
          end
        end
      end
    
      def three_diagonal
        center_val = @board[1][1]
        if center_val == 'X' || center_val == 'O'
          if @board[0][0] && @board[2][2] == center_val
            @@winner = center_val
            @@turn_count = 10
          elsif @board[2][0] && @board[0][2] == center_val
            @@winner = center_val
            @@turn_count = 10
          end
        else
          nil
        end
      end


