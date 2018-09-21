require './board.rb'

# Controls the game events
class Game < Board
  attr_reader :moves
  attr_reader :max_moves
  def initialize
    @moves = 0
    @max_moves = 9
    @player = %w[X O]
  end

  def new_match
    @moves = 0
    set_board
    puts "player #{@player.first} starts the game."
    draw_board
  end

  def make_move(slot)
    return unless put_mark(slot, @player.first)

    @moves += 1
    draw_board
    @player.rotate!
  end

  def won?
    if row_win || column_win || diagonal_win
      puts "The winner is #{@player.last}"
      return true
    end
    false
  end

  def tie?
    if @moves >= @max_moves
      puts 'Tie, match is over'
      return true
    end
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
