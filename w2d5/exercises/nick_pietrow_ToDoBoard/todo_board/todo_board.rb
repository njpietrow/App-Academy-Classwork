require "byebug"
require_relative "./item.rb"
require_relative "./list.rb"

class TodoBoard
    def initialize()
        @board = {}
        # @list = List.new(label)
    end

    def get_command
        print "Enter a command: "
        cmd, *args = gets.chomp.split(" ")

        case cmd
        when "mklist"
            @board[*args] = List.new(*args)
        when "ls"
            @board.keys.each {|key| puts "  #{key}"}
        when "showall"
            @board.each do |k,list| 
                list.print
                puts"==================END LIST===================="
            end
        when "mktodo"
            @board[args.shift].add_item(*args)
        when "up"
            @board[args.shift].up(*args.map(&:to_i))
        when "down"
            @board[args.shift].down(*args.map(&:to_i))
        when "swap"
            @board[args.shift].swap(*args.map(&:to_i))
        when "sort"
            @board[args.shift].sort_by_date!
        when "priority"
            @board[args.shift].print_priority
        when "print"
            if args.length == 1
                @board[args.shift].print
            else
                @board[args.shift].print_full_item(*args.map(&:to_i))
            end
        when "toggle"
            @board[args.shift].toggle_item(*args.map(&:to_i))
        when "rm"
            @board[args.shift].remove_item(*args.map(&:to_i))
        when "purge"
            @board[args.shift].purge
        when "quit"
            return false
        else
            puts "Sorry, that command is not recognized"
        end

        true
    end

    def run
        while self.get_command
        end
    end
end

board = TodoBoard.new()
board.run