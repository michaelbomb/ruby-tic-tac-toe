class Player

    def initialize(name, marker)
        @name = name
        @marker = marker
    end

    def win
        puts "#{@name} has won!"
    end

end

class HumanPlayer < Player

    def move(board)
        chosen = ''
        while true
            print "Choose where to make a move #{@name}: "
            chosen = gets.chomp.to_i
            flag = board.available_moves.include? chosen
            puts 'Invalid move' unless flag
            if flag
                board.mark(chosen, @marker)
                break
            end
        end
    end

end

class ComputerPlayer < Player

    def move(board)
        moves = board.available_moves
        chosen = moves[rand(moves.length)]
        board.mark(chosen, @marker)
        puts "#{@name} has moved"
    end

end