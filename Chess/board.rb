require_relative "pieces.rb"
require_relative "nullpiece.rb"
class Board ## will need board with instances of Piece in location where each piece is
    attr_reader :rows
    def initialize
        @null_piece = NullPiece.new #can make multiple of the same instance of null piece using .instance
        generate_starting_board
    end

    # def color=(color)
    #     @color = black || white
    # end

    def [](pos) #Does this take in a starting position only or a starting and ending position
        row, col = pos
        @rows[row][col] 
    end
    
    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece   #setting a piece at a certain row and column equal to a piece on the board
    end

    def move_piece(color, start_pos, end_pos) #should update the 2d grid and move the pieces position
        if !valid_start?(start_pos) 
            raise "there is no piece at #{start_pos}" 
        elsif !valid_end?(end_pos) 
            raise "the piece cannot move to #{end_pos}" 
        # elsif color != self.color
        #     raise "#{color} does not match the color of the piece you are moving"   #think this works but haven't tested it out but will need to raise this exception if color does not equal piece at positions color
        else
            self[end_pos] = self[start_pos] #updates the grid and moves the pieces position 
            self[start_pos] = @null_piece
        end
    end

    def valid_start?(start_pos) #checks if there is a piece at a location
        return false if self[start_pos] == @null_piece                #######  need to also check if the piece can actually make this move and if it is on the board 
        true
    end

    def valid_end?(end_pos) #checks if there is a piece at a location
        return true if self[end_pos] == @null_piece               #######  need to also check if the piece can actually make this move and if it is on the board ###also wont be valid end if color is same as place that we are moving to
        false
    end

    def add_piece(piece, pos)
        raise "#{pos} is not empty" unless valid_pos?(pos)
        self[pos] = piece
    end
      
    def valid_pos?(pos)
        return true if self[pos].nil? #check color of other piece if there is a piece being taken
        false
    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end

    def dup

    end
    
    def move_piece!(color, start_pos, end_pos)

    end

    def generate_starting_board
        @rows = Array.new(8) { Array.new(8, @null_piece) }
        ["white", "black"].each { |color| fill_board(color) }
    end

    def fill_board(color)
        if color == "white"
            pawns_pos = [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7]]
            rooks_pos = [[0,0], [0,7]]
            knight_pos = [[0,1], [0,6]]
            bishop_pos = [[0,2], [0,5]]
            queen_pos = [[0,3]]
            king_pos = [[0,4]]
        else 
            pawns_pos = [[6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]
            rooks_pos = [[7,0], [7,7]]
            knight_pos =[[7,1], [7,6]]
            bishop_pos = [[7,2], [7,5]]
            queen_pos = [[7,3]]
            king_pos = [[7,4]]
        end

        pawns_pos.each do |pos|
            pawn = Pawn.new(color) 
            pawn.pos = pos  #pawn.pos getting position from piece class
            self[pos] = pawn
        end
        rooks_pos.each do |pos|
            rook = Rook.new(color) 
            rook.pos = pos  #pawn.pos getting position from piece class
            self[pos] = rook
        end
        knight_pos.each do |pos|
            knight = Knight.new(color) 
            knight.pos = pos  #pawn.pos getting position from piece class
            self[pos] = knight 
        end
        bishop_pos.each do |pos|
            bishop = Bishop.new(color) 
            bishop.pos = pos  #pawn.pos getting position from piece class
            self[pos] = bishop
        end
        queen_pos.each do |pos|
            queen = Queen.new(color) 
            queen.pos = pos  #pawn.pos getting position from piece class
            self[pos] = queen
        end
        king_pos.each do |pos|
            king = King.new(color) 
            king.pos = pos  #pawn.pos getting position from piece class
            self[pos] = king
        end
    end
end