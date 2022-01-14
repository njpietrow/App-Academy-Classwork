require_relative "./passenger.rb"

class Flight
    attr_accessor :flight_number, :capacity, :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        self.passengers.length == self.capacity
    end

    def board_passenger(passenger)
        self.passengers << passenger if !self.full? && passenger.has_flight?(self.flight_number)
    end

    def list_passengers
        self.passengers.map {|passenger| passenger.name}
    end

    def [](index)
        self.passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end