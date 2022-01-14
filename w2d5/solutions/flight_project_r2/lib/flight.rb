require_relative "passenger"

class Flight
    attr_reader :passengers
    def initialize(f_num, capacity)
        @flight_number = f_num
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        if !self.full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map {|pass| pass.name}
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end