require './game.rb'

usr_input = ''
game = Game.new
game.new_match

loop do
  print 'Select the number where you want to put your mark: '
  usr_input = gets.chomp

  unless game.make_move(usr_input)
    puts 'Incorrect choice'
    game.draw_board
  end

  next unless game.won? || game.tie?

  print 'Another game? y/n '
  usr_input = gets.chomp.downcase
  break if usr_input == 'n'

  game.new_match
end
