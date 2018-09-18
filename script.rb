$marks = [[],[],[]]

def main_menu
    player_mark = "X"
    $marks = fill_marks 
    choice = ""
    print_board $marks
    loop do
        print "\nSelect the number where you want to put your mark: "
        choice = gets.chomp
        position = find_choice choice
        if position && player_mark == "X"
            $marks[position[:row]][position[:column]] = "X" 
            player_mark = "O"
        elsif position && player_mark == "O"
            $marks[position[:row]][position[:column]] = "O" 
            player_mark = "X"
        else
            puts "Incorrect choice"
        end
        print_board $marks

        if check_rules $marks
            puts "Another game? y/n" 
            choice = gets.chomp.downcase
            if choice == "y"
                $marks = fill_marks
                print_board $marks
            else
                puts "Adios"
            end
        end
        break if choice == "n"

    end
end

def check_rules(board)
    #finish_game = false
    def linear_win(matrix)
        matrix.each do |row|
            winner = row.uniq
            if winner.length == 1
                puts "Winner is " << winner[0] 
                return true
            end
        end
        false
    end

    def diagonal_win(matrix)
        diagonal_LR = []
        diagonal_RL = []

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
            puts "Winner is " << diagonal_LR[0]
            return true
        elsif diagonal_RL.length == 1
            puts "Winner is " << diagonal_RL[0]
            return true
        end
        false
    end

    linear_win(board) || linear_win(transpose board) || diagonal_win(board)
end

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


def fill_marks
    matrix = []
    count = 0
    for i in 0...3 do
        matrix[i] = []
        for j in 1..3 do
            count += 1
            matrix[i].push("#{count}")
        end
    end
    matrix
end

def find_choice(choice)
    $marks.each_index do |row_index|
        if $marks[row_index].include?(choice) 
            index = $marks[row_index].index(choice) 
            return {row:row_index, column:index}
        end
    end
    false
end

def print_board(marks)
    puts "   |   |   "
    print_marks(0, marks)
    puts "---|---|---"
    print_marks(1, marks) 
    puts "---|---|---"
    print_marks(2, marks)
    puts "   |   |   "
end

def print_marks (n, marks)
    puts " " << marks[n][0] << " | " << marks[n][1] << " | " << marks[n][2] << " "
end

main_menu