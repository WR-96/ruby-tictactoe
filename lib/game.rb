require './lib/board.rb'

# Controls the game events
class Game < Board
  attr_reader :player
  def initialize
    @moves = 0
    @max_moves = 9
    @player = %w[X O]
  end

  def new_match
    @moves = 0
    set_board
    draw_board
  end

  def make_move(slot)
    return unless put_mark(slot, @player.first)

    @moves += 1
    draw_board
    @player.rotate!
  end

  def won?
    return true if row_win || column_win || diagonal_win

    false
  end

  def tie?
    return true if @moves >= @max_moves

    false
  end

  def row_win
    board.each do |row|
      return true if row.uniq.length == 1
    end
    false
  end

  def column_win
    board = rotate_board
    board.each do |row|
      return true if row.uniq.length == 1
    end
    false
  end

  def diagonal_win
    diagonals = obtain_diagonals
    return true if diagonals[0].uniq.length == 1

    return true if diagonals[1].uniq.length == 1

    false
  end
end
