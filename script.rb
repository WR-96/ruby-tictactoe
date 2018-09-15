#TODO: Make a metod to fill this array with these defaul values
$marks = [["1","2","3"],["4","5","6"],["7","8","9"]]

def main_menu
    print_board $marks
    print "\nSelect the number where you want to put your mark: "
    choice = gets.chomp
    position = find_choice choice
    if position
        $marks[position[:row]][position[:column]] = "X" 
        print_board $marks
    else
        puts "Incorrect choice"
    end
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