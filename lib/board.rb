# Controls the game board
class Board
  @board = []

  attr_reader :board

  # prints the game board and the marks
  def draw_board
    puts "\n"
    @board.each do |row|
      row.each_with_index do |mark, index|
        print index == row.length - 1 ? " #{mark} " : " #{mark} |"
      end
      puts "\n---|---|---" unless row == @board.last
    end
    puts "\n\n"
  end

  # put the player's mark on the given slot position
  def put_mark(slot, player)
    @board.each_with_index do |row, row_index|
      if row.include?(slot.to_s)
        column_index = row.index(slot.to_s)
        return @board[row_index][column_index] = player
      end
    end
    false
  end

  # set the marks with default slot number
  def set_board
    @board = []
    slot = 0
    0.upto(2) do |i|
      @board[i] = []
      3.times do
        slot += 1
        @board[i].push(slot.to_s)
      end
    end
  end

  # Switch the values of a row for the values in its corresponding column
  def spin_board
    new_matrix = []
    board.each_index do |row|
      new_matrix[row] = []
      board[row].each_index do |column|
        new_matrix[row].push(board[column][row])
      end
    end
    new_matrix
  end

  def obtain_diagonals
    diagonals = [[], []]

    # Start indexes for left-rigth and rigth-lef diagonals
    index_rl = -1

    board.each_with_index do |row, index_lr|
      diagonals[0] << row[index_lr]
      diagonals[1] << row[index_rl]
      index_rl -= 1
      next
    end
    diagonals
  end
end
