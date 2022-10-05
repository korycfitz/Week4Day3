require_relative "board.rb"

class Piece
    attr_accessor :pos
    attr_reader :color
    def initialize(color)
        @color = color
        @board = nil
        @pos = nil
    end








    
    # def occupied?(pos)
    #     return false if @rows[pos[0]][pos[1]] == nil
    #     true
    # end

    # def to_s #need to use .join in another function to join when we render the board
    #     occupied?(pos) ? value.to_s : "P"
    # end
end