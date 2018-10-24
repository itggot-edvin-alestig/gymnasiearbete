class Board
    def initialize()
        @tiles = []
        # Create a 15*15 board in a 2D array

        (0..14).each do |row|
            column = []

            (0..14).each do |col|
                column << Tile.new(row, col)
            end
            @tiles << column
        end

        # Define the centre tile
        @tiles[7][7].attribute = "centre"
    end

    # Add a letter to a tile
    def update_tile(row, col, letter)
        @tiles[row][col].letter = letter
    end


    def json()
        dict = {
            tiles: []
        }

        @tiles.each do |row|
            arr = []
            row.each do |tile|
                arr << tile.dictionary()
            end
            dict[:tiles] << arr
        end 

        require('json') # Move later

        return dict.to_json
    end
end


class Tile
    # row & col decide position on the board
    # attribute tells if it's a special tile such as triple word och the centre tile
    # Available attributes are:
    # centre
    # 2W, 3W, 2L and 3L will be available in future versions
    # letter is the current letter placed on the tile
    def initialize(row, col) 
        @attribute = nil
        @row = row
        @col = col
        @letter = nil
    end


    def letter
        return @letter
    end


    def letter=(letter)
        @letter = letter
    end


    def attribute
        return @attribute
    end


    def attribute=(attribute)
        @attribute = attribute
    end


    def description
        return "Tile on position #{@row}, #{@col} with the attribute #{@attribute}. The current letter is #{@letter}"
    end


    def dictionary()
        tile = {
            attribute: @attribute,
            row: @row,
            column: @col,
            letter: @letter
        }
        return tile
    end

end

b = Board.new
b.update_tile(5, 2, "C")
p b.json()

File.write("board.json", b.json())