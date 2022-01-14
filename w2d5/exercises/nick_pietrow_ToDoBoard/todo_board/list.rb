require "byebug"
require_relative "./item.rb"

class List
    attr_accessor :label
    # we do not create getters or setters for @items because we only want users to interact with it through our intentionally limited methods
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        begin
            item = Item.new(title, deadline, description)
        rescue
            false
        else
            @items << item
            true
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        return false if idx < 0 || idx > self.size - 1
        true
    end

    def swap(idx_1, idx_2)
       return false if !self.valid_index?(idx_1) || !self.valid_index?(idx_2)
       @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
       true
    end

    def [](idx)
        return nil if !self.valid_index?(idx)
        @items[idx]
    end

    def priority
        @items[0]
    end

    def print
        puts "--------------------------------------------------"
        puts "               " + @label.upcase
        puts "--------------------------------------------------"
        puts "Index | Item                | Deadline     | Done?"
        puts "--------------------------------------------------"
        @items.each_with_index do |item,i|
            puts "#{i}".ljust(6) + "| " +item.title.ljust(18) +"  | " + item.deadline.ljust(13) + "| " +item.done.to_s
        end
        puts "--------------------------------------------------"
    end

    def print_full_item(idx)
        if self.valid_index?(idx)
            puts "---------------------------------------------------"
            puts " " + self[idx].title.ljust(30) + self[idx].deadline.ljust(15) + self[idx].done.to_s
            puts " " + self[idx].description
            puts "---------------------------------------------------"
        end
    end

    def print_priority
        self.print_full_item(0) if !@items.empty?
    end
    
    def up(idx, amount = 1)
        return false if !self.valid_index?(idx)
        amount.times do
            return true if idx == 0
            self.swap(idx - 1, idx)
            idx -= 1
        end
        true
    end

    def down(idx, amount = 1)
        return false if !self.valid_index?(idx)
        amount.times do
            return true if idx == self.size - 1
            self.swap(idx, idx + 1)
            idx += 1
        end
        true
    end

    def sort_by_date!
        @items = @items.sort_by! {|item| item.deadline}
    end
    
    def toggle_item(idx)
        return false if !self.valid_index?(idx)
        @items[idx].toggle
        true
    end

    def remove_item(idx)
        return false if !self.valid_index?(idx)
        @items.delete_at(idx)
        true
    end

    def purge
        @items.each_with_index do |item,i|
            @items[i] = nil if item.done
        end
        @items.delete(nil)
    end
        
end

# l = List.new("new_list")
# l.add_item("todo1","2021-10-10")
# # p l.size
# # p l.valid_index?(0)
# l.add_item("todo2","2022-12-12")
# l.add_item("todo3","2022-12-12")
# l.add_item("todo4","2022-12-12")
# l.add_item("todo5","2022-12-12")
# l.add_item("todo6","2022-12-12")
# # p l.valid_index?(1)
# # p l.valid_index?(2)
# l.print

