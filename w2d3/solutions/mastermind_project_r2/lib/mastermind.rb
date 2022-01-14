require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end
    
    def print_matches(code)
        exact = @secret_code.num_exact_matches(code)
        near = @secret_code.num_near_matches(code)
        puts "#{exact} #{near}"
    end

    def ask_user_for_guess
        print 'Enter a code'
        input = gets.chomp
        guess = Code.from_string(input)
        self.print_matches(guess)
        @secret_code == guess
    end


end
