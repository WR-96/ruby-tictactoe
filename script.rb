# Controls the gameplay
# class Game
#   @moves = 0
#   def initialize(player = 'X')
#     @player = player
#   end
#
#   def play; end
#
#   def set_game
#     @moves = 0
#   end
#
#   def winner; end
# end
require './board.rb'

def main_menu
  movements = 0
  max_movements = 9
  player_mark = 'X'
  # marks = fill_marks
  choice = ''
  # print_board marks
  board = Board.new
  board.set
  board.draw
  loop do
    print "\nSelect the number where you want to put your mark: "
    choice = gets.chomp
    print 'Incorrect option' unless board.put_mark(choice, player_mark)
    board.draw
    # position = find_choice(choice, marks)
    # if position && player_mark == 'X'
    #   marks[position[:row]][position[:column]] = 'X'
    #   player_mark = 'O'
    #   movements += 1
    # elsif position && player_mark == 'O'
    #   marks[position[:row]][position[:column]] = 'O'
    #   player_mark = 'X'
    #   movements += 1
    # else
    #   puts 'Incorrect choice'
    # end
    # print_board marks

    break if check_rules(board.marks) || movements >= max_movements
  end
  # print 'Another game? y/n '
  # choice = gets.chomp.downcase
  # if choice == 'y'
  #   movements = 0
  #   marks = fill_marks
  #   print_board marks
  # else
  #   puts 'Bye!'
  # end
end

def check_rules(board)
  # Checks if the elements in a row are all the same
  def linear_win(matrix)
    matrix.each do |row|
      winner = row.uniq
      if winner.length == 1
        puts 'Winner is ' << winner[0]
        return true
      end
    end
    false
  end

  # Checks if the elements in the diagonals are the same
  def diagonal_win(matrix)
    # Array for elemets in the diagonal from left to right
    diagonal_LR = []
    # Array for elemets in the diagonal from right to left
    diagonal_RL = []

    # Start indexes for LR and RL diagonals
    index_LR = 0
    index_RL = -1

    matrix.each do |row|
      diagonal_LR << row[index_LR]
      diagonal_RL << row[index_RL]
      index_LR += 1
      index_RL -= 1
      next
    end

    diagonal_LR.uniq!
    diagonal_RL.uniq!

    if diagonal_LR.length == 1
      puts 'Winner is ' << diagonal_LR[0]
      return true
    elsif diagonal_RL.length == 1
      puts 'Winner is ' << diagonal_RL[0]
      return true
    end
    false
  end

  linear_win(board) || linear_win(transpose(board)) || diagonal_win(board)
end

# Switch the values of a row for the values in its corresponding column
def transpose(matrix)
  new_matrix = []
  matrix.each_index do |row|
    new_matrix[row] = []
    matrix[row].each_index do |column|
      new_matrix[row].push(matrix[column][row])
    end
  end
  new_matrix
end

main_menu
