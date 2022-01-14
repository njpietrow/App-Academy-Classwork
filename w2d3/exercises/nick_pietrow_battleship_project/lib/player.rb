class Player
    def get_move
        print "enter a position with coordinates separated with a space like `4 7`: "
        str = gets.chomp
        arr = str.split(" ")
        arr.map! {|ele| ele.to_i}
    end
end
