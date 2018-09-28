require './lib/game.rb'

class TTT 
  
  def self.play
    usr_input = ''
    game = Game.new
    game.new_match

    loop do
      puts "Player #{game.player.first} turn's"
      print 'Select the number where you want to put your mark: '
      usr_input = gets.chomp

      unless game.make_move(usr_input)
        puts 'Incorrect choice'
        game.draw_board
      end

      next unless game.won? || game.tie?

      puts "The winner is #{game.player.last}" if game.won?
      puts 'Tie, match is over' if game.tie? && !game.won?
      print 'Another game? y/n '
      usr_input = gets.chomp.downcase
      break if usr_input == 'n'

      game.new_match
    end
  end
end
