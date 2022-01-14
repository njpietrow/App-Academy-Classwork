require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name,hash)
        @name = name
        @rooms = {}
        hash.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        @name
            .split(" ")
            .map(&:capitalize)
            .join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person_name, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person_name)
                puts "check in successful"
            else
                puts "sorry room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full?}
    end

    def list_rooms
        @rooms.each do |name,room|
            puts name + " " + room.available_space.to_s
        end
    end

end
