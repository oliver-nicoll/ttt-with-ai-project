class Board
    #represents the data and logic of the game
attr_accessor :cells
    def initialize()
       reset! #start with cells for a new game of ttt, use the reset! method (call it)
    end
    #property - cells (stores the data of the state of the board in an array)

    def reset!
        @cells = Array.new(9, " ")
        #reset the state of the cells to what a board should look like at the start of 
        #a game - an array with 9 " " elements
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
        #print its current state 
    end

    def position(input)
        cells[input.to_i-1]
        #takes the user's input in the form of 1-9 strings and looks
        #up the value of the cells at the correct index from the array's perspective
    end

    def update(input, player)
       cells[input.to_i-1] = player.token
        #represents updating the board when a player makes a move
    end

    def full?
        cells.all?{|token| token == "X" || token == "O"}
    end

    def turn_count
        cells.count{|token| token == "X" || token == "O"}
    end

    def taken?(input)
        !(position(input) == " " || position(input) == "")
    end

    def valid_move?(input)
        input.to_i.between?(1,9) && !taken?(input)
    end


end