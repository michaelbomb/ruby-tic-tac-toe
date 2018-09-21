class Board

    def initialize
        @board = []
        10.times {@board.push '.'}
    end

    def to_s
        res = "\n"
        for i in (0..2)
            for j in (1..3)
                res += @board[i*3 + j] + ' '
            end
            res += "\n"
        end
        res += "\n"
        return res
    end

    def draw
        puts to_s
    end

    def available_moves
        res = []
        for i in (1..9)
            res.push i if @board[i] == '.'
        end
        return res
    end

    def somebody_won?
        arr = @board
        # horizontal
        for i in (0..2)
            return true if in_a_row? arr[3*i+1..3*i+3]
        end
        # vertical
        for i in (1..3)
            return true if in_a_row? [ arr[i], arr[i+3], arr[i+6]  ]
        end
        # diagonals
        return true if in_a_row? [arr[1], arr[5], arr[9]]
        return true if in_a_row? [arr[3], arr[5], arr[7]]
        
        return false
    end

    def full?
        return available_moves.length == 0
    end

    def mark(ind, chr)
        @board[ind] = chr
    end

    private
    
    def in_a_row?(arr)
        arr -= ['.']
        return true if (arr.length == 3 && arr.uniq.length == 1)
        return false
    end

end