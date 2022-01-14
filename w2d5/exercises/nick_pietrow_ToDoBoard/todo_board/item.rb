require "byebug"

class Item
    attr_reader :deadline, :done
    attr_accessor :title, :description
    def self.valid_date?(date_string)
        year = date_string[0..3].to_i rescue  false
        month = date_string[5..6].to_i rescue  false
        day = date_string[8..9].to_i rescue  false
        return false if date_string[4] != "-" || date_string[7] != "-"
        return false if month > 12 || month < 1 
        return false if day > 31 || day < 1 
        true
    end
    
    def initialize(title, deadline, description)
        @done = false
        @title = title
        raise "date is invalid" if !Item.valid_date?(deadline)
        @deadline = deadline
        @description = description
    end

    def deadline=(date_string)
         if Item.valid_date?(deadline)
            @deadline = date_string 
         else
            raise "date is invalid"
         end
    end

    def toggle
        @done ^= true
    end
end

