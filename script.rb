$marks = [["1","2","3"],["4","5","6"],["7","8","9"]]

def main_menu
    print_board $marks
    print "\nSelect the number where you want to put your mark: "
    choice = gets.chomp
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