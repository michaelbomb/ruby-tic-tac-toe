load 'Board.rb'
load 'Player.rb'

class Game

    def initialize(p1, p2)
        @players = [p1, p2]
        @board = Board.new
    end

    def play
        @board.draw
        currPlayerInd = 0
        while true
            currPlayer = @players[currPlayerInd]
            currPlayer.move(@board)
            @board.draw
            
            if @board.somebody_won?
                currPlayer.win
                break
            end

            if @board.full?
                puts "It's a tie!"
                break
            end

            currPlayerInd = 1 - currPlayerInd
        end
    end

end


human = HumanPlayer.new "John Doe", "x"
computer = ComputerPlayer.new "Computer", "o"
g = Game.new human, computer
g.play