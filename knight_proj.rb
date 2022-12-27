class Node
    attr_accssor :data, :neigh, :prev, :visited

    def initialize(x_cor = nil, y_cor = nil)
        @data = [x_cor, y_cor]
        @neigh = []
        @prev = nil
        @visited = false
    end

    def to_s
        "[#{data[0]},#{data[1]}"
    end
end

class Board
    attr_accssor :board

    def initialize
        @board = []
        a = *(0..7)
        a.each do |i|
            a.each do |j|
                board.push(Node.new(i,j))
            end
        end
    end

    def data_to_node(data)
        i, j = data
        idx = i * 8 + j
        board[idx]
    end

    def on_board?(x, y)
        if [x, y].all? { |num| num <= 7 && num >= 0 }
            true
        else
            false
        end
    end

    def assign_neighbors(node)
        x, y = node.data
        n0 = data_to_node([x + 1, y + 2]) if on_board?(x + 1, y + 2)
        n1 = data_to_node([x + 1, y - 2]) if on_board?(x + 1, y - 2)
        n2 = data_to_node([x - 1, y + 2]) if on_board?(x - 1, y + 2)
        n3 = data_to_node([x - 1, y - 2]) if on_board?(x - 1, y - 2)

        n4 = data_to_node([x + 2, y + 1]) if on_board?(x + 2, y + 1)
        n5 = data_to_node([x + 2, y - 1]) if on_board?(x + 2, y - 1)
        n6 = data_to_node([x - 2, y + 1]) if on_board?(x - 2, y + 1)
        n7 = data_to_node([x - 2, y - 1]) if on_board?(x - 2, y - 1)

        node.neigh = [n0, n1, n2, n3, n4, n5, n6, n7] - [nil]
    end

    def knight_moves(s_data, e_data)
        start = data_to_node(s_data)
        assign_neighbors(start)
        destination = data_to_node(e_data)

        queue = []

        start.visited = true
        queue.push(start)

        while queue.length > 0 
            current_node = queue.shift

            current_node.neigh.each do |node|
                if !node.visited
                    node.visited = true
                    assign_neighbors(node)
                    queue.push(node)
                    node.prev = current_node
                    
                    if node == destination
                        queue.clear
                        break
                    end
                end
            end
        end
        trace_route(destination)
    end

    def trace_route(destination)
        node = destination
        route = []

        while node
            route.push(node)
            node = node.prev
        end
        puts route.reverse
    end
end


b = Board.new
b.knight_moves([3, 3], [4, 3])


