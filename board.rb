require_relative "knight.rb"

class Board

  attr_reader :board
  attr_writer :array

  def initialize
   @array = []
   @board = make_board
   show_board
  end

  def make_board

    @array = 

    [
      ["_","_","_","_","_","_","_","_"],
      ["_","_","_","_","_","_","_","_"],
      ["_","_","_","_","_","_","_","_"],
      ["_","_","_","_","_","_","_","_"],
      ["_","_","_","_","_","_","_","_"],
      ["_","_","_","_","_","_","_","_"],
      ["_","_","_","_","_","_","_","_"],
      ["_","_","_","_","_","_","_","_"]
    ]


  end

  def show_board

    p @array[0]
    puts
    p @array[1]
    puts
    p @array[2]
    puts
    p @array[3]
    puts
    p @array[4]
    puts
    p @array[5]
    puts
    p @array[6]
    puts
    p @array[7]


  end



end

board = Board.new

