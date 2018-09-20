# Controls the game board
class Board
  @marks = []

  attr_reader :marks

  # prints the game board and the marks
  def draw
    puts "\n"
    @marks.each do |row|
      row.each_with_index do |mark, index|
        print index == row.length - 1 ? " #{mark} " : " #{mark} |"
      end
      puts "\n---|---|---" unless row == @marks.last
    end
    puts "\n"
  end

  # put the player's mark on the given slot position
  def put_mark(slot, player)
    @marks.each_index do |row|
      if @marks[row].include?(slot.to_s)
        column = @marks[row].index(slot.to_s)
        return @marks[row][column] = player
      end
    end
    false
  end

  # set the marks with default slot number
  def set
    @marks = []
    count = 0
    0.upto(2) do |i|
      @marks[i] = []
      3.times do
        count += 1
        @marks[i].push(count.to_s)
      end
    end
  end
end